

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlignLayout extends StatelessWidget {
  const AlignLayout(Key? key):super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment(1, 1),
      widthFactor: 10,
      heightFactor: 12,
      child: Icon(Icons.pets, size: 50),
    );
  }
}


class PaddingLayout extends StatelessWidget {
  const PaddingLayout(Key? key):super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(padding: EdgeInsets.only(bottom: 10),
      child: Text("Buttons", style: TextStyle(fontSize: 30, color: Colors.red)),
    );
  }
}


class ContainerLayout extends StatelessWidget {
  const ContainerLayout(Key? key):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red,
        width: 200,
        height: 200,
        alignment: const Alignment(-1, -1),
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(15),
        child: const Icon(Icons.pets),
        transform: Matrix4.rotationX(10),
        decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(width: 2, color: Colors.pink),
            borderRadius: BorderRadius.circular(8),
            boxShadow: [BoxShadow(color: Colors.blue, offset: offset(10, 12))]
        ));
  }

  offset(int i, int j) {}
}


/*
* Row:
*   水平方向尽可能占用比较大的空间
*   如果水平方向想设置包裹内容设置 mainAxisSize = min
*
* MainAxisAlignment:
*   start:  默认值
*   end:
*   center:
*   spaceBetween: 左右两边间距为0，其他间距相等
*   spaceAround:  左右间距是其他间距的一半儿
*   spaceEvenly:  所有间距相等
*
*
* CrossAxisAlignment: 交叉轴
*   start:
*   end:
*   center: 默认值
*   baseline:基线对齐(必须有文本才有效)
*   stretch: row先占用尽可能大空间，然后拉伸子元素到最大
* */

class FlexRow extends StatelessWidget {
  const FlexRow(Key? key):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
     child: Row(
       mainAxisAlignment: MainAxisAlignment.start,
       crossAxisAlignment: CrossAxisAlignment.center,
       mainAxisSize: MainAxisSize.max,
       textBaseline: TextBaseline.ideographic,
       children: [
         Flexible( // 按比例缩放，宽度不再有作用
            fit: FlexFit.tight,
             flex: 1,
             child: Container(width: 50, height: 30, color: Colors.red)),
         Expanded( // 相当于 flexible 添加 fit: FlexFit.tight,
             flex: 1,
             child: Container(width: 50, height: 30, color: Colors.blue)),
         Container(width: 50, height: 30, color: Colors.black),
         Container(width: 50, height: 30, color: Colors.green)
       ],
     ),
    );
  }
}

/*
* Stack 默认大小为包裹内容，里面内容互相重叠
*   - alignment: 子元素布局开始位置
*   - fit：(expand 很少使用)，子元素拉伸到最大
*   - overflow: 超出部分如何处理
*
*   Positioned： 开启内部相对布局
* */
class StackCotainer extends StatelessWidget {
  const StackCotainer({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        Container(width: 400, height: 200, color: Colors.green),
        const Positioned(left: 10,child: Icon(Icons.pets)), // 开启内部布局
        const Text("stack", style: TextStyle(fontSize: 20, color: Colors.red)),
      ],
    );
  }
}

class ListViewContainer extends StatefulWidget {
  const ListViewContainer({Key? key}) :super(key: key);

  @override
  State<ListViewContainer> createState() => _ListViewContainerState();
}


/*
* 监听滚动
*
*   ScrollController -
*     1-可以设置默认offset
*     2-可以监听滚动，可以监听滚动的位置
*     3-无法监听开始滚动，结束滚动
*
*   NotificationListener
*     1-可以监听开始/结束滚动，通过回调函数onNotification
* */
class _ListViewContainerState extends State<ListViewContainer> {
  ScrollController controller = ScrollController(initialScrollOffset: 100);
  var isShowFloatingButton = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.addListener(() {
      print("listen scroll ${controller.offset}");
      if (controller.offset > 1000) {
        setState(() {
          isShowFloatingButton = true;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement deactivate
    super.dispose();

    // 销毁
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List View Demo"),
      ),

      body: NotificationListener(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollStartNotification) {
            print("start");
          } else if (notification is ScrollUpdateNotification) {} else
          if (notification is ScrollEndNotification) {
            print("end, ${notification.metrics.maxScrollExtent}");
          }

          return true;
        },
        child: ListView.builder(
          controller: controller,
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: const Icon(Icons.people),
                  trailing: const Icon(Icons.delete),
                  title: Text("Hello $index", style: const TextStyle(fontSize: 20)),
                  subtitle: const Text("联系人:12345678", style: TextStyle(fontSize: 10)),
                );
          },
        ),
      ),

      floatingActionButton: isShowFloatingButton ? FloatingActionButton(
        child: const Icon(Icons.arrow_upward),
        onPressed: () {
          controller.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.easeInSine);
        },
      ) : null,
    );

      // return ListView(
    //   itemExtent: 100,
    //   children: List.generate(100, (index) {
    //     return ListTile(
    //       leading: const Icon(Icons.people),
    //       trailing: const Icon(Icons.delete),
    //       title: Text("Hello $index", style: const TextStyle(fontSize: 20)),
    //       subtitle: const Text("联系人:12345678", style: TextStyle(fontSize: 10)),
    //   );
    // }),
    // );

    // 动态创建元素
    // return ListView.builder(
    //     itemCount: 30,
    //     itemExtent: 20,
    //     itemBuilder: (BuildContext context, int index) {
    //       var size = 20 + index;
    //       return Text(
    //           "Text-->$index", style: TextStyle(fontSize: size.toDouble()));
    //     });

    // return ListView.separated(
    //     itemCount: 30,
    //     itemBuilder: (BuildContext context, int index) {
    //       var size = 20 + index;
    //       return Text(
    //           "Text-->$index",
    //           style: TextStyle(fontSize: size.toDouble())
    //       );
    //     },
    //     separatorBuilder: (BuildContext context, int index) {
    //       return const Divider(color: Colors.blue, height: 2);
    //     });
  }
}

class GridViewContainer extends StatelessWidget {
  const GridViewContainer(Key? key) :super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: GridView(
    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 3,
    //       childAspectRatio: 2,
    //       crossAxisSpacing: 8,
    //       mainAxisSpacing: 8,
    //     ),
    //
    //     children: List.generate(100, (index) {
    //       final r = Random(1).nextInt(255);
    //       final g = Random(1).nextInt(255);
    //       final b = Random(1).nextInt(255);
    //       return Container(
    //         color: Color.fromARGB(255, r, g, b),
    //       );
    //     }),),
    // );

    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: GridView(
    //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    //       maxCrossAxisExtent: 200,
    //       crossAxisSpacing: 8,
    //       mainAxisSpacing: 8,
    //     ),
    //
    //     children: List.generate(100, (index) {
    //       final r = Random(1).nextInt(255);
    //       final g = Random(1).nextInt(255);
    //       final b = Random(1).nextInt(255);
    //       return Container(
    //         color: Color.fromARGB(255, r, g, b),
    //       );
    //     }),),
    // );

    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),

        itemBuilder: (BuildContext context, int index) {
          var size = 20 + index;
          return SizedBox(
            width: 200,
            height: 100,
            child: Text(
                "Text-->$index",
                style: TextStyle(fontSize: size.toDouble())
            ),
          );
        });
  }
}


class SliverLayout extends StatelessWidget {
  const SliverLayout({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 200,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text("hello"),
            background: Image.asset("", fit: BoxFit.cover),
          ),
        ),
        SliverSafeArea(
          sliver: SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    final r = Random(1).nextInt(255);
                    final g = Random(1).nextInt(255);
                    final b = Random(1).nextInt(255);
                    return Container(
                      color: Color.fromARGB(255, r, g, b),
                    );
                  },
                  childCount: 100,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 2,
                )),
          ),
        )
      ],
    );
  }
}



















