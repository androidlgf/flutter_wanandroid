import 'package:flutter_common/api/api.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/common/http/simple_work.dart';
import 'package:flutter_common/common/http/http_index.dart';
import 'package:flutter_common/components/wanandroid/home/data/home_article_data.dart';
import 'package:flutter_common/components/wanandroid/home/data/home_banner_data.dart';
import 'package:flutter_common/components/wanandroid/search/data/search_hot_model.dart';

//1.4 搜索热词
class HomeSearchHotWork extends BaseHttpWork<SearchHotModel> {
  @override
  String onUrl(Map<String, dynamic> params) {
    return Api.WAN_SEARCH_HOT;
  }

  //数据解析返回
  @override
  SearchHotModel onExtractResult(
      resultData, SimpleWorkData<SearchHotModel> data) {
    return SearchHotModel.fromJson(resultData);
  }

  @override
  HttpExtraPlugin httpExtraPlugin() {
    return null;
  }
}
