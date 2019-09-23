/*
 * fluro
 * Created by Yakka
 * https://theyakka.com
 * 
 * Copyright (c) 2018 Yakka, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/common/common_index.dart';

//页面跳转标识 后面页面跳转创建在此处控制/
class Routes {
  static String root = '/';
  static String doHome = '/home';

  static void configureRoutes(Router router) {
    router.notFoundHandler = new Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print("ROUTE WAS NOT FOUND !!!");
    });
    router.define(root, handler: rootHandler);
    router.define(doHome, handler: homeHandler);
  }
}
