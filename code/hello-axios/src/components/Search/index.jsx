import React from "react";
import axios from 'axios'

export default class Search extends React.Component {
search = ()=>{
  // 连续解构赋值，重命名
  const {keyWordElement: {value: keyword}} = this
  console.log('key word', keyword)

  axios.get(`https://api.github.com/search/users?q=${keyword}`).then(
    response=>{this.props.addUsers(response.data.items)},
    error =>{console.log(error)}
  )
}

  render() {
    return (
      <section className="jumbotron">
        <h3 className="jumbotron-heading">Search Github Users</h3>
        <div>
          <input ref={c=> this.keyWordElement = c} type="text" placeholder="enter the name you search" />
          &nbsp;<button onClick={this.search}>Search</button>
        </div>
      </section>
    );
  }
}
