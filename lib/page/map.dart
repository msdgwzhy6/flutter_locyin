import 'package:flutter/material.dart';
class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text("地图页"),
      ),
    );
  }
}
