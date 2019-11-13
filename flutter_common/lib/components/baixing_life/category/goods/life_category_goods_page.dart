import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common/api/api.dart';
import 'package:flutter_common/common/blocs/bloc_common.dart';
import 'package:flutter_common/common/blocs/bloc_event.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/common/blocs/bloc_widget.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/components/baixing_life/category/goods/data/life_goods_category_data.dart';
import 'package:flutter_common/components/baixing_life/dio/life_http_post_dio.dart';
import 'package:flutter_common/components/baixing_life/goodsdetail/life_goods_detail_page.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

//百姓生活 分类商品展示
class CategoryGoodsBxLifePage extends StatelessWidget {
  final String categoryId;
  final String categorySubId;

  CategoryGoodsBxLifePage({Key key, this.categoryId, this.categorySubId})
      : assert(categoryId != null, categorySubId != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, title: Text('分类商品')),
      body: BlocProvider(
          builder: (BuildContext context) {
            return BlocCommon(httpWork: ILifeHttpPostWork());
          },
          child: CategoryGoodsBxLifeWidget(
            categoryId: this.categoryId,
            categorySubId: this.categorySubId,
          )),
    );
  }
}

class CategoryGoodsBxLifeWidget extends StatefulWidget {
  final String categoryId;
  final String categorySubId;

  CategoryGoodsBxLifeWidget({Key key, this.categoryId, this.categorySubId})
      : assert(categoryId != null, categorySubId != null),
        super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CategoryGoodsBxLifeWidgetState();
  }
}

class _CategoryGoodsBxLifeWidgetState extends State<CategoryGoodsBxLifeWidget> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<BlocCommon>(context)
        .add(BlocHttpEvent(url: Api.LIFE_GOODS_MALL, params: {
      'page': 0,
      'categoryId': widget.categoryId,
      'categorySubId': widget.categorySubId
    }));
  }

  @override
  Widget build(BuildContext context) {
    return BlocWidget<BlocCommon>(
      builder: BlocBuilder<BlocCommon, BlocState>(builder: (context, state) {
        if (state is BlocSuccess) {
          List<CategoryGoodsData> categoryGoodsData =
              LifeGoodsCategoryData.fromJson(state?.response)
                  ?.categoryGoodsData;
          return Container(
            color: Color(0xFFF5F6F8),
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
          );
        }
        return Container();
      }),
    );
  }

  Widget _buildItemWidget(CategoryGoodsData goods, int index) {
    return InkWell(
        onTap: () {
          pushNewPage(
              context,
              LifeGoodsDetailPage(
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
}
