import 'package:flutter_common/components/baixing_life/confirmorder/life_confirm_order_page.dart';
import 'package:flutter_common/components/baixing_life/db/life_address_provider.dart';
import 'life_goods_cart_bloc.dart';
import 'life_goods_cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/components/baixing_life/cart/ui/cart_amount.dart';
import 'package:flutter_common/components/baixing_life/db/life_goods_provider.dart';
import 'package:flutter_common/components/baixing_life/cart/life_goods_cart_event.dart';

class LifeGoodsCartWidget extends StatefulWidget {
  final LifeGoodsProvider provider;
  final LifeAddressProvider addressProvider;

  LifeGoodsCartWidget({Key key, this.provider, this.addressProvider})
      : assert(provider != null),
        super(key: key);

  @override
  State createState() => _LifeGoodsCartWidgetState();
}

class _LifeGoodsCartWidgetState extends State<LifeGoodsCartWidget> {
  List<dynamic> _cartGoods = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<LifeCartBloc>(context)
        .add(CartQueryGoodsEvent(provider: widget.provider));
    return BlocWidget<LifeCartBloc>(
      builder: BlocBuilder<LifeCartBloc, BlocState>(
        builder: (context, state) {
          if (state is CartQueryGoodsState) {
            _cartGoods.clear();
            _cartGoods.addAll(state?.cartGoods);
          }
          if (state is CartCheckAllState) {
            _cartGoods.clear();
            _cartGoods.addAll(state?.cartGoods);
          }
          if (_cartGoods.length <= 0) {
            return Container();
          } else {
            return Container(
              child: Column(
                children: <Widget>[
                  _buildCardGoodsWidget(_cartGoods),
                  _buildCardBottomWidget(state)
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildCardGoodsWidget(obj) {
    return Expanded(
        child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return _buildBodyItemWidget(obj[index], index);
            },
            separatorBuilder: (BuildContext context, int index) {
              return Container(
                height: 10.0,
              );
            },
            padding: EdgeInsets.all(Screen.hScree10),
            itemCount: obj?.length));
  }

  Widget _buildBodyItemWidget(obj, index) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: Screen.wScreen10),
      height: Screen.hScree100,
      //边框设置
      decoration: new BoxDecoration(
        //背景
        color: Colors.white,
        //设置四周圆角 角度
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        //设置四周边框
        border: new Border.all(width: 0, color: Colors.white),
      ),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              BlocProvider.of<LifeCartBloc>(context).add(
                  ChangeCartGoodsIsCheckEvent(
                      provider: widget.provider, queryGoods: obj));
            },
            child: Icon(
              obj[LifeGoodsProvider.goodsIsCheck()] ==
                      LifeGoodsProvider.goodsChecked()
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
              size: Screen.hScree16,
              color: obj[LifeGoodsProvider.goodsIsCheck()] ==
                      LifeGoodsProvider.goodsChecked()
                  ? deepOrange300Color
                  : grey500Color,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Screen.hScree10),
            child: ImageLoadView('${obj[LifeGoodsProvider.goodsComPic()]}',
                width: Screen.hScree80, height: Screen.hScree80),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('${obj[LifeGoodsProvider.goodsName()]}',
                  style: TextStyle(
                      color: grey1000Color, fontSize: Screen.spScreen16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('¥${obj[LifeGoodsProvider.goodsOriPrice()]}',
                      style: TextStyle(
                          color: deepOrange300Color,
                          fontSize: Screen.spScreen14)),
                  CartAmountView(
                      addOnPressed: () {
                        BlocProvider.of<LifeCartBloc>(context).add(
                            AddCartNumGoodsEvent(
                                provider: widget.provider, queryGoods: obj));
                      },
                      minusOnPressed: () {
                        BlocProvider.of<LifeCartBloc>(context).add(
                            MinusCartNumGoodsEvent(
                                provider: widget.provider, queryGoods: obj));
                      },
                      amount: obj[LifeGoodsProvider.goodsCartNum()] == null
                          ? 1
                          : obj[LifeGoodsProvider.goodsCartNum()])
                ],
              )
            ],
          ))
        ],
      ),
    );
  }

  Widget _buildCardBottomWidget(BlocState state) {
    bool isCheck = false;
    double totalPrice = 0;
    if (state is CartCheckAllState) {
      isCheck = state.isCheckAll != null ? state.isCheckAll : false;
      totalPrice = state.totalPrice;
    }
    if (state is CartQueryGoodsState) {
      totalPrice = state.totalPrice;
    }
    return Container(
      alignment: Alignment.center,
      color: whiteColor,
      padding: EdgeInsets.only(
          top: Screen.hScree5,
          bottom: Screen.hScree5,
          left: Screen.wScreen8,
          right: Screen.wScreen8),
      child: Row(
        children: <Widget>[
          InkWell(
            onTap: () {
              bool isCheck = true;
              if (state is CartCheckAllState) {
                isCheck = state.isCheckAll == null ? true : !state.isCheckAll;
              }
              BlocProvider.of<LifeCartBloc>(context).add(CartCheckAllEvent(
                  isCheckAll: isCheck,
                  queryGoods: _cartGoods,
                  provider: widget.provider));
            },
            child: Row(
              children: <Widget>[
                Icon(
                  isCheck ? Icons.check_circle : Icons.radio_button_unchecked,
                  size: Screen.hScree16,
                  color: isCheck ? deepOrange300Color : grey500Color,
                ),
                Gaps.hGap10,
                Text('${S.of(context).life_cart_check_all}',
                    style: TextStyle(
                        color: grey500Color, fontSize: Screen.spScreen14))
              ],
            ),
          ),
          Expanded(
              child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text('${S.of(context).life_cart_summation}:',
                  style: TextStyle(
                      color: grey1000Color, fontSize: Screen.spScreen14)),
              Text('￥$totalPrice',
                  style: TextStyle(
                      color: Colors.red, fontSize: Screen.spScreen12)),
              Gaps.hGap10,
              RaisedButton(
                  onPressed: () => pushNewPage(
                      context,
                      LifeConfirmOrderPage(
                        provider: widget.provider,
                        addressProvider: widget.addressProvider,
                      )),
                  shape: StadiumBorder(),
                  color: deepOrange300Color,
                  child: Text('${S.of(context).life_cart_account}',
                      style: TextStyle(
                          color: Colors.white, fontSize: Screen.spScreen14)))
            ],
          ))
        ],
      ),
    );
  }
}

class SimpleBlocDelegate extends BlocDelegate {
  final LifeGoodsProvider provider;
  final BuildContext context;

  SimpleBlocDelegate(this.provider, this.context);

  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
  }
}
