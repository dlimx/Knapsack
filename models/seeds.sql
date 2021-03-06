SELECT *
FROM UserLevels;
SELECT *
FROM Users;
SELECT *
FROM Transactions;
SELECT *
FROM Products;

INSERT INTO UserLevels (role, createdAt, updatedAt)
VALUES ('owner', NOW(), NOW());
INSERT INTO UserLevels (role, createdAt, updatedAt)
VALUES ('manager', NOW(), NOW());
INSERT INTO UserLevels (role, createdAt, updatedAt)
VALUES ('buyer', NOW(), NOW());
INSERT INTO UserLevels (role, createdAt, updatedAt)
VALUES ('cashier', NOW(), NOW());

# Note - when adding new users for testing purposes, any SQL based password should start with 'password'
INSERT INTO Users (userLevelID, email, password, firstName, lastName, createdAt, updatedAt)
VALUES ((SELECT userLevelID FROM UserLevels WHERE role = 'owner'), 'tsmith@gmail.com', 'password1', 'thomas', 'smith',
        NOW(), NOW());
INSERT INTO Users (userLevelID, email, password, firstName, lastName, createdAt, updatedAt)
VALUES ((SELECT userLevelID FROM UserLevels WHERE role = 'manager'), 'jdoe@gmail.com', 'password2', 'jane', 'doe',
        NOW(), NOW());
INSERT INTO Users (userLevelID, email, password, firstName, lastName, createdAt, updatedAt)
VALUES ((SELECT userLevelID FROM UserLevels WHERE role = 'buyer'), 'jdiaz@gmail.com', 'password3', 'joey', 'diaz',
        NOW(), NOW());
INSERT INTO Users (userLevelID, email, password, firstName, lastName, createdAt, updatedAt)
VALUES ((SELECT userLevelID FROM UserLevels WHERE role = 'buyer'), 'jrogan@gmail.com', 'password4', 'joe', 'rogan',
        NOW(), NOW());
INSERT INTO Users (userLevelID, email, password, firstName, lastName, createdAt, updatedAt)
VALUES ((SELECT userLevelID FROM UserLevels WHERE role = 'cashier'), 'gfring@gmail.com', 'password5', 'gus', 'fring',
        NOW(), NOW());
INSERT INTO Users (userLevelID, email, password, firstName, lastName, createdAt, updatedAt)
VALUES ((SELECT userLevelID FROM UserLevels WHERE role = 'cashier'), 'sgoodman@gmail.com', 'password6', 'saul',
        'goodman', NOW(), NOW());

INSERT INTO Products (code, name, descript, price, expirable, createdAt, updatedAt, inventoryCount, shelfCount)
VALUES ('1010', 'tea', '100 count of english breakfast', 2.25, 0, NOW(), NOW(), 15, 211);
INSERT INTO Products (code, name, descript, price, expirable, createdAt, updatedAt, inventoryCount, shelfCount)
VALUES ('1020', 'coffee', '16oz can of preground coffee beans', 8.00, 0, NOW(), NOW(), 20, 1);
INSERT INTO Products (code, name, descript, price, expirable, createdAt, updatedAt, inventoryCount, shelfCount)
VALUES ('2060', 'tuna', '3oz metal can of shredded tuna', 1.10, 0, NOW(), NOW(), 10, 1);
INSERT INTO Products (code, name, descript, price, expirable, createdAt, updatedAt, inventoryCount, shelfCount)
VALUES ('404040', 'pasta', '12oz box of penne', 0.80, 0, NOW(), NOW(), 0, 15);
INSERT INTO Products (code, name, descript, price, expirable, createdAt, updatedAt, inventoryCount, shelfCount)
VALUES ('700700', 'beef', '16 oz package of 90/10', 3.25, 1, NOW(), NOW(), 5, 21);
INSERT INTO Products (code, name, descript, price, expirable, createdAt, updatedAt, inventoryCount, shelfCount)
VALUES ('2030', 'cheese', '16oz chunk of pecorino romano', 12.75, 0, NOW(), NOW(), 3, 1);
INSERT INTO Products (code, name, descript, price, expirable, createdAt, updatedAt, inventoryCount, shelfCount)
VALUES ('1000', 'milk', 'half gallon of milk', 1.50, 1, NOW(), NOW(), 5, 15);

INSERT INTO Transactions (userID, productID, date, productQty, startLoc, endLoc, createdAt, updatedAt)
VALUES ((SELECT userID FROM Users WHERE firstName = 'joe'), (SELECT productID FROM Products WHERE name = 'tea'),
        NOW(), 231, 'supplier', 'inventory', NOW(), NOW());
INSERT INTO Transactions (userID, productID, date, productQty, startLoc, endLoc, createdAt, updatedAt)
VALUES ((SELECT userID FROM Users WHERE firstName = 'thomas'), (SELECT productID FROM Products WHERE name = 'coffee'),
        NOW(), 31, 'supplier', 'inventory', NOW(), NOW());
INSERT INTO Transactions (userID, productID, date, productQty, startLoc, endLoc, createdAt, updatedAt)
VALUES ((SELECT userID FROM Users WHERE firstName = 'thomas'), (SELECT productID FROM Products WHERE name = 'tuna'),
        NOW(), 13, 'supplier', 'inventory', NOW(), NOW());
INSERT INTO Transactions (userID, productID, date, productQty, startLoc, endLoc, createdAt, updatedAt)
VALUES ((SELECT userID FROM Users WHERE firstName = 'thomas'), (SELECT productID FROM Products WHERE name = 'pasta'),
        NOW(), 30, 'supplier', 'inventory', NOW(), NOW());
INSERT INTO Transactions (userID, productID, date, productQty, startLoc, endLoc, createdAt, updatedAt)
VALUES ((SELECT userID FROM Users WHERE firstName = 'jane'), (SELECT productID FROM Products WHERE name = 'beef'),
        NOW(), 29, 'supplier', 'inventory', NOW(), NOW());
INSERT INTO Transactions (userID, productID, date, productQty, startLoc, endLoc, createdAt, updatedAt)
VALUES ((SELECT userID FROM Users WHERE firstName = 'jane'), (SELECT productID FROM Products WHERE name = 'cheese'),
        NOW(), 4, 'supplier', 'inventory', NOW(), NOW());
INSERT INTO Transactions (userID, productID, date, productQty, startLoc, endLoc, createdAt, updatedAt)
VALUES ((SELECT userID FROM Users WHERE firstName = 'joey'), (SELECT productID FROM Products WHERE name = 'milk'),
        NOW(), 31, 'supplier', 'inventory', NOW(), NOW());
INSERT INTO Transactions (userID, productID, date, productQty, startLoc, endLoc, createdAt, updatedAt)
VALUES ((SELECT userID FROM Users WHERE firstName = 'thomas'), (SELECT productID FROM Products WHERE name = 'tea'),
        NOW(), 216, 'inventory', 'shelf', NOW(), NOW());
INSERT INTO Transactions (userID, productID, date, productQty, startLoc, endLoc, createdAt, updatedAt)
VALUES ((SELECT userID FROM Users WHERE firstName = 'jane'), (SELECT productID FROM Products WHERE name = 'coffee'),
        NOW(), 11, 'inventory', 'shelf', NOW(), NOW());
INSERT INTO Transactions (userID, productID, date, productQty, startLoc, endLoc, createdAt, updatedAt)
VALUES ((SELECT userID FROM Users WHERE firstName = 'jane'), (SELECT productID FROM Products WHERE name = 'tuna'),
        NOW(), 3, 'inventory', 'shelf', NOW(), NOW());
INSERT INTO Transactions (userID, productID, date, productQty, startLoc, endLoc, createdAt, updatedAt)
VALUES ((SELECT userID FROM Users WHERE firstName = 'jane'), (SELECT productID FROM Products WHERE name = 'pasta'),
        NOW(), 30, 'inventory', 'shelf', NOW(), NOW());
INSERT INTO Transactions (userID, productID, date, productQty, startLoc, endLoc, createdAt, updatedAt)
VALUES ((SELECT userID FROM Users WHERE firstName = 'joey'), (SELECT productID FROM Products WHERE name = 'beef'),
        NOW(), 24, 'inventory', 'shelf', NOW(), NOW());
INSERT INTO Transactions (userID, productID, date, productQty, startLoc, endLoc, createdAt, updatedAt)
VALUES ((SELECT userID FROM Users WHERE firstName = 'joey'), (SELECT productID FROM Products WHERE name = 'cheese'),
        NOW(), 1, 'inventory', 'shelf', NOW(), NOW());
INSERT INTO Transactions (userID, productID, date, productQty, startLoc, endLoc, createdAt, updatedAt)
VALUES ((SELECT userID FROM Users WHERE firstName = 'joey'), (SELECT productID FROM Products WHERE name = 'milk'),
        NOW(), 26, 'inventory', 'shelf', NOW(), NOW());
INSERT INTO Transactions (userID, productID, date, productQty, startLoc, endLoc, createdAt, updatedAt)
VALUES ((SELECT userID FROM Users WHERE firstName = 'gus'), (SELECT productID FROM Products WHERE name = 'tuna'), NOW(),
        2, 'shelf', 'sold', NOW(), NOW());
INSERT INTO Transactions (userID, productID, date, productQty, startLoc, endLoc, createdAt, updatedAt)
VALUES ((SELECT userID FROM Users WHERE firstName = 'gus'), (SELECT productID FROM Products WHERE name = 'tea'), NOW() + 1000000,
        1, 'shelf', 'sold', NOW(), NOW());
INSERT INTO Transactions (userID, productID, date, productQty, startLoc, endLoc, createdAt, updatedAt)
VALUES ((SELECT userID FROM Users WHERE firstName = 'gus'), (SELECT productID FROM Products WHERE name = 'beef'), NOW() + 2000000,
        3, 'shelf', 'sold', NOW(), NOW());
INSERT INTO Transactions (userID, productID, date, productQty, startLoc, endLoc, createdAt, updatedAt)
VALUES ((SELECT userID FROM Users WHERE firstName = 'gus'), (SELECT productID FROM Products WHERE name = 'milk'), NOW() + 3000000,
        10, 'shelf', 'sold', NOW(), NOW());
INSERT INTO Transactions (userID, productID, date, productQty, startLoc, endLoc, createdAt, updatedAt)
VALUES ((SELECT userID FROM Users WHERE firstName = 'jane'), (SELECT productID FROM Products WHERE name = 'tea'), NOW() + 4000000,
        1, 'shelf', 'sold', NOW(), NOW());
INSERT INTO Transactions (userID, productID, date, productQty, startLoc, endLoc, createdAt, updatedAt)
VALUES ((SELECT userID FROM Users WHERE firstName = 'jane'), (SELECT productID FROM Products WHERE name = 'pasta'),
        NOW(), 1, 'shelf', 'sold', NOW(), NOW());
INSERT INTO Transactions (userID, productID, date, productQty, startLoc, endLoc, createdAt, updatedAt)
VALUES ((SELECT userID FROM Users WHERE firstName = 'saul'), (SELECT productID FROM Products WHERE name = 'pasta'),
        NOW() + 1000000, 14, 'shelf', 'sold', NOW(), NOW());
INSERT INTO Transactions (userID, productID, date, productQty, startLoc, endLoc, createdAt, updatedAt)
VALUES ((SELECT userID FROM Users WHERE firstName = 'saul'), (SELECT productID FROM Products WHERE name = 'coffee'),
        NOW() + 2000000, 10, 'shelf', 'sold', NOW(), NOW());
INSERT INTO Transactions (userID, productID, date, productQty, startLoc, endLoc, createdAt, updatedAt)
VALUES ((SELECT userID FROM Users WHERE firstName = 'saul'), (SELECT productID FROM Products WHERE name = 'tea'), NOW() + 3000000,
        3, 'shelf', 'sold', NOW(), NOW());
INSERT INTO Transactions (userID, productID, date, productQty, startLoc, endLoc, createdAt, updatedAt)
VALUES ((SELECT userID FROM Users WHERE firstName = 'saul'), (SELECT productID FROM Products WHERE name = 'milk'),
        NOW() + 4000000, 1, 'shelf', 'sold', NOW(), NOW());
