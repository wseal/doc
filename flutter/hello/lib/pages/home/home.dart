import 'package:flutter/material.dart';
import 'package:hello/theme/theme.dart';

class Home extends StatelessWidget {
  const Home({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppbarColor,
        title: const Text("首页"),
      ),

      body: const Center(
        child: HomeContent(),
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}):super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return const Text("Home....");
  }
}

