import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/common/common_index.dart';

//添加商品购物车Dialog
class GoodsAddCardDialog extends StatefulWidget {
  @override
  _GoodsAddCardDialogState createState() => _GoodsAddCardDialogState();
}

class _GoodsAddCardDialogState extends State<GoodsAddCardDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
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
              children: <Widget>[],
            ),
          )
        ],
      )),
    );
  }
}
