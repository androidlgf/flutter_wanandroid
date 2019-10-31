import 'package:dio/dio.dart';
import 'dart:io';

/// 是否开启debug模式，开启后会输出日志
bool debugWork = true;
const CONTENT_TYPE_JSON = "application/json";
const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

class BuildDioHttpClient {
  static Dio buildDioHttpClient() {
    return Dio(
      BaseOptions(
        connectTimeout: 5000,
        receiveTimeout: 5000,
        contentType: ContentType.parse(CONTENT_TYPE_FORM),
      ),
    );
  }
}
