import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/components/baixing_life/db/life_goods_provider.dart';
import 'package:flutter_common/components/baixing_life/dio/life_http_post_dio.dart';

import 'life_confirm_order_bloc.dart';
import 'life_confirm_order_form.dart';

///购物结算界面
class LifeConfirmOrderPage extends StatelessWidget {
  final LifeGoodsProvider provider;

  LifeConfirmOrderPage({Key key, this.provider})
      : assert(provider != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) {
        return LifeConfirmOrderBloc(httpWork: ILifeHttpPostWork());
      },
      child: LifeConfirmOrderForm(provider: provider),
    );
  }
}
