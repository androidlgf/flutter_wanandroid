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
      await event.provider
          .checkAllCartGoods(event.isCheckAll, event.queryGoods);
      var cartGoods = await event.provider.queryGoods();
      var totalPrice = await event.provider.queryTotalPrice(cartGoods);

      yield CartCheckAllState(
          isCheckAll: event.isCheckAll,
          cartGoods: cartGoods,
          totalPrice: totalPrice);
    }
    if (event is CartQueryGoodsEvent) {
      var cartGoods = await event.provider.queryGoods();
      var totalPrice = await event.provider.queryTotalPrice(cartGoods);
      if (cartGoods == null || cartGoods.length <= 0) {
        yield BlocEmpty();
      } else {
        yield CartQueryGoodsState(cartGoods: cartGoods, totalPrice: totalPrice);
      }
    }
    if (event is AddCartNumGoodsEvent) {
      event.provider.addCartNumGoods(event.queryGoods);
      var cartGoods = await event.provider.queryGoods();
      var totalPrice = await event.provider.queryTotalPrice(cartGoods);
      yield CartQueryGoodsState(cartGoods: cartGoods, totalPrice: totalPrice);
    }
    if (event is MinusCartNumGoodsEvent) {
      event.provider.minusCartNumGoods(event.queryGoods);
      var cartGoods = await event.provider.queryGoods();
      var totalPrice = await event.provider.queryTotalPrice(cartGoods);
      yield CartQueryGoodsState(cartGoods: cartGoods, totalPrice: totalPrice);
    }
    if (event is ChangeCartGoodsIsCheckEvent) {
      event.provider.changeCartGoodsIsCheck(event.queryGoods);
      var cartGoods = await event.provider.queryGoods();
      var totalPrice = await event.provider.queryTotalPrice(cartGoods);
      yield CartQueryGoodsState(cartGoods: cartGoods, totalPrice: totalPrice);
    }
  }
}
