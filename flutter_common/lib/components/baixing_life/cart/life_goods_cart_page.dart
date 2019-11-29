import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/components/baixing_life/db/life_goods_provider.dart';
import 'package:flutter_common/components/baixing_life/dio/life_http_post_dio.dart';

import 'lif_goods_cart_form.dart';
import 'life_goods_cart_bloc.dart';

///我的购物车界面
class LifeGoodsCardPage extends StatelessWidget {
  final LifeGoodsProvider provider;

  LifeGoodsCardPage({Key key, this.provider})
      : assert(provider != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) {
        return LifeCartBloc(httpWork: ILifeHttpPostWork());
      },
      child: LifeGoodsCartWidget(provider: provider),
    );
  }
}
