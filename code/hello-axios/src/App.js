import React from "react";

import Search from "./components/Search";
import List from "./components/List";

import "./App.css";

export default class App extends React.Component {
  state = { users: [] };

  addUsers = (users) => {
    this.setState({ users });
  };

  render() {
    return (
      <div className="container">
        <Search addUsers={this.addUsers} />
        <List users={this.state.users} />
      </div>
    );
  }
}
