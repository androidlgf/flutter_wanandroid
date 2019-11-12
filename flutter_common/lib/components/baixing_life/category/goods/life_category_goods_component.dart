import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_common/api/api.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/components/baixing_life/category/goods/data/life_goods_category_data.dart';
import 'package:flutter_common/components/baixing_life/dio/life_http_post_dio.dart';
import 'package:flutter_common/components/baixing_life/goodsdetail/life_goods_detail_component.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

//百姓生活 分类商品展示
class CategoryGoodsBxLifeComponent extends StatefulWidget {
  final String categoryId;
  final String categorySubId;

  CategoryGoodsBxLifeComponent({Key key, this.categoryId, this.categorySubId})
      : assert(categoryId != null, categorySubId != null),
        super(key: key);

  @override
  _CategoryGoodsBxLifeComponentState createState() =>
      _CategoryGoodsBxLifeComponentState();
}

class _CategoryGoodsBxLifeComponentState
    extends State<CategoryGoodsBxLifeComponent>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  int _page = 0;
  EasyRefreshController _controller = EasyRefreshController();

  List<CategoryGoodsData> categoryGoodsData = [];

  @override
  void initState() {
    super.initState();
    _categoryGoods(_page);
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, title: Text('分类商品')),
      body: _buildBodyWidget(),
    );
  }

  Widget _buildBodyWidget() {
    if (categoryGoodsData == null) {
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
      color: Color(0xFFF5F6F8),
      child: EasyRefresh(
        header: MaterialHeader(),
        footer: MaterialFooter(),
        controller: _controller,
        onRefresh: () async {
          _controller.callRefresh();
        },
        onLoad: () async {
          _categoryGoods(_page);
        },
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemCount: categoryGoodsData.length,
          itemBuilder: (BuildContext context, int index) =>
              _buildItemWidget(categoryGoodsData[index], index),
          padding: EdgeInsets.symmetric(
              horizontal: Screen.wScreen16, vertical: Screen.wScreen16),
          staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
          mainAxisSpacing: Screen.wScreen8,
          crossAxisSpacing: Screen.wScreen8,
        ),
      ),
    );
  }

  Widget _buildItemWidget(CategoryGoodsData goods, int index) {
    return InkWell(
        onTap: () {
          pushNewPage(
              context,
              LifeGoodsDetailComponent(
                goodsId: '${goods.goodsId}',
              ));
        },
        //Hero
        child: Hero(
          tag: '${goods.image}',
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ImageLoadView(
                  '${goods.image}',
                  height: Screen.hScree170 + Random().nextInt(10),
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
                      '${goods.goodsName}',
                      maxLines: 1,
                      style: TextStyle(
                          color: Color(0xFF515C6F),
                          fontSize: Screen.spScreen12),
                    )),
                Padding(
                    padding: EdgeInsets.only(
                        left: Screen.wScreen10, right: Screen.wScreen10),
                    child: Text(
                      '￥' + '${goods.presentPrice}',
                      style: TextStyle(
                          color: Color(0xFF515C6F),
                          fontSize: Screen.spScreen10),
                    ))
              ],
            ),
          ),
        ));
  }

  //获取分类商品
  void _categoryGoods(int page) {
    ILifeHttpPostWork().start(url: Api.LIFE_GOODS_MALL, params: {
      'page': page,
      'categoryId': widget.categoryId,
      'categorySubId': widget.categorySubId
    }).then((onValue) {
      if (onValue.success) {
        categoryGoodsData.addAll(
            LifeGoodsCategoryData.fromJson(onValue.result)?.categoryGoodsData);
        setState(() {
          _controller.finishLoad(success: true, noMore: false);
        });
      } else {}
    });
  }
}
