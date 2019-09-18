import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/components/wanandroid/home/wanandroid_home_component.dart';
import 'package:flutter_common/components/wanandroid/member/wanandroid_member_component.dart';
import 'package:flutter_common/components/wanandroid/project/wanandroid_project_component.dart';
import 'package:flutter_common/components/wanandroid/system/wanandroid_system_component.dart';
import 'package:flutter_common/res/json_strings.dart';

import 'local_tab_data.dart';

class IndexWanAndroidComponent extends StatefulWidget {
  @override
  _IndexWanAndroidComponentState createState() =>
      _IndexWanAndroidComponentState();
}

class _IndexWanAndroidComponentState extends State<IndexWanAndroidComponent>
    with SingleTickerProviderStateMixin {
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
        ),
        body: listOfWidgetObjects[currentIndex],
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
