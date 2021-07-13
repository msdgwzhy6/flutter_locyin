import 'package:flutter/material.dart';
import 'package:flutter_locyin/common/lang/translation_service.dart';
import 'package:flutter_locyin/page/index.dart';
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
    Get.put(LocaleController());
    WidgetsFlutterBinding.ensureInitialized();
    SPUtils.init()
        .then((value) => LocaleController.init().then ((value) => runApp(ToastUtils.init(MyApp()))));
  }
  //程序初始化操作
  static void initApp() {
    print("正在初始化应用程序...");
    //LocaleController.init();
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
      home: MainHomePage(),
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
