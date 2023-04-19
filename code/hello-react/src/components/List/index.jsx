import React from 'react';

import Item from '../Item'
import './index.css'

const Index = (props) => {
const{todos} = props
  return (
    <ul className='todo-main'>
      {
        todos.map((todo)=>{
          return <Item key={todo.id} {...todo} />
        })
      }
    </ul>
  );
}

export default Index;
