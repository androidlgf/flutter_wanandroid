import 'package:devicelocale/devicelocale.dart';
import 'package:get_ip/get_ip.dart';
import 'dart:async';
import 'package:flutter_user_agent/flutter_user_agent.dart';
import 'package:flutter/services.dart';

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
}
