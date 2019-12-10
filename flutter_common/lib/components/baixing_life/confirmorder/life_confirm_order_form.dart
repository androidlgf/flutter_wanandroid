import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/components/baixing_life/address/add/life_add_address_page.dart';
import 'package:flutter_common/components/baixing_life/address/life_shipping_address_page.dart';
import 'package:flutter_common/components/baixing_life/confirmorder/life_confirm_order_state.dart';
import 'package:flutter_common/components/baixing_life/db/life_address_provider.dart';
import 'package:flutter_common/components/baixing_life/db/life_goods_provider.dart';
import 'package:flutter_common/components/baixing_life/dialog/mode_of_distribution_dialog.dart';

import 'life_confirm_order_bloc.dart';
import 'life_confirm_order_event.dart';

///购物结算界面
class LifeConfirmOrderForm extends StatefulWidget {
  final LifeGoodsProvider provider;
  final LifeAddressProvider addressProvider;

  LifeConfirmOrderForm({Key key, this.provider, this.addressProvider})
      : assert(provider != null),
        super(key: key);

  @override
  State createState() => _LifeSettlementFormState();
}

class _LifeSettlementFormState extends State<LifeConfirmOrderForm> {
  Address _address;
  final List<GoodsProvider> _listOfGoods = [];
  double _totalPrice = 0.0;
  int _totleNum = 0;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LifeConfirmOrderBloc>(context).add(
        ConfirmOrderQueryGoodsEvent(
            provider: widget.provider,
            addressProvider: widget.addressProvider));
    return Scaffold(
      appBar: AppBar(
        title: Text('${S.of(context).life_confirm_order_title}'),
      ),
      body: BlocWidget<LifeConfirmOrderBloc>(
        builder: BlocBuilder<LifeConfirmOrderBloc, BlocState>(
          builder: (context, state) {
            if (state is ConfirmOrderQueryGoodsState) {
              _address = state?.address;
              _listOfGoods.clear();
              _listOfGoods.addAll(state?.checkGoods);
              _totalPrice = state?.totalPrice;
              _totleNum = state?.totalCartNum;
            }
            return Column(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        _buildAddressWidget(_address),
                        _buildBodyWidget(_listOfGoods)
                      ],
                    ),
                  ),
                ),
                _buildBottomSubmitOrderWidget()
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildBodyWidget(List<GoodsProvider> listOfGoods) {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return _buildGoodsItemWidget(listOfGoods[index], index);
        },
        separatorBuilder: (context, index) {
          return Gaps.vGap(15.0);
        },
        itemCount: listOfGoods?.length);
  }

  Widget _buildAddressWidget(Address address) {
    if (address == null) {
      return InkWell(
        onTap: () => pushNewPage(
            context,
            LifeAddAddressPage(
                provider: widget.provider,
                addressProvider: widget.addressProvider)),
        child: Container(
          margin: EdgeInsets.all(Screen.wScreen10),
          padding: EdgeInsets.only(left: Screen.wScreen10),
          height: Screen.hScree40,
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
              Icon(Icons.add_box, color: Colors.red),
              SizedBox(
                width: Screen.wScreen10,
              ),
              Text('${S.of(context).life_confirm_order_manually_add_address}',
                  style: TextStyle(
                      color: grey1000Color, fontSize: Screen.spScreen14))
            ],
          ),
        ),
      );
    }
    return InkWell(
      onTap: () => pushNewPage(
          context,
          LifeShippingAddressPage(
              provider: widget.provider,
              addressProvider: widget.addressProvider)),
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
                          text: '${address.name}',
                          style: TextStyle(
                              color: grey1000Color,
                              fontSize: Screen.spScreen16),
                          children: <TextSpan>[
                        TextSpan(text: '    '),
                        TextSpan(
                            text: '${address.phone}',
                            style: TextStyle(
                                color: grey500Color,
                                fontSize: Screen.spScreen12))
                      ])),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: Screen.hScree5),
                    child: Text('${address.province}' + '${address.address}',
                        style: TextStyle(
                            color: grey900Color, fontSize: Screen.spScreen12),
                        maxLines: 2),
                  ),
                  Text('${address.temporaryServer}',
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

  Widget _buildGoodsItemWidget(GoodsProvider goods, index) {
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
                Text('${goods.storeName}',
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
                  '${goods.comPic}',
                  width: Screen.wScreen80,
                  height: Screen.wScreen80,
                ),
                Container(
                  padding: EdgeInsets.only(left: Screen.wScreen10),
                  width: Screen.wScreen200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('${goods.goodsName}',
                          style: TextStyle(
                              color: grey900Color, fontSize: Screen.spScreen14),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      Text('${goods.assure}',
                          style: TextStyle(
                              color: deepOrange300Color,
                              fontSize: Screen.spScreen14),
                          maxLines: 1),
                    ],
                  ),
                ),
                Container(
                  width: Screen.wScreen55,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text('¥${goods.oriPrice}',
                          style: TextStyle(
                              color: grey900Color, fontSize: Screen.spScreen14),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis),
                      Padding(
                        padding: EdgeInsets.only(top: Screen.hScree5),
                        child: Text('x${goods.goodsCartNum}',
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
                InkWell(
                  onTap: () => showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (ctx) => ModeOfDistributionDialog(
                            onTap: (value) {},
                          )),
                  child: Container(
                    margin: EdgeInsets.only(left: Screen.wScreen25),
                    height: Screen.wScreen44,
                    child: Row(
                      children: <Widget>[
                        Text('配送方式',
                            style: TextStyle(
                                color: grey900Color,
                                fontSize: Screen.spScreen14),
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
                          text: '共${goods.goodsCartNum}件',
                          style: TextStyle(
                              color: grey500Color, fontSize: Screen.spScreen12),
                          children: <TextSpan>[
                        TextSpan(
                          text: '${S.of(context).life_confirm_order_subtotal}',
                          style: TextStyle(
                              color: grey900Color, fontSize: Screen.spScreen14),
                        ),
                        TextSpan(
                            text: '${goods.oriPrice}',
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
                  text: '共' + _totleNum.toString() + '件 ',
                  style: TextStyle(
                      color: grey500Color, fontSize: Screen.spScreen12),
                  children: <TextSpan>[
                TextSpan(
                  text: '${S.of(context).life_cart_summation}',
                  style: TextStyle(
                      color: grey900Color, fontSize: Screen.spScreen14),
                ),
                TextSpan(
                    text: '¥' + _totalPrice?.toString(),
                    style: TextStyle(
                        color: deepOrange300Color, fontSize: Screen.spScreen14))
              ])),
          Padding(padding: EdgeInsets.only(left: Screen.wScreen10)),
          InkWell(
            onTap: () => null,
            child: Container(
              height: Screen.hScree30,
              padding: EdgeInsets.symmetric(horizontal: Screen.wScreen10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.orange, Colors.deepOrange]),
                //设置四周圆角 角度
                borderRadius:
                    BorderRadius.all(Radius.circular(Screen.hScree15)),
              ),
              child: Text('${S.of(context).life_confirm_submit_order_subtotal}',
                  style: TextStyle(
                      color: Colors.white, fontSize: Screen.spScreen14)),
            ),
          )
        ],
      ),
    );
  }
}
