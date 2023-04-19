import React from 'react'

import {nanoid} from 'nanoid'

import './index.css'

export default class Index extends React.Component {

  handleKeyUp = (event) => {
    const {keyCode, target} = event

    // check is enter
    if (keyCode !== 13) return

    //
    if (target.value.trim() === '') {
      return
    }

    // yarn add nanoid
    const obj = {
      id: nanoid()+'',
      name: target.value,
      done: false
    }

    this.props.addTodo(obj)

    target.value = ''
  }

  render() {
    return (
      <div className='todo-header'>
        <input onKeyUp={this.handleKeyUp} type="text" placeholder='please input your tast name, then enter back' />
      </div>
    )
  }
}
