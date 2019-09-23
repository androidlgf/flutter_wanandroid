import 'package:flutter/material.dart';
import 'package:flutter_common/common/res/colors.dart';
import 'package:flutter_common/common/utils/device_util.dart';

//android ToolBar 对标AppBar
class ToolBar extends StatelessWidget {
  final Color backgroundColor;
  final String title;
  final bool centerTitle;

  ToolBar({
    Key key,
    this.backgroundColor = colorPrimary,
    this.title,
    this.centerTitle = false,
  })  : assert(centerTitle != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(color: backgroundColor),
        padding: EdgeInsets.fromLTRB(20, DeviceUtil.topSafeHeight, 0, 0),
        height: DeviceUtil.navigationBarHeight,
        child: Align(
          child: Text(
            '$title',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          alignment: centerTitle ? Alignment.center : Alignment.centerLeft,
        ));
  }
}
