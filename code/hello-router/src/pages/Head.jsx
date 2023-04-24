import React from "react";
import { useNavigate } from "react-router-dom";

export default function Head() {
  const navigate = useNavigate();

  function back() {
    navigate(-1);
  }

  function forward() {
    navigate(1);
    console.log("forward....");
  }

  return (
    <div className="row">
      <div className="col-xs-offset-2 col-xs-8">
        <div className="page-header">
          <h2>React Router Demo</h2>
          <button onClick={back}>{"<<--"}</button>
          <button onClick={forward}>{"-->>"}</button>
        </div>
      </div>
    </div>
  );
}
