import { Navigate } from "react-router-dom";

import About from "../pages/About";
import Home from "../pages/Home";
import Message from "../pages/Message";
import News from "../pages/News";

const route = [
  {
    path: "/home",
    element: <Home />,
    children: [
      {
        path: "news",
        element: <News />,
      },
      {
        path: "message",
        element: <Message />,
      },
    ],
  },
  {
    path: "/about",
    element: <About />,
  },
  {
    path: "/home",
    element: <Navigate to="/about" />,
  },
];

export default route;
