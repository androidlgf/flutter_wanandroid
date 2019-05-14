import 'package:flutter/services.dart';
import 'package:flutter/services.dart' show SystemChrome;

class OrientationUtil {
  //强制竖屏
  static void portrait() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  //强制横屏
  static void landscape() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }
}
