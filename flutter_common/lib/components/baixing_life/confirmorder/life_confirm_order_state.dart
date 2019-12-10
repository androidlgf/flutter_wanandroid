import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/components/baixing_life/db/life_address_provider.dart';
import 'package:flutter_common/components/baixing_life/db/life_goods_provider.dart';

class ConfirmOrderQueryGoodsState extends BlocState {
  final Address address;
  final List<GoodsProvider> checkGoods;
  final double totalPrice;
  final int totalCartNum;

  const ConfirmOrderQueryGoodsState(
      {@required this.address,
      this.checkGoods,
      this.totalPrice,
      this.totalCartNum});

  @override
  List<Object> get props => [address, checkGoods, totalPrice];

  @override
  String toString() =>
      'ConfirmOrderQueryGoodsState {Address: $address,CheckGoods:$checkGoods,totalPrice:$totalPrice}';
}
