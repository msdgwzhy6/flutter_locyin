import 'package:get/get.dart';

class XRouter {
  static void goWeb(String url, String title , String local) {
    Get.toNamed(
        "/web?url=${Uri.encodeFull(url)}&title=${Uri.encodeFull(title)}&local=${Uri.encodeFull(local)}");
  }
}