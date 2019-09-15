import 'package:flutter/material.dart';
import 'package:flutter_common/common/utils/sp_util.dart';

class UserProvider extends ChangeNotifier {
  final String _spIsLogin = 'isLogin';
  final String _spName = 'name';
  final String _spEmail = 'email';
  final String _spAvatar = 'avatar';

  //是否登录
  bool isLogin() {
    return SpUtil.getBool(_spIsLogin, defValue: false);
  }

  //获取用户名
  String getName() {
    return SpUtil.getString(_spName, defValue: '');
  }

  //获取Email
  String getEmail() {
    return SpUtil.getString(_spEmail, defValue: '');
  }

  //获取用户Icon
  String getAvatar() {
    return SpUtil.getString(_spAvatar, defValue: '');
  }

  //设置用户信息
  setUser({
    String name,
    String email,
    String avatar,
  }) async {
    String _name = name ?? getName();
    String _email = email ?? getEmail();
    String _avatar = avatar ?? getAvatar();

    SpUtil.setString(_spName, _name);
    SpUtil.setString(_spEmail, _email);
    SpUtil.setString(_spAvatar, _avatar);
    notifyListeners();
  }

  //设置登录状态
  initLogin(bool value) async {
    SpUtil.setBool(_spIsLogin, value ?? isLogin());
    notifyListeners();
  }

  //清空用户数据(退出登录)
  cleanUserInfo() async {
    SpUtil.remove(_spIsLogin);
    SpUtil.remove(_spName);
    SpUtil.remove(_spEmail);
    SpUtil.remove(_spAvatar);
    notifyListeners();
  }
}
