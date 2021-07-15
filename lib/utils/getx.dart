import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locyin/data/api/apis_service.dart';
import 'package:flutter_locyin/data/model/user_entity.dart';
import 'package:flutter_locyin/utils/sputils.dart';
import 'package:get/get.dart';

// APP状态控制器
class ConstantController extends GetxController{

  String? _token;

  String? get  token => _token;

  String _baseUrl = kDebugMode?"http://192.168.10.10/api/v1/":"https://locyin.com/api/v1/";

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
// 用户信息状态控制器
class UserController extends GetxController{

  UserEntity? _user;

  UserEntity? get  user => _user;
/*
  void init(){
    print("正在初始化用户状态...");
    String? token = Get.find<ConstantController>().token;
    print(token);
    if(token != null){
      getUserInfo();
    }else{
      print("未登录！");
    }
  }*/
  Future<void> getUserInfo ()async{
    print("开始获取用户信息...");
    apiService.getUserInfo((UserEntity model) {
      print("获取用户信息成功！");
      _user = model;
      update();
    }, (DioError error) {
      print("获取用户信息失败！");
      //handleLaravelErrors(error);

    },);
  }
  void setUser(UserEntity user) {
    _user = user;
    //语言的持久化存储
  }
  void clearUser(){
    _user = null;
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

