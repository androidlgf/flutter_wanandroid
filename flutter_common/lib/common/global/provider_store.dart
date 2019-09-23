//Provider管理类

import 'package:flutter/material.dart';
import 'package:flutter_common/common/provider/net_connect_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_common/common/common_index.dart';

class Store {
  //  初始化
  static init({Widget child}) {
    /// 返回多个状态
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => UserProvider()),
        ChangeNotifierProvider(builder: (_) => ConfigProvider()),
        ChangeNotifierProvider(builder: (_) => NetworkConnectProvider()),
//        ChangeNotifierProvider(builder: (_) => ArticleModel()),
//        ChangeNotifierProvider(builder: (_) => ReaderSettingModel()),
//        ChangeNotifierProvider(builder: (_) => BookModel()),
      ],
      child: child,
    );
  }

  //  通过Provider.value<T>(context)获取状态数据
  static T value<T>(BuildContext context) {
    return Provider.of(context);
  }

  //  通过Consumer获取状态数据
  static Consumer connect<T>(
      {Function(BuildContext context, T value, Widget child) builder,
      Widget child}) {
    return Consumer<T>(builder: builder, child: child);
  }

  //  通过Consumer获取状态数据
  static Consumer2 connect2<A, B>(
      {Function(BuildContext context, A value, B value2, Widget child) builder,
      Widget child}) {
    return Consumer2<A, B>(builder: builder, child: child);
  }
}
