import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';

class CartCheckAllState extends BlocState {
  final bool isCheckAll;
  final List<dynamic> cartGoods;
  final double totalPrice;

  const CartCheckAllState(
      {@required this.isCheckAll, this.cartGoods, this.totalPrice});

  @override
  List<Object> get props => [isCheckAll, cartGoods, totalPrice];

  @override
  String toString() =>
      'CartCheckAllState {isCheckAll: $isCheckAll,cartGoods: $cartGoods,totalPrice: $totalPrice }';
}

class CartQueryGoodsState extends BlocState {
  final List<dynamic> cartGoods;
  final double totalPrice;
  const CartQueryGoodsState({@required this.cartGoods,this.totalPrice});

  @override
  List<Object> get props => [cartGoods,totalPrice];

  @override
  String toString() => 'CartQueryGoodsState {CartQueryGoodsState: $cartGoods,totalPrice: $totalPrice }';
}
