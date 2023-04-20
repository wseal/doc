import React from 'react'

import './index.css'

export default class index extends React.Component {

  handleCheck = (event)=>{
    // console.log(event)
    const value = event.target.checked
    this.props.checkAllTodo(value)
  }

  handleCleanFinished = () =>{
    this.props.cleanFinished()
  }

  render() {
    const {todos} = this.props
    const doneCnt = todos.reduce((pre, todo) => pre + (todo.done ? 1 : 0), 0)
    const total = todos.length;

    return (
      <div className='todo-footer'>
        {/* defaultChecked only init once */}
        <label><input type="checkbox" checked={doneCnt===total && total !== 0} onChange={this.handleCheck}/></label>
        <span><span>已完成{doneCnt}</span> / 全部{total}</span>
        <button onClick={this.handleCleanFinished} className='btn btn-danger'>clear all finished task</button>
      </div>
    )
  }
}
