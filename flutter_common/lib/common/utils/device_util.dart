import 'dart:io';
import 'dart:async';
import 'package:get_ip/get_ip.dart';
import 'dart:ui' as ui show window;
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:devicelocale/devicelocale.dart';
import 'package:flutter_user_agent/flutter_user_agent.dart';

class DeviceUtil {
  static Future<String> getUserAgent() async {
    String userAgent;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      userAgent = await FlutterUserAgent.getPropertyAsync('userAgent');
      await FlutterUserAgent.init();
    } on PlatformException {
      userAgent = '<error>';
    }
    return userAgent;
  }

  static Future<String> getLanguage() async {
    String currentLocale;
    try {
      currentLocale = await Devicelocale.currentLocale;
    } on PlatformException {
      currentLocale = ("Error obtaining current locale");
    }
    return currentLocale;
  }

  static String getPackageName() {
    return null;
  }

  static Future<String> getLocalIPAddress() async {
    String ipAddress;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      ipAddress = await GetIp.ipAddress;
    } on PlatformException {
      ipAddress = 'Failed to get ipAddress.';
    }
    return ipAddress;
  }

  /// 获取运行平台是Android还是IOS
  static bool get isAndroid => Platform.isAndroid;

  static bool get isIOS => Platform.isIOS;

  /// 屏幕宽
  static double get width {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.size.width;
  }

  /// 屏幕高
  static double get height {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.size.height;
  }

  static double get navigationBarHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.top + kToolbarHeight;
  }

  static double get topSafeHeight {
    MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);
    return mediaQuery.padding.top;
  }
  /// 文字转颜色
  static Color strToColor(String name) {
    assert(name.length > 1);
    final int hash = name.hashCode & 0xffff;
    final double hue = (360.0 * hash / (1 << 15)) % 360.0;
    return HSVColor.fromAHSV(1.0, hue, 0.4, 0.90).toColor();
  }
  static void delayed(int milliseconds, ValueChanged onDelayed) {
    Future.delayed(Duration(milliseconds: milliseconds)).then((value) {
      if (onDelayed != null) {
        onDelayed(value);
      }
    });
  }
}
