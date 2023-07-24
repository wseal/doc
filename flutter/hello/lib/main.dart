import 'package:flutter/material.dart';
import 'package:hello/hello/count.dart';

import 'hello/fidget.dart';
import 'hello/goods.dart';
import 'hello/hello.dart';
import 'hello/terms.dart';

void main() {
  runApp(
      const MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   title: 'Demo Flutter',
    //   theme: ThemeData(
    //     primarySwatch: Colors.green,
    //   ),
    //   debugShowCheckedModeBanner: false,
    //   home: const TermsHomePage("条款")
    // );

    return const WidgetApp();
  }
}

