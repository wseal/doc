import React from "react";

import Search from "./components/Search";
import List from "./components/List";

import "./App.css";

export default class App extends React.Component {
  state = { isLoading: false, isFirst: true, users: [], err: null };

  updateState = (stat) => {
    this.setState({ ...stat });
  };

  render() {
    return (
      <div className="container">
        <Search updateState={this.updateState} />
        <List {...this.state} />
      </div>
    );
  }
}
