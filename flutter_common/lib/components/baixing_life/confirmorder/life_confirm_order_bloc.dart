import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/blocs/bloc_common.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/components/baixing_life/confirmorder/life_confirm_order_event.dart';
import 'package:flutter_common/components/baixing_life/db/life_address_provider.dart';
import 'package:flutter_common/components/baixing_life/dio/life_http_post_dio.dart';

import 'life_confirm_order_state.dart';

class LifeConfirmOrderBloc extends BlocCommon<BlocEvent, BlocState> {
  final ILifeHttpPostWork httpWork;

  LifeConfirmOrderBloc({@required this.httpWork});

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    if (event is ConfirmOrderQueryGoodsEvent) {
      var defaultAddress = await event?.addressProvider?.queryDefaultAddress();
      var checkGoods = await event?.provider?.queryCheckGoods();
      var queryTotalPrice = await event?.provider?.queryTotalPrice(checkGoods);
      var totalCartNum = 0;
      for (var value in checkGoods) {
        totalCartNum += value?.goodsCartNum;
      }
      yield ConfirmOrderQueryGoodsState(
          address: defaultAddress == null
              ? null
              : Address.fromMap(Map<String, dynamic>.from(defaultAddress)),
          checkGoods: checkGoods,
          totalPrice: queryTotalPrice,
          totalCartNum: totalCartNum);
    }
  }
}
