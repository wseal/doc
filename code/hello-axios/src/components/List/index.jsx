import React from "react";
import PropTypes from "prop-types";

import "./index.css";

export default class List extends React.Component {
  PropTypes = {
    users: PropTypes.array.isRequired,
  };

  render() {
    return (
      <div className="row">
        {this.props.users.map((item) => {
          return (
            <div key={item.id} className="card">
              <a href={item.html_url}>
                <img
                  alt="header"
                  src={item.avatar_url}
                  style={{ width: "100px" }}
                />
              </a>
              <p className="card-text">{item.login}</p>
            </div>
          );
        })}
      </div>
    );
  }
}
