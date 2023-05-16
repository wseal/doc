import { combineReducers } from "redux";

import count from "./count";
import persons from "./person";

// combine all reducer to one
export default combineReducers({
  count,
  persons,
});
