import 'package:flutter/material.dart';
import 'package:flutter_locyin/utils/sputils.dart';
import 'package:get/get.dart';

// APP状态控制器
class ConstantController extends GetxController{

  String? _token;

  String? get  token => _token;

  String _baseUrl = "https://locyin.com/";

  String get  baseUrl => _baseUrl;
  void init(){
    print("正在初始化 Token 设置...");
    String? token = SPUtils.getToken();
    if(token != null){
      _token = token;
      print("Token值：$token");
    }else{
      print("Token 不存在");
    }
  }

  void setToken(String token) {

    _token = token;
    //语言的持久化存储
    SPUtils.saveToken(token);

  }
  void clearToken(){
    print("正在清空Token状态...");
    _token = null;
    //清除 Token 的持久化存储
    SPUtils.clearToken();
  }

}
class LocaleController extends GetxController {

  Locale? _locale;

  Locale? get  locale => _locale;

  void init(){
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

  bool _isDartTheme = false;
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

  void init(){
    print("正在初始化主题设置...");
    if(SPUtils.getDarkTheme() != null){
      _isDartTheme = true;
      print("主题设置为：黑夜模式");
    }else{
      print("主题设置为：白天模式");
    }

  }
}

