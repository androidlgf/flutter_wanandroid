import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/components/baixing_life/db/life_goods_provider.dart';

///我的购物地址列表
class LifeShippingAddressForm extends StatefulWidget {
  final LifeGoodsProvider provider;
  final LifeGoodsProvider addressProvider;
  LifeShippingAddressForm({Key key, this.provider,this.addressProvider})
      : assert(provider != null),
        super(key: key);

  @override
  State createState() => _LifeSettlementFormState();
}

class _LifeSettlementFormState extends State<LifeShippingAddressForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _buildAddressWidget(),
                    _buildGoodsItemWidget()
                  ],
                ),
              ),
            ),
            _buildBottomSubmitOrderWidget()
          ],
        ));
  }

  Widget _buildAddressWidget() {
    return InkWell(
      onTap: () => null,
      child: Container(
        margin: EdgeInsets.all(Screen.wScreen10),
        height: Screen.hScree100,
        //边框设置
        decoration: new BoxDecoration(
          //背景
          color: Colors.white,
          //设置四周圆角 角度
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          //设置四周边框
          border: new Border.all(width: 0, color: Colors.white),
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: Screen.wScreen10),
              width: Screen.wScreen30,
              height: Screen.wScreen30,
              //边框设置
              decoration: new BoxDecoration(
                //背景
                color: deepOrange300Color,
                //设置四周圆角 角度
                borderRadius:
                    BorderRadius.all(Radius.circular(Screen.wScreen15)),
                //设置四周边框
                border: new Border.all(width: 0, color: deepOrange300Color),
              ),
              child: Icon(
                Icons.location_on,
                size: Screen.wScreen20,
                color: Colors.white,
              ),
            ),
            Container(
              width: Screen.wScreen280,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RichText(
                      text: TextSpan(
                          text: '刘先生',
                          style: TextStyle(
                              color: grey1000Color,
                              fontSize: Screen.spScreen16),
                          children: <TextSpan>[
                        TextSpan(text: '    '),
                        TextSpan(
                            text: '17602177793',
                            style: TextStyle(
                                color: grey500Color,
                                fontSize: Screen.spScreen12))
                      ])),
                  Text('上海市浦东新区三林镇杨思路1201东方吉苑22号1304室',
                      style: TextStyle(
                          color: grey900Color, fontSize: Screen.spScreen12),
                      maxLines: 2),
                  Text('收货不方便时,可选择免费暂存服务',
                      style: TextStyle(
                          color: deepOrange300Color,
                          fontSize: Screen.spScreen12)),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios,
                size: Screen.wScreen15, color: grey400Color),
          ],
        ),
      ),
    );
  }

  Widget _buildGoodsItemWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Screen.wScreen10),
      padding: EdgeInsets.symmetric(horizontal: Screen.wScreen10),
      height: Screen.wScreen355,
      //边框设置
      decoration: new BoxDecoration(
        //背景
        color: Colors.white,
        //设置四周圆角 角度
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        //设置四周边框
        border: new Border.all(width: 0, color: Colors.white),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            height: Screen.wScreen35,
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.shopping_basket,
                  color: deepOrange300Color,
                  size: Screen.wScreen15,
                ),
                SizedBox(width: Screen.wScreen10),
                Text('优衣库旗舰店',
                    style: TextStyle(
                        color: grey900Color, fontSize: Screen.spScreen14),
                    maxLines: 1),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: Screen.wScreen10),
            height: Screen.wScreen100,
            child: Row(
              children: <Widget>[
                ImageLoadView(
                  'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1575296473002&di=d6b4b5b283f3b005374e75078cee7411&imgtype=0&src=http%3A%2F%2Fpic45.nipic.com%2F20140715%2F10657291_172631119640_2.jpg',
                  width: Screen.wScreen80,
                  height: Screen.wScreen80,
                ),
                Container(
                  padding: EdgeInsets.only(left: Screen.wScreen10),
                  width: Screen.wScreen210,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('大码女装胖妹妹mm羊羔毛外套秋冬2019新款宽松显瘦网红千鸟格外套',
                          style: TextStyle(
                              color: grey900Color, fontSize: Screen.spScreen14),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      Text('七天无理由退换',
                          style: TextStyle(
                              color: deepOrange300Color,
                              fontSize: Screen.spScreen14),
                          maxLines: 1),
                    ],
                  ),
                ),
                Container(
                  width: Screen.wScreen45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text('¥199.00',
                          style: TextStyle(
                              color: grey900Color, fontSize: Screen.spScreen14),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      Padding(
                        padding: EdgeInsets.only(top: Screen.hScree5),
                        child: Text('x1',
                            style: TextStyle(
                                color: grey500Color,
                                fontSize: Screen.spScreen12),
                            maxLines: 1),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: Screen.wScreen220,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: Screen.wScreen25),
                  height: Screen.wScreen44,
                  child: Row(
                    children: <Widget>[
                      Text('配送方式',
                          style: TextStyle(
                              color: grey900Color, fontSize: Screen.spScreen14),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      Padding(
                        padding: EdgeInsets.only(left: Screen.wScreen10),
                        child: Text('普通配送',
                            style: TextStyle(
                                color: grey500Color,
                                fontSize: Screen.spScreen14),
                            maxLines: 1),
                      ),
                      Expanded(
                          child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text('快递 免邮',
                                style: TextStyle(
                                    color: grey900Color,
                                    fontSize: Screen.spScreen14),
                                maxLines: 1),
                            SizedBox(
                              width: Screen.wScreen10,
                            ),
                            Icon(Icons.arrow_forward_ios,
                                size: Screen.hScree14, color: grey400Color)
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: Screen.wScreen20),
                  height: Screen.wScreen44,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.error_outline,
                          size: Screen.wScreen14, color: grey400Color),
                      SizedBox(
                        width: Screen.wScreen5,
                      ),
                      Text('运费险',
                          style: TextStyle(
                              color: grey900Color, fontSize: Screen.spScreen14),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      Padding(
                        padding: EdgeInsets.only(left: Screen.wScreen10),
                        child: Text('卖家赠送，退换货可赔',
                            style: TextStyle(
                                color: grey500Color,
                                fontSize: Screen.spScreen14),
                            maxLines: 1),
                      ),
                      Expanded(
                          child: Container(
                              alignment: Alignment.centerRight,
                              child: Icon(Icons.arrow_forward_ios,
                                  size: Screen.hScree14, color: grey400Color)))
                    ],
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(left: Screen.wScreen25),
                    height: Screen.wScreen44,
                    child: Row(
                      children: <Widget>[
                        Text('店铺优惠',
                            style: TextStyle(
                                color: grey900Color,
                                fontSize: Screen.spScreen14),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis),
                        Padding(
                          padding: EdgeInsets.only(left: Screen.wScreen10),
                          child: Text('省5元:组合优惠',
                              style: TextStyle(
                                  color: grey500Color,
                                  fontSize: Screen.spScreen14),
                              maxLines: 1),
                        ),
                        Expanded(
                            child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text('-¥5.00',
                                  style: TextStyle(
                                      color: deepOrange300Color,
                                      fontSize: Screen.spScreen14),
                                  maxLines: 1),
                              SizedBox(
                                width: Screen.wScreen10,
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  size: Screen.hScree14, color: grey400Color)
                            ],
                          ),
                        ))
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(left: Screen.wScreen25),
                  height: Screen.wScreen44,
                  child: Row(
                    children: <Widget>[
                      Text('订单备注',
                          style: TextStyle(
                              color: grey900Color, fontSize: Screen.spScreen14),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      Padding(
                        padding: EdgeInsets.only(left: Screen.wScreen10),
                        child: Text('选填，请先和卖家协商一致',
                            style: TextStyle(
                                color: grey500Color,
                                fontSize: Screen.spScreen14),
                            maxLines: 1),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: Screen.wScreen20),
                  height: Screen.wScreen44,
                  alignment: Alignment.bottomRight,
                  padding: EdgeInsets.only(
                      right: Screen.wScreen10, bottom: Screen.wScreen10),
                  child: RichText(
                      text: TextSpan(
                          text: '共1件 ',
                          style: TextStyle(
                              color: grey500Color, fontSize: Screen.spScreen12),
                          children: <TextSpan>[
                        TextSpan(
                          text: '小计:',
                          style: TextStyle(
                              color: grey900Color, fontSize: Screen.spScreen14),
                        ),
                        TextSpan(
                            text: '¥199.00',
                            style: TextStyle(
                                color: deepOrange300Color,
                                fontSize: Screen.spScreen12))
                      ])),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildBottomSubmitOrderWidget() {
    return Container(
      width: DeviceUtil.width,
      height: Screen.hScree50,
      padding: EdgeInsets.only(right: Screen.wScreen10),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          RichText(
              text: TextSpan(
                  text: '共1件 ',
                  style: TextStyle(
                      color: grey500Color, fontSize: Screen.spScreen12),
                  children: <TextSpan>[
                TextSpan(
                  text: '合计:',
                  style: TextStyle(
                      color: grey900Color, fontSize: Screen.spScreen14),
                ),
                TextSpan(
                    text: '¥199.00',
                    style: TextStyle(
                        color: deepOrange300Color, fontSize: Screen.spScreen14))
              ])),
          Padding(padding: EdgeInsets.only(left: Screen.wScreen10)),
          RaisedButton(
              onPressed: () => null,
              shape: StadiumBorder(),
              color: deepOrange300Color,
              child: Text('提交订单',
                  style: TextStyle(
                      color: Colors.white, fontSize: Screen.spScreen14)))
        ],
      ),
    );
  }
}
