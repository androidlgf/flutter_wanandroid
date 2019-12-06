import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/blocs/bloc_common.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/components/baixing_life/dio/life_http_post_dio.dart';

import 'life_shiping_address_event.dart';
import 'life_shiping_address_state.dart';

class LifeShippingAddressBloc extends BlocCommon<BlocEvent, BlocState> {
  final ILifeHttpPostWork httpWork;

  LifeShippingAddressBloc({@required this.httpWork});

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    if (event is QueryAddressEvent) {
      var listOfAddress = await event?.provider?.queryAddress();
      if (listOfAddress == null || listOfAddress.length <= 0) {
        yield BlocEmpty();
        return;
      }
      yield QueryAddressState(listOfAddress: listOfAddress);
      return;
    }
  }
}
