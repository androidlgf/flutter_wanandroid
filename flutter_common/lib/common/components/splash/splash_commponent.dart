import 'package:flutter/material.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/common/custom/shape_of_view.dart';
import 'package:flutter_common/components/baixing_life/index_life_component.dart';
import 'package:flutter_common/components/ibrand/home/ibrand_home_component.dart';
import 'package:flutter_common/components/ibrand/index_ibrand_component.dart';
import 'package:flutter_common/components/wanandroid/index_wanandroid_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    ScreenUtil.instance =
        ScreenUtil(width: 375, height: 667, allowFontScaling: true)
          ..init(context);
    return Stack(children: <Widget>[
      ConstrainedBox(
        constraints: BoxConstraints.expand(),
//          child: Image.asset("images/icon_welcome_bg.jpg", fit: BoxFit.cover)
        child: _buildBodyWidget(),
      ),
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

  Widget _buildBodyWidget() {
    return Container(
      color: whiteColor,
      child: Stack(
        children: <Widget>[
          Container(
            color: Color(0xE6E75153),
            height: ScreenUtil().setHeight(268.0),
          ),
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(28.0)),
            width: ScreenUtil().setWidth(315.0),
            height: ScreenUtil().setWidth(315.0),
            child: ShapeOfView(
              elevation: 4,
              shape: ArcCircleShape(
                  position: ArcCirclePosition.Left,
                  offset: ScreenUtil().setWidth(60.0)),
              child: Container(
                color: Color(0xE62A99BA),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(
                top: ScreenUtil().setHeight(39.0),
                left: ScreenUtil().setHeight(60.0)),
            width: ScreenUtil().setWidth(315.0),
            height: ScreenUtil().setWidth(315.0),
            child: ShapeOfView(
              elevation: 4,
              shape: ArcCircleShape(
                  position: ArcCirclePosition.Right,
                  offset: ScreenUtil().setWidth(80.0)),
              child: Container(
                color: Color(0xCCFF9966),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: EdgeInsets.only(
                top: ScreenUtil().setHeight(106.0),
                left: ScreenUtil().setWidth(26.0)),
            width: ScreenUtil().setWidth(324.0),
            height: ScreenUtil().setWidth(324.0),
            child: ShapeOfView(
              elevation: 4,
              shape: ArcCircleShape(
                position: ArcCirclePosition.Right,
              ),
              child: Stack(
                alignment: Alignment.topCenter,
                children: <Widget>[
                  GradualChangeView(
                    colors: [Color(0xFF2A99BA), Color(0xFF45E994)],
                  ),
                  Padding(padding: EdgeInsets.only(top: ScreenUtil().setHeight(140.0)),child: Text(
                    'SIMPLY SHOP',
                    style: TextStyle(
                        fontSize: 33,
                        color: Color(0xFFFFFFFF),
                        decoration: TextDecoration.none),
                  ),)
                ],
              )
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(50.0),
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(486.0)),
            child: Button(
              onPressed: () {
                goToHomePage();
              },
              color: Color(0xFFFF9966),
              highlightedBorderColor: Color(0xFFFF9966),
              borderRadius: 24,
              width: ScreenUtil().setWidth(163.0),
              text: 'Getting Started',
            ),
          ),
          Container(
            width: DeviceUtil.width,
            margin: EdgeInsets.only(
                top: ScreenUtil().setHeight(536.0),
                bottom: ScreenUtil().setHeight(25.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Already have account?',
                  style: TextStyle(
                      fontSize: 17,
                      color: Color(0xFF4D4D4D),
                      decoration: TextDecoration.none),
                ),
                Text('Login here',
                    style: TextStyle(
                        fontSize: 17,
                        color: Color(0xFF37BEA9),
                        decoration: TextDecoration.none))
              ],
            ),
          )
        ],
      ),
    );
  }

  Future checkFirstSeen(context) async {
    _prefs = await SharedPreferences.getInstance();
    firstOpen = _prefs.getBool("first_open") ?? true;
  }

  void goToHomePage() {
    if (!firstOpen) {
      pushAndRemovePage(context, IndexComponent());
    } else {
      _prefs.setBool("first_open", false);
      pushAndRemovePage(context, IntroSlideComponent());
    }
  }
}
