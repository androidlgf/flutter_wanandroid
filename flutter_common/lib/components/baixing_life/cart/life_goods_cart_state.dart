import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';

class CartCheckAllState extends BlocState {
  final bool isCheckAll;

  const CartCheckAllState({@required this.isCheckAll});

  @override
  List<Object> get props => [isCheckAll];

  @override
  String toString() => 'CartCheckAllEvent {isCheckAll: $isCheckAll }';
}
