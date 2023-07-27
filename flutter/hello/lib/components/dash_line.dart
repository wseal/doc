
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashLineAppTest extends StatelessWidget {
  const DashLineAppTest({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Dash Line Test"),
        ),
        body: const Center(child: DashLine(color: Colors.blue)),
      ),
    );
  }
}

class DashLine extends StatelessWidget {
  final Axis axis;
  final int    dashCount;
  final double dashWidth;
  final double dashHeight;
  final Color color;


  const DashLine({
    Key? key,
    this.axis = Axis.horizontal,
    this.dashCount = 5,
    this.dashWidth = 30,
    this.dashHeight = 3,
    this.color = const Color(0xffaaaaaa),
  }) :super(key: key);

  @override
  Widget build(BuildContext context) {
    // var count = dashCount;
    // var width = dashWidth;
    // if (count == 1 || dashCount * dashWidth > totalWidth) {
    //   count = 1;
    //   width = totalWidth;
    // }

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return SizedBox(
            child: Flex(
              direction: axis,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(dashCount, (index) {
                return SizedBox(
                  width: dashWidth,
                  height: dashHeight,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: color),
                  ),
                );
              })),
          );
        });
  }
}
