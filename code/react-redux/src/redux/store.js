import { legacy_createStore as createStore, applyMiddleware } from "redux";

// for async action
import thunk from "redux-thunk";

import countReducer from "./count_reducer";

export default createStore(countReducer, applyMiddleware(thunk));
