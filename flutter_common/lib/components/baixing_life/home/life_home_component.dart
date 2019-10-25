import 'dart:convert';

import 'package:amap_base_location/amap_base_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_common/api/api.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/components/baixing_life/category/life_category_component.dart';
import 'package:flutter_common/components/baixing_life/dio/life_http_post_dio.dart';
import 'package:flutter_common/components/baixing_life/goodsdetail/life_goods_detail_component.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'data/life_home_data.dart';
import 'data/life_home_hot_data.dart';

//百姓生活 首页
class HomeBxLifeComponent extends StatefulWidget {
  @override
  _HomeBxLifeComponentState createState() => _HomeBxLifeComponentState();
}

class _HomeBxLifeComponentState extends State<HomeBxLifeComponent>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  final int TYPE_LEFT_FLOORF = 0;
  final int TYPE_RIGHT_FLOORF = 1;
  int _page = 0;
  EasyRefreshController _controller = EasyRefreshController();

  LifeHomeData _lifeHomeData;
  List<LifeGood> liftOfGoods = [];

  final _aMapLocation = AMapLocation();
  Location location;

  @override
  void initState() {
    super.initState();
    _aMapLocation.init();
    _location();
    _homeHotGoods(_page);
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
    if (_lifeHomeData == null) {
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
          header: MaterialHeader(),
          footer: MaterialFooter(),
          controller: _controller,
          onRefresh: () async {
            _controller.callRefresh();
          },
          onLoad: () async {
            _homeHotGoods(_page);
          },
          child: CustomScrollView(
            slivers: <Widget>[
              _buildBannerWidget(_lifeHomeData?.homeData?.slides),
              _buildCategoriesWidget(_lifeHomeData?.homeData?.category),
              _buildSliverToBoxAdapterAds(
                  _lifeHomeData?.homeData?.advertesPicture,
                  _lifeHomeData?.homeData?.shopInfo,
                  _lifeHomeData?.homeData?.saoma,
                  _lifeHomeData?.homeData?.integralMallPic,
                  _lifeHomeData?.homeData?.newUser),
              _buildSliverToBoxAdapterFloor(_lifeHomeData?.homeData?.floor1Pic,
                  _lifeHomeData?.homeData?.floor1, TYPE_LEFT_FLOORF),
              _buildSliverToBoxAdapterFloor(_lifeHomeData?.homeData?.floor2Pic,
                  _lifeHomeData?.homeData?.floor2, TYPE_RIGHT_FLOORF),
              _buildSliverToBoxAdapterFloor(_lifeHomeData?.homeData?.floor3Pic,
                  _lifeHomeData?.homeData?.floor3, TYPE_LEFT_FLOORF),
              _buildHotGoodsWidget(liftOfGoods)
            ],
          )),
    );
  }

  Widget _buildBannerWidget(List<Slides> slides) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(
          horizontal: Screen.wScreen10, vertical: Screen.wScreen10),
      sliver: SliverToBoxAdapter(
        child: AspectRatio(
            aspectRatio: 9 / 4,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Swiper(
                onTap: (int index) => pushNewPage(
                    context,
                    LifeGoodsDetailComponent(
                      goodsId: '${slides[index].goodsId}',
                    )),
                autoplay: true,
                itemCount: slides?.length,
                itemBuilder: (BuildContext context, int index) {
                  return ImageLoadView(
                    '${slides[index].image}',
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    fit: BoxFit.fill,
                  );
//            return Hero(
//                tag: '${carousels[index].image}',
//                child: ImageLoadView(
//                  '${carousels[index].image}',
//                  fit: BoxFit.fill,
//                ));
                },
                pagination: new SwiperPagination(
                    margin: new EdgeInsets.all(Screen.wScreen10)),
              ),
            )),
      ),
    );
  }

  //广告
  Widget _buildSliverToBoxAdapterAds(
      AdvertesPicture adPicture,
      ShopInfo shopInfo,
      Saoma saoma,
      IntegralMallPic mallPic,
      NewUser newUser) {
    double imageWidth = DeviceUtil.width - Screen.wScreen20;
    double imageHeight = imageWidth * 0.319;
    double width = (DeviceUtil.width - Screen.wScreen40) / 3;
    double height = width * 1.281;
    double adPicHeight = imageWidth * 0.134;
    return SliverToBoxAdapter(
        child: SizedBox(
      height: imageHeight + height + Screen.wScreen20 + adPicHeight,
      child: Card(
        color: Colors.white,
        elevation: 0.0,
        margin: EdgeInsets.all(Screen.wScreen10),
        child: Column(
          children: <Widget>[
            ImageLoadView(
              '${adPicture.pICTUREADDRESS}',
              width: imageWidth,
              height: adPicHeight,
            ),
            ImageLoadView(
              '${shopInfo.leaderImage}',
              width: imageWidth,
              height: imageHeight,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: ImageLoadView(
                    '${saoma.pICTUREADDRESS}',
                    width: width,
                    height: height,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ImageLoadView(
                    '${mallPic.pICTUREADDRESS}',
                    width: width,
                    height: height,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: ImageLoadView(
                    '${newUser.pICTUREADDRESS}',
                    width: width,
                    height: height,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }

  Widget _buildSliverToBoxAdapterFloor(
      dynamic floorPic, List<dynamic> floor, int type) {
    double imageWidth = DeviceUtil.width - Screen.wScreen20;
    double floorPicHeight = imageWidth * 0.25;
    double floorItemHeight = imageWidth * 0.5 * 0.519;
    List<Widget> leftItemWidgets = [];
    List<Widget> rightItemWidgets = [];
    if (type == TYPE_LEFT_FLOORF) {
      leftItemWidgets
        ..add(InkWell(
          onTap: () {
            pushNewPage(
                context,
                LifeGoodsDetailComponent(
                  goodsId: '${floor[0].goodsId}',
                ));
          },
          child: ImageLoadView(
            '${floor[0].image}',
            height: floorItemHeight * 2,
          ),
        ))
        ..add(InkWell(
          onTap: () {
            pushNewPage(
                context,
                LifeGoodsDetailComponent(
                  goodsId: '${floor[1].goodsId}',
                ));
          },
          child: ImageLoadView('${floor[1].image}',
              height: floorItemHeight,
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(4.0))),
        ));
      rightItemWidgets
        ..add(InkWell(
          onTap: () {
            pushNewPage(
                context,
                LifeGoodsDetailComponent(
                  goodsId: '${floor[2].goodsId}',
                ));
          },
          child: ImageLoadView(
            '${floor[2].image}',
            height: floorItemHeight,
          ),
        ))
        ..add(InkWell(
          onTap: () {
            pushNewPage(
                context,
                LifeGoodsDetailComponent(
                  goodsId: '${floor[3].goodsId}',
                ));
          },
          child: ImageLoadView(
            '${floor[3].image}',
            height: floorItemHeight,
          ),
        ))
        ..add(InkWell(
          onTap: () {
            pushNewPage(
                context,
                LifeGoodsDetailComponent(
                  goodsId: '${floor[4].goodsId}',
                ));
          },
          child: ImageLoadView('${floor[4].image}',
              height: floorItemHeight,
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(4.0))),
        ));
    } else {
      rightItemWidgets
        ..add(InkWell(
          onTap: () {
            pushNewPage(
                context,
                LifeGoodsDetailComponent(
                  goodsId: '${floor[0].goodsId}',
                ));
          },
          child: ImageLoadView(
            '${floor[0].image}',
            height: floorItemHeight * 2,
          ),
        ))
        ..add(InkWell(
          onTap: () {
            pushNewPage(
                context,
                LifeGoodsDetailComponent(
                  goodsId: '${floor[1].goodsId}',
                ));
          },
          child: ImageLoadView('${floor[1].image}',
              height: floorItemHeight,
              borderRadius:
                  BorderRadius.only(bottomRight: Radius.circular(4.0))),
        ));
      leftItemWidgets
        ..add(InkWell(
          onTap: () {
            pushNewPage(
                context,
                LifeGoodsDetailComponent(
                  goodsId: '${floor[2].goodsId}',
                ));
          },
          child: ImageLoadView(
            '${floor[2].image}',
            height: floorItemHeight,
          ),
        ))
        ..add(InkWell(
          onTap: () {
            pushNewPage(
                context,
                LifeGoodsDetailComponent(
                  goodsId: '${floor[3].goodsId}',
                ));
          },
          child: ImageLoadView(
            '${floor[3].image}',
            height: floorItemHeight,
          ),
        ))
        ..add(InkWell(
          onTap: () {
            pushNewPage(
                context,
                LifeGoodsDetailComponent(
                  goodsId: '${floor[4].goodsId}',
                ));
          },
          child: ImageLoadView('${floor[4].image}',
              height: floorItemHeight,
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(4.0))),
        ));
    }
    return SliverToBoxAdapter(
        child: SizedBox(
      height: type == TYPE_RIGHT_FLOORF
          ? floorItemHeight * 3 + floorPicHeight + Screen.wScreen30
          : floorItemHeight * 3 + floorPicHeight + Screen.wScreen10,
      child: Card(
        color: Colors.white,
        elevation: 0.0,
        margin: EdgeInsets.symmetric(
            horizontal: Screen.wScreen10,
            vertical: type == TYPE_RIGHT_FLOORF ? Screen.wScreen10 : 0),
        child: Column(
          children: <Widget>[
            ImageLoadView(
              '${floorPic.pICTUREADDRESS}',
              width: imageWidth,
              height: floorPicHeight,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0)),
            ),
            SizedBox(
              height: Screen.wScreen10,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: (leftItemWidgets),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Column(
                    children: (rightItemWidgets),
                  ),
                  flex: 1,
                )
              ],
            )
          ],
        ),
      ),
    ));
  }

  Widget _buildCategoriesWidget(List<Category> categories) {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: Screen.wScreen10),
      sliver: SliverGrid(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return InkWell(
              onTap: () => pushNewPage(
                  context,
                  CategoryBxLifeComponent(
                    index: '${categories[index].mallCategoryId}',
                  )),
              child: Container(
                color: Colors.white,
                padding: EdgeInsets.all(Screen.hScree7),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ImageLoadView('${categories[index].image}',
                          height: 40, width: 40),
//                      Gaps.vGap5,
                      Text(
                        '${categories[index].mallCategoryName}',
                        maxLines: 1,
                      )
                    ]),
              ),
            );
          }, childCount: categories?.length - 1),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5, childAspectRatio: 0.9)),
    );
  }

  Widget _buildHotGoodsWidget(List<LifeGood> goods) {
    return SliverPadding(
        padding: EdgeInsets.all(Screen.wScreen10),
        sliver: SliverGrid(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return InkWell(
                onTap: () {
                  pushNewPage(
                      context,
                      LifeGoodsDetailComponent(
                        goodsId: '${goods[index].goodsId}',
                      ));
                },
                //Hero
                child: Hero(
                  tag: '${goods[index].image}',
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ImageLoadView(
                          '${goods[index].image}',
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
                              '￥' + '${goods[index].mallPrice}',
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

  Future<void> _location() async {
    final options = LocationClientOptions(
      isOnceLocation: true,
      locatingWithReGeocode: true,
    );

    if (await Permissions.requestMapPermission()) {
      _aMapLocation.getLocation(options).then((value) {
        location = value;
        ILifeHttpPostWork().start(url: Api.LIFE_HOME, params: {
          'lon': location.longitude,
          'lat': location.latitude
        }).then((onValue) {
          if (onValue.success) {
            _lifeHomeData = LifeHomeData.fromJson(onValue.result);
            setState(() {});
          } else {}
        });
      });
    } else {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('权限不足')));
    }
  }

  //获取热销商品
  void _homeHotGoods(int page) {
    ILifeHttpPostWork()
        .start(url: Api.LIFE_HOME_HOT, params: {'page': page}).then((onValue) {
      if (onValue.success) {
        liftOfGoods.addAll(LifeHomeHotData.fromJson(onValue.result)?.lifeGood);
        setState(() {
          _controller.finishLoad(success: true,noMore: false);
        });
      } else {}
    });
  }
}
