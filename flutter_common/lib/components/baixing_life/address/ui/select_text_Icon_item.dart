import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/common/res/styles.dart';

class SelectTextIcon extends StatelessWidget {
  final Widget icon;
  final int maxLines;
  final int maxLength;
  final double height;
  final Widget text;

  const SelectTextIcon(
      {Key key,
      @required this.icon,
      this.maxLines: 1,
      this.height,
      this.text,
      this.maxLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height == null ? 55.0 : height,
        width: double.infinity,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: Screen.wScreen10),
        child: Row(
            crossAxisAlignment: maxLines == 1
                ? CrossAxisAlignment.center
                : CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: text,
              ),
              Container(
                  height: 50,
                  alignment: Alignment.centerLeft,
                  child: icon == null ? Container() : icon),
            ]));
  }
}
