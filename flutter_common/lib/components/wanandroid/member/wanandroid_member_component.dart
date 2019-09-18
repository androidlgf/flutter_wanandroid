import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/common/common_index.dart';
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
            color: Colors.red,
          ),
          Line(
            margin: EdgeInsets.all(0.0),
            color: grey100Color,
            lineHeight: 15.0,
          ),
          ListTile(
              title: Text('我的收藏'),
//              onTap: () => pushNewPage(context, OrderHomePage()),
              leading: Icon(Icons.favorite),
              trailing: Icon(Icons.keyboard_arrow_right)),
          Gaps.line,
          ListTile(
              title: Text('切换主题'),
              onTap: () => pushNewPage(context, ChangeThemeWanAndroidComponent()),
              leading: Icon(Icons.language),
              trailing: Icon(Icons.keyboard_arrow_right)),
          Gaps.line,
          ListTile(
              title: Text('关于软件'),
//              onTap: () => pushNewPage(context, OrderHomePage()),
              leading: Icon(Icons.error_outline),
              trailing: Icon(Icons.keyboard_arrow_right)),
          Gaps.line
        ],
      ),
    );
  }
}
