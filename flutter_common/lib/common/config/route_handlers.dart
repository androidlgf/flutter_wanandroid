import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/common/common_index.dart';

//跳转Handler相关 后面页面跳转创建在此处控制/
var rootHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return AppComponent();
});
//主页/
var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return AppComponent();
});
