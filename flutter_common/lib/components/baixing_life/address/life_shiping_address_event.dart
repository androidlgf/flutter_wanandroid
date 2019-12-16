import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/components/baixing_life/db/life_address_provider.dart';

class QueryAddressEvent extends BlocEvent {
  final LifeAddressProvider provider;

  const QueryAddressEvent({@required this.provider});

  @override
  List<Object> get props => [provider];

  @override
  String toString() => 'QueryAddressEvent';
}

class SelectAddressEvent extends BlocEvent {
  final BuildContext context;
  final LifeAddressProvider provider;
  final Map<dynamic, dynamic> selectAddress;

  const SelectAddressEvent(
      {@required this.context, this.provider, this.selectAddress});

  @override
  List<Object> get props => [provider, selectAddress];

  @override
  String toString() => 'SelectAddressEvent';
}
