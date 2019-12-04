import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';

class SelectContactEvent extends BlocEvent {
  const SelectContactEvent();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'SelectContactEvent';
}

class SelectCityEvent extends BlocEvent {
  final BuildContext context;

  const SelectCityEvent({@required this.context});

  @override
  List<Object> get props => [context];

  @override
  String toString() => 'SelectCityEvent';
}

class SwitchDefaultAddressEvent extends BlocEvent {
  final bool isSwitch;

  const SwitchDefaultAddressEvent({@required this.isSwitch});

  @override
  List<Object> get props => [isSwitch];

  @override
  String toString() => 'SwitchDefaultAddressEvent';
}
