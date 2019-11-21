import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/components/baixing_life/db/life_goods_provider.dart';

import 'data/life_goods_detail_data.dart';
class AddCartGoodsEvent extends BlocEvent {
  final LifeGoodsProvider provider;
  final GoodInfo goodInfo;
  const AddCartGoodsEvent({@required this.provider,@required this.goodInfo});

  @override
  List<Object> get props => [provider,goodInfo];

  @override
  String toString() => 'AddCartGoodsEvent {goods: $provider }';
}
