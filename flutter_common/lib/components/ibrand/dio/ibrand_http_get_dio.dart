import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/http/http_index.dart';
import 'ibrand_http_status_plugin.dart';

//网络请求集成类
class IBrandHttpGetWork<V extends Object> extends SimpleWork<V> {
  String subKey;

  IBrandHttpGetWork({Key key, this.subKey});

  /// 地址必须为完整地址，没有baseUrl支持，项目代码必须集中拼接和管理所有接口地址，便于维护和查找 必复写
  @override
  String onUrl(Map<String, dynamic> params) {
    return null;
  }

  /// 默认get请求
  @override
  HttpMethod get httpMethod => HttpMethod.get;

  /// 解析响应数据 必复写
  @override
  V onExtractResult(resultData, SimpleWorkData<V> data) {
    return resultData;
  }

  ///http网络请求业务状态码标识判断
  @override
  HttpExtraPlugin httpExtraPlugin() {
    return IBrandHttpStatusPlugin();
  }

  ///适合填充项目中所有接口必须传递的固定参数Body
  @override
  Map<String, dynamic> onPreFillParams() {
    return super.onPreFillParams();
  }

  ///适合填充项目中所有接口必须传递的固定参数Headers
  @override
  Map<String, dynamic> onPreFillHeaders() {
    return super.onPreFillHeaders();
  }

  ///自定义字段,您可以稍后检索它(拦截器),(变压器)和(响应)对象
  /// * [MaxAge]只有这个是必须的参数，设置缓存的时间；
  /// *[MaxStale]设置过期时常；在maxAge过期，而请求网络失败的时候，如果maxStale没有过期，则会使用这个缓存数据。
  /// * [subKey]dio-http-cache 默认使用 url 作为缓存 key ,但当 url 不够用的时候，比如 post 请求分页数据的时候，就需要配合subKey使用，
  /// * [forceRefresh]dio-http-cache 是否刷新缓存
  @override
  Map<String, dynamic> onExtraOptions() {
    return buildCacheOptions(Duration(days: 30),
            subKey: subKey != null ? subKey : '')
        .extra;
  }

  ///http_cache 拦截器
  /// * [encrypt / dectrypt]这2个必须组合使用，实现磁盘缓存数据的加密，如果没有设置加密，默认会用 base64 重新编码再存到数据库.
  /// *[DefaultMaxAge]默认值为 Duration( day: 7 ), 在上面 buildCacheOption 中如果没有配置 MaxAge 有错误，或者自己实现了 option 而没有配置 MaxAge, 会使用这个默认值；
  /// * [DefalutMaxStale]和 DefaultMaxAge 类似
  /// * [DatabaseName]配置数据库名；
  /// * [SkipMemoryCache]默认 false；
  /// *[SkipDiskCache] 默认 false;
  /// * [MaxMemoryCacheCount]最大的内存缓存数量，默认100；
  @override
  Iterable<Interceptor> onExtraInterceptors() {
    return [DioCacheManager(CacheConfig()).interceptor];
  }
}
