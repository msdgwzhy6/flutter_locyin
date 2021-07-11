import 'package:flutter/material.dart';
import 'package:flutter_locyin/page/find.dart';
import 'package:flutter_locyin/page/map.dart';
import 'package:flutter_locyin/page/message.dart';
import 'package:flutter_locyin/page/mine.dart';
import 'package:flutter_locyin/utils/toast.dart';

import 'dynamic.dart';

class MainHomePage extends StatefulWidget {
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int _tabIndex = 0;

  List<BottomNavigationBarItem> getTabs(BuildContext context) => [
        BottomNavigationBarItem(label: "动态", icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: "发现", icon: Icon(Icons.find_in_page)),
        BottomNavigationBarItem(label: "地图", icon: Icon(Icons.map)),
        BottomNavigationBarItem(label: "消息", icon: Icon(Icons.notifications)),
        BottomNavigationBarItem(label: "我的", icon: Icon(Icons.person)),
      ];

  List<Widget> getTabWidget(BuildContext context) =>
      [MyHomePage(), FindPage(), MapPage(), MessagePage(), MinePage()];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tabs = getTabs(context);
    DateTime? lastPopTime;
    return WillPopScope(
      onWillPop: () {
        // 点击返回键的操作

        if(lastPopTime == null || DateTime.now().difference(lastPopTime!) > Duration(seconds: 2)){

          lastPopTime = DateTime.now();
          ToastUtils.toast("再按一次退出程序");
          return Future.value(false);


        }else{

          lastPopTime = DateTime.now();
          return Future.value(true);
          // 退出app

        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: IndexedStack(
          index: _tabIndex,
          children: getTabWidget(context),
        ),
        bottomNavigationBar: SizedBox(
          height: 64,
          child: BottomNavigationBar(
            items: tabs,
            //高亮  被点击高亮
            currentIndex: _tabIndex,
            //修改 页面
            onTap: (index) {
              setState(() {
                _tabIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            fixedColor: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
