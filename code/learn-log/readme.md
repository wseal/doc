- 目录结构
  - public
    - index.html
  - src
    - index.js

- 初始化
  -  yarn init -y
    
- 安装依赖
  - yarn add react react-dom react-scripts
  
  
- 添加快捷命令
  - package.json中添加
  ```
  "scripts": {
    "start":"react-scripts start",
    "build":"react-scripts build"
  }

  // 语法检测
  "eslintConfig": {
    "extends":[
      "react-app"
    ]
  }
  ```