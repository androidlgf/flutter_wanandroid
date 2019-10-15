import 'package:flutter/material.dart';

enum IconAlignment { Bottom, Top, Left, Right }

class IconText extends StatelessWidget {
  final Widget text;
  final Widget icon;
  final double leading;
  final IconAlignment iconAlignment;
  final VoidCallback onPressed;

  IconText(
      {Key key,
      this.icon,
      this.iconAlignment = IconAlignment.Left,
      this.leading = 0.0,
      this.onPressed,
      this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: InkWell(onTap: onPressed, child: _buildBodyWidget()));
  }

  Widget _buildBodyWidget() {
    switch (this.iconAlignment) {
      case IconAlignment.Top:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[icon, SizedBox(height: this.leading), text],
        );
        break;
      case IconAlignment.Bottom:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[text, SizedBox(height: this.leading), icon],
        );
        break;
      case IconAlignment.Left:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[icon, SizedBox(width: this.leading), text],
        );
        break;
      default: //right
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[text, SizedBox(width: this.leading), icon],
        );
        break;
    }
  }
}
