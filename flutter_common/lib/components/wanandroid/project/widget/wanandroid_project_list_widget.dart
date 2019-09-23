//4.2 项目列表数据
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/common/ui/web_view.dart';
import 'package:flutter_common/components/wanandroid/dio/home_project_list_work.dart';
import 'package:flutter_common/components/wanandroid/project/data/project_list_of_data.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_easyrefresh/material_footer.dart';
import 'package:flutter_easyrefresh/material_header.dart';

class ProjectListWanAndroidWidget extends StatefulWidget {
  final int cid;

  ProjectListWanAndroidWidget(
    this.cid, {
    Key key,
  }) : super(key: key);

  @override
  _ProjectListWanAndroidWidgetState createState() =>
      _ProjectListWanAndroidWidgetState();
}

class _ProjectListWanAndroidWidgetState
    extends State<ProjectListWanAndroidWidget> {
  List<ProjectDatas> _listOfProject = [];
  int _page = 1;

  @override
  void initState() {
    super.initState();
    loadMore();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBodyWidget();
  }

  Widget _buildBodyWidget() {
    if (_listOfProject.length <= 0) {
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
      child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return _buildBodyItemWidget(_listOfProject[index], index);
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              height: 0.6,
            );
          },
          padding: EdgeInsets.all(0.0),
          itemCount: _listOfProject.length),
    ));
  }

  Widget _buildBodyItemWidget(ProjectDatas obj, int index) {
    return Material(
      color: Colors.white,
      child: InkWell(
          onTap: () {
            pushNewPage(
                context,
                WebViewPage(
                  url: '${obj.projectLink}',
                  title: '${obj.title}',
                ));
          },
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: DeviceUtil.width/4*1.5+20.0,
                    padding: EdgeInsets.only(right: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${obj.title}',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text('${obj.desc}',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: grey500Color)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('${obj.author}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: grey500Color)),
                            Text('${obj.niceDate}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(color: grey500Color))
                          ],
                        )
                      ],
                    ),
                  ),
                  flex: 3,
                ),
                Expanded(
                  child: ImageLoadView('${obj.envelopePic}',height:DeviceUtil.width/4*1.5+20.0,),
                  flex: 1,
                )
              ],
            ),
          )),
    );
  }

  void loadMore() {
    HomeProjectListWork(_page, widget.cid).start().then((value) {
      if (value.success) {
        _listOfProject.addAll(value.result.projectListData.projectDatas);
        setState(() {});
      }
    });
  }
}
