import 'package:flutter_common/api/api.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/common/http/simple_work.dart';
import 'package:flutter_common/common/http/http_index.dart';
import 'package:flutter_common/components/wanandroid/home/data/home_article_data.dart';
import 'package:flutter_common/components/wanandroid/home/data/home_banner_data.dart';

//2.2 知识体系下的文章
class HomeSystemArticleWork extends BaseHttpGetWork<HomeArticleData> {
  int _page = 0;
  int cid=0;
  HomeSystemArticleWork(int page,int cid) {
    this._page = page;
    this.cid=cid;
  }

  @override
  String onUrl(Map<String, dynamic> params) {
    return Api.WAN_SYSTEM_ARTICLE + _page.toString() + '/json?cid='+cid.toString();
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
