import 'package:shared_preferences/shared_preferences.dart';

class SPUtils {
  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  SPUtils._internal();

  static SharedPreferences? _spf;

  static Future<SharedPreferences> init() async {
    print("正在初始化持久化存储模块...");
    if (_spf == null) {
      _spf = await SharedPreferences.getInstance();
    }
    print("持久化存储模块初始化成功!");
    return _spf!;
  }

  ///语言
  static void saveLocale(String locale) {
    _spf!.setString('key_locale', locale);
  }
  static void  clearLocale() {
    _spf!.remove('key_locale');
  }
  static String? getLocale() {
    return _spf!.getString('key_locale');
  }

  ///黑夜模式
  static void saveDarkTheme() {
    _spf!.setBool('key_dark_theme', true);
  }
  static void  clearDarkTheme() {
    _spf!.remove('key_dark_theme');
  }
  static bool? getDarkTheme() {
    return _spf!.getBool('key_dark_theme');
  }

}
