import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'default_app.dart';

//应用初始化
class AppInit {
  static void run() async {
    //final isProd = bool.fromEnvironment('dart.vm.product');
    FlutterError.onError = (FlutterErrorDetails details) {
      reportErrorAndLog(details);
    };
    runZonedGuarded(() async {
      if (!isInDebugMode) {
        await SentryFlutter.init(
              (options) {
            options.dsn = 'https://c1e5f341710c4ac5a5229a0e1f300fd4@o915761.ingest.sentry.io/5856342';
          },
        );
      }
      DefaultApp.run();
    }, (exception, stackTrace) async {
      reportErrorAndLog(makeDetails(exception, stackTrace));
    },
      zoneSpecification: ZoneSpecification(
        print: (Zone self, ZoneDelegate parent, Zone zone, String line) async {
          collectLog(parent,zone,line); // 收集日志
        },
      ),
    );
  }
  //上报错误和日志逻辑
  static Future<void> reportErrorAndLog(FlutterErrorDetails details) async {
    if (isInDebugMode) {
      print(details);
    }else{
      await Sentry.captureException(details.exception, stackTrace: details.stack);
    }
  }
  //日志拦截, 收集日志
  static void collectLog(ZoneDelegate parent, Zone zone, String line) {
    parent.print(zone, "日志拦截: $line");
  }
  // 构建错误信息
  static FlutterErrorDetails makeDetails(Object exception, StackTrace stack) {
    return FlutterErrorDetails(stack: stack,exception: exception);
  }

  //判断debug及release环境
  static bool get isInDebugMode {

    bool inDebugMode = false;

    assert(inDebugMode = true);

    return inDebugMode;
  }

}