import React, { Component } from "react";

import store from "../../redux/store";
import { createIncAction, createDecAction } from "../../redux/count_action";

export default class Count extends Component {
  state = { message: "win" };

  // componentDidMount() {
  //   // monitor redux value update
  //   store.subscribe(() => {
  //     this.setState({});
  //   });
  // }

  increment = () => {
    const { value } = this.selectNumber;
    // const { count } = this.state;
    // this.setState({ count: count + value * 1 });
    // 分发事件
    store.dispatch(createIncAction(value * 1));
  };

  decrement = () => {
    const { value } = this.selectNumber;
    // const { count } = this.state;
    // this.setState({ count: count - value * 1 });
    store.dispatch(createDecAction(value * 1));
  };

  incrementIfOdd = () => {
    const { value } = this.selectNumber;
    // const { count } = this.state;
    const count = store.getState();
    if (count % 2 === 0) {
      return;
    }

    // this.setState({ count: count + value * 1 });
    store.dispatch(createIncAction(value * 1));
  };

  incrementAsync = () => {
    const { value } = this.selectNumber;
    // const { count } = this.state;

    setTimeout(() => {
      // this.setState({ count: count + value * 1 });
      store.dispatch(createIncAction(value));
    }, 500);
  };

  render() {
    // const { count } = this.state;
    return (
      <div>
        <h1>current sum:{store.getState() /*get value */}</h1>
        <select ref={(c) => (this.selectNumber = c)}>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
        </select>
        &nbsp;
        <button onClick={this.increment}>+</button>&nbsp;
        <button onClick={this.decrement}>-</button>&nbsp;
        <button onClick={this.incrementIfOdd}>when odd, +</button>&nbsp;
        <button onClick={this.incrementAsync}>async add</button>&nbsp;
      </div>
    );
  }
}
