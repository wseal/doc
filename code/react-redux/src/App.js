import React, { Component } from "react";

import Counter from "./container/Counter";
import Person from "./container/Person";

export default class App extends Component {
  render() {
    return (
      <div>
        <Counter />
        <hr />
        <Person />
      </div>
    );
  }
}
