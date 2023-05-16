import { legacy_createStore as createStore, applyMiddleware } from "redux";
import { composeWithDevTools } from "redux-devtools-extension";

// for async action
import thunk from "redux-thunk";

import allReducer from "./reducers";

export default createStore(
  allReducer,
  composeWithDevTools(applyMiddleware(thunk))
);

// export default createStore(countReducer, applyMiddleware(thunk));

// 汇总reducer
// import { combineReducers } from "react-redux";
// const allReducer = combineReducers({
//   count: countReducer,
//   persons: personReducer,
// })
// export default createStore(allReducer, applyMiddleware(thunk))
