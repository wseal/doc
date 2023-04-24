import React from "react";
import { NavLink, useRoutes } from "react-router-dom";

import route from "./routes";
import Head from "./pages/Head";

import "./App.css";

const App = () => {
  const element = useRoutes(route);

  function computeClassName({ isActive }) {
    return isActive ? "list-group-item change-route-color" : "list-group-item";
  }

  return (
    <div>
      <Head />
      <div className="row">
        <div className="col-xs-2 col-xs-offset-2">
          <div className="list-group">
            {/* 路由链接 */}
            <NavLink className={computeClassName} to="/about">
              About
            </NavLink>

            <NavLink className={computeClassName} to="home">
              Home
            </NavLink>
          </div>
        </div>
        <div className="col-xs-6">
          <div className="panel">
            <div className="panel-body">
              {/* 注册路由 */}
              {element}
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default App;
