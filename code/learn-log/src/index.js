import ReactDOM from "react-dom/client";
import App from "./App";

// 引入资源需要使用相对路径开头，否则当做js模块引入
import "./index.css";

const app = <App />;

const root = ReactDOM.createRoot(document.getElementById("root"));

root.render(app);
