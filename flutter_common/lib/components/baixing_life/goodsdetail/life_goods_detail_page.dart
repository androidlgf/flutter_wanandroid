import 'package:flutter_common/components/baixing_life/db/life_goods_provider.dart';

import 'life_goods_detail_bloc.dart';
import 'life_goods_detail_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/common/blocs/bloc_common.dart';
import 'package:flutter_common/components/baixing_life/dio/life_http_post_dio.dart';

//百姓生活 商品详情
class LifeGoodsDetailPage extends StatelessWidget {
  final String goodsId;
  final LifeGoodsProvider provider;

  LifeGoodsDetailPage({Key key, this.goodsId, this.provider})
      : assert(goodsId != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (BuildContext context) {
        return LifeGoodsDetailBloc(httpWork: ILifeHttpPostWork(subKey: goodsId));
      },
      child: LifeGoodsDetailWidget(
        goodsId: goodsId,
        provider: provider,
      ),
    );
  }
}
