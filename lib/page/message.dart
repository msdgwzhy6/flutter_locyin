import 'package:flutter/material.dart';
class MessagePage extends StatefulWidget {
  const MessagePage({Key? key}) : super(key: key);

  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("消息页"),
      ),
    );
  }
}
