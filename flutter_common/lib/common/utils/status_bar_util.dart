import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show SystemChrome;

//状态栏管理工具栏/
class StatusBarUtil {
  //隐藏状态栏 即全屏模式/
  static hideStatusBar() {
    SystemChrome.setEnabledSystemUIOverlays([]);
  }

  //Set status bar color/
  static setColor() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //背景颜色
      statusBarBrightness: Brightness.dark, //图标颜色
      systemNavigationBarColor: Colors.red, //底部navigationBar背景颜色
    ));
  }
}
