import 'package:expandable/expandable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/common/res/colors.dart';
import 'package:flutter_common/components/wanandroid/dio/home_system_work.dart';

import 'data/tree_data.dart';

////玩android 体系
class SystemWanAndroidComponent extends StatefulWidget {
  @override
  _SystemWanAndroidComponentState createState() =>
      _SystemWanAndroidComponentState();
}

class _SystemWanAndroidComponentState extends State<SystemWanAndroidComponent> {
  HomeSystemWork _systemWork;
  TreeData _systemData;

  @override
  void initState() {
    super.initState();
    getSystemData();
  }

  @override
  void dispose() {
    super.dispose();
    _systemWork?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return _buildBodyWidget();
  }

  Widget _buildBodyWidget() {
    if (_systemData == null) {
      return Container();
    }
    return ListView.separated(
        itemBuilder: (BuildContext context, index) {
          return _buildBodyItemWidget(_systemData.systemData[index], index);
        },
        separatorBuilder: (BuildContext context, index) {
          return Container(
            height: 10.0,
            color: grey300Color,
          );
        },
        itemCount: _systemData.systemData.length);
  }

  Widget _buildBodyItemWidget(SystemData obj, int index) {
    return Material(
      child: ExpandablePanel(
          hasIcon: false,
          tapHeaderToExpand: true,
          tapBodyToCollapse: true,
          header: Container(
            alignment: Alignment.centerLeft,
            height: 50.0,
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text('${obj.name}'),
                  flex: 3,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        '${obj.children.length}' + '分类  ',
                        style: TextStyle(color: blue500Color, fontSize: 12.0),
                      ),
                      Icon(Icons.list)
                    ],
                  ),
                  flex: 1,
                ),
              ],
            ),
          ),
          expanded: Container(
            alignment: Alignment.topLeft,
            child: Wrap(
              textDirection: TextDirection.ltr,
              children: obj.children.map((childrenObj) {
                return InkWell(
                  onTap: () {},
                  child: Padding(padding: EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 15.0, bottom: 15.0),child: Text('${childrenObj.name}'),),
                );
              }).toList(),
            ),
          )),
    );
  }

  void getSystemData() {
    if (_systemWork == null) _systemWork = HomeSystemWork();
    _systemWork.start().then((value) {
      if (value.success) {
        _systemData = value.result;
        setState(() {});
      }
    });
  }
}
