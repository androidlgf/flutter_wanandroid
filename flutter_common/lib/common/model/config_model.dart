import 'package:flutter/material.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/common/utils/sp_util.dart';

//配置信息 全局Theme
class ConfigModel extends ChangeNotifier {
  int _theme = blue900Color.value;
  int _localIndex = 0;

  ConfigModel() {
    getTheme();
    getLocal();
  }

  void getTheme() {
    _theme = SpUtil.getInt('theme', defValue: blue900Color.value);
    debugPrint('config get Theme $_theme');
    notifyListeners();
  }

  int get theme => _theme;

  void setTheme(theme) async {
    _theme = theme;
    SpUtil.setInt('theme', theme);
    notifyListeners();
  }

  void getLocal() {
    _localIndex = SpUtil.getInt('key_support_locale', defValue: 0);
    debugPrint('config get Local $_localIndex');
    notifyListeners();
  }

  int get localIndex => _localIndex;

  void setLocal(local) async {
    _localIndex = local;
    SpUtil.setInt('key_support_locale', local);
    notifyListeners();
  }
}
