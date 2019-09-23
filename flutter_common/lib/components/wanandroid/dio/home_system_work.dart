import 'package:flutter_common/api/api.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/common/http/simple_work.dart';
import 'package:flutter_common/common/http/http_index.dart';
import 'package:flutter_common/components/wanandroid/home/data/home_banner_data.dart';
import 'package:flutter_common/components/wanandroid/system/data/tree_data.dart';

//2.1 体系数据
class HomeSystemWork extends BaseHttpWork<TreeData> {
  @override
  String onUrl(Map<String, dynamic> params) {
    return Api.WAN_SYSTEM;
  }

  //数据解析返回
  @override
  TreeData onExtractResult(
      resultData, SimpleWorkData<TreeData> data) {
    return TreeData.fromJson(resultData);
  }
  @override
  HttpExtraPlugin httpExtraPlugin() {
    return null;
  }
}
