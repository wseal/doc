import { connect } from "react-redux";

import CountUI from "../components/Count";

import {
  createAsyncIncAction,
  createDecAction,
  createIncAction,
} from "../redux/count_action";

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

export default connect(mapStateToProps, mapDispatchToProps)(CountUI);
