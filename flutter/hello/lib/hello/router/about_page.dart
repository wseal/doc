import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  static const String routeName = "/about";

  const AboutPage({Key? key}):super(key:key);

  @override
  Widget build(BuildContext context) {

    final String args = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
          title: const Text("About", style: TextStyle(color: Colors.black, fontSize: 20)),
          leading: ElevatedButton(onPressed: (){_back(context);}, child: const Icon(Icons.back_hand),)
      ),

      body: Center(
        child: ElevatedButton(
            onPressed: () {
              _back(context);
            },
            child: Text("关于容。。。。${args}",
              style: const TextStyle(color: Colors.black, fontSize: 20),)),
      ),
    );
  }

  void _back(BuildContext context) {
    Navigator.of(context).pop("pop from about");
  }
}
