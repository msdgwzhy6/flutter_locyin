import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locyin/common/lang/translation_service.dart';
import 'package:flutter_locyin/data/api/apis_service.dart';
import 'package:flutter_locyin/data/model/user_entity.dart';
import 'package:flutter_locyin/page/index.dart';
import 'package:flutter_locyin/page/menu/theme.dart';
import 'package:flutter_locyin/router/router_map.dart';
import 'package:flutter_locyin/utils/getx.dart';
import 'package:flutter_locyin/utils/sputils.dart';
import 'package:flutter_locyin/utils/toast.dart';
import 'package:get/get.dart';
//默认App的启动
class DefaultApp {
  //运行app
  static void run() {
    print("正在启动应用程序...");

    Get.lazyPut(()=>ConstantController());
    Get.lazyPut(()=>UserController());
    Get.lazyPut(()=>LocaleController());
    Get.lazyPut(()=>DarkThemeController());
    WidgetsFlutterBinding.ensureInitialized();
    SPUtils.init().then((value) =>
        initApp().then((value) => afterRunApp())
    );
  }
  //程序初始化操作
  static Future<void> initApp() async{
    print("正在初始化应用程序...");
    Get.find<ConstantController>().init();
    if(Get.find<ConstantController>().token==null){

      Get.find<ConstantController>().clearToken();
      Get.find<UserController>().clearUser();

      Get.find<LocaleController>().init();
      Get.find<DarkThemeController>().init();
      runApp(ToastUtils.init(MyApp()));
    }else{
      apiService.getUserInfo((UserEntity model) {
        print("获取用户信息成功！");
        Get.find<LocaleController>().init();
        Get.find<DarkThemeController>().init();
        Get.find<UserController>().setUser(model);
        runApp(ToastUtils.init(MyApp()));
      }, (DioError error) {
        Get.find<ConstantController>().clearToken();
        Get.find<UserController>().clearUser();
        print("获取用户信息失败！");
      },);
    }
  }
  static void afterRunApp(){
    Get.find<DarkThemeController>().isDarkTheme ? Get.changeTheme(ThemeData.dark()):Get.changeTheme(ThemeData.light());
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '骆寻',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: RouteMap.getPages,
      defaultTransition: Transition.rightToLeft,
      /*localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: Locale('en', 'US'),                       //当前的语言
      localeListResolutionCallback: (locales, supportedLocales) {
        if (localeModel.getLocale() != null) {
          //如果已经选定语言，则不跟随系统
          return localeModel.getLocale();
        } else {
          //跟随系统
          if (I18n.delegate.isSupported(_locale)) {
            return _locale;
          }
          return supportedLocales.first;
        }
        print('当前系统语言环境$locales');
        return;
      },*/

      locale: Messages.locale,
      fallbackLocale: Messages.fallbackLocale,
      translations: Messages(),
    );
  }
}
