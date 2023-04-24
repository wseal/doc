import React from "react";

export default function Home() {
  return (
    <div>
      <h2>Home组件内容</h2>
      <div>
        <ul className="nav nav-tabs">
          <li>
            <a className="list-group-item active" href="./home-news.html">
              News
            </a>
          </li>
          <li>
            <a className="list-group-item " href="./home-message.html">
              Message
            </a>
          </li>
        </ul>
        <ul>
          <li>news001</li>
          <li>news002</li>
          <li>news003</li>
        </ul>
      </div>
    </div>
  );
}
