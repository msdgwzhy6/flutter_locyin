import 'package:flutter/material.dart';
import 'package:flutter_locyin/generated/l10n.dart';
import 'package:flutter_locyin/menu/menu.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _changeLocale(){
    setState(() {
      S.load(Locale("en","US"));
    });
  }
  void _makeError(){
    print("抛出异常");
    Future.delayed(Duration(seconds: 1)).then((e) => Future.error("异步异常"));
    //throw new StateError('This is a Dart exception error.');
    //List<String> numList = ['1', '2']; print(numList[6]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).appName,),
      ),
      drawer: MenuDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              S.of(context).pushLabel,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),

    );
  }
}