import { AddPerson } from "../const";

const initStat = [{ id: 1, name: "test-1", age: 18 }];
export default function personReducer(preState = initStat, action) {
  // if (!preState) { preState = initStat}
  const { type, data } = action;
  console.log(`count reducer--> ${type} ${data} ==> ${preState}`);
  switch (type) {
    case AddPerson:
      return [data, ...initStat];

    default:
      return preState;
  }
}
