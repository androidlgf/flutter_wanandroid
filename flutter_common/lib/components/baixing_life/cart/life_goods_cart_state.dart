import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';

class CartCheckAllState extends BlocState {
  final bool isCheckAll;

  const CartCheckAllState({@required this.isCheckAll});

  @override
  List<Object> get props => [isCheckAll];

  @override
  String toString() => 'CartCheckAllState {isCheckAll: $isCheckAll }';
}
class CartQueryGoodsState extends BlocState {
  final List<dynamic> cartGoods;

  const CartQueryGoodsState({@required this.cartGoods});

  @override
  List<Object> get props => [cartGoods];

  @override
  String toString() => 'CartQueryGoodsState {CartQueryGoodsState: $cartGoods }';
}