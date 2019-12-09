import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/components/baixing_life/db/life_address_provider.dart';

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

class SaveAddressEvent extends BlocEvent {
  final LifeAddressProvider provider;
  final String id;
  final String name;
  final String phone;
  final bool isDefault;
  final String tag;
  final String address;
  final String province;
  final String city;
  final String area;

  const SaveAddressEvent(
      {@required this.id,
      this.provider,
      this.name,
      this.phone,
      this.isDefault,
      this.tag,
      this.address,
      this.province,
      this.city,
      this.area});

  @override
  List<Object> get props =>
      [id, name, phone, isDefault, tag, address, province, city, area];

  @override
  String toString() => 'SaveAddressEvent';
}

class UpdateAddressEvent extends BlocEvent {
  final LifeAddressProvider provider;
  final BuildContext context;
  final String id;
  final String name;
  final String phone;
  final bool isDefault;
  final String tag;
  final String address;
  final String province;
  final String city;
  final String area;

  const UpdateAddressEvent(
      {@required this.id,
        this.context,
        this.provider,
        this.name,
        this.phone,
        this.isDefault,
        this.tag,
        this.address,
        this.province,
        this.city,
        this.area});

  @override
  List<Object> get props =>
      [id, name, phone, isDefault, tag, address, province, city, area];

  @override
  String toString() => 'SaveAddressEvent';
}
