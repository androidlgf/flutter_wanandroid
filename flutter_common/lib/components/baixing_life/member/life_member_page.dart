import 'package:amap_base_location/amap_base_location.dart';
import 'package:flutter_common/components/baixing_life/db/life_goods_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/components/baixing_life/home/life_home_bloc.dart';
import 'package:flutter_common/components/baixing_life/dio/life_http_post_dio.dart';

import 'life_member_form.dart';

//百姓生活 我的
class MemberLifePage extends StatelessWidget {
  final LifeGoodsProvider provider;

  MemberLifePage(this.provider, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF5F6F8),
      child: MemberLifeWidget(this.provider),
    );
  }
}
