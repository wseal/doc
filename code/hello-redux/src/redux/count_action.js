import { Increment, Decrement } from "./const";

export function createIncAction(data) {
  return { type: Increment, data };
}

export const createDecAction = (data) => ({ type: Decrement, data });

// async action, value is function, start async task
export const createAsyncIncAction = (data, time) => {
  return (dispatch) => {
    setTimeout(() => {
      dispatch(createIncAction(data));
    }, time);
  };
};
