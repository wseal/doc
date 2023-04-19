import React from 'react';

import './index.css'

export default class Index extends React.Component {

  render() {
    const {id, name, done} = this.props;

    return (
      <li>
          <label>
            <input type="checkbox" defaultChecked={done} />
            <span>{id}-{name}</span>
          </label>
          <button className='btn btn-danger' style={{display: 'none'}}>Del</button>
        </li>
    );
  }
}