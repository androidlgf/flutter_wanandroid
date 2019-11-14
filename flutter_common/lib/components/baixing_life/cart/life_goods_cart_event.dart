import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';

class CartCheckAllEvent extends BlocEvent {
  final bool isCheckAll;

  const CartCheckAllEvent({@required this.isCheckAll});

  @override
  List<Object> get props => [isCheckAll];

  @override
  String toString() => 'CartCheckAllEvent {isCheckAll: $isCheckAll }';
}
