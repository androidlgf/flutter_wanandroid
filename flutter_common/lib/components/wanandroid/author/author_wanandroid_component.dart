import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/common/ui/web_view.dart';

class AuthorWanAndroidComponent extends StatefulWidget {
  @override
  _AuthorWanAndroidComponentState createState() =>
      _AuthorWanAndroidComponentState();
}

class _AuthorWanAndroidComponentState extends State<AuthorWanAndroidComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('关于作者'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      padding:
          EdgeInsets.only(left: 15.0, right: 15.0, bottom: 10.0, top: 30.0),
      width: DeviceUtil.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          ClipOval(
            child: SizedBox(
                width: 90.0,
                height: 90.0,
                child: Image.asset("images/icon_welcome_bg.jpg",
                    fit: BoxFit.cover)),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text('基于Google Flutter 玩Android客户端'),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                    onTap: () {},
                    child: RichText(
                        text: TextSpan(
                      text: '邮箱: ',
                      style: TextStyle(color: grey500Color),
                      children: <TextSpan>[
                        TextSpan(
                            text: 'android_lgf@163.com',
                            style: TextStyle(color: blue500Color)),
                      ],
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: InkWell(
                      onTap: () {
                        pushNewPage(
                            context,
                            WebViewPage(
                              url:
                                  'https://github.com/androidlgf/FlutterCommon',
                              title: 'Github项目地址',
                            ));
                      },
                      child: RichText(
                          text: TextSpan(
                        text: 'Github地址: ',
                        style: TextStyle(color: grey500Color),
                        children: <TextSpan>[
                          TextSpan(
                              text:
                                  'https://github.com/androidlgf/FlutterCommon',
                              style: TextStyle(color: blue500Color)),
                        ],
                      )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: InkWell(
                      onTap: () {
                        pushNewPage(
                            context,
                            WebViewPage(
                              url: 'https://wanandroid.com/index',
                              title: '开放API地址',
                            ));
                      },
                      child: RichText(
                          text: TextSpan(
                        text: '开放API地址: ',
                        style: TextStyle(color: grey500Color),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'https://wanandroid.com/index',
                              style: TextStyle(color: blue500Color)),
                        ],
                      )),
                    ),
                  )
                ],
              ),
            ),
            flex: 8,
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text('本项目仅供学习使用,不得用作商业目的'),
            ),
            flex: 1,
          )
        ],
      ),
    );
  }
}
