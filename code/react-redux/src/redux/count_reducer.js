// create a reducer used by store
// params (preState, action)

const initStat = 0;
export default function countReducer(preState = initStat, action) {
  // if (!preState) { preState = initStat}
  const { type, data } = action;
  console.log(`count reducer--> ${type} ${data} ==> ${preState}`);
  switch (type) {
    case "increment":
      return preState + data;

    case "decrement":
      return preState - data;

    default:
      return preState;
  }
}
