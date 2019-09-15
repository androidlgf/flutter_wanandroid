import 'package:flutter/material.dart';
import 'package:flutter_common/common/res/colors.dart';
import 'package:flutter_common/common/utils/sp_util.dart';

class ConfigProvider extends ChangeNotifier {
  final String _spIsTheme = 'theme';
  int _localIndex = 4;

  ConfigProvider() {
    getTheme();
  }

  int _theme = Colors.blue.value;

  int get theme => _theme;

  int get localIndex => _localIndex;

  //获取主题
  void getTheme() {
    _theme = SpUtil.getInt(_spIsTheme, defValue: Colors.blue.value);
    notifyListeners();
  }

  //设置主题
  void setTheme(theme) async {
    _theme = theme;
    SpUtil.setInt(_spIsTheme, theme);
    notifyListeners();
  }

  void getLocal() {
    _localIndex = SpUtil.getInt('key_support_locale', defValue: 0);
    debugPrint('config get Local $_localIndex');
    notifyListeners();
  }

  void setLocal(local) async {
    _localIndex = local;
    SpUtil.setInt('key_support_locale', local);
    notifyListeners();
  }
}
