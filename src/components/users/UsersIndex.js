import React, { Component, useReducer } from 'react';
import axios from 'axios'; // library for AJAX functions
import Table from '../Table';


// This component is a class because it has state. Having state is neccesary
// because the page will render before the AJAX is complete. Once the AJAX
// is processed and returned from backend we setState() which will automatically
// rerender the component with the new state. An additional reason this
// componenet has state is because if AJAX fails, no results will be available
// to render
class UsersIndex extends Component {
  constructor(props) {
    super(props);

    // initial state which will get updated from AJAX
    this.state = {
      index: []
    };
    
    this.getUsers = this.getUsers.bind(this);

  }
  
  // after component mounts ( mount is React term for after the initital render)
  componentDidMount() {

    // call function to send AJAX to backend
    this.getUsers();
    
  }

  getUsers() {

    // AJAX call to /api/user
    axios.get('/api/user').then(res => {
      
      // update state based on return JSON from backend
      // React will automatically rerender the component after state updates.
      // Always use setState to update state. Updating state directly 
      // can cause errors.
      this.setState({ index: res.data });
    });
  }

  // This render function is called when component first renders
  // e.g. user clicks on link or when setState updates state
  render() {

    // set index from state
    const { index } = this.state

    // set tableHeaders to index keys unless index is empty set to empty array
    const tableHeaders = index.length ? Object.keys(index[0]) : [];

    // below is the HTML and components being returned
    // We can pass data to other React components by using "props"
    // e.g. The "Table" component has several props. One is called "headers"
    // and we set the data within headers to "tableHeaders" which is 
    // is set within the render() function.
    return (
      <div className="container-fluid text-center">
        <Table headers={tableHeaders}
          rows={index}/>
      </div>
    );
  }
}

export default UsersIndex;