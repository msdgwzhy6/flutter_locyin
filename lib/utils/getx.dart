import 'package:flutter/material.dart';
import 'package:flutter_locyin/utils/sputils.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {

  static Locale? _locale;

  Locale? get  locale => _locale;

  static Future<void> init() async{
    print("正在初始化语言模块...");
    var _localeString = SPUtils.getLocale();
    if(_localeString != null){
      _locale = Locale(_localeString);
      print("设置系统语言为："+ _locale.toString());
    }else{
      print("设置系统语言为："+ Get.deviceLocale.toString());
    }
  }

  void setLocale(String l) {

    _locale = Locale(l);
    //语言的持久化存储
    SPUtils.saveLocale(l);
    Get.updateLocale(_locale!);
    //update();

  }
  void clearLocale(){
    print("正在清空语言设置...");
    print("当前设备语言:"+Get.deviceLocale.toString());
    //清空_locale
    _locale = null;
    //清除语言的持久化存储
    SPUtils.clearLocale();
    Get.updateLocale(Get.deviceLocale!);
    //update();
  }
}

//昼夜模式控制器
class DarkThemeController extends GetxController{

  static bool _isDartTheme = false;
  bool get  isDarkTheme => _isDartTheme;

  void changeDarkTheme(){
    if(_isDartTheme == true){
      clearDarkTheme();
    }else{
      setDarkTheme();
    }
  }
  void setDarkTheme(){
    print("正在保存黑夜主题设置...");
    _isDartTheme = true;
    SPUtils.saveDarkTheme();
    Get.changeTheme(ThemeData.dark());
    print("已设置为黑夜主题");
  }
  void clearDarkTheme(){
    print("正在清空黑夜主题设置...");
    _isDartTheme = false;
    SPUtils.clearDarkTheme();
    Get.changeTheme(ThemeData.light());
    print("已设置为白天主题");
  }
  static Future<void> init() async{
    print("正在初始化主题设置...");
    if(SPUtils.getDarkTheme() != null){
      _isDartTheme = true;
      print("主题设置为：黑夜模式");
    }else{
      print("主题设置为：白天模式");
    }

  }
}