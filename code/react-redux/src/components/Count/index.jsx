import React, { Component } from "react";

export default class Count extends Component {
  state = { message: "win" };

  increment = () => {
    const { value } = this.selectNumber;
    this.props.add(value * 1);
  };

  decrement = () => {
    const { value } = this.selectNumber;
    this.props.desc(value * 1);
  };

  incrementIfOdd = () => {
    const { value } = this.selectNumber;
    if (value % 2 !== 0) {
      this.props.add(value * 1);
    }
  };

  incrementAsync = () => {
    const { value } = this.selectNumber;
    this.props.asyncAdd(value * 1, 500);
  };

  render() {
    return (
      <div>
        <h1>current sum:{this.props.count}</h1>
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
