
import 'package:dio/dio.dart';
import 'dart:io';

/// 是否开启debug模式，开启后会输出日志
bool debugWork = true;

/// 全局使用的[Dio]请求对象
Dio dio = Dio(
  BaseOptions(
    connectTimeout: 30000,
    receiveTimeout: 30000,
    contentType: ContentType.parse("application/json"),
  ),
);
