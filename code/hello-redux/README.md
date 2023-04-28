# Getting Started with Redux

This project was demo for how to use redux

## Counter

- delete components's state
- add redux construct
  - src/redux
    - store.js 
    - count_reduce.js
  - store
    - import redux function legacy_createStore
    - use reduce function to create store instance 
    - export store install
  - counter_reduce
    - create reduce function(preState, action)
    - reducer function do to works for us, init data and do action
    - store will trigger the first function call of the reducer
  - to subscribe the state change,to render component

### `npm run build`

See the section about [deployment](https://facebook.github.io/create-react-app/docs/deployment) for more information.

### `npm run eject`

**Note: this is a one-way operation. Once you `eject`, you can't go back!**

If you aren't satisfied with the build tool and configuration choices, you can `eject` at any time. This command will remove the single build dependency from your project.


