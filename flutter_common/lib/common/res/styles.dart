import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../res/dimens.dart';
import '../res/colors.dart';

/// 间隔
class Gaps {
  /// 水平间隔
  static Widget hGap3 = SizedBox(width: Dimens.gap_dp3);
  static Widget hGap4 = SizedBox(width: Dimens.gap_dp4);
  static Widget hGap5 = SizedBox(width: Dimens.gap_dp5);
  static Widget hGap6 = SizedBox(width: Dimens.gap_dp6);
  static Widget hGap8 = SizedBox(width: Dimens.gap_dp8);
  static Widget hGap10 = SizedBox(width: Dimens.gap_dp10);
  static Widget hGap12 = SizedBox(width: Dimens.gap_dp12);
  static Widget hGap15 = SizedBox(width: Dimens.gap_dp15);
  static Widget hGap16 = SizedBox(width: Dimens.gap_dp16);
  static Widget hGap20 = SizedBox(width: Dimens.gap_dp20);
  static Widget hGap24 = SizedBox(width: Dimens.gap_dp24);
  static Widget hGap40 = SizedBox(width: Dimens.gap_dp40);

  /// 垂直间隔
  static Widget vGap3 = SizedBox(height: Dimens.gap_dp3);
  static Widget vGap4 = SizedBox(height: Dimens.gap_dp4);
  static Widget vGap5 = SizedBox(height: Dimens.gap_dp5);
  static Widget vGap6 = SizedBox(height: Dimens.gap_dp6);
  static Widget vGap8 = SizedBox(height: Dimens.gap_dp8);
  static Widget vGap10 = SizedBox(height: Dimens.gap_dp10);
  static Widget vGap12 = SizedBox(height: Dimens.gap_dp12);
  static Widget vGap15 = SizedBox(height: Dimens.gap_dp15);
  static Widget vGap16 = SizedBox(height: Dimens.gap_dp16);
  static Widget vGap20 = SizedBox(height: Dimens.gap_dp20);
  static Widget vGap24 = SizedBox(height: Dimens.gap_dp24);
  static Widget vGap25 = SizedBox(height: Dimens.gap_dp25);
  static Widget vGap40 = SizedBox(height: Dimens.gap_dp40);
  static Widget vGap60 = SizedBox(height: Dimens.gap_dp60);

  static Widget hGap(double w) {
    return SizedBox(width: w);
  }

  static Widget vGap(double h) {
    return SizedBox(height: h);
  }

  static Widget line = Container(height: 0.6, color: Color(0xFFEEEEEE));
}

class AppTheme {
  static getThemeData(int color) {
    ThemeData themData = ThemeData(
      //- Color类型，App主要部分的背景色（ToolBar,Tabbar等）
      primaryColor: Color(color == 0 ? colorPrimary.value : color),
      //- Color类型，primaryColor的较暗版本。(顶部状态栏)
      primaryColorDark: Color(colorPrimaryDark.value),
      //作为Scaffold基础的Material默认颜色，典型Material应用或应用内页面的背景颜色(背景色)
      scaffoldBackgroundColor: Color(scaffoldBackgroundColor.value),
      //Color类型，与primaryColor对比的颜色(例如 用作进度条的剩余部分)。
      //backgroundColor: Color(teal700Color.value),
      //- Color类型，前景色（文本、按钮等）
      accentColor: colorAccent,
      //- Brightness类型，accentColor的亮度。 用于确定放置在突出颜色顶部的文本和图标的颜色（例如FloatingButton上的图标）。
      //accentColorBrightness:Brightness.light,
      //- IconThemeData类型，与突出颜色对照的图片主题。
      //accentIconTheme:IconThemeData.fallback(),
      //- TextTheme类型，与突出颜色对照的文本主题。
      //accentTextTheme:
      //- Color类型，BottomAppBar的默认颜色。
      //bottomAppBarColor:colorPrimaryDark,
      //- Brightness类型，应用程序整体主题的亮度。 由按钮等Widget使用，以确定在不使用主色或强调色时要选择的颜色。
      //brightness: Brightness.light,
      //- Color类型，Material中RaisedButtons使用的默认填充色。
      //buttonColor: Colors.white,
      //- ButtonThemeData类型，定义了按钮等控件的默认配置，像RaisedButton和FlatButton。
      //buttonTheme:
      //canvasColor - Color类型，MaterialType.canvas Material的默认颜色。
      //cardColor - Color类型，Material被用作Card时的颜色。
      //chipTheme - ChipThemeData类型，用于渲染Chip的颜色和样式。
      //dialogBackgroundColor - Color类型，Dialog元素的背景色。
      //disabledColor - Color类型，用于Widget无效的颜色，无论任何状态。例如禁用复选框。
      //dividerColor - Color类型，Dividers和PopupMenuDividers的颜色，也用于ListTiles中间，和DataTables的每行中间.
      //errorColor - Color类型，用于输入验证错误的颜色，例如在TextField中。
      //hashCode - int类型，这个对象的哈希值。
      //highlightColor - Color类型，用于类似墨水喷溅动画或指示菜单被选中的高亮颜色。
      //hintColor - Color类型，用于提示文本或占位符文本的颜色，例如在TextField中。
      //iconTheme - IconThemeData类型，与卡片和画布颜色形成对比的图标主题。
      //indicatorColor - Color类型，TabBar中选项选中的指示器颜色。
      //inputDecorationTheme - InputDecorationTheme类型，InputDecorator，TextField和TextFormField的默认InputDecoration值基于此主题。
      //platform - TargetPlatform类型，Widget需要适配的目标类型。
      //primaryColorBrightness - Brightness类型，primaryColor的亮度。
      //primaryColorDark - Color类型，primaryColor的较暗版本。
      //primaryColorLight - Color类型，primaryColor的较亮版本。
      //primaryIconTheme - IconThemeData类型，一个与主色对比的图片主题。
      //primaryTextTheme - TextThemeData类型，一个与主色对比的文本主题。
      //scaffoldBackgroundColor - Color类型，作为Scaffold基础的Material默认颜色，典型Material应用或应用内页面的背景颜色。
      //secondaryHeaderColor - Color类型，有选定行时PaginatedDataTable标题的颜色。
      //selectedRowColor - Color类型，选中行时的高亮颜色。
      //sliderTheme - SliderThemeData类型，用于渲染Slider的颜色和形状。
      //splashColor - Color类型，墨水喷溅的颜色。
      //splashFactory - InteractiveInkFeatureFactory类型，定义InkWall和InkResponse生成的墨水喷溅的外观。
      //textSelectionColor - Color类型，文本字段中选中文本的颜色，例如TextField。
      //textSelectionHandleColor - Color类型，用于调整当前文本的哪个部分的句柄颜色。
      //textTheme - TextTheme类型，与卡片和画布对比的文本颜色。
      //toggleableActiveColor - Color类型，用于突出显示切换Widget（如Switch，Radio和Checkbox）的活动状态的颜色。
      //unselectedWidgetColor - Color类型，用于Widget处于非活动（但已启用）状态的颜色。 例如，未选中的复选框。 通常与accentColor形成对比。
      //runtimeType - Type类型，表示对象的运行时类型。
      fontFamily: 'Aleo',
      //作为Scaffold基础的Material默认颜色，典型Material应用或应用内页面的背景颜色(背景色)
      // scaffoldBackgroundColor: Colors.red,
      //accentColorBrightness:Brightness.dark,
    );
    return themData;
  }
}

class TextStyles {
  static TextStyle textStyle(
      {double fontSize: Dimens.font_sp12,
      Color color: Colors.white,
      FontWeight fontWeight}) {
    return TextStyle(
        fontSize: fontSize,
        color: color,
        decoration: TextDecoration.none,
        fontWeight: fontWeight);
  }

  static TextStyle textRed12 = textStyle(color: Colors.red);
  static TextStyle textBlue12 = textStyle(color: Colors.blueAccent);
  static TextStyle textWhite12 = textStyle();
  static TextStyle textGreyC12 = textStyle(color: grey900Color);
  static TextStyle textGrey12 = textStyle(color: Colors.grey);
  static TextStyle textDark12 = textStyle(color: grey900Color);
  static TextStyle textBoldDark12 = textStyle(color: Colors.black);
  static TextStyle textBoldWhile12 = textStyle(fontWeight: FontWeight.bold);

  static TextStyle textWhite14 = textStyle(fontSize: Dimens.font_sp14);
  static TextStyle textRed14 =
      textStyle(fontSize: Dimens.font_sp14, color: Colors.red);
  static TextStyle textReader14 =
      textStyle(fontSize: Dimens.font_sp14, color: grey900Color);
  static TextStyle textBlue14 =
      textStyle(fontSize: Dimens.font_sp14, color: Colors.blueAccent);
  static TextStyle textGreyC14 =
      textStyle(fontSize: Dimens.font_sp14, color: grey900Color);
  static TextStyle textGrey14 =
      textStyle(fontSize: Dimens.font_sp14, color: Colors.grey);
  static TextStyle textDark14 =
      textStyle(fontSize: Dimens.font_sp14, color: grey900Color);
  static TextStyle textBoldDark14 = textStyle(
      fontSize: Dimens.font_sp14,
      color: Colors.black,
      fontWeight: FontWeight.bold);
  static TextStyle textBoldWhile14 =
      textStyle(fontSize: Dimens.font_sp14, fontWeight: FontWeight.bold);

  static TextStyle textReader16 =
      textStyle(fontSize: Dimens.font_sp16, color: grey900Color);
  static TextStyle textRed16 =
      textStyle(fontSize: Dimens.font_sp16, color: Colors.red);
  static TextStyle textBlue16 =
      textStyle(fontSize: Dimens.font_sp16, color: Colors.blueAccent);
  static TextStyle textWhite16 = textStyle(fontSize: Dimens.font_sp16);
  static TextStyle textGreyC16 =
      textStyle(fontSize: Dimens.font_sp16, color: grey900Color);
  static TextStyle textGrey16 =
      textStyle(fontSize: Dimens.font_sp16, color: Colors.grey);
  static TextStyle textDark16 =
      textStyle(fontSize: Dimens.font_sp16, color: grey900Color);
  static TextStyle textBoldDark16 = textStyle(
      fontSize: Dimens.font_sp16,
      color: Colors.black,
      fontWeight: FontWeight.bold);
  static TextStyle textBoldWhile16 = textStyle(
      fontSize: Dimens.font_sp16,
      color: Colors.white,
      fontWeight: FontWeight.bold);

  static TextStyle textBoldDark20 = textStyle(
      fontSize: Dimens.font_sp20,
      color: Colors.black,
      fontWeight: FontWeight.bold);

  static TextStyle textBoldDark26 = textStyle(
      fontSize: Dimens.font_sp26,
      color: Colors.black,
      fontWeight: FontWeight.bold);

  static TextStyle textBoldWhile40 =
      textStyle(fontSize: Dimens.font_sp40, fontWeight: FontWeight.w400);
}

const IconThemeData lightIconTheme = IconThemeData(color: Colors.black54);
