import 'package:flutter/material.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/components/wanandroid/index_wanandroid_component.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_common/components/index_component.dart';

//启动页
class SplashComponent extends StatefulWidget {
  @override
  _SplashComponentState createState() => _SplashComponentState();
}

class _SplashComponentState extends State<SplashComponent> {
  /// 是否第一次打开APP
  bool firstOpen = true;

  /// 是否登录
  bool isLogin = false;
  SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    checkFirstSeen(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Image.asset("images/icon_welcome_bg.jpg", fit: BoxFit.cover)),
      Positioned(
          child: SkipDownTimeProgress(
              color: grey800Color,
              radius: 22.0,
              duration: Duration(seconds: 5),
              size: Size(25.0, 25.0),
              skipText: "跳过",
              onTap: () => goToHomePage(),
              onFinishCallBack: (bool value) {
                if (value) goToHomePage();
              }),
          top: 30,
          right: 30),
      Positioned(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                child: Text('',
                    style: TextStyle(
                        color: Colors.redAccent,
                        fontSize: 16,
                        height: 2.0,
                        decoration: TextDecoration.none))),
            Container(
                padding: EdgeInsets.only(right: 20),
                alignment: Alignment.centerRight,
                width: double.infinity,
                child: Text('', style: TextStyles.textGrey14))
          ]),
          left: 0,
          right: 0,
          bottom: 300)
    ]);
  }

  Future checkFirstSeen(context) async {
    _prefs = await SharedPreferences.getInstance();
    firstOpen = _prefs.getBool("first_open") ?? true;
  }

  void goToHomePage() {
    if (!firstOpen) {
      pushAndRemovePage(context, IndexWanAndroidComponent());
    } else {
      _prefs.setBool("first_open", false);
      pushAndRemovePage(context, IntroSlideComponent());
    }
  }
}
