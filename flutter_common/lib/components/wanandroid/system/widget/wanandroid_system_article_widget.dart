import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/common/ui/web_view.dart';
import 'package:flutter_common/components/wanandroid/dio/home_article_work.dart';
import 'package:flutter_common/components/wanandroid/dio/home_banner_work.dart';
import 'package:flutter_common/components/wanandroid/dio/home_system_article_work.dart';
import 'package:flutter_common/components/wanandroid/home/data/home_article_data.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

//玩android 体系文章详情
class HomeWanAndroidWidget extends StatefulWidget {
  final int cid;

  HomeWanAndroidWidget(this.cid, {Key key}) : super(key: key);

  @override
  _HomeWanAndroidWidgetState createState() =>
      _HomeWanAndroidWidgetState();
}

class _HomeWanAndroidWidgetState extends State<HomeWanAndroidWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  int _page = 0;
  HomeSystemArticleWork _articleWork;
  List<Datas> _listOfArticleData = [];

  @override
  void initState() {
    super.initState();
    loadMore();
  }

  @override
  void dispose() {
    super.dispose();
    _articleWork?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBodyWidget();
  }

  Widget _buildBodyWidget() {
    if (_listOfArticleData.length <= 0) {
      return Container(
        child: getLoadingWidget(),
      );
    }
    return Container(
      child: EasyRefresh(
          header: MaterialHeader(),
          footer: MaterialFooter(),
          onRefresh: () async {},
          onLoad: () async {
            _page++;
            loadMore();
          },
          child: CustomScrollView(
            shrinkWrap: true,
            slivers: <Widget>[_buildArticleWidget(_listOfArticleData)],
          )),
    );
  }

  Widget _buildArticleWidget(List<Datas> objs) {
    return SliverFixedExtentList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return _buildArticleItemWidget(objs[index], index);
        },
        childCount: objs?.length,
      ),
      itemExtent: 140,
    );
  }

  Widget _buildArticleItemWidget(Datas obj, int index) {
    return Material(
      child: InkWell(
          onTap: () {
            String link = obj.link;
            if (link.isEmpty) return;
            pushNewPage(
                context,
                WebViewPage(
                  url: link,
                  title: obj?.title,
                ));
          },
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                height: 130.0,
                padding: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.supervised_user_circle,
                              size: 30.0,
                              color: grey500Color,
                            ),
                            Text(
                              '${obj.author}',
                              style: TextStyle(color: grey500Color),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 20.0),
                              child: Icon(Icons.favorite_border,
                                  color: grey500Color),
                            ),
                            Icon(Icons.share, color: grey500Color)
                          ],
                        )
                      ],
                    ),
                    Text(
                      '${obj.title}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        RichText(
                            text: TextSpan(
                                text: '分类: ',
                                style: TextStyle(color: grey500Color),
                                children: <TextSpan>[
                              TextSpan(
                                  text: '${obj.superChapterName}',
                                  style: TextStyle(color: blue500Color)),
                              TextSpan(
                                  text: ' / ',
                                  style: TextStyle(color: blue500Color)),
                              TextSpan(
                                  text: '${obj.chapterName}',
                                  style: TextStyle(color: blue500Color))
                            ])),
                        Text(
                          '${obj.niceDate}',
                          style: TextStyle(color: grey500Color, fontSize: 12.0),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 10.0,
                color: grey300Color,
              )
            ],
          )),
    );
  }

  void loadMore() {
    _articleWork = HomeSystemArticleWork(_page, widget.cid);
    _articleWork.start().then((value) {
      if (value.success) {
        HomeArticleData homeArticleData = value.result;
        if (homeArticleData == null) return;
        ArticleData articleData = homeArticleData.articleData;
        if (articleData == null) return;
        _listOfArticleData.addAll(articleData.datas);
        setState(() {});
      }
    });
  }
}
