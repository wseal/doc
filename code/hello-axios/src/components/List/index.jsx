import React from "react";
import PubSub from "pubsub-js";
// import PropTypes from "prop-types";

import "./index.css";

export default class List extends React.Component {
  // PropTypes = {
  //   users: PropTypes.array.isRequired,
  // };

  state = { isLoading: false, isFirst: true, users: [], err: null };

  componentDidMount() {
    this.token = PubSub.subscribe("Search", (msg, data) => {
      this.setState({ ...data });
    });
  }

  componentWillUnmount() {
    PubSub.unsubscribe(this.token);
  }

  render() {
    const { users, isFirst, isLoading, err } = this.state;
    return (
      <div className="row">
        {isFirst ? (
          <h2>Welcome, Please Input Keyword</h2>
        ) : isLoading ? (
          <h2>Loading....</h2>
        ) : err ? (
          <h2 style={{ color: "red" }}>{err}</h2>
        ) : (
          users.map((item) => {
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
          })
        )}
      </div>
    );
  }
}
