import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';

class QueryAddressState extends BlocState {
  final List listOfAddress;

  const QueryAddressState({@required this.listOfAddress});

  @override
  List<Object> get props => [listOfAddress];

  @override
  String toString() => 'QueryAddressState';
}
