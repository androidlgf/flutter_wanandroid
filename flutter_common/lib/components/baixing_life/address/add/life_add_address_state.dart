import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';

class SelectContactState extends BlocState {
  final String fullName;
  final String phoneNumber;

  const SelectContactState({@required this.fullName, this.phoneNumber});

  @override
  List<Object> get props => [fullName, phoneNumber];

  @override
  String toString() =>
      'SelectContactState {fullName: $fullName,phoneNumber: $phoneNumber}';
}

class SelectCityState extends BlocState {
  final String provinceName;
  final String areaName;
  final String cityName;
  final String provinceId;
  final String areaId;
  final String cityId;

  const SelectCityState(
      {@required this.provinceName,
      this.areaName,
      this.cityName,
      this.provinceId,
      this.areaId,
      this.cityId});

  @override
  List<Object> get props =>
      [provinceName, provinceId, areaName, areaId, cityName, cityId];

  @override
  String toString() =>
      'SelectContactState {provinceName: $provinceName,provinceId: $provinceId,areaName: $areaName,areaId: $areaId,cityName: $cityName,cityId: $cityId}';
}

class SwitchDefaultAddressState extends BlocState {
  final bool isSwitch;

  const SwitchDefaultAddressState({@required this.isSwitch});

  @override
  List<Object> get props => [isSwitch];

  @override
  String toString() => 'SwitchDefaultAddressState {isSwitch: $isSwitch}';
}
class SaveAddressState extends BlocState {
  final bool isSuccess;

  const SaveAddressState({@required this.isSuccess});

  @override
  List<Object> get props => [isSuccess];

  @override
  String toString() => 'SaveAddressState {isSuccess: $isSuccess}';
}

class UpdateAddressState extends BlocState {
  final bool isSuccess;

  const UpdateAddressState({@required this.isSuccess});

  @override
  List<Object> get props => [isSuccess];

  @override
  String toString() => 'UpdateAddressState {isSuccess: $isSuccess}';
}