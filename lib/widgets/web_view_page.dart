import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class WebViewPage extends StatefulWidget {


  @override
  _WebViewPage createState() => _WebViewPage();

}

class _WebViewPage extends State<WebViewPage> {
  late WebViewController _webViewController;
  String? url = Get.parameters['url'];
  String? title = Get.parameters['title'];
  bool isLocalUrl = Get.parameters['local'] == 'true'? true:false;

  JavascriptChannel jsBridge(BuildContext context) => JavascriptChannel(
      name: 'jsbridge', // 与h5 端的一致 不然收不到消息
      onMessageReceived: (JavascriptMessage message) async{
        debugPrint(message.message);
      });

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: _buildAppbar(),
        body: _buildBody()
    );
  }

  _buildAppbar() {
    return AppBar(
        elevation: 0,
        backgroundColor: Color(0xccd0d7),
        title: Text(title!, style: TextStyle(color: Colors.black),),
        centerTitle: true,
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Color(0xFF23ADE5),), onPressed: () {

        })
    );
  }

  _buildBody() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 1,
          width: double.infinity,
          child: const DecoratedBox(decoration: BoxDecoration(color: Color(0xFFEEEEEE))),
        ),
        Expanded(
          flex: 1,
          child: WebView(
            initialUrl: isLocalUrl ? Uri.dataFromString(url!, mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
                .toString(): url,
            javascriptMode: JavascriptMode.unrestricted,
            javascriptChannels: <JavascriptChannel>[
              jsBridge(context)
            ].toSet(),
            onWebViewCreated: (WebViewController controller){
              _webViewController = controller;
              if(isLocalUrl){
                _loadHtmlAssets(controller);
              }else{
                controller.loadUrl(url!);
              }
              controller.canGoBack().then((value) => debugPrint(value.toString()));
              controller.canGoForward().then((value) => debugPrint(value.toString()));
              controller.currentUrl().then((value) => debugPrint(value));
            },
            onPageFinished: (String value){
              _webViewController.evaluateJavascript('document.title')
                  .then((title) => debugPrint(title));
            },
          ),
        )
      ],
    );
  }

//加载本地文件
  _loadHtmlAssets(WebViewController controller) async {
    String htmlPath = await rootBundle.loadString(url!);
    controller.loadUrl(Uri.dataFromString(htmlPath,mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

}
