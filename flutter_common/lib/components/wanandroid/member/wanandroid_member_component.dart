import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/components/wanandroid/author/author_wanandroid_component.dart';
import 'package:flutter_common/components/wanandroid/login/login_page.dart';
import 'package:flutter_common/components/wanandroid/theme/wanandroid_change_theme_component.dart';

//玩android 个人中心
class MemberWanAndroidComponent extends StatefulWidget {
  @override
  _MemberWanAndroidComponentState createState() =>
      _MemberWanAndroidComponentState();
}

class _MemberWanAndroidComponentState extends State<MemberWanAndroidComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 100.0,
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.supervised_user_circle,
                  size: 60.0,
                  color: grey500Color,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    '点击登录',
                    style: TextStyle(fontSize: 18.0),
                  ),
                )
              ],
            ),
          ),
          Line(
            margin: EdgeInsets.all(0.0),
            color: grey100Color,
            lineHeight: 15.0,
          ),
          ListTile(
              title: Text('我的收藏'),
              onTap: () => pushNewPage(context, LoginPage()),
              leading: Icon(Icons.favorite),
              trailing: Icon(Icons.keyboard_arrow_right)),
          Gaps.line,
          ListTile(
              title: Text('切换主题'),
              onTap: () =>
                  pushNewPage(context, ChangeThemeWanAndroidComponent()),
              leading: Icon(Icons.language),
              trailing: Icon(Icons.keyboard_arrow_right)),
          Gaps.line,
          ListTile(
              title: Text('关于作者'),
              onTap: () => pushNewPage(context, AuthorWanAndroidComponent()),
              leading: Icon(Icons.error_outline),
              trailing: Icon(Icons.keyboard_arrow_right)),
          Gaps.line
        ],
      ),
    );
  }
}
