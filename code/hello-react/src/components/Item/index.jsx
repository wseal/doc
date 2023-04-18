import React from 'react';

import './index.css'

const Index = () => {
  return (
    <li>
        <label>
          <input type="checkbox" />
          <span>xxxx</span>
        </label>
        <button className='btn btn-danger' style={{display: 'none'}}>Del</button>
      </li>
  );
}

export default Index;
