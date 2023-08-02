
import 'package:flutter/material.dart';

import 'about_page.dart';
import 'detail_page.dart';


class RouterApp extends StatelessWidget {
  const RouterApp({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green,
          splashColor: Colors.transparent
      ),

      routes: {
        RouterHomePage.routeName: (context) => const RouterHomePage(),
        AboutPage.routeName: (ctx) => const AboutPage(),
        DetailPage.routeName: (ctx) => const DetailPage(),
      },

      // home: const RouterHomePage(),
      initialRoute: RouterHomePage.routeName,

      // onGenerateInitialRoutes: (settings) {
      //   return [];
      // },

      onGenerateRoute: (settings) {
        if (settings.name == "t") {
          return MaterialPageRoute(builder: (ctx) {
            // settings?.arguments
            return const RouterHomePage();
          });
        }
      },

      onUnknownRoute: (settings) {
        // Unknown page
      },
    );
  }
}

class RouterHomePage extends StatefulWidget {
  static const String routeName = "/";

  const RouterHomePage({Key? key}):super(key: key);

  @override
  State<RouterHomePage> createState() => _RouterHomePageState();
}

class _RouterHomePageState extends State<RouterHomePage> {
  var _data = "welcome ";
  var _about = "about";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页", style: TextStyle(color: Colors.white, fontSize: 40)),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton( // 或者使用WillPopScope，自己实现返回代码，替换默认的返回
              onPressed: () {
                _jumpToDetail(context);
              },
              child: Text("Detail: ${_data}", style: const TextStyle(color: Colors.white, fontSize: 30)),
            ),

            ElevatedButton( // 或者使用WillPopScope，自己实现返回代码，替换默认的返回
              onPressed: () {
                _jumpToAbout(context);
              },
              child: Text("About: ${_about}", style: const TextStyle(color: Colors.white, fontSize: 30)),
            ),
          ],
        )
      ),
    );
  }

  _jumpToDetail(BuildContext context) {
    var navigator = Navigator.of(context);
    var feature = navigator.push(MaterialPageRoute(builder: (ctx)=>const DetailPage()));
    feature.then((value) {
      setState(() {
        _data = value;
      });
    });
  }

  _jumpToAbout(BuildContext context) {
    var navigator = Navigator.of(context);
    var feature = navigator.pushNamed(AboutPage.routeName, arguments: "about param");
    feature.then((value) {
      setState(() {
        _about = value as String;
      });
    });
  }
}



