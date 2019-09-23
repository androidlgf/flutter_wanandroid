import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/common/utils/route_util.dart';
import 'package:flutter_common/components/wanandroid/home/wanandroid_home_component.dart';
import 'package:flutter_common/components/wanandroid/member/wanandroid_member_component.dart';
import 'package:flutter_common/components/wanandroid/project/wanandroid_project_component.dart';
import 'package:flutter_common/components/wanandroid/search/wanandroid_search_component.dart';
import 'package:flutter_common/components/wanandroid/system/wanandroid_system_component.dart';
import 'package:flutter_common/res/json_strings.dart';

import 'local_tab_data.dart';

class IndexWanAndroidComponent extends StatefulWidget {
  IndexWanAndroidComponent({Key key}) : super(key: key) {}

  @override
  _IndexWanAndroidComponentState createState() =>
      _IndexWanAndroidComponentState();
}

//BottomNavigationBar+IndexedStack 保持状态
class _IndexWanAndroidComponentState extends State<IndexWanAndroidComponent>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  int currentIndex = 0;

  List<Widget> listOfWidgetObjects = [];

  @override
  void initState() {
    super.initState();
    listOfWidgetObjects
      ..add(HomeWanAndroidComponent())
      ..add(SystemWanAndroidComponent())
      ..add(ProjectWanAndroidComponent())
      ..add(MemberWanAndroidComponent());
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localTabJson = json.decode(JsonStrings.wanAndroidTab);
    final localTabObjects = localTabJson.map((o) => LocalTabData.fromJson(o));
    final listOfLocalTabObjects = localTabObjects.toList();
    return Scaffold(
        appBar: AppBar(
          title: Text('${listOfLocalTabObjects[currentIndex].tab}'),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () =>
                    pushNewPage(context, SearchWanAndroidComponent())),
            PopupMenuButton(
                onSelected: (String value) {
                  debugPrint(value);
                },
                itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                      PopupMenuItem(value: "选项一的内容", child: new Text("网站导航")),
                      PopupMenuItem(value: "选项二的内容", child: new Text("登录")),
                      PopupMenuItem(value: "选项三的内容", child: new Text("我的主页"))
                    ])
          ],
        ),
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
                  title: Text(listOfLocalTabObjects[0].tab)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard),
                  activeIcon: Icon(Icons.dashboard),
                  title: Text(listOfLocalTabObjects[1].tab)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance_wallet),
                  activeIcon: Icon(Icons.account_balance_wallet),
                  title: Text(listOfLocalTabObjects[2].tab)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_box),
                  activeIcon: Icon(Icons.account_box),
                  title: Text(listOfLocalTabObjects[3].tab)),
            ]));
  }
}
