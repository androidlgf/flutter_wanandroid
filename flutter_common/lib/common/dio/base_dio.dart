import 'package:flutter_common/common/http/http_index.dart';

//网络请求集成类
class BaseHttpWork<V extends Object> extends SimpleWork<V> {
  // 解析响应数据
  @override
  V onExtractResult(resultData, SimpleWorkData<V> data) {
    return resultData;
  }

  @override
  V onDefaultResult(resultData, SimpleWorkData<V> data) {
    return resultData;
  }
  @override
  bool onResponseResult(response) {
    return true;
  }
  /// 解析响应体，返回解析结果
  @override
  bool onCheckResponse(response) {
    return true;
  }

  // 装配请求参数，data为最终要发送的参数集合，params为[Work]调用处端传入的参数列表
  @override
  void onFillParams(Map<String, dynamic> data, List params) {
    // TODO: implement onFillParams
  }

  // 地址必须为完整地址，没有baseUrl支持，项目代码必须集中拼接和管理所有接口地址，便于维护和查找
  @override
  String onUrl(List params) {
    return null;
  }

  // 使用post请求
  @override
  // TODO: implement httpMethod
  HttpMethod get httpMethod => super.httpMethod;
}
