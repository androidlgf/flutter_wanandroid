import 'package:flutter_common/common/http/http_index.dart';

//网络请求集成类
class BaseHttpWork<V extends Object> extends SimpleWork<V> {
  // 地址必须为完整地址，没有baseUrl支持，项目代码必须集中拼接和管理所有接口地址，便于维护和查找 必复写
  @override
  String onUrl(Map<String, dynamic> params) {
    return null;
  }

  // 解析响应数据 必复写
  @override
  V onExtractResult(resultData, SimpleWorkData<V> data) {
    return resultData;
  }

//  @override
//  V onDefaultResult(resultData, SimpleWorkData<V> data) {
//    return resultData;
//  }
//  @override
//  bool onResponseResult(response) {
//    return true;
//  }
//  /// 解析响应体，返回解析结果
//  @override
//  bool onCheckResponse(response) {
//    return true;
//  }
  //适合填充项目中所有接口必须传递的固定参数Body
  @override
  void onPreFillParams(Map<String, dynamic> data, Map<String, dynamic> params) {
    super.onPreFillParams(data, params);
  }

  //适合填充项目中所有接口必须传递的固定参数Headers
  @override
  Map<String, dynamic> onPreFillHeaders() {
    return super.onPreFillHeaders();
  }

  //自定义配置http请求选择项
  @override
  void onConfigOptions(Options options, Map<String, dynamic> params) {
    super.onConfigOptions(options, params);
  }

  // 装配请求参数，data为最终要发送的参数集合，params为[Work]调用处端传入的参数列表 暂时用不到
  @override
  void onFillParams(Map<String, dynamic> data, Map<String, dynamic> params) {}

  // 默认post请求
  @override
  HttpMethod get httpMethod => super.httpMethod;
}
