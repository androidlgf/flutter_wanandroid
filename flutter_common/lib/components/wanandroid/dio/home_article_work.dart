import 'package:flutter_common/api/api.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/common/http/simple_work.dart';
import 'package:flutter_common/common/http/http_index.dart';
import 'package:flutter_common/components/wanandroid/home/data/home_article_data.dart';
import 'package:flutter_common/components/wanandroid/home/data/home_banner_data.dart';

//1.1 首页文章列表
class HomeArticleWork extends BaseHttpWork<HomeArticleData> {
  int _page = 0;

  HomeArticleWork(int page) {
    this._page = page;
  }

  @override
  String onUrl(Map<String, dynamic> params) {
    return Api.WAN_ARTICLE + _page.toString() + '/json';
  }

  //数据解析返回
  @override
  HomeArticleData onExtractResult(
      resultData, SimpleWorkData<HomeArticleData> data) {
    return HomeArticleData.fromJson(resultData);
  }

  @override
  HttpExtraPlugin httpExtraPlugin() {
    return null;
  }
}
