import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/common/common_index.dart';

//商品品牌Dialog
class GoodsBrandDialog extends StatefulWidget {
  @override
  _GoodsBrandDialogState createState() => _GoodsBrandDialogState();
}

class _GoodsBrandDialogState extends State<GoodsBrandDialog> {
  @override
  Widget build(BuildContext context) {
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
                children: <Widget>[],
              ),
            )
          ],
        )),
      ),
    );
  }
}
