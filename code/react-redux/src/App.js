import React, { Component } from "react";

import Counter from "./container/Counter";
import store from "./redux/store";

export default class App extends Component {
  render() {
    return (
      <div>
        <Counter store={store} />
      </div>
    );
  }
}
