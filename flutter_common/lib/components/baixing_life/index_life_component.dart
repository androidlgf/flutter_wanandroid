import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/common/custom/shape/arc_circle.dart';
import 'package:flutter_common/common/custom/shape_of_view.dart';
import 'package:flutter_common/common/utils/route_util.dart';
import 'package:flutter_common/components/wanandroid/member/wanandroid_member_component.dart';
import 'package:flutter_common/components/wanandroid/search/wanandroid_search_component.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'cart/life_goods_cart_page.dart';
import 'category/life_category_page.dart';
import 'db/life_address_provider.dart';
import 'db/life_goods_provider.dart';
import 'home/life_home_page.dart';
import 'member/life_member_page.dart';

class IndexBxLifeComponent extends StatefulWidget {
  IndexBxLifeComponent({Key key}) : super(key: key) {}

  @override
  _IndexBxLifeComponentState createState() => _IndexBxLifeComponentState();
}

//BottomNavigationBar+IndexedStack 保持状态
class _IndexBxLifeComponentState extends State<IndexBxLifeComponent>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  int currentIndex = 0;

  List<Widget> listOfWidgetObjects = [];
  LifeGoodsProvider goodsProvider;
  LifeAddressProvider addressProvider;

  @override
  void initState() {
    super.initState();
    goodsProvider = LifeGoodsProvider();
    addressProvider = LifeAddressProvider();
    listOfWidgetObjects
      ..add(HomeBxLifePage(goodsProvider))
      ..add(CategoryBxLifePage(
        index: '${0}',
      ))
      ..add(CategoryBxLifePage(
        index: '${0}',
      ))
      ..add(LifeGoodsCardPage(
          provider: goodsProvider, addressProvider: addressProvider))
      ..add(MemberLifePage(goodsProvider));
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
//          leading: InkWell(
//            child: Icon(Icons.list),
//          ),
          title: Text('SIMPLY'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () =>
                    pushNewPage(context, SearchWanAndroidComponent()))
          ],
        ),
        drawer: Drawer(child: _buildDrawerWidget()),
        body: IndexedStack(
          index: currentIndex,
          children: listOfWidgetObjects,
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: changePage,
            type: BottomNavigationBarType.fixed,
            elevation: 8,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  activeIcon: Icon(Icons.home),
                  title: Container()),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border),
                  activeIcon: Icon(Icons.favorite_border),
                  title: Container()),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_shopping_cart),
                  activeIcon: Icon(Icons.add_shopping_cart),
                  title: Container()),
              BottomNavigationBarItem(
                  icon: Icon(Icons.assignment),
                  activeIcon: Icon(Icons.assignment),
                  title: Container()),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_box),
                  activeIcon: Icon(Icons.account_box),
                  title: Container()),
            ]));
  }

  Widget _buildDrawerWidget() {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(),
          flex: 3,
        ),
        Expanded(
          child: Container(
            color: red900Color,
            alignment: Alignment.bottomLeft,
            child: Stack(
              children: <Widget>[
                ShapeOfView(
                    elevation: 4,
                    shape: ArcCircleShape(
                        position: ArcCirclePosition.Left,
                        offset: ScreenUtil().setHeight(85.0)),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Container(
                          color: Color(0xE62A99BA),
                        ),
                      ],
                    )),
                ShapeOfView(
                    elevation: 4,
                    shape: ArcCircleShape(
                        position: ArcCirclePosition.Bottom,
                        offset: ScreenUtil().setHeight(85.0)),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Container(
                          color: Color(0xE6FF9966),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          flex: 1,
        )
      ],
    );
  }
}
