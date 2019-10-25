import 'package:flutter/material.dart';
import 'package:flutter_common/api/api.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/common/utils/loading_util.dart';
import 'package:flutter_common/components/baixing_life/dialog/goods_brand_dialog.dart';
import 'package:flutter_common/components/baixing_life/dialog/goods_card_dialog.dart';
import 'package:flutter_common/components/baixing_life/dialog/goods_service_dialog.dart';
import 'package:flutter_common/components/baixing_life/dio/life_http_post_dio.dart';
import 'package:flutter_common/components/ibrand/dio/ibrand_http_get_dio.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'data/life_goods_detail_data.dart';

//百姓生活 商品详情
class LifeGoodsDetailComponent extends StatefulWidget {
  final String goodsId;

  LifeGoodsDetailComponent({Key key, this.goodsId})
      : assert(goodsId != null),
        super(key: key);

  @override
  _LifeGoodsDetailIBrandComponentState createState() =>
      _LifeGoodsDetailIBrandComponentState();
}

class _LifeGoodsDetailIBrandComponentState
    extends State<LifeGoodsDetailComponent> with TickerProviderStateMixin {
  bool get wantKeepAlive => true;

  LifeGoodsDetailData _lifeGoodsDetailData;
  List<String> listOfBanners = [];
  ScrollController scrollController = ScrollController();

  double navAlpha = 0.1;
  double headerHeight;
  List<Tab> titleTabs;
  TabController tabController;
  Color c = Colors.grey;
  bool isLove = false; //是否点赞
  @override
  void initState() {
    super.initState();
    headerHeight = DeviceUtil.width;

    titleTabs = titleTabs = <Tab>[
      Tab(text: '宝贝'),
      Tab(text: "评价"),
      Tab(text: "详情"),
      Tab(text: "推荐")
    ];
    tabController = TabController(length: titleTabs.length, vsync: this)
      ..addListener(() {
        // 监听滑动/点选位置
        if (tabController.index.toDouble() == tabController.animation.value) {
//          setState(() => currentIndex = controller.index);
        }
      });
    scrollController.addListener(() {
      var offset = scrollController.offset;
      if (offset < 0) {
        if (navAlpha != 0) {
          setState(() => navAlpha = 0);
        }
      } else if (offset < headerHeight) {
        if (headerHeight - offset <= DeviceUtil.navigationBarHeight) {
          setState(() => c = Colors.white);
        } else {
          c = Colors.grey;
        }
        setState(() => navAlpha = 1 - (headerHeight - offset) / headerHeight);
      } else if (navAlpha != 1) {
        setState(() => navAlpha = 1);
      }
    });
    getGoodsDetailData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(_lifeGoodsDetailData == null
              ? ''
              : '${_lifeGoodsDetailData.goodsDetailData?.goodInfo?.goodsName}')),
      body: _buildBodyWidget(),
    );
  }

  Widget _buildBodyWidget() {
    if (_lifeGoodsDetailData == null) {
      return Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: getLoadingWidget(),
              flex: 1,
            )
          ],
        ),
      );
    }
    return Column(
//      alignment: Alignment.bottomLeft,
      children: <Widget>[_buildContentWidget(), _buildBottomTabWidget()],
    );
  }

  Widget _buildContentWidget() {
    return Expanded(
        child: Stack(
      children: <Widget>[
        CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            _buildBannerWidget(listOfBanners),
            _buildBodyTabWidget()
          ],
        ),
        _buildTabBar(),
      ],
    ));
  }

  Widget _buildTabBar() {
//    return SliverPersistentHeader(
//      pinned: true,
//      delegate: StickyTabBarDelegate(
//        opacity: navAlpha,
//        child: TabBar(
//            tabs: titleTabs,
//            labelColor: Colors.pinkAccent,
//            unselectedLabelColor: Colors.grey,
//            controller: this.tabController,
//            isScrollable: false,
//            indicatorColor: Colors.pinkAccent),
//      ),
//    );
//
//    return SliverPersistentHeader(
//      floating: false,
//      pinned: true,
//      delegate: _SliverAppBarDelegate(
//        minHeight: 300,
//        maxHeight: 300,
//        child: Transform.scale(
//          scale: navAlpha,
//          child: Image.network('https://picsum.photos/id/1025/990/660',
//              fit: BoxFit.cover),
//        ),
//      ),
//    );

    return Container(
        color: Color.fromARGB((navAlpha * 255).toInt(), 255, 255, 255),
        child: Opacity(
          opacity: navAlpha,
          child: TabBar(
              tabs: titleTabs,
              labelColor: Colors.pinkAccent,
              unselectedLabelColor: Colors.grey,
              controller: this.tabController,
              isScrollable: false,
              indicatorColor: Colors.pinkAccent),
        ));
  }

  Widget _buildBannerWidget(List<String> banners) {
    return SliverToBoxAdapter(
      child: AspectRatio(
        aspectRatio: 1,
        child: Swiper(
//          onTap: (int index) => pushNewPage(
//              context,
//              WebViewPage(
//                url: '${objs[index].url}',
//                title: '${objs[index].title}',
//              )),
          autoplay: true,
          itemCount: banners?.length,
          pagination: SwiperPagination(
              builder: SwiperPagination.fraction,
              alignment: Alignment.bottomRight),
          itemBuilder: (BuildContext context, int index) {
            return ImageLoadView(
              banners[index],
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

  Widget _buildBodyTabWidget() {
    return SliverList(
        delegate: SliverChildListDelegate([
      _buildGoodsDetailWidget(),
//      Center(child: Text('Content of 评价')),
//      Center(child: Text('Content of 详情')),
//      Center(child: Text('Content of 推荐')),
    ]));
    return SliverFillRemaining(
      child: TabBarView(children: [
//        SingleChildScrollView(
////          physics: NeverScrollableScrollPhysics(),
//          child: _buildGoodsDetailWidget(),
//        ),
        _buildGoodsDetailWidget(),
        Center(child: Text('Content of 评价')),
        Center(child: Text('Content of 详情')),
        Center(child: Text('Content of 推荐')),
      ], controller: this.tabController),
    );
//    List<Widget> children = [];
//    children..add(Container(height:1000,child: Text('Content of 评价'),))..add(Text('Content of 评价'))..add(Text('Content of 评价'))..add(Text('Content of 评价'));
//    return SliverList(delegate: SliverChildListDelegate(children));
  }

  Widget _buildGoodsDetailWidget() {
    return Container(
      color: Colors.white,
//      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
            child: RichText(
                text: TextSpan(
                    text: '￥' +
                        '${_lifeGoodsDetailData.goodsDetailData?.goodInfo?.presentPrice}' +
                        '  ',
                    style: TextStyle(
                        color: Color(0xFFFF6969), fontSize: Screen.spScreen18),
                    children: <TextSpan>[
                  TextSpan(
                      text: '市场价:￥' +
                          '${_lifeGoodsDetailData.goodsDetailData?.goodInfo?.oriPrice}',
                      style: TextStyle(
                        color: Color(0xFF515C6F),
                        fontSize: Screen.spScreen12,
                        decoration: TextDecoration.lineThrough,
                      ))
                ])),
          ),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                '${_lifeGoodsDetailData.goodsDetailData?.goodInfo?.goodsName}',
                maxLines: 2,
                style: TextStyle(
                    color: Color(0xFF3E3A3A), fontSize: Screen.spScreen15),
              )),
          Container(
            height: Screen.hScree40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    isLove = !isLove;
                    setState(() {});
                  },
                  child: IconText(
                    icon: Icon(
                      Icons.thumb_up,
                      size: Screen.hScree12,
                      color: isLove ? deepOrange800Color : grey500Color,
                    ),
                    text: Text(
                      '点赞',
                      style: TextStyle(
                          color: grey500Color, fontSize: Screen.spScreen12),
                    ),
                    leading: Screen.wScreen5,
                  ),
                ),
                IconText(
                  icon: Icon(Icons.business_center,
                      size: Screen.hScree12, color: grey500Color),
                  text: Text('送给TA',
                      style: TextStyle(
                          color: grey500Color, fontSize: Screen.spScreen12)),
                  leading: Screen.wScreen5,
                ),
                IconText(
                  icon: Icon(Icons.add_shopping_cart,
                      size: Screen.hScree12, color: grey500Color),
                  text: Text('帮我选',
                      style: TextStyle(
                          color: grey500Color, fontSize: Screen.spScreen12)),
                  leading: Screen.wScreen5,
                ),
              ],
            ),
          ),
          Container(
            color: grey100Color,
            height: Screen.hScree8,
          ),
          Container(
            height: Screen.hScree40,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '发货',
                      style: TextStyle(
                          color: grey500Color, fontSize: Screen.spScreen12),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: Screen.wScreen20),
                        child: IconText(
                          icon: Icon(Icons.location_on,
                              size: Screen.hScree12, color: Color(0xFF515C6F)),
                          text: Text('上海',
                              style: TextStyle(
                                  color: Color(0xFF515C6F),
                                  fontSize: Screen.spScreen12)),
                          leading: Screen.wScreen5,
                        ))
                  ],
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            '快递:免运费',
                            style: TextStyle(
                                color: Color(0xFF515C6F),
                                fontSize: Screen.spScreen12),
                          )),
                      Text(
                        '月销' +
                            '${_lifeGoodsDetailData.goodsDetailData?.goodInfo?.state}',
                        style: TextStyle(
                            color: grey500Color, fontSize: Screen.spScreen12),
                      )
                    ],
                  ),
                  flex: 3,
                )
              ],
            ),
          ),
          Container(
            color: grey100Color,
            height: Screen.hScree8,
          ),
          Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () => showGoodsServiceDialog(),
              child: Container(
                height: Screen.hScree40,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '服务',
                      style: TextStyle(
                          color: grey500Color, fontSize: Screen.spScreen12),
                    ),
                    Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: Screen.wScreen20),
                              child: Text('7天无理由',
                                  style: TextStyle(
                                      color: Color(0xFF515C6F),
                                      fontSize: Screen.spScreen12)),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: Screen.wScreen12,
                              color: grey300Color,
                            )
                          ],
                        ),
                        flex: 1)
                  ],
                ),
              ),
            ),
          ),
          Material(
            type: MaterialType.transparency,
            child: InkWell(
              onTap: () => showGoodsBrandDialog(),
              child: Container(
                height: Screen.hScree40,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '参数',
                      style: TextStyle(
                          color: grey500Color, fontSize: Screen.spScreen12),
                    ),
                    Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: Screen.wScreen20),
                              child: Text('品牌 型号...',
                                  style: TextStyle(
                                      color: Color(0xFF515C6F),
                                      fontSize: Screen.spScreen12)),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: Screen.wScreen12,
                              color: grey300Color,
                            )
                          ],
                        ),
                        flex: 1)
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: DeviceUtil.width,
            height: Screen.hScree40,
            alignment: Alignment.center,
            color: grey100Color,
            child: Text('————宝贝详情————'),
          ),
          Html(
              data:
                  '${_lifeGoodsDetailData.goodsDetailData?.goodInfo?.goodsDetail}')
        ],
      ),
    );
  }

  Widget _buildBottomTabWidget() {
    return Container(
      height: Screen.hScree44,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
          vertical: Screen.hScree4, horizontal: Screen.wScreen10),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.store,
                      color: grey500Color,
                    ),
                    Text(
                      '店铺',
                      style: TextStyle(
                          color: grey500Color,
                          fontSize: Screen.spScreen10,
                          decoration: TextDecoration.none),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(Icons.sentiment_satisfied, color: grey500Color),
                    Text(
                      '客服',
                      style: TextStyle(
                          color: grey500Color,
                          fontSize: Screen.spScreen10,
                          decoration: TextDecoration.none),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Icon(Icons.star_border, color: grey500Color),
                    Text(
                      '收藏',
                      style: TextStyle(
                          color: grey500Color,
                          fontSize: Screen.spScreen10,
                          decoration: TextDecoration.none),
                    )
                  ],
                )
              ],
            ),
            flex: 1,
          ),
          Padding(padding: EdgeInsets.all(Screen.wScreen5)),
          Expanded(
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () => showGoodsAddCardDialog(),
                  child: Container(
                    width: (DeviceUtil.width - Screen.wScreen30) / 3,
                    height: Screen.hScree40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Screen.hScree20),
                            bottomLeft: Radius.circular(Screen.hScree20)),
                        color: deepOrange300Color),
                    child: Text(
                      '加入购物车',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Screen.spScreen15,
                          decoration: TextDecoration.none),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: (DeviceUtil.width - Screen.wScreen30) / 3,
                    height: Screen.hScree40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(Screen.hScree20),
                            topRight: Radius.circular(Screen.hScree20)),
                        color: deepOrange800Color),
                    child: Text(
                      '立即购买',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: Screen.spScreen15,
                          decoration: TextDecoration.none),
                    ),
                  ),
                )
              ],
            ),
            flex: 2,
          )
        ],
      ),
    );
  }

  void getGoodsDetailData() {
    ILifeHttpPostWork().start(
        url: Api.LIFE_GOODS_DETAIL,
        params: {'goodId': '${widget.goodsId}'}).then((goodsDetail) {
      if (goodsDetail.success) {
        _lifeGoodsDetailData = LifeGoodsDetailData.fromJson(goodsDetail.result);
        GoodsDetailData goodsDetailData = _lifeGoodsDetailData.goodsDetailData;
        GoodInfo goodInfo = goodsDetailData.goodInfo;
        String image1 = goodInfo.image1;
        if (image1 != null && image1.isNotEmpty) {
          listOfBanners.add(image1);
        }
        String image2 = goodInfo.image2;
        if (image2 != null && image2.isNotEmpty) {
          listOfBanners.add(image2);
        }
        String image3 = goodInfo.image3;
        if (image3 != null && image3.isNotEmpty) {
          listOfBanners.add(image3);
        }
        String image4 = goodInfo.image4;
        if (image4 != null && image4.isNotEmpty) {
          listOfBanners.add(image4);
        }
        String image5 = goodInfo.image5;
        if (image5 != null && image5.isNotEmpty) {
          listOfBanners.add(image5);
        }
        setState(() {});
      }
    });
  }

  //服务Dialog展示
  void showGoodsServiceDialog() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => GoodsServiceDialog());
  }

  //品牌Dialog展示
  void showGoodsBrandDialog() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => GoodsBrandDialog());
  }

  //添加购物车Dialog展示
  void showGoodsAddCardDialog() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (ctx) => GoodsAddCardDialog());
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;
  final double opacity;

  StickyTabBarDelegate({@required this.child, @required this.opacity});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Color.fromARGB((opacity * 255).toInt(), 255, 255, 255),
      child: this.child,
    );
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
