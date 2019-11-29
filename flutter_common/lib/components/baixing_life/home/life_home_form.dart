import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/api/api.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/common/res/styles.dart';
import 'package:flutter_common/common/ui/image_load_view.dart';
import 'package:flutter_common/common/utils/device_util.dart';
import 'package:flutter_common/common/utils/route_util.dart';
import 'package:flutter_common/components/baixing_life/category/life_category_component.dart';
import 'package:flutter_common/components/baixing_life/db/life_goods_provider.dart';
import 'package:flutter_common/components/baixing_life/goodsdetail/life_goods_detail_page.dart';
import 'package:flutter_common/components/baixing_life/home/life_home_bloc.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'data/life_home_data.dart';
import 'data/life_home_hot_data.dart';
import 'life_home_bloc_event.dart';

//百姓生活 首页
class HomeBxLifeWidget extends StatefulWidget {
  final LifeGoodsProvider provider;

  HomeBxLifeWidget(this.provider, {Key key}) : super(key: key);

  @override
  State createState() => _HomeBxLifeWidgetState();
}

class _HomeBxLifeWidgetState extends State<HomeBxLifeWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  int page = 1;

// 是否开启刷新
  bool _enableRefresh = true;

  // 是否开启加载
  bool _enableLoad = true;
  List<LifeGood> liftOfGoods = [];
  LifeHomeData _lifeHomeData;
  EasyRefreshController _controller = EasyRefreshController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<LifeHomeBloc>(context).add(LocationEvent());
    BlocProvider.of<LifeHomeBloc>(context)
        .add(BlocHttpEvent(url: Api.LIFE_HOME_HOT, params: {'page': page}));
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFFAFAFA),
      child: BlocWidget<LifeHomeBloc>(
        builder:
            BlocBuilder<LifeHomeBloc, BlocState>(builder: (context, state) {
          if (state is BlocSuccess) {
            if (state.url == null) {
              _lifeHomeData = LifeHomeData.fromJson(state?.response);
            } else {
              liftOfGoods
                  .addAll(LifeHomeHotData.fromJson(state?.response)?.lifeGood);
              page += 1;
            }
          }
          if (_lifeHomeData != null) {
            return EasyRefresh.custom(
              controller: _controller,
              header: MaterialHeader(),
              footer: MaterialFooter(),
              onRefresh: _enableRefresh ? () async {} : null,
              onLoad: _enableLoad
                  ? () async {
                      BlocProvider.of<LifeHomeBloc>(context).add(BlocHttpEvent(
                          url: Api.LIFE_HOME_HOT, params: {'page': page}));
                    }
                  : null,
              slivers: <Widget>[
                _buildBannerWidget(_lifeHomeData?.homeData?.slides),
                _buildCategoriesWidget(_lifeHomeData?.homeData?.category),
                _buildSliverToBoxAdapterAds(
                    _lifeHomeData?.homeData?.advertesPicture,
                    _lifeHomeData?.homeData?.shopInfo,
                    _lifeHomeData?.homeData?.saoma,
                    _lifeHomeData?.homeData?.integralMallPic,
                    _lifeHomeData?.homeData?.newUser),
                _buildSliverToBoxAdapterFloor(
                    _lifeHomeData?.homeData?.floor1Pic,
                    _lifeHomeData?.homeData?.floor1,
                    FloorType.Left),
                _buildSliverToBoxAdapterFloor(
                    _lifeHomeData?.homeData?.floor2Pic,
                    _lifeHomeData?.homeData?.floor2,
                    FloorType.Right),
                _buildSliverToBoxAdapterFloor(
                    _lifeHomeData?.homeData?.floor3Pic,
                    _lifeHomeData?.homeData?.floor3,
                    FloorType.Left),
                _buildHotGoodsWidget(liftOfGoods)
              ],
            );
          }
          return Container();
        }),
      ),
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
                    LifeGoodsDetailPage(
                      provider: widget.provider,
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
      dynamic floorPic, List<dynamic> floor, FloorType type) {
    double imageWidth = DeviceUtil.width - Screen.wScreen20;
    double floorPicHeight = imageWidth * 0.25;
    double floorItemHeight = imageWidth * 0.5 * 0.519;
    List<Widget> leftItemWidgets = [];
    List<Widget> rightItemWidgets = [];
    if (type == FloorType.Left) {
      leftItemWidgets
        ..add(InkWell(
          onTap: () {
            pushNewPage(
                context,
                LifeGoodsDetailPage(
                  provider: widget.provider,
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
                LifeGoodsDetailPage(
                  provider: widget.provider,
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
                LifeGoodsDetailPage(
                  provider: widget.provider,
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
                LifeGoodsDetailPage(
                  provider: widget.provider,
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
                LifeGoodsDetailPage(
                  provider: widget.provider,
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
                LifeGoodsDetailPage(
                  provider: widget.provider,
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
                LifeGoodsDetailPage(
                  provider: widget.provider,
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
                LifeGoodsDetailPage(
                  provider: widget.provider,
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
                LifeGoodsDetailPage(
                  provider: widget.provider,
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
                LifeGoodsDetailPage(
                  provider: widget.provider,
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
      height: type == FloorType.Right
          ? floorItemHeight * 3 + floorPicHeight + Screen.wScreen30
          : floorItemHeight * 3 + floorPicHeight + Screen.wScreen10,
      child: Card(
        color: Colors.white,
        elevation: 0.0,
        margin: EdgeInsets.symmetric(
            horizontal: Screen.wScreen10,
            vertical: type == FloorType.Right ? Screen.wScreen10 : 0),
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
          }, childCount: categories.length - 1),
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
                    LifeGoodsDetailPage(
                      provider: widget.provider,
                      goodsId: '${goods[index].goodsId}',
                    ));
              },
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
                            left: Screen.wScreen10, right: Screen.wScreen10),
                        child: Text(
                          '￥' + '${goods[index].mallPrice}',
                          style: TextStyle(
                              color: Color(0xFF515C6F),
                              fontSize: Screen.spScreen10),
                        ))
                  ],
                ),
              ),
            );
          }, childCount: goods?.length),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.652,
              crossAxisSpacing: Screen.wScreen10,
              mainAxisSpacing: Screen.hScree10),
        ));
  }
}

enum FloorType { Left, Right }
