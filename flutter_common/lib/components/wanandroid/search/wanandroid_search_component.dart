import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/api/api.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/components/wanandroid/dio/wanandroid_http_get_dio.dart';
import 'data/search_hot_model.dart';

//7.1 搜索页面
class SearchWanAndroidComponent extends StatefulWidget {
  @override
  _SearchWanAndroidComponentState createState() =>
      _SearchWanAndroidComponentState();
}

class _SearchWanAndroidComponentState extends State<SearchWanAndroidComponent> {
  WanAndroidHttpGetWork _searchHotWork;
  List<SearchData> _listOfSearchModel = [];

  @override
  void initState() {
    super.initState();
    loadSearchHotData();
  }

  @override
  void dispose() {
    super.dispose();
    _searchHotWork?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBodyWidget(),
    );
  }

  Widget _buildBodyWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SearchBar(
          hintText: '请输入搜索内容',
          backgroundColor: Color(Store.value<ConfigProvider>(context).theme),
        ),
        Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('热门搜索', style: TextStyle(color: blue300Color))),
        Container(
          alignment: Alignment.topLeft,
          child: Wrap(
            children: _listOfSearchModel.map((searchModel) {
              return InkWell(
                onTap: () {
//                  pushNewPage(
//                      context,
//                      SystemArticleWanAndroidComponent(
//                        '${obj.name}',
//                        tabs: obj.children,
//                        index: obj.children.indexOf(childrenObj),
//                      ));
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),
                  child: Text('${searchModel.name}'),
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }

  void loadSearchHotData() {
    if (_searchHotWork == null) _searchHotWork = new WanAndroidHttpGetWork();
    _searchHotWork.start(url: Api.WAN_SEARCH_HOT).then((value) {
      if (value.success) {
        _listOfSearchModel
            .addAll(SearchHotModel.fromJson(value.result).searchData);
        setState(() {});
      }
    });
  }
}
