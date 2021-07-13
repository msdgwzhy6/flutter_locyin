import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'language.dart';
class SettingsPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("设置")),
        body: SingleChildScrollView(
            child: ListBody(children: <Widget>[
              SizedBox(height: 10),
              ListTile(
                  leading: Icon(Icons.color_lens),
                  title: Text("切换主题"),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  contentPadding: EdgeInsets.only(left: 20, right: 10),
                  onTap: () {
                    Get.toNamed('/menu/settings/theme');
                  }),
              ListTile(
                leading: Icon(Icons.language),
                title: Text("切换语言"),
                trailing: Icon(Icons.keyboard_arrow_right),
                contentPadding: EdgeInsets.only(left: 20, right: 10),
                onTap: () {
                  Get.toNamed('/menu/settings/language');
                },
              ),
            ])));
  }
}
