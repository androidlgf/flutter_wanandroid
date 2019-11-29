import 'package:amap_base_location/amap_base_location.dart';
import 'package:flutter_common/components/baixing_life/db/life_goods_provider.dart';

import 'life_home_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/components/baixing_life/home/life_home_bloc.dart';
import 'package:flutter_common/components/baixing_life/dio/life_http_post_dio.dart';

//百姓生活 首页
class HomeBxLifePage extends StatelessWidget {
  final LifeGoodsProvider provider;

  HomeBxLifePage(this.provider, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (BuildContext context) {
        return LifeHomeBloc(
            httpWork: ILifeHttpPostWork(), location: AMapLocation());
      },
      child: HomeBxLifeWidget(provider),
    );
  }
}
