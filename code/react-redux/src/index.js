import React from "react";
import ReactDOM from "react-dom/client";
import { Provider } from "react-redux";
// import store from "./redux/store";
import store from "./redux/store";
import App from "./App";

const root = ReactDOM.createRoot(document.getElementById("root"));
// store.subscribe(() => {
//   root.render(
//     <React.StrictMode>
//       <App />
//     </React.StrictMode>
//   );
// });

root.render(
  <React.StrictMode>
    {/* allow all child node could use store */}
    <Provider store={store}>
      <App />
    </Provider>
  </React.StrictMode>
);
