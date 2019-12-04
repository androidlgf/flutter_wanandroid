import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/res/json_strings.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'data/address_tag_data.dart';
import 'data/goods_server_data.dart';

//地址标签选择
class AddressTagDialog extends StatefulWidget {
  final Function onTap;
  final double height;
  final int index;

  const AddressTagDialog(
      {Key key, @required this.height, this.index = 0, this.onTap})
      : super(key: key);

  @override
  State createState() => _AddressTagState();
}

class _AddressTagState extends State<AddressTagDialog> {
  int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    final localAddressJson = json.decode(JsonStrings.lifeAddressTagJson);
    final localAddressObjects =
        localAddressJson.map((o) => AddressTagData.fromJson(o));
    final listOfLocalAddressObjects = localAddressObjects.toList();
    return Material(
      type: MaterialType.transparency, //创建透明层
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
      child: InkWell(
          child: Stack(
        children: <Widget>[
          Container(
            height: 30.0,
            width: double.infinity,
            color: Colors.black54,
          ),
          Container(
              height: widget.height == null
                  ? DeviceUtil.height * 0.5
                  : widget.height,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Screen.wScreen10),
                    topRight: Radius.circular(Screen.wScreen10),
                  ))),
          Container(
            height:
                widget.height == null ? DeviceUtil.height * 0.5 : widget.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: Screen.hScree40,
                  child: Text('选择地址标签',
                      style: TextStyle(
                          color: grey900Color, fontSize: Screen.spScreen14)),
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: listOfLocalAddressObjects.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _buildBodyItemWidget(
                          listOfLocalAddressObjects[index], index);
                    }),
                _buildBodyBottomButton(listOfLocalAddressObjects),
              ],
            ),
          )
        ],
      )),
    );
  }

  Widget _buildBodyItemWidget(obj, index) {
    return InkWell(
      onTap: () {
        _index = index;
        setState(() {});
      },
      child: Container(
        height: Screen.hScree50,
        padding:
            EdgeInsets.only(left: Screen.wScreen10, right: Screen.wScreen20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  '${obj.path}',
                  width: Screen.hScree25,
                  height: Screen.hScree25,
                ),
                Gaps.hGap10,
                Text('${obj.title}',
                    style: TextStyle(
                        color: grey900Color, fontSize: Screen.spScreen14)),
              ],
            ),
            Offstage(
              offstage: _index != index,
              child: Icon(
                Icons.check,
                size: Screen.hScree15,
                color: Colors.deepOrange,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBodyBottomButton(obj) {
    return InkWell(
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap(obj[_index]);
        }
        Navigator.pop(context);
      },
      child: Container(
        width: DeviceUtil.width,
        height: Screen.hScree40,
        margin: EdgeInsets.only(
            top: Screen.hScree30,
            left: Screen.wScreen10,
            right: Screen.wScreen10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.orange, Colors.deepOrange]),
          //设置四周圆角 角度
          borderRadius: BorderRadius.all(Radius.circular(Screen.hScree25)),
        ),
        child: Text('完成',
            style: TextStyle(color: Colors.white, fontSize: Screen.spScreen16)),
      ),
    );
  }
}
