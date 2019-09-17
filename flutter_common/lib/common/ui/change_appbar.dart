import 'package:flutter/material.dart';
import 'package:flutter_common/common/ui/toolbar.dart';
import 'package:flutter_common/common/utils/device_util.dart';

//android ToolBar 对标AppBar 结合滑动控件改变颜色alpha
class ChangeAppBar extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final double navAlpha;
  final bool centerTitle;

  ChangeAppBar({
    Key key,
    this.title,
    this.backgroundColor,
    this.navAlpha,
    this.centerTitle = false,
  })  : assert(centerTitle != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ToolBar(
            backgroundColor: Colors.transparent,
            title: title,
            centerTitle: centerTitle),
        Container(
          padding: EdgeInsets.fromLTRB(20, DeviceUtil.topSafeHeight, 0, 0),
          height: DeviceUtil.navigationBarHeight,
          child: Align(
            child: Text(
              '$title',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            alignment: Alignment.centerLeft,
          ),
        ),
        Opacity(
          opacity: navAlpha,
          child: ToolBar(
              backgroundColor: backgroundColor,
              title: title,
              centerTitle: centerTitle),
        ),
      ],
    );
  }
}
