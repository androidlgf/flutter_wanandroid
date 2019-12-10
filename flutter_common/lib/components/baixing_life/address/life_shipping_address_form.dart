import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/common/blocs/bloc_widget.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/components/baixing_life/address/life_shiping_address_state.dart';
import 'package:flutter_common/components/baixing_life/db/life_address_provider.dart';
import 'package:flutter_common/components/baixing_life/db/life_goods_provider.dart';

import 'add/life_add_address_page.dart';
import 'life_shiping_address_event.dart';
import 'life_shipping_address_bloc.dart';

///我的购物地址列表
class LifeShippingAddressForm extends StatefulWidget {
  final LifeGoodsProvider provider;
  final LifeAddressProvider addressProvider;

  LifeShippingAddressForm({Key key, this.provider, this.addressProvider})
      : assert(provider != null),
        super(key: key);

  @override
  State createState() => _LifeSettlementFormState();
}

class _LifeSettlementFormState extends State<LifeShippingAddressForm> {
  List _listOfAddress = [];

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LifeShippingAddressBloc>(context)
        .add(QueryAddressEvent(provider: widget.addressProvider));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${S.of(context).life_add_address_ship_title}',
          style: TextStyle(fontSize: Screen.spScreen16),
        ),
        centerTitle: true,
        actions: <Widget>[
          RaisedButton(
              onPressed: () => pushNewPage(
                  context,
                  LifeAddAddressPage(
                      provider: widget.provider,
                      addressProvider: widget.addressProvider)),
              color: colorPrimary,
              child: Text('${S.of(context).life_add_new_address_title}',
                  style: TextStyle(
                      fontSize: Screen.spScreen16, color: Colors.white)))
        ],
      ),
      body: BlocWidget<LifeShippingAddressBloc>(
        builder: BlocBuilder<LifeShippingAddressBloc, BlocState>(
            builder: (context, state) {
          if (state is QueryAddressState) {
            _listOfAddress.clear();
            _listOfAddress.addAll(state?.listOfAddress);
          }
          return Container(
            child: ListView.builder(
              itemCount: _listOfAddress.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildBodyItemWidget(_listOfAddress[index], index);
              },
            ),
          );
        }),
      ),
    );
  }

  Widget _buildBodyItemWidget(obj, index) {
    return InkWell(
      onTap: () => BlocProvider.of<LifeShippingAddressBloc>(context).add(
          SelectAddressEvent(
              context: context,
              provider: widget.addressProvider,
              selectAddress: obj)),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: Screen.hScree10, horizontal: Screen.wScreen10),
        height: Screen.hScree80,
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Container(
              width: Screen.wScreen50,
              height: Screen.wScreen50,
              alignment: Alignment.center,
              //边框设置
              decoration: new BoxDecoration(
                //背景
                color: grey500Color,
                //设置四周圆角 角度
                borderRadius:
                    BorderRadius.all(Radius.circular(Screen.wScreen25)),
                //设置四周边框
                border: new Border.all(width: 0, color: grey500Color),
              ),
              child: Text(
                '${obj[LifeAddressProvider.addressName()]}'.substring(0, 2),
                style:
                    TextStyle(color: Colors.white, fontSize: Screen.spScreen15),
              ),
            ),
            Container(
              width: Screen.wScreen235,
              padding: EdgeInsets.only(left: Screen.wScreen10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RichText(
                      text: TextSpan(
                          text: '${obj[LifeAddressProvider.addressName()]}',
                          style: TextStyle(
                              color: grey1000Color,
                              fontSize: Screen.spScreen16),
                          children: <TextSpan>[
                        TextSpan(text: '    '),
                        TextSpan(
                            text: '${obj[LifeAddressProvider.addressPhone()]}',
                            style: TextStyle(
                                color: grey500Color,
                                fontSize: Screen.spScreen14))
                      ])),
                  RichText(
                      text: TextSpan(
                          text: obj[LifeAddressProvider.addressIsDefault()] ==
                                  LifeAddressProvider.addressDefault()
                              ? '默认    '
                              : '',
                          style: TextStyle(
                              color: deepOrange300Color,
                              fontSize: Screen.spScreen14),
                          children: <TextSpan>[
                        TextSpan(
                            text: '${obj[LifeAddressProvider.addressProvince()]}' +
                                '${obj[LifeAddressProvider.addressDetails()]}',
                            style: TextStyle(
                                color: grey1000Color,
                                fontSize: Screen.spScreen14))
                      ])),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Screen.wScreen10),
              width: 1,
              height: Screen.hScree30,
              color: grey200Color,
            ),
            InkWell(
                onTap: () => pushNewPage(
                    context,
                    LifeAddAddressPage(
                        provider: widget.provider,
                        addressProvider: widget.addressProvider,
                        address:
                            Address.fromMap(Map<String, dynamic>.from(obj)))),
                child: Container(
                  width: Screen.wScreen50 - 1,
                  alignment: Alignment.center,
                  child: Text('${S.of(context).life_add_address_edit_title}',
                      style: TextStyle(
                          color: grey500Color, fontSize: Screen.spScreen14)),
                ))
          ],
        ),
      ),
    );
  }
}
