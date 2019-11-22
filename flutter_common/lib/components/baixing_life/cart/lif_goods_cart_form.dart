import 'package:flutter_common/components/baixing_life/goodsdetail/life_add_cart_goods_detail_event.dart';

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

  LifeGoodsCartWidget({Key key, this.provider})
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
//    BlocSupervisor.delegate = SimpleBlocDelegate(widget.provider, context);
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
          if (_cartGoods.length <= 0) {
            return Container();
          } else {
            return Container(
              color: Color(0xFFF5F6F8),
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
            onTap: () => null,
            child: Icon(
              Icons.radio_button_unchecked,
              size: Screen.hScree16,
              color: grey500Color,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Screen.hScree10),
            child: ImageLoadView('${obj['comPic']}',
                width: Screen.hScree80, height: Screen.hScree80),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('${obj['goodsName']}',
                  style: TextStyle(
                      color: grey1000Color, fontSize: Screen.spScreen16)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('¥${obj['oriPrice']}',
                      style: TextStyle(
                          color: deepOrange300Color,
                          fontSize: Screen.spScreen14)),
                  CartAmountView(
                      addOnPressed: () {
                      },
                      minusOnPressed: () {
                      },
                      amount:
                          obj['goodsCartNum'] == null ? 1 : obj['goodsCartNum'])
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
    if (state is CartCheckAllState) {
      isCheck = state.isCheckAll != null ? state.isCheckAll : false;
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
              BlocProvider.of<LifeCartBloc>(context)
                  .add(CartCheckAllEvent(isCheckAll: isCheck));
            },
            child: Row(
              children: <Widget>[
                Icon(
                  isCheck ? Icons.check_circle : Icons.radio_button_unchecked,
                  size: Screen.hScree16,
                  color: isCheck ? deepOrange300Color : grey500Color,
                ),
                Gaps.hGap10,
                Text('全选',
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
              Text('合计:',
                  style: TextStyle(
                      color: grey1000Color, fontSize: Screen.spScreen14)),
              Text('￥0',
                  style: TextStyle(
                      color: Colors.red, fontSize: Screen.spScreen12)),
              Gaps.hGap10,
              RaisedButton(
                  onPressed: () => null,
                  shape: StadiumBorder(),
                  color: deepOrange300Color,
                  child: Text('结算',
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
    print('==state=onEvent=' + event.toString());
    if (event is AddCartGoodsEvent) {
      if (context == null) {
        print('==state=onEvent==22=');
      }
      if (provider == null) {
        print('==state=onEvent==33=');
      }
      print('==state=onEvent==11=');
//      BlocProvider.of<LifeCartBloc>(context)
//          .add(CartQueryGoodsEvent(provider: provider));
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('==state=onTransition=');
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print('==state=onError=');
  }
}
