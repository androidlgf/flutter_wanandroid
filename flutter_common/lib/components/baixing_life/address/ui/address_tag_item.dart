import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/common/res/colors.dart';
import 'package:flutter_common/common/res/styles.dart';
import 'package:flutter_common/components/baixing_life/dialog/address_tag_dialog.dart';
import 'package:flutter_common/components/baixing_life/dialog/data/address_tag_data.dart';

enum AddressTagState { Custom, Home, Company, School }

class AddressTagItem extends StatefulWidget {
  final String text;
  final double height;
  final AddressTagState state;
  final Function onTap;
  final AddressTagData value;

  const AddressTagItem(
      {Key key,
      @required this.text,
      this.height,
      this.state = AddressTagState.Custom,
      this.onTap,
      this.value})
      : super(key: key);

  @override
  State createState() => _AddressTagItemState();
}

class _AddressTagItemState extends State<AddressTagItem> {
  AddressTagData _value;
  int _index;
  List<String> _listOfTag = ['更多', '家', '公司', '学校'];

  @override
  void initState() {
    super.initState();
    if (_value == null) {
      _value = widget.value;
    }
    _index = widget.state.index;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height == null ? Screen.hScree45 : widget.height,
      padding: EdgeInsets.symmetric(horizontal: Screen.wScreen10),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(widget.text == null ? '' : widget.text,
              style:
                  TextStyle(color: grey900Color, fontSize: Screen.spScreen14)),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(left: Screen.wScreen50),
                  child: _buildBodyWidget(_value)))
        ],
      ),
    );
  }

  Widget _buildBodyWidget(AddressTagData tagData) {
    if (tagData == null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          _buildItemTagWidget(context, _listOfTag[AddressTagState.Home.index],
              AddressTagState.Home.index),
          _buildItemTagWidget(
              context,
              _listOfTag[AddressTagState.Company.index],
              AddressTagState.Company.index),
          _buildItemTagWidget(context, _listOfTag[AddressTagState.School.index],
              AddressTagState.School.index),
          _buildMoreWidget(context, _listOfTag[AddressTagState.Custom.index],
              AddressTagState.Custom.index),
        ],
      );
    }
    return InkWell(
      onTap: () => showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (ctx) => AddressTagDialog(
                index: _index,
                onTap: (value) {
                  setState(() {
                    _value = value;
                    if (widget.onTap != null) {
                      widget.onTap(_value);
                    }
                  });
                },
              )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Image.asset(
            '${tagData.path}',
            width: Screen.hScree25,
            height: Screen.hScree25,
          ),
          Gaps.hGap10,
          Icon(
            Icons.arrow_forward_ios,
            size: Screen.wScreen12,
            color: grey500Color,
          ),
        ],
      ),
    );
  }

  Widget _buildItemTagWidget(context, obj, index) {
    return InkWell(
      onTap: () => showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (ctx) => AddressTagDialog(
                index: index,
                onTap: (value) {
                  setState(() {
                    _value = value;
                    _index = index;
                    if (widget.onTap != null) {
                      widget.onTap(_value);
                    }
                  });
                },
              )),
      child: Container(
        width: Screen.wScreen50,
        height: Screen.hScree22,
        alignment: Alignment.center,
        //边框设置
        decoration: new BoxDecoration(
          //背景
          color: Colors.white,
          //设置四周圆角 角度
          borderRadius: BorderRadius.all(Radius.circular(Screen.hScree11)),
          //设置四周边框
          border: new Border.all(width: 1, color: grey500Color),
        ),
        child: Text(obj,
            style: TextStyle(color: grey500Color, fontSize: Screen.spScreen14)),
      ),
    );
  }

  Widget _buildMoreWidget(context, obj, index) {
    return InkWell(
      onTap: () => showModalBottomSheet(
          isScrollControlled: true,
          context: context,
          builder: (ctx) => AddressTagDialog(
                index: index,
                onTap: (value) {
                  _value = value;
                  _index = index;
                  if (widget.onTap != null) {
                    widget.onTap(_value);
                  }
                  setState(() {});
                },
              )),
      child: Container(
        width: Screen.wScreen50,
        height: Screen.hScree22,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(obj,
                style: TextStyle(
                    color: grey500Color, fontSize: Screen.spScreen14)),
            Icon(
              Icons.arrow_forward_ios,
              size: Screen.wScreen12,
              color: grey500Color,
            ),
          ],
        ),
      ),
    );
  }
}
