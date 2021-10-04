import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locyin/router/router.dart';
import 'package:flutter_locyin/utils/toast.dart';
import 'package:url_launcher/url_launcher.dart';

//隐私弹窗工具
class PrivacyUtils {
  PrivacyUtils._internal();

  //隐私服务政策地址
  static String _privacyUrl =
      'https://www.baidu.com';
  static String _protocolUrl =
      'https://locyin.com';
  static void showPrivacyDialog(BuildContext context,
      {required VoidCallback onAgreeCallback}) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("温馨提示"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("感谢您使用骆寻App!"),
                  SizedBox(height: 5),
                  Text.rich(TextSpan(children: [
                    TextSpan(text: "我们非常重视您的个人信息和隐私保护，为了更好地 保障您的个人权益，请您务必审慎阅读、 充分理解"),
                    TextSpan(
                        text: "《骆寻用户协议》",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _launchURL(_protocolUrl);
                          }),
                    TextSpan(text:"和"),
                    TextSpan(
                        text: "《骆寻隐私声明》",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _launchURL(_privacyUrl);
                          }),
                    TextSpan(text:"各条款，包括但不限于："),
                  ])),
                  SizedBox(height: 5),
                  Text("1.在您使用软件及服务的过程中，向你提供相关基本功能，我们将根据合法、正当、必要的原则，收集或使用必要的个人信息；"),
                  SizedBox(height: 5),
                  Text("2.鉴于您的授权，我们可能会获取您的地理位置、照片和相册等相关软件权限；"),
                  SizedBox(height: 5),
                  Text("3.我们会采取符合标准的技术措施和数据 安全措施来保护您的个人信息安全；"),
                  SizedBox(height: 5),
                  Text("4.您可以查询、更正、管理您的个人信息，我们也提供账户注销的渠道；"),
                  SizedBox(height: 5),
                  Text("如您同意以上协议内容，请点击“同 意”开始使用我们的产品和服务。"),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text("不同意"),
                onPressed: () {
                  Navigator.of(context).pop();
                  showPrivacySecond(context,
                      onAgreeCallback: onAgreeCallback);
                },
              ),
              TextButton(
                child: Text("同意"),
                onPressed: onAgreeCallback == null
                    ? () {
                  Navigator.of(context).pop();
                }: onAgreeCallback,
              ),
            ],
          );
        },
      );
  }

  ///第二次提醒
  static void showPrivacySecond(BuildContext context,
      {required VoidCallback onAgreeCallback}) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("温馨提示"),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("我们非常重视对你个人信息的保护，承诺严格按照《骆寻隐私权政策》和《骆寻用户协议》保护及处理你的信息。如果你不同意该政策，很遗憾我们将无法为你提供服务。"),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text("仍不同意"),
                onPressed: () {
                  Navigator.of(context).pop();
                  showPrivacyThird(context, onAgreeCallback: onAgreeCallback);
                },
              ),
              TextButton(
                child: Text("再看看"),
                onPressed: () {
                  Navigator.of(context).pop();
                  showPrivacyDialog(context,
                      onAgreeCallback: onAgreeCallback);
                },
              ),
            ],
          );
        },
      );
  }

  ///第三次提醒
  static void showPrivacyThird(BuildContext context,
      {required VoidCallback onAgreeCallback}) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("要不要再想想？"),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text("退出应用"),
                onPressed: () {
                  //退出程序
                  // SystemNavigator.pop();
                  exit(0);
                },
              ),
              TextButton(
                child: Text("再次查看"),
                onPressed: () {
                  Navigator.of(context).pop();
                  showPrivacyDialog(context,
                      onAgreeCallback: onAgreeCallback);
                },
              ),
            ],
          );
        },
      );
  }
 static Future<void>_launchURL(String url) async {
    //const url = 'https://flutter.dev';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      ToastUtils.toast("Could not launch: " + url);
      throw 'Could not launch: $url';
    }
  }
}
