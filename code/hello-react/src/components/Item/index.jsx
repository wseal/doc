import React from 'react';

import './index.css'

export default class Index extends React.Component {

  state = {mouse: false}

  handleMouse = (flag)=>{
    return ()=>{
      this.setState({mouse:flag})
    }
  }

  handleCheck = (id)=>{
    return (event)=>{
      // event.target.checked
      this.props.updateTodo(id, event.target.checked)
    }
  }

  handleDelete = (id) => {
    if (window.confirm("Are You Sure?")) {
      this.props.deleteTodo(id)
    }
  }

  render() {
    const {id, name, done} = this.props;
    const {mouse} = this.state
    return (
      <li style={{backgroundColor: mouse? '#ddd': 'white'}} onMouseEnter={this.handleMouse(true)} onMouseLeave={this.handleMouse(false)}>
          <label >
            <input type="checkbox" checked={done} onChange={this.handleCheck(id)}/>
            <span>{name}</span>
          </label>
          <button onClick={()=>{this.handleDelete(id)}}className='btn btn-danger' style={{display: mouse ? 'block' : 'none'}}>Del</button>
        </li>
    );
  }
}