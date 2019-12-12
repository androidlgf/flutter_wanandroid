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
  bool _isShowFloatingTopBar = false;
  double _topBarOpacity = 1;
  double _lastScrollPixels = 0;

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
            return MediaQuery.removePadding(
                removeTop: true,
                context: context,
                child: NotificationListener(
                  onNotification: _onScroll,
                  child: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Expanded(
                            child: SingleChildScrollView(
                              child: _buildBodyWidget(_cartGoods),
                            ),
                          ),
                          _buildCardBottomWidget(state)
                        ],
                      ),
                      Offstage(
                        offstage: !_isShowFloatingTopBar,
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [Colors.orange, Colors.deepOrange])),
                          width: DeviceUtil.width,
                          height: DeviceUtil.topSafeHeight + Screen.hScree40,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: DeviceUtil.topSafeHeight,
                              ),
                              Container(
                                height: Screen.hScree40,
                                child: _buildFloatingTopBar(_cartGoods),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ));
          }
        },
      ),
    );
  }

  Widget _buildBodyWidget(List<dynamic> obj) {
    return Stack(
      children: <Widget>[
        Container(
          width: DeviceUtil.width,
          height: DeviceUtil.height / 4,
          decoration: BoxDecoration(
              gradient:
                  LinearGradient(colors: [Colors.orange, Colors.deepOrange])),
          child: Opacity(opacity: _topBarOpacity, child: _buildTopBar(obj)),
        ),
        Container(
          margin:
              EdgeInsets.only(top: Screen.hScree77 + DeviceUtil.topSafeHeight),
          child: ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return _buildBodyItemWidget(obj[index], index);
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                  height: 10.0,
                );
              },
              padding: EdgeInsets.all(Screen.hScree10),
              itemCount: obj?.length),
        ),
      ],
    );
  }

  Widget _buildTopBar(obj) {
    return Container(
        margin:
            EdgeInsets.only(top: DeviceUtil.topSafeHeight + Screen.hScree10),
        padding: EdgeInsets.symmetric(horizontal: Screen.wScreen10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  '${S.of(context).life_cart_title}',
                  style: TextStyle(
                      fontSize: Screen.spScreen24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  '${S.of(context).life_cart_management}',
                  style: TextStyle(
                      fontSize: Screen.spScreen18, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: Screen.hScree10),
            Text('共' + '${obj?.length}' + '件宝贝',
                style:
                    TextStyle(fontSize: Screen.spScreen15, color: Colors.white))
          ],
        ));
  }

  Widget _buildFloatingTopBar(obj) {
    return Stack(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              GestureDetector(
                  child: Text(
                '${S.of(context).life_cart_setting}',
                style:
                    TextStyle(color: Colors.white, fontSize: Screen.spScreen16),
              )),
              SizedBox(
                width: 8,
              ),
            ],
          ),
        ),
        Center(
          child: Text('购物车(' + '${obj?.length})',
              textAlign: TextAlign.center,
              style:
                  TextStyle(color: Colors.white, fontSize: Screen.spScreen16)),
        ),
      ],
    );
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
              InkWell(
                  onTap: () {
                    if (totalPrice == 0.0) return;
                    pushNewPage(
                        context,
                        LifeConfirmOrderPage(
                          provider: widget.provider,
                          addressProvider: widget.addressProvider,
                        ));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(vertical: Screen.hScree8),
                    padding: EdgeInsets.symmetric(
                        horizontal: Screen.wScreen15, vertical: Screen.hScree4),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.orange, Colors.deepOrange]),
                      //设置四周圆角 角度
                      borderRadius:
                          BorderRadius.all(Radius.circular(Screen.hScree15)),
                    ),
                    child: Text('${S.of(context).life_cart_account}',
                        style: TextStyle(
                            color: Colors.white, fontSize: Screen.spScreen14)),
                  ))
            ],
          ))
        ],
      ),
    );
  }

  bool _onScroll(ScrollNotification scroll) {
    double limitExtent = Screen.hScree40;
    // 当前滑动距离
    double currentExtent = scroll.metrics.pixels;
    //向下滚动
    if (currentExtent - _lastScrollPixels > 0) {
      if (currentExtent <= limitExtent) {
        setState(() {
          double opacity = 1 - currentExtent / limitExtent;
          _topBarOpacity = opacity > 1 ? 1 : opacity;
        });
      } else {
        if (!_isShowFloatingTopBar) {
          setState(() {
            _isShowFloatingTopBar = true;
          });
        }
      }
    }
    //往上滚动
    if (currentExtent - _lastScrollPixels < 0) {
      if (currentExtent <= limitExtent) {
        setState(() {
          double opacity = 1 - currentExtent / limitExtent;
          _topBarOpacity = opacity > 1 ? 1 : opacity;
          _isShowFloatingTopBar = false;
        });
      }
    }
    _lastScrollPixels = currentExtent;
    // 返回false，继续向上传递,返回true则不再向上传递
    return false;
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
