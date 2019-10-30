import 'package:dio/dio.dart' as dio;
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter_common/common/http/http_index.dart';
import 'life_http_status_plugin.dart';

//网络请求集成类
class ILifeHttpGetWork<V extends Object> extends SimpleWork<V> {
  // 地址必须为完整地址，没有baseUrl支持，项目代码必须集中拼接和管理所有接口地址，便于维护和查找 必复写
  @override
  String onUrl(Map<String, dynamic> params) {
    return null;
  }

// 默认get请求
  @override
  HttpMethod get httpMethod => HttpMethod.get;

  // 解析响应数据 必复写
  @override
  V onExtractResult(resultData, SimpleWorkData<V> data) {
    return resultData;
  }

  @override
  HttpExtraPlugin httpExtraPlugin() {
    return LifeHttpStatusPlugin();
  }

  //适合填充项目中所有接口必须传递的固定参数Body
  @override
  Map<String, dynamic> onPreFillParams() {
    return super.onPreFillParams();
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
  @override
  Map<String, dynamic> onExtraOptions() {
    return buildCacheOptions(Duration(days: 30)).extra;
  }

  @override
  Iterable<dio.Interceptor> onExtraInterceptors() {
    return [DioCacheManager(CacheConfig()).interceptor];
  }
}
