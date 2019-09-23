

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:mime/mime.dart';

import '_dio_request.dart' as http;
import '_print.dart';

/// 进度监听器
typedef OnProgress = void Function(int current, int total);

/// 通讯工具
///
/// 用于进行HTTP请求的工具
class Communication {
  const Communication();

  /// 执行网络请求
  ///
  /// [tag]为跟踪日志标签，[options]为请求所需的全部参数，返回响应数据
  Future<Response> request(String tag, Options options) async {
    if (!options.url.startsWith(new RegExp(r"https?://"))) {
      // 地址不合法
      log(tag, "url error");
      return Response();
    }

    _onNullSafe(options);

    log(tag, "http", options);

    Response response;
    for (int i = 0; i <= options.retry; i++) {
      if (i > 0) {
        log(tag, "retry:$i");
      }
      response = await http.request(tag, options);

      if (response.success) {
        break;
      }
    }

    log(tag, "http", response);

    // 转换类型
    if (response.success &&
        (options.responseType == null ||
            options.responseType == ResponseType.json) &&
        response.data is String &&
        response.data.isNotEmpty) {
      response.data = json.decode(response.data);
    }

    return response;
  }

  /// 处理空安全，目前不去除子结构的null
  void _onNullSafe(Options options) {
    if (options.ignoreNull) {
      options.params.removeWhere((key, value) => value == null);
    }
  }
}

/// 请求配置信息
class Options {
  /// Http请求方法
  HttpMethod method;

  /// 完整的请求地址（需包含http(s)://）
  String url;

  /// 请求重试次数
  ///
  /// 默认0表示不重试，实际执行1此请求，如果设置为1则至少执行一次请求，最多执行两次请求。
  int retry = 0;

  /// 进度监听器
  ///
  /// 在[HttpMethod.get]中无效，
  /// 在[HttpMethod.download]请求中为下载进度，在其他类型请求中为上传/发送进度
  OnProgress onProgress;

  /// Http请求头
  Map<String, dynamic> headers;

  /// 请求参数
  Map<String, dynamic> params;

  /// 连接服务器超时时间，单位毫秒
  int connectTimeout;

  ///  读取超时
  ///
  ///  响应流上前后两次接受到数据的间隔，单位毫秒
  int readTimeout;

  /// 请求的Content-Type
  ///
  /// 默认值'application/x-www-form-urlencoded'
  ContentType contentType;

  /// [responseType] 表示期望以那种格式(方式)接受响应数据
  ///
  /// 默认值是[ResponseType.json]
  ResponseType responseType;

  /// 下载文件的存放路径，仅[HttpMethod.download]中有效
  String downloadPath;

  /// 用于取消本次请求的工具，由系统管理，无法被覆盖
  CancelToken cancelToken;

  /// 忽略值为null的参数，即不会被发送
  bool ignoreNull = true;

  @override
  String toString() => '''request 
$method
url: $url
headers: $headers
params: $params''';
}

/// Http响应数据
class Response {
  Response(
      {this.success = false, this.data, this.headers, this.statusCode = 0});

  /// 响应数据
  ///
  /// 数据类型由[ResponseType]决定
  dynamic data;

  /// 响应头信息
  HttpHeaders headers;

  /// 响应状态码
  int statusCode;

  /// 请求成功失败标志
  bool success;

  @override
  String toString() => '''response 
success: $success; code: $statusCode;
headers: $headers;
body: $data''';
}

/// 取消请求工具
class CancelToken {
  /// 用于发射取消请求
  final StreamController<Null> _controller = StreamController.broadcast();

  /// 用于接收取消请求事件
  Stream<Null> get stream => _controller.stream;

  /// 用于特定取消实现关联对象使用
  dynamic data;

  /// 取消请求
  void cancel() {
    _controller.add(null);
  }
}

/// 描述要上传的文件信息
class UploadFileInfo {
  UploadFileInfo(this.filePath, {this.fileName, this.mimeType}) {
    if (fileName == null) {
      int index = filePath.lastIndexOf(RegExp(r'[\/]'));
      if (index > 0 && index < filePath.length) {
        fileName = filePath.substring(index + 1);
      } else {
        fileName = filePath;
      }
    }

    if (mimeType == null) {
      mimeType = lookupMimeType(fileName);
    }
  }

  /// 文件路径
  String filePath;

  /// 文件名
  ///
  /// 带后缀，用于表示要上传的文件名称，覆盖[filePath]中的文件名
  String fileName;

  /// 要上传的文件mime类型
  String mimeType;

  @override
  String toString() => "UploadFileInfo:'$filePath'";
}

/// 响应数据格式
enum ResponseType {
  /// json类型
  json,

  /// [Stream]类型数据
  stream,

  /// UTF8编码字符串
  plain
}

/// http请求类型
enum HttpMethod {
  /// get请求
  get,

  /// post请求
  post,

  /// put请求
  put,

  /// delete请求
  delete,

  /// head请求
  head,

  /// 上传
  ///
  /// （post 'multipart/form-data'包装），参数中的文件需要用[File]或[UploadFileInfo]类型包装，支持文件列表
  upload,

  /// 下载（get包装）
  download,
}
