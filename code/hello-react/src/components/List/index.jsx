import React from 'react';

import Item from '../Item'
import './index.css'

const Index = (props) => {
const{todos, updateTodo} = props
  return (
    <ul className='todo-main'>
      {
        todos.map((todo)=>{
          return <Item key={todo.id} {...todo} updateTodo={updateTodo} />
        })
      }
    </ul>
  );
}

export default Index;
