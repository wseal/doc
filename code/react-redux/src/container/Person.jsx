import React, { Component } from "react";

import { connect } from "react-redux";

import { createAddPersonAction } from "../redux/actions/person";

class Person extends Component {
  state = {
    // nameNode = nil
  };

  addPerson = () => {
    const name = this.nameNode.value;
    const age = this.ageNode.value;
    const obj = { id: name, name, age };
    this.props.addPerson(obj);
    this.nameNode.value = "";
    this.ageNode.value = 0;
  };

  render() {
    return (
      <div>
        <h2>components sum:{this.props.count}</h2>
        <input
          ref={(c) => (this.nameNode = c)}
          type="text"
          placeholder="input name"
        />
        <input
          ref={(c) => (this.ageNode = c)}
          type="text"
          placeholder="input age"
        />
        <button onClick={this.addPerson}>Add</button>
        <ul>
          {this.props.persons.map((p) => {
            return (
              <li key={p.id}>
                {p.name}--{p.age}
              </li>
            );
          })}
        </ul>
      </div>
    );
  }
}

export default connect(
  (state) => ({ persons: state.persons, count: state.count }),
  { addPerson: createAddPersonAction }
)(Person);
