import React from 'react';

import Item from '../Item'
import './index.css'

const Index = () => {
  return (
    <ul className='todo-main'>
      <Item />
      <Item />
    </ul>
  );
}

export default Index;
