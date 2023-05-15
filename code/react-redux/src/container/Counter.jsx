import React, { Component } from "react";
import { connect } from "react-redux";

import {
  createAsyncIncAction,
  createDecAction,
  createIncAction,
} from "../redux/count_action";

class Count extends Component {
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

// 函数返回一个对象
// 对象的key value 作为props传给ui组件
function mapStateToProps(state) {
  return { count: state };
}

// 函数返回一个对象，里面是函数，用于操作状态的方法
function mapDispatchToProps(dispatch) {
  return {
    add: (number) => dispatch(createIncAction(number)),
    desc: (number) => dispatch(createDecAction(number)),
    asyncAdd: (number, time) => dispatch(createAsyncIncAction(number, time)),
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(Count);

// 简写形式
// export default connect((state) => ({ count: state }), {
//   add: createIncAction,
//   desc: createDecAction,
//   asyncAdd: createAsyncIncAction,
// })(Count);
