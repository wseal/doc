import { Increment, Decrement } from "./const";

export function createIncAction(data) {
  return { type: Increment, data };
}

export const createDecAction = (data) => ({ type: Decrement, data });
