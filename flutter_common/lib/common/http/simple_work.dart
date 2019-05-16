

import 'package:meta/meta.dart';
import 'communication.dart';
import 'work_core.dart';

/// 用于获取响应json数据协议中"result"字段
const String result = "result";

/// 简化的[WorkData]类实现
///
/// 使用特定的公司接口协议描述。
///
/// ``` http协议
/// 所有接口响应数据格式
///
/// json结构
///
/// {
/// "state":true, // 业务的成功失败标志
/// "errorCode":0, // 错误码，成功时返回0
/// "message":null, // 业务消息字符串，可以是成功时用于显示的信息，也可以是失败时的提示信息
/// "result": {}  // 真正响应的有效业务数据，任意类型
/// }
///
/// ```
class SimpleWorkData<T> extends WorkData<T> {
  /// 协议错误码
  int _errorCode;

  /// 协议错误码
  int get errorCode => _errorCode;
}

/// 简化的[Work]类
///
/// * [D]为关联的接口结果数据类型。
/// * 适用于除下载任务以外的请求任务，下载任务请使用[SimpleDownloadWork]
/// * 使用特定的公司接口协议描述。
///
/// ``` http协议
/// 所有接口响应数据格式
///
/// json结构
///
/// {
/// "state":true, // 业务的成功失败标志
/// "errorCode":0, // 错误码
/// "message":null, // 业务消息字符串，可以是成功时用于显示的信息，也可以是失败时的提示信息
/// "result": {}  // 真正响应的有效业务数据，任意类型
/// }
///
/// ```
abstract class SimpleWork<D> extends Work<D, SimpleWorkData<D>> {
  @override
  SimpleWorkData<D> onCreateWorkData() => SimpleWorkData<D>();

  @override
  D onResponseSuccess(response, SimpleWorkData<D> data) =>
      response[result] == null
          ? onDefaultResult(data)
          : onExtractResult(response[result], data);

  @override
  bool onResponseResult(response) => response["state"];

  @mustCallSuper
  @override
  D onRequestFailed(response, SimpleWorkData<D> data) {
    if (response["errorCode"] != null) {
      data._errorCode = response["errorCode"];
    }

    return super.onRequestFailed(response, data);
  }

  @override
  String onRequestSuccessMessage(response, SimpleWorkData<D> data) =>
      response["message"];

  @override
  String onRequestFailedMessage(response, SimpleWorkData<D> data) =>
      response["message"];

  /// 生成响应成功的结果数据
  ///
  /// * [resultData]为协议中的[result]标签下的数据
  /// * 当请求成功且返回结果中存在[result]标签且不为null时被调用
  /// * 返回装配后的本地数据对象
  /// * [data]为将要返回的数据包装类，包含有传入的参数[data.params]
  @protected
  D onExtractResult(resultData, SimpleWorkData<D> data);

  /// 生成响应成功的默认结果数据
  ///
  /// * 当请求成功且返回结果不存在[result]标签或值为null时被调用，默认实现为null
  /// * [data]为将要返回的数据包装类，包含有传入的参数[data.params]
  @protected
  D onDefaultResult(SimpleWorkData<D> data) => null;
}

/// 简化的下载专用[Work]类
///
/// * 适用于下载文件任务，其他类型任务请使用[SimpleWork]
abstract class SimpleDownloadWork extends Work<Null, SimpleWorkData<Null>> {
  @override
  SimpleWorkData<Null> onCreateWorkData() => SimpleWorkData<Null>();

  @override
  Null onResponseSuccess(response, SimpleWorkData data) => null;

  @override
  bool onResponseResult(response) => true;

  @override
  HttpMethod get httpMethod => HttpMethod.download;

  @mustCallSuper
  @override
  void onConfigOptions(Options options, List params) {
    options.downloadPath = onDownloadPath(params);
  }

  /// 设置下载文件路径
  ///
  /// [params]为任务传入参数，返回下载文件要保存的位置路径
  String onDownloadPath(List params);
}
