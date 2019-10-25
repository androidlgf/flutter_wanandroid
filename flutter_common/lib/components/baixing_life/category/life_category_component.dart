import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_common/api/api.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/components/baixing_life/category/data/life_goods_category_data.dart';
import 'package:flutter_common/components/baixing_life/dio/life_http_post_dio.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

//百姓生活 分类页面
class CategoryBxLifeComponent extends StatefulWidget {
  final String mallCategoryId;
  final String title;

  CategoryBxLifeComponent({Key key, this.title, this.mallCategoryId})
      : assert(mallCategoryId != null, title != null),
        super(key: key);

  @override
  _CategoryBxLifeComponentState createState() =>
      _CategoryBxLifeComponentState();
}

class _CategoryBxLifeComponentState extends State<CategoryBxLifeComponent>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  LifeGoodsCategoryData _lifeGoodsCategoryData;

  int leftCurIndex = 0;

  AutoScrollController controller;

  @override
  void initState() {
    super.initState();
    controller = AutoScrollController();
    _categoryGoodsData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text(widget.title == null ? '商品分类' : widget.title)),
      body: _buildBodyWidget(),
    );
  }

  Widget _buildBodyWidget() {
    if (_lifeGoodsCategoryData == null) {
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
      child: Row(
        children: <Widget>[
          Expanded(
            child: _leftListWidget(_lifeGoodsCategoryData?.categoryData),
            flex: 3,
          ),
          Expanded(
            child: _rightListWidget(_lifeGoodsCategoryData?.categoryData),
            flex: 7,
          )
        ],
      ),
    );
  }

  Widget _leftListWidget(List<CategoryData> categoryData) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 0);
        },
        itemBuilder: (BuildContext context, int index) {
          return _buildLeftItemWidget(categoryData[index], index);
        },
        padding: EdgeInsets.symmetric(vertical: Screen.hScree25),
        itemCount: categoryData?.length);
  }

  Widget _rightListWidget(List<CategoryData> categoryData) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: Screen.hScree60);
        },
        itemBuilder: (BuildContext context, int index) {
          return _buildRightItemWidget(categoryData[index], index);
        },
        padding: EdgeInsets.only(
            right: Screen.wScreen25,
            top: Screen.hScree25,
            bottom: Screen.hScree25),
        controller: controller,
        itemCount: categoryData?.length);
  }

  Widget _buildLeftItemWidget(CategoryData categoryData, int index) {
    return InkWell(
      onTap: () {
        leftCurIndex = index;
        controller.scrollToIndex(leftCurIndex,
            preferPosition: AutoScrollPosition.begin);
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: Screen.wScreen25, vertical: Screen.hScree15),
        child: Column(
          children: <Widget>[
            ImageLoadView(
              '${categoryData.image}',
              borderRadius: BorderRadius.all(Radius.circular(Screen.hScree30)),
            ),
            Text(
              '${categoryData.mallCategoryName}',
              style: TextStyle(
                  color: leftCurIndex == index
                      ? Color(0xFFFF6969)
                      : Color(0xFF515C6F),
                  fontSize: Screen.spScreen15),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRightItemWidget(CategoryData categoryData, int index) {
    List<BxMallSubDto> listOfSubDto = categoryData.bxMallSubDto;
    return AutoScrollTag(
        controller: controller,
        index: index,
        child: InkWell(
          onTap: () {},
          child: Container(
            height: (Screen.hScree38 + 1) * listOfSubDto.length,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.all(Radius.circular(Screen.wScreen10))),
            child: _buildRightItemBodyWidget(listOfSubDto),
          ),
        ));
  }

  Widget _buildRightItemBodyWidget(List<BxMallSubDto> listOfSubDto) {
    return ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            height: 0.5,
            color: Color(0xFFE7EAF0),
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {},
            child: Container(
              height: Screen.hScree38 + 0.5,
              padding: EdgeInsets.symmetric(horizontal: Screen.wScreen15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '${listOfSubDto[index].mallSubName}',
                    style: TextStyle(
                        color: Color(0xFF515C6F), fontSize: Screen.spScreen15),
                  ),
                  Icon(Icons.keyboard_arrow_right,
                      size: Screen.wScreen18, color: Color(0xFF727C8E))
                ],
              ),
            ),
          );
        },
        physics: NeverScrollableScrollPhysics(),
        itemCount: listOfSubDto?.length);
  }

  //获取热销商品
  void _categoryGoodsData() {
    ILifeHttpPostWork().start(url: Api.LIFE_GOODS_CATEGORY).then((onValue) {
      if (onValue.success) {
        _lifeGoodsCategoryData = LifeGoodsCategoryData.fromJson(onValue.result);
        setState(() {});
      } else {}
    });
  }
}
