import React from 'react'

import './index.css'

export default function index() {
  return (
    <div className='todo-footer'>
      <label><input type="checkbox" /></label>
      <span><span>已完成0</span> / 全部1</span>
      <button className='btn btn-danger'>clear all finished task</button>
    </div>
  )
}
