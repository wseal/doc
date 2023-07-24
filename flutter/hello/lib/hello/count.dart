
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountApp extends StatelessWidget {
  const CountApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "计算器",
      home: CountHomePage(),
    );
  }
}

class CountHomePage extends StatelessWidget {
  const CountHomePage({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter", style: TextStyle(color: Colors.black)),
      ),

      body: CountBody(),
    );
  }
}

class CountBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Counter();
  }
}

class _Counter extends State<CountBody> {
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        counter += 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.red),
                    child: const Text("+", style: TextStyle(fontSize: 20))),

                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        counter -= 1;
                      });
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                    child: const Text("+", style: TextStyle(fontSize: 20))),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("当前计数为: ${this.counter}",
                      style: const TextStyle(
                          color: Colors.black, fontSize: 10)),
                ]
            ),
          ]
      );
  }
}


