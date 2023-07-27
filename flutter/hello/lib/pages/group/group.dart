
import 'package:flutter/material.dart';

class Group extends StatelessWidget {
  const Group({Key?key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
      ),

      body: const Center(
        child: GroupContent(),
      ),
    );
  }
}

class GroupContent extends StatefulWidget {
  const GroupContent({Key? key}):super(key: key);

  @override
  State<GroupContent> createState() => _GroupContentState();
}

class _GroupContentState extends State<GroupContent> {
  @override
  Widget build(BuildContext context) {
    return const Text("Group");
  }
}