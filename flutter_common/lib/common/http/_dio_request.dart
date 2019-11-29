import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart' as dio;

import '_print.dart';
import 'communication.dart' as com;
import 'work_config.dart';

/// 发起请求
///
/// dio实现
Future<com.Response> request(String tag, com.Options options) async {
  final dioOptions = _onConfigOptions(tag, options);

  dio.Response dioResponse;

  bool success = false;
  dio.Dio dioHttpClient = BuildDioHttpClient.buildDioHttpClient();
  try {
    if (options.iterable != null && options.iterable.length > 0) {
      dioHttpClient.interceptors.addAll(options.iterable);
    }
    switch (options.method) {
      case com.HttpMethod.download:
        log(tag, "download path:${options.downloadPath}");
        dioResponse = await dioHttpClient.download(
            options.url, options.downloadPath,
            data: options.params,
            cancelToken: options.cancelToken.data,
            options: dioOptions,
            onReceiveProgress: options.onProgress);
        break;
      case com.HttpMethod.get:
        final params = options.params.map<String, dynamic>((key, value) =>
            MapEntry(key, value is Iterable<String> ? value : "$value"));

        dioResponse = await dioHttpClient.get(
          options.url,
          queryParameters: params,
          cancelToken: options.cancelToken.data,
          options: dioOptions,
        );
        break;
      case com.HttpMethod.upload:
        dioResponse = await dioHttpClient.request(
          options.url,
          data: _onConvertToDio(options.params),
          cancelToken: options.cancelToken.data,
          options: dioOptions,
          onSendProgress: options.onProgress,
        );
        break;
      default:
        dioResponse = await dioHttpClient.request(
          options.url,
          data: options.params,
          cancelToken: options.cancelToken.data,
          options: dioOptions,
          onSendProgress: options.onProgress,
        );
        break;
    }

    success = true;
  } on dio.DioError catch (e) {
    log(tag, "http error", e.type);

    dioResponse = e.response;
    success = false;
  } catch (e) {
    log(tag, "http other error", e);
  }

  return _onParseResponse(tag, success, dioResponse);
}

/// 用于[com.HttpMethod.upload]请求类型的数据转换
///
/// [src]原始参数，返回处理后的符合dio接口的参数
dio.FormData _onConvertToDio(Map<String, dynamic> src) {
  onConvert(value) {
    if (value is File) {
      value = com.UploadFileInfo(value.path);
    }

    if (value is com.UploadFileInfo) {
      return dio.UploadFileInfo(File(value.filePath), value.fileName,
          contentType: ContentType.parse(value.mimeType));
    }

    return value;
  }

  final params = Map<String, dynamic>();

  src.forEach((key, value) {
    if (value is List) {
      params[key] = value.map(onConvert).toList();
    } else {
      params[key] = onConvert(value);
    }
  });

  return dio.FormData.from(params);
}

/// 生成dio专用配置
dio.Options _onConfigOptions(String tag, com.Options options) {
  final dioOptions = dio.Options();

  switch (options.method) {
    case com.HttpMethod.get:
      dioOptions.method = "GET";
      break;
    case com.HttpMethod.post:
      dioOptions.method = "POST";
      break;
    case com.HttpMethod.put:
      dioOptions.method = "PUT";
      break;
    case com.HttpMethod.head:
      dioOptions.method = "HEAD";
      break;
    case com.HttpMethod.delete:
      dioOptions.method = "DELETE";
      break;
    case com.HttpMethod.upload:
      dioOptions.method = "POST";
      break;
    case com.HttpMethod.download:
      dioOptions.method = "GET";
      break;
  }

  if (options.responseType != null) {
    switch (options.responseType) {
      case com.ResponseType.json:
        dioOptions.responseType = dio.ResponseType.json;
        break;
      case com.ResponseType.stream:
        dioOptions.responseType = dio.ResponseType.stream;
        break;
      case com.ResponseType.plain:
        dioOptions.responseType = dio.ResponseType.plain;
        break;
    }
  }

  dioOptions.contentType = options.contentType;
  dioOptions.connectTimeout = options.connectTimeout;
  dioOptions.receiveTimeout = options.readTimeout;
  if (options.headers != null) {
    dioOptions.headers = options.headers;
  }
  if (options.extra != null) {
    dioOptions.extra = options.extra;
  }
  if (options.cancelToken.data is! dio.CancelToken) {
    com.CancelToken cancelToken = options.cancelToken;

    cancelToken.data = dio.CancelToken();

    cancelToken.stream.listen((_) {
      if (cancelToken.data is dio.CancelToken) {
        log(tag, "http cancel");
        cancelToken.data.cancel();
        cancelToken.data = null;
      }
    });
  }

  return dioOptions;
}

/// 处理dio Response为work的Response
com.Response _onParseResponse(
    String tag, bool success, dio.Response dioResponse) {
  if (dioResponse != null) {
    return com.Response(
        success: success,
        statusCode: dioResponse.statusCode,
        headers: dioResponse.headers,
        data: dioResponse.data);
  } else {
    return com.Response();
  }
}
