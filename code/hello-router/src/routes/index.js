import About from "../pages/About";
import Home from "../pages/Home";
import { Navigate } from "react-router-dom";

const route = [
  {
    path: "/home",
    element: <Home />,
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
