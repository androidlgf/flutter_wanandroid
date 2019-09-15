import 'dart:io';

import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/material.dart';
import 'package:get_ip/get_ip.dart';
import 'dart:async';
import 'package:flutter_user_agent/flutter_user_agent.dart';
import 'package:flutter/services.dart';

import 'dart:ui' as ui show window;

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
}
