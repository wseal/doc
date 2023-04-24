import React from "react";
import { NavLink, Routes, Route, Navigate } from "react-router-dom";

import Home from "./pages/Home";
import About from "./pages/About";
import Head from "./pages/Head";

import "./App.css";

const App = () => {
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
              <Routes>
                <Route path="/about" element={<About />} />
                <Route path="/home" element={<Home />} />
                <Route
                  path="/"
                  element={<Navigate to="/about" replace={false} />}
                />
              </Routes>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default App;
