import 'dart:io';
import 'dart:async';
import 'generated/i18n.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/config/config.dart';
import 'package:flutter_common/common/delegates/fallback_cupertino_localisations_delegate.dart';
import 'package:flutter_common/common/global/provider_store.dart';
import 'package:flutter_common/common/provider/config_provider.dart';
import 'package:flutter_common/common/res/styles.dart';
import 'package:flutter_common/common/utils/main_util.dart';
import 'package:flutter_common/components/app/app_component.dart';
import 'package:flutter_common/common/config/routes.dart';
import 'package:flutter_common/common/config/application.dart';
import 'package:flutter_common/common/model/account_model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  MainUtil.setCustomErrorPage();
  MainUtil.setTargetPlatformForDesktop();
  runZoned(() {
    //强制横屏
    // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

    /// 强制竖屏
    SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp])
        .then((_) {
      runApp(Store.init(child: AppWidget()));

      if (Platform.isAndroid) {
        // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
        SystemUiOverlayStyle systemUiOverlayStyle =
            SystemUiOverlayStyle(statusBarColor: Colors.transparent);
        SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      }
    });
  }, onError: (Object error, StackTrace stack) {
    debugPrint(error.toString());
    debugPrint(stack.toString());
  });
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
    return Store.connect<ConfigProvider>(
      builder: (BuildContext context, ConfigProvider provider, Widget child) {
        return MaterialApp(
          /// 任务管理器显示的标题
          title: 'Flutter App',

          /// 您可以通过配置ThemeData类轻松更改应用程序的主题
          theme: AppTheme.getThemeData(provider.theme),

          /// 右上角显示一个debug的图标
          debugShowCheckedModeBanner: false,

          /// 主页
          onGenerateRoute: Application.router.generator,

          /// localizationsDelegates 列表中的元素时生成本地化集合的工厂
          localizationsDelegates: [
            // 为Material Components库提供本地化的字符串和其他值
            GlobalMaterialLocalizations.delegate,

            // 定义widget默认的文本方向，从左往右或从右往左
            GlobalWidgetsLocalizations.delegate,

            S.delegate,

            /// 解决 ‘使用CupertinoAlertDialog 报 'alertDialogLabel' was called on null’ 的BUG
            const FallbackCupertinoLocalisationsDelegate(),
          ],

          ///
          supportedLocales: S.delegate.supportedLocales,

          ///
          locale: mapLocales[SupportLocale.values[provider.localIndex]],

          /// 不存对应locale时，默认取值Locale('zh', 'CN')
          /// 如果需要强制使用某种语言可以添加如下代码
          localeResolutionCallback:
              S.delegate.resolution(fallback: const Locale('zh', 'CN')),
          home: AppComponent(),
        );
      },
    );
  }
}
