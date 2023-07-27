import 'package:flutter/material.dart';
import 'package:hello/pages/group/group.dart';
import 'package:hello/pages/home/home.dart';
import 'package:hello/pages/mall/mall.dart';
import 'package:hello/pages/profile/profile.dart';
import 'package:hello/pages/subject/subject.dart';
import 'package:hello/theme/theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // title: "豆瓣 Demo",
        debugShowCheckedModeBanner: false,

        theme: ThemeData(
          // primaryColor: Colors.yellow,
          // highlightColor: Colors.transparent,
          splashColor: Colors.transparent, // 去除点击tab-bar阴影
        ),

        home: const StackPage()
    );
  }
}

class StackPage extends StatefulWidget {
  const StackPage({Key?key}):super(key: key);

  @override
  State<StackPage> createState() => _StackPageState();
}

class _StackPageState extends State<StackPage> {
  var _curIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("豆瓣 1.0"),
      // ),
      body: IndexedStack(
        index: _curIndex,
        children: const [
          Home(),
          Subject(),
          Group(),
          Mall(),
          Profile(),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: TabBarSelectedFontColor,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _curIndex,
        onTap: (index) {
          setState(() {
            _curIndex = index;
          });
        },
        items: [
          createItem("首页", "home"),
          createItem("书影音", "subject"),
          createItem("小组", "group"),
          createItem("集市", "mall"),
          createItem("我de", "profile"),
        ],
      ),
    );
  }

  BottomNavigationBarItem createItem(String title, String iconUrl) {
    return BottomNavigationBarItem(
      label: title,
      icon: Image.asset("assets/images/tab-bar/$iconUrl.png", width: 32),
      activeIcon: Image.asset(
          "assets/images/tab-bar/${iconUrl}_active.png", width: 32),
    );
  }
}
