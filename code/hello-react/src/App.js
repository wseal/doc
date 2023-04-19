import { Component } from "react";

import "./App.css";

// import Hello from "./components/Hello/Hello";
import Header from "./components/Header";
import List from "./components/List";
import Footer from "./components/Footer";

// create and export

export default class App extends Component {
  state = {
    todos: [
      { id: "001", name: "java", done: true },
      { id: "002", name: "golang", done: true },
      { id: "003", name: "cocos", done: true },
    ],
  };

  render(h) {
    const { todos } = this.state;
    return (
      <div className="todo-container">
        <div className="todo-wrap">
          <Header />
          <List todos={todos} />
          <Footer />
        </div>
      </div>
    );
  }
}
