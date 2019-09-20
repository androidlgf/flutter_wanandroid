import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/common/global/provider_store.dart';
import 'package:flutter_common/common/provider/config_provider.dart';
import 'package:flutter_common/components/wanandroid/home/wanandroid_home_component.dart';
import 'package:flutter_common/components/wanandroid/system/widget/wanandroid_system_article_widget.dart';
import 'data/tree_data.dart';

////玩android 知识体系下的文章
class SystemArticleWanAndroidComponent extends StatefulWidget {
  final String title;
  final int cid;
  final int index;
  final List<Children> tabs;

  SystemArticleWanAndroidComponent(this.title,
      {Key key, this.cid = 0, this.index, this.tabs})
      : assert(cid != null),
        assert(tabs != null),
        assert(index != null),
        super(key: key);

  @override
  _SystemArticleWanAndroidComponentState createState() =>
      _SystemArticleWanAndroidComponentState();
}

class _SystemArticleWanAndroidComponentState
    extends State<SystemArticleWanAndroidComponent>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  PageController pageController;
  int currentIndex = -1;
  var isPageCanChanged = true;
  List<Widget> listOfPageWidget = [];

  @override
  void initState() {
    super.initState();
    widget.tabs.map((childTab) {
      listOfPageWidget.add(HomeWanAndroidWidget(childTab.id));
    }).toList();
    currentIndex = widget.index;
    pageController = new PageController(initialPage: currentIndex);
    tabController = TabController(
        length: widget.tabs.length, initialIndex: currentIndex, vsync: this);
    tabController.addListener(() {
      //TabBar的监听
      if (tabController.indexIsChanging) {
        //判断TabBar是否切换
        currentIndex = tabController.index;
        onPageChange(tabController.index, p: pageController);
      }
    });
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
    tabController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title}'),
        bottom: TabBar(
            isScrollable: true,
            controller: tabController,
            tabs: widget.tabs.map((childTab) {
              return Tab(text: '${childTab.name}');
            }).toList()),
      ),
      body: _buildBodyWidget(),
    );
  }

  Widget _buildBodyWidget() {
    return Column(
      children: <Widget>[
        Expanded(
          child: PageView.builder(
              itemCount: widget.tabs.length,
              controller: pageController,
              onPageChanged: (index) {
                if (isPageCanChanged) {
                  onPageChange(index);
                }
              },
              itemBuilder: (BuildContext context, int index) {
                return listOfPageWidget[index];
              }),
          flex: 1,
        )
      ],
    );
  }
}
