import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/components/baixing_life/db/life_address_provider.dart';
import 'package:flutter_common/components/baixing_life/db/life_goods_provider.dart';

class ConfirmOrderQueryGoodsEvent extends BlocEvent {
  final LifeGoodsProvider provider;
  final LifeAddressProvider addressProvider;
  final double totalPrice;
  const ConfirmOrderQueryGoodsEvent(
      {@required this.provider, this.addressProvider,this.totalPrice});

  @override
  List<Object> get props => [provider, addressProvider,totalPrice];

  @override
  String toString() => 'ConfirmOrderQueryGoodsEvent {goods: $provider }';
}
