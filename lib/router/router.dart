import 'package:get/get.dart';

class XRouter {
  static void goWeb(String url, String title , String local) {
    Get.toNamed(
        "/web?url=${Uri.encodeComponent(url)}&title=${Uri.encodeComponent(title)}&local=${Uri.encodeComponent(local)}");
  }
}