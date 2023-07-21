# Dart Program Language

- 声明变量

  - String name = "string";
  - var age = 20;
  - final score = 100; // 运行期间只能赋值一次
  - const score = 100; // 编译期间必须赋值
  - var message = "name is ${name}, type is ${name.runtimeType}";
  - var nameList = [];
  - var movieSet = {"", "", ""};
  - var s = Set<String>.from(iterable).toList();
  - var infoMap = {"a":10, "b": 9};

- 函数

  ```
    // 位置可选参数
    void sayHello(String name, [int age = 10, double h]) {

    }

    // 命名可选参数
    void sayHello(String name, {int age = 11, double h}) {

    }

    // 匿名函数，高阶函数
    void sayHell(Function func) {
        func();
    }

    typedef Func int func(int a);
    int sayHello(Func func) {
        return func(10);
    }

    // sayHello((){return 10;})
    // sayHello(()=> return 10;)

  ```

- 运算符

  ```
    var name = "cb";
    name ??= "if no value, use this"; // 如果name为null，则用后面的值，否则不进行赋值

    var tmp = name ?? "new value"; // 如果name为null，则用后面的值，否则用前面的值，三目运算符简写


    // 级联运算符，链式调用
    var p = Person()
            ..run()
            ..sleep()
            ..name = "w"

  ```

- 语法

```
for (var i=0; i<10; i++)
for (var name in array)

switch, case , break, default;
```

- 类: 默认情况下所有类都继承自 Object

```
class Person {
    String name;
    int age = 1;
    String desc;

    // setter
    set setDesc(String desc) {this.desc = desc;}

    // getter
    String get getDesc =>desc;

    // 初始化列表
    Person(String name, {int age}):this.age = age ?? 10 {
        this.name = name;
    }

    // 语法糖
    Person(this.name, this.age);

    // 命名构造函数
    Person.withAge(this.age);

    //
    Person.fromMap(Map<String, dynamic> map) {
        this.age = map["age"];
    }

    // 构造函数重定向
    Persion(String name):this._internal(name, 0);
    Persion._internal(this.name, this.age);


    // 常量构造函数,同样参数的常量构造函数创作出来的对象是同一块内存
    const Persion(this.name);


    // 工厂构造函数, 工厂构造函数可以手动返回对象。
    // 普通构造函数，只能返回对象自身，不能使用return
    factory Persion.withName(String name) {
        if (_name.containsKey(name)) {
            return _name["name"];
        } else {
            final p = Persion(name)；
            _name[name] = p;
            return p;
        }
    }


    // 函数重写
    @override
    String toString() {
        return "${name}, ${age}";
    }
}

```

- 继承

```

class Animal {
    int age;
    Animal(this.age);
}

class Person extends Animal {
    String name;

    Persion(thia.name, int age):super(age);
}


// 抽象类
abstract class Shape {
    int getArea();
    String getInfo() => "info";
}


// 继承抽象类之后，必须实现抽象类的抽象方法
class Rectangle extends Shape {
    @override
    int getArea() {return 10;}
}


```

- 隐式接口

```
// flutter中没有接口关键字，都是类(隐式接口)
//

class Runner {
    void running() {}
}

class Flyer {
    void flying(){}
}

// dart只支持单继承
// 当将一个类当作接口来使用时，实现这个接口类，必须实现接口中的所有方法
class SuperMan implement Runner, Flyer {
    @override
    void running() {}

    @override
    void flying(){}
}
```

- 混入 mixin

```
// 定义混入类的时候需要使用mixin，集成的时候使用with
mixin Runner {
    void running() {}
}

mixin Flyer {
    void flying(){}
}

// dart只支持单继承
// 当将一个类当作接口来使用时，实现这个接口类，必须实现接口中的所有方法
class SuperMan with Runner, Flyer {

}

```

- 查找顺序，自己方法>混入方法>父类方法

- Enum

```
enum Color {
    red,
    blue,
    green
}

print(Color.values);
print(Color.red.index);

```

- 库

```
// 一个dart文件就是一个库文件， _开头的变量，函数只能模块内使用

// 系统库
// import 'dart:core';
import 'dart:isolate';
import 'dart:async';
import 'dart:math';


// 封装库
import 'pkg/file_name.dart' as pkg;
import 'pkg/file_name.dart' show sum; // 显示指定导入
import 'pkg/file_name.dart' hide mul; // 显示不导入

// 使用export 将多个文件合并为一个库文件


// 三方库
// pubspec.yaml

import 'package:http/http.dart';

```

# Fluter

- 快捷键

  - stl -
  - stf -

- Sulfold

- StatelessWidget

```
// 无状态，内部只能使用final
```

- StatefulWidget

```
// 继承自State，State内部有widget绑定到了实际的widget中


```

- 生命周期

```

stateless的生命周期：只需要关注 构造函数 和 build函数

stateful生命周期：
1、StatefulWidget构造函数，然后调用createState()

2、State的构造函数，
    mounted
    initState
    dirtyState
    build

```
