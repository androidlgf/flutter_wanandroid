import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/components/baixing_life/cart/life_goods_cart_event.dart';

import 'life_goods_cart_bloc.dart';
import 'life_goods_cart_state.dart';

class LifeGoodsCartWidget extends StatefulWidget {
  @override
  State createState() => _LifeGoodsCartWidgetState();
}

class _LifeGoodsCartWidgetState extends State<LifeGoodsCartWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocWidget<LifeCartBloc>(
      builder: BlocBuilder<LifeCartBloc, BlocState>(
        builder: (context, state) {
          if (state is BlocInitial || state is CartCheckAllState) {
            return Container(
              color: Color(0xFFF5F6F8),
              child: Column(
                children: <Widget>[
                  _buildCardGoodsWidget(),
                  _buildCardBottomWidget(state)
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildCardGoodsWidget() {
    return Expanded(
        child: ListView(
            padding: EdgeInsets.only(top: 0),
            physics: const BouncingScrollPhysics()));
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
