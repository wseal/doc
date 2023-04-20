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

  render() {
    const {id, name, done} = this.props;
    const {mouse} = this.state
    return (
      <li style={{backgroundColor: mouse? '#ddd': 'white'}} onMouseEnter={this.handleMouse(true)} onMouseLeave={this.handleMouse(false)}>
          <label >
            <input type="checkbox" defaultChecked={done} onChange={this.handleCheck(id)}/>
            <span>{name}</span>
          </label>
          <button className='btn btn-danger' style={{display: mouse ? 'block' : 'none'}}>Del</button>
        </li>
    );
  }
}