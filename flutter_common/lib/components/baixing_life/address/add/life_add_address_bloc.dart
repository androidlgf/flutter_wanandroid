import 'package:city_pickers/modal/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/blocs/bloc_common.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/common/utils/picker_util.dart';
import 'package:flutter_common/components/baixing_life/dio/life_http_post_dio.dart';
import 'package:native_contact_picker/native_contact_picker.dart';

import 'life_add_address_event.dart';
import 'life_add_address_state.dart';

class LifeAddAddressBloc extends BlocCommon<BlocEvent, BlocState> {
  final ILifeHttpPostWork httpWork;

  LifeAddAddressBloc({@required this.httpWork});

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
  }
}
