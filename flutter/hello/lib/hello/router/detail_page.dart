import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  static const String routeName = "/detail";

  const DetailPage({Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail", style: TextStyle(color: Colors.black, fontSize: 20)),
        leading: ElevatedButton(onPressed: (){_back(context);}, child: const Icon(Icons.back_hand),)
      ),

      body: Center(
        child: ElevatedButton(
            onPressed: () {
              _back(context);
            },
            child: const Text("详情内容。。。。",
              style: TextStyle(color: Colors.black, fontSize: 20),)),
      ),
    );
  }

  void _back(BuildContext context) {
    Navigator.of(context).pop("pop from detail");
  }
}
