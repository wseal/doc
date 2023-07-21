# React

## 虚拟 DOM

- 虚拟 DOM 就是普通的 Object
- 虚拟 dom 比较`轻量`, 真实 dom 比较`重`，因为虚拟 dom 在 react 内部是使用，不需要那么多属性
- 虚拟 dom 最总会被转换为真实 dom，渲染显示
- `每个dom都要有唯一ID`
- second paragraph backend-->front
- shrug
- rough
- lumber
- cradle
- refuse
- finish
- old + 2BigAlpha

- 格式
  - 虚拟 dom 时候，不用写引号`const vdom = (<h2 id={myID}><span>hello</hello></h2>)`
  - 标签中引入`js表达式，注意不是语句`，需要使用{}
  - 样式的类名不用 class，使用 className 代替
  - 内联样式，要用 style={{key:value}}形式
  - 虚拟 dom 必须只有一个根标签
  - 标签必须闭合
  - 小写字母开头，则转换为 html 中的同名标签，若没有同名的标签，则报错
  - 大写字母开头，则 react 去渲染对应的组件，组件没有定义则报错

## 组件

- 函数组件

  - 首字母必须大写，组件名就是函数名
  - 渲染: ReactDOM.render(<Component/>, parentNode)
    - react 解析组件标签，找到组件 Component
    - 发现组件是使用函数定义的，随后调用函数，将返回的虚拟 dom 转换为真实的 DOM，呈现页面内容
  - 可以接收参数`(props的使用方式)`

- 类组件
  - 类组件必须继承 React.Component
  - 必须要实现 render 方法
    ```
      class MComponent extends React.Component {
        render() {
          return <h2>类式组件</h2>
        }
      }
    ```
  - 渲染同函数式组件相同

## 组件核心属性

- 核心组件必须是类式组件
- 继承 React.Component
- 事件响应采用 onClick 方式编写 `<h1 onClick={click}></h1>`
- state

  - 值是对象，可以包含多个 key-value 组合
  - 为组件的状态机，可以通过更新组件的 state 来更新对应页面的显示
  - 状态不能直接更改`(需要使用setState,将属性合并)`
  - 组件中自定义的函数方法直接绑定的时候，this 会为 undefined，下面方法解决
    - 通过函数对象的 bind
    - 箭头函数

- `babel可以运行展开运算符，展开一个对象，但是使用上有很多限制`

- props

  - 只读属性
  - 从组件外部传递数据 ReactDOM.render(<Weather key1="val1" key2="val2"/>,document.getElementById('root'));
  - 数据存放在 this.props 中
  - 限制数据类型和默认值`(也可以写在类定义中，使用static限定)`

    ```
      Class.propTypes = {
        name: PropTypes.string.isRequired,
        age: PropTypes.number.
        speak: PropTypes.func, // 限制为函数
      }

      class.defaultProps = {
        sex: 'male', // 默认值
        age: 18,
      }
    ```

  - 构造器是否接收 props，是否传递给 super，取决于，是否希望在构造器中通过 this 访问 prop
  - `通常能省略构造器中的props就省略`

- ref

  - 字符串形式：

    - 渲染中使用 <input ref="input" type="text"/>
    - 组件中直接使用 this.refs.input 引用该元素

  - 回调函数形式：

    - ref 内联函数形式，`默认每次更新组件函数会被调用两次，可以使用类实例的绑定函数替换，这样只需调用一次`
    - `但通常我们就使用内联方式`
    - 渲染中使用(绑定函数) <input ref={ this.input } type="text"/>
    - 渲染中使用(内联函数) <input ref={ (c) => {this.input = c} } type="text"/>
    - 组件中直接使用 this.input 引用该元素

  - createRef 形式
    - 调用后返回一个容器，容器可以存储被 ref 标识的节点(一个容器对应一个节点)
    - 组件中定义：inputRef = React.createRef();
    - 渲染中：<input ref={this.inputRef} type="text" />

- 受控组件：使用回调，随时存储数据
- 非受控组件：使用 ref，随用随取

- 生命周期(旧版本)

  - 挂载 - ReactDOM.render() 触发

    - constructor
    - componentWillMount - `废弃`
    - `render`
    - `componentDidMount - 组件挂载完成，通常：定时器、网络请求、订阅`

  - 卸载 - ReactDOM.unmountComponentAtNode `触发卸载`

    - `componentWillUnmount - 组件将要被卸载，通常 关闭定时器、取消订阅`

  - 更新 - 组件内部 setState

    - shouldComponentUpdate - 返回值 true：更新，false：不更新
    - componentWillUpdate - `废弃`
    - `render`
    - componentDidUpdate -

  - 父子组件 - 父组件`重新`render

    - componentWillReceiveProps - `废弃`, 组件将要接收新的 props`(第一次不算)`
    - shouldComponentUpdate

  - setState 触发 shouldComponentUpdate，进行更新检查
  - foreUpdate 触发 componentWillUpdate,不修改状态直接更新

- 生命周期(新版本)

  - 带有 will 的增加`UNSAFE`前缀,不包括 componentWillUnmount
  - 废弃三个 will 钩子，增加两个
  - 挂载

    - constructor
    - getDerivedStateFromProps - `通常不用,除非state的值在任何情况下都取决于props,那么可以考虑使用`
    - render
    - 更新 DOM、refs - `框架操作`
    - componetDidMount

  - 更新

    - getDerivedStateFromProps
    - shouldComponentUpdate
    - render
    - getSnapshotBeforeUpdate - `框架操作 - 更新之前获取快照`
    - 更新 DOM、refs - `框架操作`
    - componentDidUpdate

  - 卸载-和旧版本相同

## 消息发布-订阅

- 使用 pubsubjs
- yarm add pubsub-js
- PubSub.subscribe('topic', (msg, data) => {})
- PubSub.publish('topic', data)
- PubSub.publishSync('topic', data)
- PubSub.unsubscribe()
- mount 中发起订阅
- unmount 中取消订阅

## fetch

- 内置发送 http 请求，通常还是使用 jQuery/axios(底层封装 xhr)
- 有一些老版本浏览器，不兼容 fetch

## await / async 优化代码

```
  function getData() {
    fetch('url').then(
      response => {
        return response.json()
      },
      error => {
        return new Promise(()=>{}) // 中断链式调用处理
      }
    ).then(
      response => {
        console.log("获取数据成功", response)
      },
      error => {
        console.log('获取数据失败', error)
      }
    )
  }

  // 使用 async / await 优化链式调用代码
  async function getData() {
    try {
      const response = await fetch('url')
      const data = await response.json()
      PubSub.publis('topic', data)
    } catch (error) {
      console.log('获取数据失败', error)
    }
  }
```

## tips

- import React,{Component} from 'react' - react 中使用了多种暴露方式(分别暴露、默认暴露)
- 样式模块化 import hello from 'index.module.css',使用的时候{hello.title}
- 样式使用 less 写，最外部套一个模块层
- rcc 类组件初始化文件内容快捷键
- rfc 函数组件
- 不支持 if 操作的是，可以直接使用三元运算符

## 案例

- 拆分组件、安装静态组件。注意：className、style 写法
- 父子组件通信
  - 父-->子:通过 props
  - 子-->父:父通过 props 传递回调函数到子控件
- defaultChecked、checked 区别
- defaultValue、value 区别

## 跨域

- 配置一个代理：package.json 中配置 proxy:"目标机器"
- 配置多个代理：setupProxy.js
  ```
  const proxy = require('http-proxy-middleware')
  module.exports = function(app) {
    app.use(
      proxy('/api1', {
        target: "",
        changeOrigin: true,  // 控制修改请求头中的host
        pathRewrite:{'^/api1': ''}
      })
    )
  }
  ```

## 解构赋值

```
const {keyWordElement:{value:keyWord}} = this;
从this.keyWordElement.value中取值，并用keyWord变量保存值
```

## 路由

- SPA
- 默认是`push模式`, 可以开启`replace模式` - `<Link replace={true} ....> </Link>`
- 底层依靠 BOM 的 history 实现

  - H5 推出的 history - createBrowserHistory，`不兼容IE9以及以下版本,但是目前通常使用该模式`
    - 刷新不影响 state 参数(state 参数保存在 history 中)
  - hash(锚点) - createHashHistory
    - `刷新后导致路由state参数丢失！！！`

- reactor-router(-dom web 使用的路由)

  - BrowserRouter 包裹 App 里面所有内容
  - 路由链接 `<Link className="list-group-item" to="/about">About</Link>`
  - `路由链接: 可以用NavLink代替Link，增加一个activieClassName - 实现点击激活时的高亮`
  - 注册路由组件 `<Route exact={true} path="/about" component={About} />` - 放在 page 目录
  - 普通组件 `<About />` - 放在 component 目录
  - 路由组件会收到三个固定属性`(注意：一般组件没有这些)`

    - history
    - location
    - match

  - `withRouter函数`
    - 函数，加工一般组件，然后一般组件有路由组件的特性新组件

- 实现 Link 的扩展

  - `<Link>About</Link>` - 标签体内容 `About` 会被放到 Link 组件的 props 的 children 中
  - `<Link children='About'/>` - 和上面  等价

  ```
    <Link {...this.props} />
  ```

- 路由匹配

  - 默认是从头遍历全部路由
  - 使用 Switch 组件包裹所有路由注册 - `就会使用单一匹配，匹配到第一个就不再继续匹配`
  - 默认使用模糊匹配，开启精准匹配 - `exact={true}`,通常能不开精准匹配就不开启`(开启会导致二级路由出现问题)`

  ```
  <Switch>
    <Route path="/home/news" component={News} />
    <Redirect to="/home/news" />
  </Switch>
  ```

- 重定向(Redriect)

  - 放到路由注册的最下面，都不匹配的时候执行(类似 default)
  - `<Redirect to="/about" /> `

- 嵌套路由(多级路由/二级路由)

  - 注册子路由，需要带有父路由的 path
  - 路由匹配是按照注册路由的顺序进行的

- 向路由组件传递参数

  - params 参数 `/home/message/news/10/title-txt` 传递两个数据{10, title-txt}

    - 传递 `` <Link to={`/home/message/detail/${obj.id}/${obj.title}`}>{obj.title}</Link> ``
    - 接收 `<Route path="/home/message/detail/:id/:title" component={Detail} />`
    - 参数都会存储在 props.match.params 中，传递给目标匹配成功对象

  - search 参数 `/home/message/news?id=10&title=txt`

    - 传递 `` <Link to={`/home/message/detail/?id=${obj.id}&title=${obj.title}`}>{obj.title}</Link> ``
    - 接收 `<Route path="/home/message/detail" component={Detail} />`
    - 参数都会存储在 props.location.search 中`(urlencode编码格式)`，传递给目标匹配成功对象
    - 使用 querystring 解析 query 字符串

  - state 参数

    - 优势：传递的参数不会暴露在地址栏
    - 传递 `` <Link to={{pathname:`/home/message/detail`, state:{id:1, title:'txt'}}}>{obj.title}</Link> ``
    - 接收 `<Route path="/home/message/detail" component={Detail} />`
    - 参数都会存储在 props.location.state 中

  - 编程实现路由跳转

    - searh / params
      - this.props.history.replace(host+path)
      - this.props.history.push(host+path)
    - state

      - this.props.history.replace(host+path, {id: 1, data:{}})
      - this.props.history.push(host+path, {id: 2, data:{}})

    - this.props.history.go
    - this.props.history.goBack
    - this.props.history.goForward

- 解决样式丢失
  - 使用 HashBrowser
  - 使用%PUBLIC_URL%前缀，引入样式
  - 使用绝对路径，引入样式

## ReactUI 组件库

- material-ui - 国外
- ant-design - 支付宝
- 按需引入(3.x 版本详细)-参考官方文档即可

## redux

- 某个组件的状态需要让其他组件可以随时使用(共享)
- 一个组件需要改变另一个组件状态(通信)
- 总体原则：`能不用就不用,不用的时候比较吃力就考虑使用`

- 同步 action - 一般的函数对象
- 异步 action - 函数对象

  ```
  export const createAsyncAction = (data, time) => {
    return (dispatch) => {
      setTimeout(()=>{
        dispatch({type:"increment", data})
      },time)

  }
  ```

## react-redux

- 所有的 UI 组件都应该被一个容器组件包裹，他们是父子关系
- 容器组件真正和 redux 交互，随意使用 redux 的 api
- ui 组件不能使用任何 redus 的 api
- 容器组件会传给 UI 组件 redux 中的状态、操作状态的方法
- 容器传递给 UI 组件的状态、方法都使用 props 方式

- ## 容器组件

## 状态更新

- setState(stateChange, [callback])
- 同步方法，但是引起后续的渲染更新动作是异步执行
- `要获取更新后的结果需要在后面的回调中获取`

  ```
  setState(stateChange, [callback]) - 对象式
      stateChange: 状态改变对象
      callback: 状态更新完成、界面也更新(render)后被调用

  setState({count: 10}, ()=>{})

  setState((state, props) =>(), [callback])  - 函数式
      updater: 返回stateChange对象的函数

    对象式setState是函数式的简写(语法糖)
      新状态不依赖原对象--->使用对象式
      新状态依赖原对象---->使用函数式
      如果需要在setState执行后获取最新的状态数据，要在callback函数中获取

  setState((state, props)=>{
    return {count: state.count+1}
  }, ()=>{})
  ```

- `注意 - setState在react中更新底层采用事物机制，当脱离react时候，state数据的更新方式有区别`

  - 在 react 控制的回调函数中：生命周期钩子/react 事件监听回调中式异步更新值
  - 在非 react 控制的异步回调函数中：定时器回调、原生事件监听回调、promise 回调 中同步更新值
  - 同步更新的时候，先更新->render->执行更新后面的语句
  - 异步模式：先执行 setState 后面的语句，再 render

- 异步的 setState(React 控制范围内)多次调用情况下
  - 对象模式`状态更新和界面更新都合并，都只做一次`
  - 函数模式`更新多次数据`，但只 render 渲染一次。
  -

## 懒加载(lazy load)

- 通常路由组件采用懒加载(使用的时候才加载)
- `使用Suspense组件处理加载没成功的情况---新建一个Loading组件`
  ```
  <Suspense fallback={<Loading />}>
    <Route path="/about" component={About} />
    <Route path="/home" component={Home} />
  </Suspense>
  ```
- 引入方式改为`const Home = lazy(()=>{import('./Home')})`
-

## Hooks

- 函数式组件，没有 this，通常只用于很简单的组件
- Hooks 可以让函数式组件使用 state、其他 React 特性
- React.useState() - 函数式组件使用 state
- React.useEffect() - 函数组件使用生命周期
- React.useRef() - 函数组件使用子 html 元素

```
// 渲染过程中，一次一次被调用
function Demo() {
  const [count, setCount] = React.useState(0)

  const my = React.useRef()

  // 如果没有第二个参数，则监控所有状态改变，数组里面保存的式要监控的变量
  // 参数回调函数的返回值是一个函数，当组件unmount的时候被调用
  React.useEffect(()=>{

    return ()=>{

    }
  }, [])

  function add() {
    setCount(count+1)
  }

  return (
    <div>
    <h2>sum :{count}</h2>
    <button onClick={add}>点击</button>
    </div>
  )
}
```

## Fragment

- 避免多余的 div 层级
- 使用<Fragment></Fragment>包裹各个元素
- 编译之后该标签会被丢掉

## Context

- 一种通信方式，常用于祖组件 和 后代组件通信

  ```
  const UContext = React.createContext()

  // 使用新标签包裹子组件
  <UContext.Provider value={name}> </UContext.Provider>

  // 子组件声明使用context, this.context中就会有数据
  static contextType = UContext

  // 或者子组件使用函数
  <Consumer>
    {
      value=>{
        return `${value.username}`
      }
    }
  </Consumer>
  ```

## 组件优化

- Component 组件的两个问题

  - 只要执行了 setState,即使不改变状态，组件也会重新 render
  - 只要当前组件 render,就会自动重新 render 所有子控件 -- 效率低
  - 原因：`组件中的shouldComponentUpdate总是返回true`

- 解决方案
  - 重写`shouldComponentUpdate(nextProps, nextState)方法`
  - 使用 PureComponent(该组件重写了 shouldComponentUpdate,只有 state、props 数据变化才返回 true)
    - 只进行浅比较`(不进行对象内部字段一一比较,只比较对象的地址)`
    - 不要只在原来对象修改 state 数据，要使用新对象更新 state
  - `项目一般使用PureComponent代替Component优化项目`

## renderProps-(类似 vue 中的插槽)

- 组件 B 作为组件 A 的标签体，AB 就是父子关系`<A><B /></A>`(B 在 A 的 props.children 中)
- 动态修改预留位置的组件
  - 使用 B 组件占用 A 组件的位置，形成一个新的布局。`<A render={()=><B name={name} />}>`
  - A 中渲染函数中调用 prps.render，渲染 B {this.props.render(name)},B 就会获得 props.name 属性
-

## 错误边界(Error Boundary)

- 当子组件生命周期(render)中出现错误时候，会触发调用该函数，该函数返回一个对象(该对象会被设置给 state)
- static getDerivedStateFromError(error) {return {hasError: true}}
- {this.state.hasError ? <h1>当前网络不稳定，稍后！！</h2> : <Child/>}

- `声明周期: componentDidCache - 组件渲染错误时候调用(通常反馈错误给统计后台)`

## 通信方式

- Props
  - children props
  - render props
- 消息发布订阅
  - pub-sub
  - event
- 集中式
  - redux
  - dva
- conText

  - 生产者-消费者模式

- 父子：props
- 兄弟：消息订阅、集中式
- 祖孙：消息订阅、集中式、conText(实际使用较少，通常用于封装框架)

- elementUI
- vantUI - 移动端

## React Native

- 安装工具：npm install -g react-native-cli
- 创建项目: react-native init project-name or react-native init peoject --source react-native@0.42.3
-
