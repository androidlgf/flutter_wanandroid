import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/components/baixing_life/db/life_goods_provider.dart';

class CartCheckAllEvent extends BlocEvent {
  final bool isCheckAll;

  const CartCheckAllEvent({@required this.isCheckAll});

  @override
  List<Object> get props => [isCheckAll];

  @override
  String toString() => 'CartCheckAllEvent {isCheckAll: $isCheckAll }';
}

class CartQueryGoodsEvent extends BlocEvent {
  final LifeGoodsProvider provider;

  const CartQueryGoodsEvent({@required this.provider});

  @override
  List<Object> get props => [provider];

  @override
  String toString() => 'CartQueryGoodsEvent {goods: $provider }';
}
