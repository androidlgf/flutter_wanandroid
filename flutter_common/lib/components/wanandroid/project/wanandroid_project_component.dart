import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/api/api.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/common/utils/loading_util.dart';
import 'package:flutter_common/components/wanandroid/dio/wanandroid_http_get_dio.dart';
import 'package:flutter_common/components/wanandroid/project/widget/wanandroid_project_list_widget.dart';

import 'data/project_tab_data.dart';

////玩android 项目
class ProjectWanAndroidComponent extends StatefulWidget {
  @override
  _ProjectWanAndroidComponentState createState() =>
      _ProjectWanAndroidComponentState();
}

class _ProjectWanAndroidComponentState extends State<ProjectWanAndroidComponent>
    with SingleTickerProviderStateMixin {
  List<ProjectData> _listOfProjectTab = [];
  List<Widget> _listOfPageWidget = [];
  WanAndroidHttpGetWork _projectTabWork;

  TabController tabController;
  PageController pageController;
  int currentIndex = 0;
  var isPageCanChanged = true;

  @override
  void initState() {
    super.initState();
    loadProjectTabData();
  }

  onPageChange(int index, {PageController p, TabController t}) async {
    if (p != null) {
      //判断是哪一个切换
      isPageCanChanged = false;
      await pageController.animateToPage(index,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease); //等待pageview切换完毕,再释放pageivew监听
      isPageCanChanged = true;
    } else {
      tabController.animateTo(index); //切换Tabbar
    }
  }

  @override
  void dispose() {
    super.dispose();
    _projectTabWork?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBodyWidget();
  }

  Widget _buildBodyWidget() {
    if (_listOfProjectTab.length <= 0) {
      return Container(
        child: getLoadingWidget(),
      );
    }
    return Column(
      children: <Widget>[
        Material(
          color: Color(
            Store.value<ConfigProvider>(context).theme,
          ),
          child: TabBar(
              isScrollable: true,
              controller: tabController,
              tabs: _listOfProjectTab.map((childTab) {
                return Tab(text: '${childTab.name}');
              }).toList()),
        ),
        Expanded(
          child: PageView.builder(
              itemCount: _listOfProjectTab.length,
              controller: pageController,
              onPageChanged: (index) {
                if (isPageCanChanged) {
                  onPageChange(index);
                }
              },
              itemBuilder: (BuildContext context, int index) {
                return _listOfPageWidget[index];
              }),
          flex: 1,
        )
      ],
    );
  }

  void loadProjectTabData() async{
    if (_projectTabWork == null) _projectTabWork = new WanAndroidHttpGetWork();
    _projectTabWork.start(url: Api.WAN_PROJECT).then((value) {
      if (value.success) {
        _listOfProjectTab
            .addAll(ProjectTabData.fromJson(value.result).projectData);
        _listOfProjectTab.map((childTab) {
          _listOfPageWidget.add(ProjectListWanAndroidWidget(childTab.id));
        }).toList();
        pageController = new PageController(initialPage: currentIndex);
        tabController = TabController(
            length: _listOfProjectTab.length,
            initialIndex: currentIndex,
            vsync: this);
        tabController.addListener(() {
          //TabBar的监听
          if (tabController.indexIsChanging) {
            //判断TabBar是否切换
            currentIndex = tabController.index;
            onPageChange(tabController.index, p: pageController);
          }
        });
        setState(() {});
      }
    });
  }
}
