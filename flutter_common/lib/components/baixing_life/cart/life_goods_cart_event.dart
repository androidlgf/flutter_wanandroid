import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/components/baixing_life/db/life_goods_provider.dart';

class CartCheckAllEvent extends BlocEvent {
  final LifeGoodsProvider provider;
  final bool isCheckAll;
  final List<dynamic> queryGoods;

  const CartCheckAllEvent(
      {@required this.isCheckAll, this.queryGoods, this.provider});

  @override
  List<Object> get props => [isCheckAll, queryGoods, provider];

  @override
  String toString() =>
      'CartCheckAllEvent {isCheckAll: $isCheckAll,queryGoods: $queryGoods,provider: $provider }';
}

class CartQueryGoodsEvent extends BlocEvent {
  final LifeGoodsProvider provider;

  const CartQueryGoodsEvent({@required this.provider});

  @override
  List<Object> get props => [provider];

  @override
  String toString() => 'CartQueryGoodsEvent {goods: $provider }';
}

class AddCartNumGoodsEvent extends BlocEvent {
  final LifeGoodsProvider provider;
  final Map<dynamic, dynamic> queryGoods;

  const AddCartNumGoodsEvent({@required this.provider, this.queryGoods});

  @override
  List<Object> get props => [provider, queryGoods];

  @override
  String toString() =>
      'AddCartNumGoodsEvent {goods: $provider ,queryGoods: $queryGoods}';
}

class MinusCartNumGoodsEvent extends BlocEvent {
  final LifeGoodsProvider provider;
  final Map<dynamic, dynamic> queryGoods;

  const MinusCartNumGoodsEvent({@required this.provider, this.queryGoods});

  @override
  List<Object> get props => [provider, queryGoods];

  @override
  String toString() =>
      'AddCartNumGoodsEvent {goods: $provider ,queryGoods: $queryGoods}';
}

class ChangeCartGoodsIsCheckEvent extends BlocEvent {
  final LifeGoodsProvider provider;
  final Map<dynamic, dynamic> queryGoods;

  const ChangeCartGoodsIsCheckEvent({@required this.provider, this.queryGoods});

  @override
  List<Object> get props => [provider, queryGoods];

  @override
  String toString() =>
      'ChangeCartGoodsIsCheckEvent {goods: $provider ,queryGoods: $queryGoods}';
}
