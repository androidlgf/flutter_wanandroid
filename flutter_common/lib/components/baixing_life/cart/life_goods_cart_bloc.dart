import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/blocs/bloc_common.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/components/baixing_life/cart/life_goods_cart_event.dart';
import 'package:flutter_common/components/baixing_life/dio/life_http_post_dio.dart';

import 'life_goods_cart_state.dart';

class LifeCartBloc extends BlocCommon<BlocEvent, BlocState> {
  final ILifeHttpPostWork httpWork;

  LifeCartBloc({@required this.httpWork});

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    if (event is CartCheckAllEvent) {
      yield CartCheckAllState(isCheckAll: event.isCheckAll);
    }
    if (event is CartQueryGoodsEvent) {
      var cartGoods = await event.provider.queryGoods();
      if (cartGoods == null || cartGoods.length <= 0) {
        yield BlocEmpty();
      } else {
        yield CartQueryGoodsState(cartGoods: cartGoods);
      }
    }
  }
}
