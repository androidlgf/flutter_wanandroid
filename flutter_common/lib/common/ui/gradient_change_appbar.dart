import 'dart:math';
import 'dart:ui' as ui show window;
import 'package:flutter/material.dart';
import 'package:flutter_common/common/common_index.dart';

enum Rotation { LR, RL, TB, BT, TL2BR, BL2TR, TR2BL, BR2TL }

//可渐变的AppBar
class GradientChangeAppBar extends StatefulWidget
    implements PreferredSizeWidget {
  final double width;
  final double height;
  final double titleSpacing;
  final List<Color> colors;
  final Rotation rotation;

  // 包括三个状态：clamp 为默认方式，自动延伸；repeated 重复效果;mirror 镜面效果，即对称效果
  final TileMode tileMode;
  final List<double> stops;

  final Widget title;
  final Widget leading;
  final List<Widget> actions;
  final Widget customBody;

  GradientChangeAppBar(
      {Key key,
      @required this.colors,
      this.width,
      this.height,
      this.titleSpacing,
      this.stops,
      this.rotation = Rotation.TB,
      this.tileMode = TileMode.clamp,
      this.title,
      this.leading,
      this.actions,
      this.customBody})
      : assert(tileMode != null),
        assert(rotation != null),
        super(key: key);

  @override
  State createState() => _GradientChangeAppBarState();

  @override
  Size get preferredSize =>
      Size.fromHeight(height == null ? DeviceUtil.navigationBarHeight : height);
}

class _GradientChangeAppBarState extends State<GradientChangeAppBar> {
  void _handleDrawerButton() {
    Scaffold.of(context).openDrawer();
  }

  void _handleDrawerButtonEnd() {
    Scaffold.of(context).openEndDrawer();
  }

  double _kLeadingWidth = kToolbarHeight;

  @override
  void initState() {
    super.initState();
    _kLeadingWidth = widget.height ?? kToolbarHeight;
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    final AppBarTheme appBarTheme = AppBarTheme.of(context);
    final ScaffoldState scaffold = Scaffold.of(context, nullOk: true);
    final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);
    final MediaQueryData mediaQuery = MediaQueryData.fromWindow(ui.window);

    final bool hasDrawer = scaffold?.hasDrawer ?? false;
    final bool hasEndDrawer = scaffold?.hasEndDrawer ?? false;
    final bool canPop = parentRoute?.canPop ?? false;
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;
    IconThemeData overallIconTheme =
        appBarTheme.iconTheme ?? themeData.primaryIconTheme;
    IconThemeData actionsIconTheme =
        appBarTheme.actionsIconTheme ?? overallIconTheme;

    TextStyle centerStyle =
        appBarTheme.textTheme?.title ?? themeData.primaryTextTheme.title;
    Widget title = widget.title;
    if (title != null) {
      title = DefaultTextStyle(
          style: centerStyle,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
          child: title);
    }
    Widget leading = widget.leading;
    if (leading == null) {
      if (hasDrawer) {
        leading = IconButton(
          icon: const Icon(Icons.menu),
          onPressed: _handleDrawerButton,
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      } else {
        if (canPop)
          leading = useCloseButton
              ? const CloseButton()
              : BackButton(
                  color: appBarTheme.textTheme?.title?.color ??
                      themeData.primaryTextTheme.title?.color);
      }
    }
    if (leading != null) {
      leading = ConstrainedBox(
        constraints:
            BoxConstraints.tightFor(width: widget.height ?? _kLeadingWidth),
        child: leading,
      );
    }

    Widget actions;
    if (widget.actions != null && widget.actions.isNotEmpty) {
      actions = Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: widget.actions,
      );
    } else if (hasEndDrawer) {
      actions = IconButton(
        icon: const Icon(Icons.menu),
        onPressed: _handleDrawerButtonEnd,
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    }

    // Allow the trailing actions to have their own theme if necessary.
    if (actions != null) {
      actions = IconTheme.merge(
        data: actionsIconTheme,
        child: actions,
      );
    }

    double appBarHeight = widget.height;
    if (appBarHeight != null) {
      appBarHeight += mediaQuery.padding.top;
    }
    final Widget toolbar = NavigationToolbar(
      leading: leading,
      middle: title,
      trailing: actions,
      centerMiddle: false,
      middleSpacing: widget.titleSpacing ?? 0,
    );
    AlignmentGeometry begin;
    AlignmentGeometry end;
    if (widget.rotation == Rotation.TB) {
      begin = Alignment.topCenter;
      end = Alignment.bottomCenter;
    } else if (widget.rotation == Rotation.BT) {
      begin = Alignment.bottomCenter;
      end = Alignment.topCenter;
    } else if (widget.rotation == Rotation.LR) {
      begin = Alignment.centerLeft;
      end = Alignment.centerRight;
    } else if (widget.rotation == Rotation.RL) {
      begin = Alignment.centerRight;
      end = Alignment.centerLeft;
    } else if (widget.rotation == Rotation.TL2BR) {
      begin = Alignment.topLeft;
      end = Alignment.bottomRight;
    } else if (widget.rotation == Rotation.TR2BL) {
      begin = Alignment.topRight;
      end = Alignment.bottomLeft;
    } else if (widget.rotation == Rotation.BL2TR) {
      begin = Alignment.bottomLeft;
      end = Alignment.topRight;
    } else if (widget.rotation == Rotation.BR2TL) {
      begin = Alignment.bottomRight;
      end = Alignment.topLeft;
    } else {
      begin = Alignment.topCenter;
      end = Alignment.bottomCenter;
    }
    return Container(
        width: widget.width,
        height: appBarHeight ?? DeviceUtil.navigationBarHeight,
        padding: EdgeInsets.only(top: DeviceUtil.topSafeHeight),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: widget.colors ??
                    [themeData?.primaryColor, themeData?.primaryColor],
                begin: begin,
                end: end,
                stops: widget.stops,
                tileMode: widget.tileMode)),
        child: widget.customBody ?? toolbar);
  }
}
