import 'dart:math';

import 'package:city_pickers/modal/result.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/blocs/bloc_common.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/common/utils/picker_util.dart';
import 'package:flutter_common/components/baixing_life/db/life_address_provider.dart';
import 'package:flutter_common/components/baixing_life/dio/life_http_post_dio.dart';
import 'package:native_contact_picker/native_contact_picker.dart';

import 'life_add_address_event.dart';
import 'life_add_address_state.dart';

class LifeAddAddressBloc extends BlocCommon<BlocEvent, BlocState> {
  final ILifeHttpPostWork httpWork;

  LifeAddAddressBloc({@required this.httpWork});

  String addressNameErrorInfo() =>
      '请输入收货人姓名' + Random().nextInt(100).toString();

  String addressPhoneErrorInfo() =>
      '请输入收货人手机号' + Random().nextInt(100).toString();

  String addressLocationErrorInfo() =>
      '请选择收货人所在地区' + Random().nextInt(100).toString();

  String addressAddressDetailErrorInfo() =>
      '请输入收货人详细地址' + Random().nextInt(100).toString();

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    if (event is SelectContactEvent) {
      Contact contact = await PickerUtil.selectContact();
      yield SelectContactState(
          fullName: '${contact.fullName}',
          phoneNumber: '${contact.phoneNumber}');
      return;
    }
    if (event is SelectCityEvent) {
      Result result = await PickerUtil.showCityPicker(event?.context);
      yield SelectCityState(
          provinceName: result?.provinceName,
          provinceId: result?.provinceId,
          areaName: result?.areaName,
          areaId: result?.areaId,
          cityName: result?.cityName,
          cityId: result?.cityId);
      return;
    }
    if (event is SwitchDefaultAddressEvent) {
      yield SwitchDefaultAddressState(isSwitch: !event.isSwitch);
      return;
    }
    if (event is SaveAddressEvent) {
      if (ObjectUtil.isEmpty(event?.name)) {
        yield BlocShowSnackBar(message: addressNameErrorInfo());
        return;
      }
      if (!RegexUtil.isMobileSimple(event?.phone)) {
        yield BlocShowSnackBar(message: addressPhoneErrorInfo());
        return;
      }
      if (ObjectUtil.isEmpty(event?.province)) {
        yield BlocShowSnackBar(message: addressLocationErrorInfo());
        return;
      }
      if (ObjectUtil.isEmpty(event?.address)) {
        yield BlocShowSnackBar(message: addressAddressDetailErrorInfo());
        return;
      }
      Address address = new Address(
          id: new DateTime.now().millisecondsSinceEpoch.toString(),
          name: event?.name,
          phone: event?.phone,
          isDefault: event.isDefault?LifeAddressProvider.addressDefault():LifeAddressProvider.addressUnDefault(),
          address: event?.address,
          province: event?.province,
          city: event?.city,
          area: event?.area,
          tag: event?.tag);
      event?.provider?.saveAddress(address);
      Navigator.of(event?.context).pop();
      return;
    }
    if (event is UpdateAddressEvent) {
      if (ObjectUtil.isEmpty(event?.name)) {
        yield BlocShowSnackBar(message: addressNameErrorInfo());
        return;
      }
      if (!RegexUtil.isMobileSimple(event?.phone)) {
        yield BlocShowSnackBar(message: addressPhoneErrorInfo());
        return;
      }
      if (ObjectUtil.isEmpty(event?.province)) {
        yield BlocShowSnackBar(message: addressLocationErrorInfo());
        return;
      }
      if (ObjectUtil.isEmpty(event?.address)) {
        yield BlocShowSnackBar(message: addressAddressDetailErrorInfo());
        return;
      }
      Address address = new Address(
          id: event?.id,
          name: event?.name,
          phone: event?.phone,
          isDefault: event.isDefault?LifeAddressProvider.addressDefault():LifeAddressProvider.addressUnDefault(),
          address: event?.address,
          province: event?.province,
          city: event?.city,
          area: event?.area,
          tag: event?.tag);
      event?.provider?.updateAddress(address);
      Navigator.of(event?.context).pop();
      return;
    }
  }
}
