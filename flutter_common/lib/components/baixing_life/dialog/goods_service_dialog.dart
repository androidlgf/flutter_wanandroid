import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/res/json_strings.dart';

import 'data/goods_server_data.dart';

//商品基础服务Dialog
class GoodsServiceDialog extends StatefulWidget {
  @override
  _GoodsServiceDialogState createState() => _GoodsServiceDialogState();
}

class _GoodsServiceDialogState extends State<GoodsServiceDialog> {
  @override
  Widget build(BuildContext context) {
    final localServiceJson = json.decode(JsonStrings.lifeGoodsServerData);
    final localServiceObjects =
        localServiceJson.map((o) => GoodsServerData.fromJson(o));
    final listOfLocalServiceObjects = localServiceObjects.toList();

    return GestureDetector(
//      onTap: () => Navigator.pop(context), //关闭对话框
      child: Material(
        type: MaterialType.transparency, //创建透明层
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
        child: InkWell(
//            onTap: () => Navigator.pop(context),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 30.0,
                  width: double.infinity,
                  color: Colors.black54,
                ),
                Container(
                    height: DeviceUtil.height * 0.7,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Screen.wScreen10),
                          topRight: Radius.circular(Screen.wScreen10),
                        ))),
                Container(
                  height: DeviceUtil.height * 0.7,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      _buildTitleWidget(),
                      _buildBodyItemWidget(listOfLocalServiceObjects[0], 0),
                      _buildBodyItemWidget(listOfLocalServiceObjects[1], 1),
                      _buildBodyItemWidget(listOfLocalServiceObjects[2], 2),
                      _buildBodyItemWidget(listOfLocalServiceObjects[3], 3),
                      _buildBodyItemWidget(listOfLocalServiceObjects[4], 4)
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget _buildTitleWidget() {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(vertical: Screen.hScree15),
        child: Text('天猫基础保障',
            style: TextStyle(
                color: Color(0xFF3E3A3A),
                fontSize: Screen.spScreen18,
                fontWeight: FontWeight.w900)));
  }

  Widget _buildBodyWidget(List listOfObj) {
    return ListView.separated(
      itemBuilder: (BuildContext context, index) {
        return _buildBodyItemWidget(listOfObj[index], index);
      },
      separatorBuilder: (BuildContext context, index) {
        return Container(
          height: 10.0,
          color: grey300Color,
        );
      },
      itemCount: listOfObj?.length,
      physics: NeverScrollableScrollPhysics(),
    );
  }

  Widget _buildBodyItemWidget(obj, int index) {
    return Padding(
      padding: EdgeInsets.only(
          left: Screen.wScreen10,
          right: Screen.wScreen10,
          top: Screen.wScreen15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.collections_bookmark,
                size: Screen.wScreen15,
                color: deepOrange800Color,
              ),
              SizedBox(width: Screen.wScreen10),
              Text(
                '${obj.title}',
                style: TextStyle(
                    color: Color(0xFF3E3A3A),
                    fontSize: Screen.spScreen15,
                    fontWeight: FontWeight.w900),
              )
            ],
          ),
          Padding(
            padding:
                EdgeInsets.only(left: Screen.wScreen25, top: Screen.wScreen5),
            child: Text(
              '${obj.content}',
              style:
                  TextStyle(color: grey500Color, fontSize: Screen.spScreen12),
            ),
          )
        ],
      ),
    );
  }
}
