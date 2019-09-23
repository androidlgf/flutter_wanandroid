import 'package:flutter_common/api/api.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/common/http/simple_work.dart';
import 'package:flutter_common/common/http/http_index.dart';
import 'package:flutter_common/components/wanandroid/home/data/home_article_data.dart';
import 'package:flutter_common/components/wanandroid/home/data/home_banner_data.dart';
import 'package:flutter_common/components/wanandroid/project/data/project_tab_data.dart';

//1.1 首页文章列表
class HomeProjectTabWork extends BaseHttpWork<ProjectTabData> {
  @override
  String onUrl(Map<String, dynamic> params) {
    return Api.WAN_PROJECT;
  }

  //数据解析返回
  @override
  ProjectTabData onExtractResult(
      resultData, SimpleWorkData<ProjectTabData> data) {
    return ProjectTabData.fromJson(resultData);
  }

  @override
  HttpExtraPlugin httpExtraPlugin() {
    return null;
  }
}
