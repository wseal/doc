
import 'package:flutter/material.dart';

class TermsHomePage extends StatelessWidget {
  final String title;

  const TermsHomePage(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Scaffold(
     appBar: AppBar(
       title: Text(title),
     ),

     body: const TermsBody(),
   );

  }
}
class TermsBody extends StatefulWidget {
  const TermsBody({Key? key}) : super(key: key);

  // const TermsBody({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TermsBodyState();
  }
}

class TermsBodyState extends State<TermsBody> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              value: value,
              // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              onChanged: <bool>(value) {
                print(value);
                setState(() {
                  this.value = value;
                });
              }),

          const Text(
              "同意条款", style: TextStyle(color: Colors.blue, fontSize: 22)),
        ],
      ),
    );
  }
}