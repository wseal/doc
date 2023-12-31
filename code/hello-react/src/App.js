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

  // add todo
  addTodo = (todoObj) => {
    const { todos } = this.state;

    const newTodos = [todoObj, ...todos];

    this.setState({ todos: newTodos });
  };

  updateTodo = (id, done) => {
    const { todos } = this.state;
    const newTodos = todos.map((todo) => {
      if (todo.id === id) return { ...todo, done: done };

      return todo;
    });

    this.setState({ todos: newTodos });
  };

  deleteTodo = (id) => {
    const { todos } = this.state;
    const newTodos = todos.filter((todo) => {
      return todo.id !== id;
    });

    this.setState({ todos: newTodos });
  };

  checkAllTodo = (done) => {
    const { todos } = this.state;
    const newTodos = todos.map((item) => {
      return { ...item, done };
    });

    this.setState({ todos: newTodos });
  };

  cleanFinished = () => {
    const { todos } = this.state;
    const newTodos = todos.filter((item) => {
      return item.done !== true;
    });

    this.setState({ todos: newTodos });
  };

  render(h) {
    const { todos } = this.state;
    return (
      <div className="todo-container">
        <div className="todo-wrap">
          <Header addTodo={this.addTodo} />
          <List
            todos={todos}
            updateTodo={this.updateTodo}
            deleteTodo={this.deleteTodo}
          />
          <Footer
            todos={todos}
            checkAllTodo={this.checkAllTodo}
            cleanFinished={this.cleanFinished}
          />
        </div>
      </div>
    );
  }
}
