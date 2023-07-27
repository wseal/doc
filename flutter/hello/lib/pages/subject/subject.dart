
import 'package:flutter/material.dart';

class Subject extends StatelessWidget {
  const Subject({Key?key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
      ),

      body: const Center(
        child: SubjectContent(),
      ),
    );
  }
}

class SubjectContent extends StatefulWidget {
  const SubjectContent({Key? key}):super(key: key);

  @override
  State<SubjectContent> createState() => _SubjectContentState();
}

class _SubjectContentState extends State<SubjectContent> {
  @override
  Widget build(BuildContext context) {
    return const Text("Subject");
  }
}