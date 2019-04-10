import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/components/app/app_component.dart';

//根布局/
var rootHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return AppComponent();
});
//主页/
var homeHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return AppComponent();
});
