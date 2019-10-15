import 'package:flutter/material.dart';
import 'package:flutter_common/api/api.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/common/utils/loading_util.dart';
import 'package:flutter_common/components/ibrand/dio/ibrand_http_get_dio.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'data/i_brand_goods_detail_data.dart';

//IBrad 商品详情
class GoodsDetailIBrandComponent extends StatefulWidget {
  final int goodsId;

  GoodsDetailIBrandComponent({Key key, this.goodsId = 0})
      : assert(goodsId != null),
        super(key: key);

  @override
  _GoodsDetailIBrandComponentState createState() =>
      _GoodsDetailIBrandComponentState();
}

class _GoodsDetailIBrandComponentState extends State<GoodsDetailIBrandComponent>
    with TickerProviderStateMixin {
  bool get wantKeepAlive => true;

  IBrandGoodsDetailData _iBrandGoodsDetailData;

  ScrollController scrollController = ScrollController();

  double navAlpha = 0.1;
  double headerHeight;
  List<Tab> titleTabs;
  TabController tabController;
  Color c = Colors.grey;

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
      appBar: AppBar(),
      body: _buildBodyWidget(),
    );
  }

  Widget _buildBodyWidget() {
    if (_iBrandGoodsDetailData == null) {
      return Container(
        color: Color(0xFF727C8E),
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
            _buildBannerWidget(_iBrandGoodsDetailData?.goodsDetailData?.img),
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

  Widget _buildBannerWidget(String bannerImage) {
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
          itemCount: 1,
          pagination: SwiperPagination(
              builder: SwiperPagination.fraction,
              alignment: Alignment.bottomRight),
          itemBuilder: (BuildContext context, int index) {
            return ImageLoadView(
              bannerImage,
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
    return SliverFillRemaining(
      child: TabBarView(children: [
        SingleChildScrollView(
//          physics: NeverScrollableScrollPhysics(),
          child: _buildGoodsDetailWidget(),
        ),
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
                        '${_iBrandGoodsDetailData.goodsDetailData.sellPrice}' +
                        '  ',
                    style: TextStyle(
                        color: Color(0xFFFF6969), fontSize: Screen.spScreen18),
                    children: <TextSpan>[
                  TextSpan(
                      text: '市场价:￥' +
                          '${_iBrandGoodsDetailData.goodsDetailData.marketPrice}',
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
                '${_iBrandGoodsDetailData.goodsDetailData.name}',
                maxLines: 2,
                style: TextStyle(
                    color: Color(0xFF3E3A3A), fontSize: Screen.spScreen15),
              )),
          Container(
            height: Screen.hScree40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconText(
                  icon: Icon(
                    Icons.thumb_up,
                    size: Screen.hScree12,
                    color: grey500Color,
                  ),
                  text: Text(
                    '点赞',
                    style: TextStyle(
                        color: grey500Color, fontSize: Screen.spScreen12),
                  ),
                  leading: Screen.wScreen5,
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
                            '${_iBrandGoodsDetailData.goodsDetailData.saleCount}',
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
              onTap: () {},
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
              onTap: () {},
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
            color: grey100Color,
            height: Screen.hScree8,
          ),
          Container(
            color: red900Color,
            height: 10000,
          ),
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
                  onTap: () {},
                  child: Container(
                    width: (DeviceUtil.width - Screen.wScreen30) / 3,
                    height: Screen.hScree40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Screen.hScree20),
                            bottomLeft: Radius.circular(Screen.hScree20)),
                        color: Colors.blue),
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
                        color: Colors.red),
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
    IBrandHttpGetWork()
        .start(url: Api.IbRAND_DETAIL + '${widget.goodsId}')
        .then((goodsDetail) {
      if (goodsDetail.success) {
        _iBrandGoodsDetailData =
            IBrandGoodsDetailData.fromJson(goodsDetail.result);
        setState(() {});
      }
    });
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
