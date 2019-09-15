
import 'package:flutter_common/common/dio/base_dio.dart';

class LoginWork extends BaseHttpWork{
  @override
  String onUrl(Map<String, dynamic> params) {
    return 'https://s.shishangmami.net/Jk/Usercoupon/getcounpon/';
  }
}