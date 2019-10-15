import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/common/ui/web_view.dart';
import 'package:flutter_common/components/wanandroid/dio/home_article_work.dart';
import 'package:flutter_common/components/wanandroid/dio/home_banner_work.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:like_button/like_button.dart';

//IBrad 分类
class CategoriesIBrandComponent extends StatefulWidget {
  @override
  _CategoriesIBrandComponentState createState() =>
      _CategoriesIBrandComponentState();
}

class _CategoriesIBrandComponentState extends State<CategoriesIBrandComponent>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    loadMore();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBodyWidget();
  }

  Widget _buildBodyWidget() {
    return Container(
      color: Color(0xFFFAFAFA),
      child: EasyRefresh(
          header: MaterialHeader(),
          footer: MaterialFooter(),
          onRefresh: () async {},
          onLoad: () async {
            _page++;
            loadMore();
          },
          child: GridView.builder(
              itemCount: 10,
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  //单个子Widget的水平最大宽度
                  maxCrossAxisExtent: (DeviceUtil.width) / 2,
                  //水平单个子Widget之间间距
                  mainAxisSpacing: 10.0,
                  //垂直单个子Widget之间间距
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 0.58),
              itemBuilder: (BuildContext context, int index) {
                return _buildGridItemWidget();
              })),
    );
  }

  void loadMore() {}

  Widget _buildGridItemWidget() {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 163 / 208,
            child: Container(
              color: Colors.blue,
            ),
          ),
          AspectRatio(
            aspectRatio: 163 / 73,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(
                        left: Screen.wScreen8,
                        right: Screen.wScreen8,
                        top: Screen.hScree7),
                    child: Text('BRAND',
                        style: TextStyle(
                            color: Color(0xFF4D4D4D),
                            fontSize: Screen.spScreen15))),
                Padding(
                    padding: EdgeInsets.only(
                        left: Screen.wScreen8, right: Screen.wScreen8),
                    child: Text('Helvetica',
                        style: TextStyle(
                            color: Color(0xFFC0C0C0),
                            fontSize: Screen.spScreen10))),
                Padding(
                    padding: EdgeInsets.only(
                        left: Screen.wScreen8,
                        right: Screen.wScreen8,
                        top: Screen.hScree8),
                    child: Text('RP 459.500',
                        style: TextStyle(
                            color: Color(0xFF37BEA9),
                            fontSize: Screen.spScreen15))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
