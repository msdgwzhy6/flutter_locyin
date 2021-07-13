import 'package:flutter_locyin/page/menu/about.dart';
import 'package:flutter_locyin/page/menu/language.dart';
import 'package:flutter_locyin/page/menu/settings.dart';
import 'package:flutter_locyin/page/menu/theme.dart';
import 'package:flutter_locyin/page/index.dart';
import 'package:get/get.dart';
import 'package:flutter_locyin/widgets/web_view_page.dart';


class RouteMap {
  static List<GetPage> getPages = [
    GetPage(name: '/index', page: (){
      return MainHomePage();
    }),
    GetPage(name: '/menu/settings', page: () => SettingsPage()),
    GetPage(name: '/menu/settings/theme', page: () => ThemePage()),
    GetPage(name: '/menu/settings/language', page: () => LanguagePage()),
    GetPage(name: '/menu/about', page: () => AboutPage()),
    GetPage(name: '/web', page: () => WebViewPage()),
  ];
}