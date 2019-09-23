import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show SystemChrome;

//状态栏管理工具栏/
class StatusBarUtil {
  //隐藏状态栏 即全屏模式/
  static hideStatusBar() {
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  //Set status bar color/
  static setColor(
      {statusBarColor, statusBarBrightness, systemNavigationBarColor}) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //背景颜色
      statusBarBrightness: Brightness.dark, //图标颜色
      systemNavigationBarColor: Colors.red, //底部navigationBar背景颜色
    ));
  }

  //设置沉浸式状态栏 注:部分Android手机无效 需设置外部Activity/
  static setImmStatusBar() {
    if (Platform.isAndroid) {
      // 以下两行 设置android状态栏为透明的沉浸。
      // 写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}
