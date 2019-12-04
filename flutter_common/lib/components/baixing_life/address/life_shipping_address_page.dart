import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/components/baixing_life/db/life_goods_provider.dart';
import 'package:flutter_common/components/baixing_life/dio/life_http_post_dio.dart';

import 'life_shipping_address_bloc.dart';
import 'life_shipping_address_form.dart';

///我的购物地址列表
class LifeShippingAddressPage extends StatelessWidget {
  final LifeGoodsProvider provider;

  LifeShippingAddressPage({Key key, this.provider})
      : assert(provider != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) {
        return LifeShippingAddressBloc(httpWork: ILifeHttpPostWork());
      },
      child: LifeShippingAddressForm(provider: provider),
    );
  }
}
