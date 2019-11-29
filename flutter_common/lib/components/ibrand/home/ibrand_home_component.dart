import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_common/api/api.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/components/ibrand/dio/ibrand_http_get_dio.dart';
import 'package:flutter_common/components/ibrand/goodsdetail/ibrand_goods_detail_component.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'data/i_brand_home_data.dart';

//IBrad 首页
class HomeIBrandComponent extends StatefulWidget {
  @override
  _HomeIBrandComponentState createState() => _HomeIBrandComponentState();
}

class _HomeIBrandComponentState extends State<HomeIBrandComponent>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  int _page = 0;
  IBrandHomeData _iBrandHomeData;

  @override
  void initState() {
    super.initState();
    getIBrandHomeData();
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
    if (_iBrandHomeData == null) {
      return Column(
        children: <Widget>[
          Expanded(
            child: getLoadingWidget(),
            flex: 1,
          )
        ],
      );
    }
    return Container(
      color: Color(0xFFFAFAFA),
      child: EasyRefresh(
          child: CustomScrollView(
        slivers: <Widget>[
          _buildBannerWidget(_iBrandHomeData?.iBrandData?.carousels),
          _buildCategoriesWidget(_iBrandHomeData?.iBrandData?.categories),
          _buildCategoriesTagWidget(
              _iBrandHomeData?.iBrandData?.boyCategory?.name),
          _buildGoodsWidget(_iBrandHomeData?.iBrandData?.boyCategory?.iBrandItems),
          _buildCategoriesTagWidget(
              _iBrandHomeData?.iBrandData?.girlCategory?.name),
          _buildGoodsWidget(
              _iBrandHomeData?.iBrandData?.girlCategory?.iBrandItems),
        ],
      )),
    );
  }

  Widget _buildBannerWidget(List<Carousels> carousels) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Swiper(
//          onTap: (int index) => pushNewPage(
//              context,
//              WebViewPage(
//                url: '${objs[index].url}',
//                title: '${objs[index].title}',
//              )),
          autoplay: true,
          itemCount: carousels.length,
          itemBuilder: (BuildContext context, int index) {
            return ImageLoadView(
              '${carousels[index].image}',
              fit: BoxFit.fill,
            );
//            return Hero(
//                tag: '${carousels[index].image}',
//                child: ImageLoadView(
//                  '${carousels[index].image}',
//                  fit: BoxFit.fill,
//                ));
          },
        ),
      ),
    );
  }

  Widget _buildCategoriesTagWidget(categoriesName) {
    return SliverToBoxAdapter(
      child: Container(
//        color: Colors.white,
//        height: Screen.hScree44,
        margin: EdgeInsets.only(top: Screen.hScree10),
        padding: EdgeInsets.only(left: Screen.wScreen10),
        child: Text(
          '${categoriesName}',
          style:
              TextStyle(color: Color(0xFF515C6F), fontSize: Screen.spScreen30),
        ),
      ),
    );
  }

  Widget _buildCategoriesWidget(List<Categories> categories) {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
          return InkWell(
            onTap: () {},
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(Screen.hScree5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ImageLoadView('${categories[index].image}',
                        height: 40, width: 40),
                    Gaps.vGap5,
                    Text(
                      '${categories[index].name}',
                      maxLines: 1,
                    )
                  ]),
            ),
          );
        }, childCount: categories?.length),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5, childAspectRatio: 0.9));
  }

  Widget _buildGoodsWidget(List<IBrandItems> goods) {
    return SliverPadding(
        padding: EdgeInsets.only(
            left: Screen.wScreen10,
            right: Screen.wScreen10,
            top: Screen.wScreen10),
        sliver: SliverGrid(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return InkWell(
                onTap: () {
                  pushNewPage(
                      context,
                      GoodsDetailIBrandComponent(
                        goodsId: goods[index].id,
                      ));
                },
                //Hero
                child: Hero(
                  tag: '${goods[index].img}',
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ImageLoadView(
                          '${goods[index].img}',
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0)),
                        ),
                        Padding(
                            padding: EdgeInsets.only(
                                left: Screen.wScreen10,
                                right: Screen.wScreen10,
                                top: Screen.hScree10),
                            child: Text(
                              '${goods[index].name}',
                              maxLines: 1,
                              style: TextStyle(
                                  color: Color(0xFF515C6F),
                                  fontSize: Screen.spScreen12),
                            )),
                        Padding(
                            padding: EdgeInsets.only(
                                left: Screen.wScreen10,
                                right: Screen.wScreen10),
                            child: Text(
                              '￥' + '${goods[index].sellPrice}',
                              style: TextStyle(
                                  color: Color(0xFF515C6F),
                                  fontSize: Screen.spScreen10),
                            ))
                      ],
                    ),
                  ),
                ));
          }, childCount: goods?.length),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.652,
              crossAxisSpacing: Screen.wScreen10,
              mainAxisSpacing: Screen.hScree10),
        ));
  }

  void getIBrandHomeData() {
    IBrandHttpGetWork().start(url: Api.IbRAND_HOME).then((homeData) {
      if (homeData.success) {
        _iBrandHomeData = IBrandHomeData.fromJson(homeData?.result);
        setState(() {});
      } else {
        rootBundle.loadString('assets/data/ibrand_home.json').then((value) {
          Map<String, dynamic> obj = json.decode(value);
          _iBrandHomeData = IBrandHomeData.fromJson(obj);
          setState(() {});
        });
      }
    });
  }
}
