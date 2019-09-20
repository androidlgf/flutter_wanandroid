import 'package:flutter_common/api/api.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/common/http/simple_work.dart';
import 'package:flutter_common/common/http/http_index.dart';
import 'package:flutter_common/components/wanandroid/home/data/home_article_data.dart';
import 'package:flutter_common/components/wanandroid/home/data/home_banner_data.dart';
import 'package:flutter_common/components/wanandroid/project/data/project_list_of_data.dart';
import 'package:flutter_common/components/wanandroid/project/data/project_tab_data.dart';

//4.2 项目列表数据
class HomeProjectListWork extends BaseHttpWork<ProjectListOfData> {
  int _page = 1;
  int _cid = 0;

  HomeProjectListWork(int page, int cid) {
    this._page = page;
    this._cid = cid;
  }

  @override
  String onUrl(Map<String, dynamic> params) {
    return Api.WAN_PROJECT_LIST +
        _page.toString() +
        '/json?cid=' +
        _cid.toString();
  }

  //数据解析返回
  @override
  ProjectListOfData onExtractResult(
      resultData, SimpleWorkData<ProjectListOfData> data) {
    return ProjectListOfData.fromJson(resultData);
  }

  @override
  HttpExtraPlugin httpExtraPlugin() {
    return null;
  }
}
