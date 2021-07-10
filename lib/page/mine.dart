import 'package:flutter/material.dart';
class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<MinePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("我的页"),
      ),
    );
  }
}
