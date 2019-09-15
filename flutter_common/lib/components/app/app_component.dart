import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_common/generated/i18n.dart';
import 'package:flutter_common/common/config/routes.dart';
import 'package:flutter_common/common/config/application.dart';

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
//    final accountModel = ScopedModel.of<AccountModel>(context);
//    Future.delayed(Duration(seconds: 1)).then((value) {
//      if (ObjectUtil.isEmptyString(accountModel.token)) {
//        //去登录
//      } else {
//        //去首页
//      }
//    });
  }

  @override
  Widget build(BuildContext context) {
//    LoginWork().start(
//        params: {'sellerid': "8", "userid": "3", 'sign': '', 'id': '0'},
//        headers: {}).then((data) {
//      if (data.success) {
//        // 登录成功
//        print("==stat===" + data.toString());
//        print("==stat===" + data.result.toString());
//      } else {
//        // 登录失败
//        print("==stat==message=" + data.message.toString());
//        print("==stat==result=" + data.result.toString());
//      }
//    });
    return Container(
      child: GestureDetector(
//        child: Image.asset('images/icon_welcome_bg.png', fit: BoxFit.fill),
        child: Text('${S.of(context).abc}'),
      ),
    );
  }
}
