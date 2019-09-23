import 'package:flutter_common/api/api.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/common/http/simple_work.dart';
import 'package:flutter_common/common/http/http_index.dart';
import 'package:flutter_common/components/wanandroid/home/data/home_banner_data.dart';

//1.2 首页banner
class HomeBannerWork extends BaseHttpWork<HomeBannerData> {
  @override
  String onUrl(Map<String, dynamic> params) {
    return Api.WAN_BANNER;
  }

  //数据解析返回
  @override
  HomeBannerData onExtractResult(
      resultData, SimpleWorkData<HomeBannerData> data) {
    return HomeBannerData.fromJson(resultData);
  }
  @override
  HttpExtraPlugin httpExtraPlugin() {
    return null;
  }
}
