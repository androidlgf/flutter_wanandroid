import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_common/common/config/routes.dart';
import 'package:flutter_common/common/config/application.dart';
import 'package:flutter_common/common/model/account_model.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter_common/common/dio/base_dio.dart';

//启动页+登录+首页逻辑跳转/
class AppComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppComponentState();
  }
}

class _AppComponentState extends State<AppComponent> {
  bool _hasInit = false;

  _AppComponentState() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_hasInit) {
      return;
    }
    _hasInit = true;
    final accountModel = ScopedModel.of<AccountModel>(context);
    Future.delayed(Duration(seconds: 1)).then((value) {
      if (ObjectUtil.isEmptyString(accountModel.token)) {
        //去登录
      } else {
        //去首页
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    BaseHttpWork().start(params: {'username':"张三","password":"12345678"},headers:{},retry: 1).then((data){
      if (data.success){
        // 登录成功
        print("==stat==="+data.toString());
        final user = data.result;
        print("==stat==="+data.result.toString());
      }else{
        // 登录失败
        print("==stat==error="+data.result.toString());
      }
    });
    return Container(
      child: Image.asset('images/icon_welcome_bg.png', fit: BoxFit.fill),
    );
  }
}
