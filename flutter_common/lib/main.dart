import 'package:fluro/fluro.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_common/common/config/routes.dart';
import 'package:flutter_common/common/config/application.dart';
import 'package:flutter_common/common/model/account_model.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

class _AppState extends State<AppWidget> {
  AccountModel model = new AccountModel();

  _AppState() {
    final router = new Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AccountModel>(
      model: model,
      child: MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Color.fromRGBO(18, 18, 18, 1),
            cardColor: Colors.white,
            scaffoldBackgroundColor: const Color(0xFFF0F0F0)),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}
