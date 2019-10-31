import 'package:dio/dio.dart';
import 'dart:io';

/// 是否开启debug模式，开启后会输出日志
bool debugWork = true;
const CONTENT_TYPE_JSON = "application/json";
const CONTENT_TYPE_FORM = "application/x-www-form-urlencoded";

/// 全局使用的[Dio]请求对象
Dio dio = Dio(
  BaseOptions(
    connectTimeout: 1000,
    receiveTimeout: 1000,
    contentType: ContentType.parse(CONTENT_TYPE_FORM),
  ),
);
