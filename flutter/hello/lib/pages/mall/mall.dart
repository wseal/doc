
import 'package:flutter/material.dart';

class Mall extends StatelessWidget {
  const Mall({Key?key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
      ),

      body: const Center(
        child: MallContent(),
      ),
    );
  }
}

class MallContent extends StatefulWidget {
  const MallContent({Key? key}):super(key: key);

  @override
  State<MallContent> createState() => _MallContentState();
}

class _MallContentState extends State<MallContent> {
  @override
  Widget build(BuildContext context) {
    return const Text("Mall");
  }
}

