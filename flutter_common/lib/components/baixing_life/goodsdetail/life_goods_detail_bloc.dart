import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/blocs/bloc_common.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/components/baixing_life/dio/life_http_post_dio.dart';

import 'life_add_cart_goods_detail_event.dart';

class LifeGoodsDetailBloc extends BlocCommon<BlocEvent, BlocState> {
  final ILifeHttpPostWork httpWork;

  LifeGoodsDetailBloc({@required this.httpWork});

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    //网络请求事件处理
    if (event is BlocHttpEvent) {
      //改为加载loading状态
      yield BlocLoading();
      var response = await httpWork?.start(
          url: event?.url, params: event?.params, headers: event?.headers);
      if (response.success) {
        yield BlocSuccess(response: response?.result);
      } else {
        yield BlocFailure(error: '${response?.message}');
      }
      return;
    }
    if (event is BlocShowMessageEvent) {
      yield BlocShowMessage(message: '${event.message}');
      return;
    }
    if (event is BlocShowSnackBarEvent) {
      yield BlocShowSnackBar(message: '${event.message}');
      return;
    }
    if (event is AddCartGoodsEvent) {
      event?.provider?.addCardGoods(event?.goodInfo);
      yield BlocShowSnackBar(message: '添加购物车成功');
      return;
    }
  }
}
