import React from "react";
import axios from "axios";
import PubSub from "pubsub-js";

export default class Search extends React.Component {
  search = () => {
    // 连续解构赋值，重命名
    const {
      keyWordElement: { value: keyword },
    } = this;
    console.log("key word", keyword);

    // this.props.updateState({ isFirst: false, isLoading: true });
    PubSub.publish("Search", { isFirst: false, isLoading: true });

    axios.get(`https://api.github.com/search/users?q=${keyword}`).then(
      (response) => {
        // this.props.updateState({
        //   isLoading: false,
        //   users: response.data.items,
        // });
        PubSub.publish("Search", {
          isLoading: false,
          users: response.data.items,
        });
      },
      (error) => {
        // this.props.updateState({
        //   isLoading: false,
        //   err: error.message,
        // });
        PubSub.publish("Search", {
          isLoading: false,
          err: error.message,
        });
      }
    );
  };

  render() {
    return (
      <section className="jumbotron">
        <h3 className="jumbotron-heading">Search Github Users</h3>
        <div>
          <input
            ref={(c) => (this.keyWordElement = c)}
            type="text"
            placeholder="enter the name you search"
          />
          &nbsp;<button onClick={this.search}>Search</button>
        </div>
      </section>
    );
  }
}
