
// widget ui

import 'package:flutter/material.dart';

class WidgetApp extends StatelessWidget {
  const WidgetApp({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WidgetHomepage(),
    );
  }
}

class WidgetHomepage extends StatelessWidget {
  const WidgetHomepage({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widget UI"),
      ),
      body: const WidgetHomeBody(),
    );
  }
}

class WidgetHomeBody extends StatelessWidget {
  const WidgetHomeBody({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Text.rich(
    //   TextSpan(
    //     children: [
    //       TextSpan(text:"Hello Widget", style: TextStyle(color: Colors.green)),
    //       TextSpan(text:"Hello Widget 222", style: TextStyle(color: Colors.red)),
    //       TextSpan(text:"Hello Widget 3333", style: TextStyle(color: Colors.black)),
    //     ]
    //   )
    // );
    
    return FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(Icons.add),
            Text("Button"),
          ],
        ),
        onPressed: (){ print("----->"); }
    );
  }
}


