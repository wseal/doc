import ReactDOM from "react-dom/client";

// 引入资源需要使用相对路径开头，否则当做js模块引入
import "./index.css";

const app = (
  <div className="logs">
    <div className="item">
      <div className="date">
        <div className="month">April</div>
        <div className="day">19</div>
      </div>

      <div className="content">
        <h2 className="desc">learn</h2>
        <div className="">50 min</div>
      </div>
    </div>
  </div>
);

const root = ReactDOM.createRoot(document.getElementById("root"));

root.render(app);
