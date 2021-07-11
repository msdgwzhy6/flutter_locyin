import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_locyin/generated/l10n.dart';

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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _backDeskTop() async {
    //初始化通信管道-设置退出到手机桌面
    String CHANNEL = "android/back/desktop";
    final platform = MethodChannel(CHANNEL);
    //通知安卓返回,到手机桌面
    try {
      final bool out = await platform.invokeMethod('backDesktop');
      if (out) debugPrint('返回到桌面');
    } on PlatformException catch (e) {
      debugPrint("通信失败(设置回退到安卓手机桌面:设置失败)");
      print(e.toString());
    }
    return Future.value(false);
  }
}