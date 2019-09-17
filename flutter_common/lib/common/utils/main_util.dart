//main.dart 入口函数初始化方法
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class MainUtil {
  //Flutter 页面渲染错误显示页面
  static void setCustomErrorPage() {
    ErrorWidget.builder = (FlutterErrorDetails flutterErrorDetails) {
      debugPrint(flutterErrorDetails.toString());
      return Center(child: Text("${flutterErrorDetails.toString()}"));
    };
  }

  //设置平台
  /// If the current platform is desktop, override the default platform to
  /// a supported platform (iOS for macOS, Android for Linux and Windows).
  /// Otherwise, do nothing.
  static void setTargetPlatformForDesktop() {
    TargetPlatform targetPlatform;
    if (Platform.isMacOS) {
      targetPlatform = TargetPlatform.iOS;
    } else if (Platform.isLinux || Platform.isWindows) {
      targetPlatform = TargetPlatform.android;
    }
    if (targetPlatform != null) {
      debugDefaultTargetPlatformOverride = targetPlatform;
    }
  }
}
