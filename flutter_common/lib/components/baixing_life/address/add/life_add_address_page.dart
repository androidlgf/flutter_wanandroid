import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/components/baixing_life/db/life_goods_provider.dart';
import 'package:flutter_common/components/baixing_life/dio/life_http_post_dio.dart';

import 'life_add_address_bloc.dart';
import 'life_add_address_form.dart';

///添加购物地址列表
class LifeAddAddressPage extends StatelessWidget {
  final LifeGoodsProvider provider;
  final LifeGoodsProvider addressProvider;

  LifeAddAddressPage({Key key, this.provider, this.addressProvider})
      : assert(provider != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) {
        return LifeAddAddressBloc(httpWork: ILifeHttpPostWork());
      },
      child: LifeAddAddressForm(
        provider: provider,
        addressProvider: addressProvider,
      ),
    );
  }
}
