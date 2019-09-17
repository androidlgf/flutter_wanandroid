import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//启动页配置信息+splash
class AppComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppComponentState();
  }
}

class _AppComponentState extends State<AppComponent> {
  _AppComponentState() {
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
          home: Builder(
            builder: (BuildContext context) {
              return SplashComponent();
            },
          ),
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
        );
      },
    );
  }
}
