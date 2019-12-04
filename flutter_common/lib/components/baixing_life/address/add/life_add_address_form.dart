import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/common/blocs/bloc_widget.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/components/baixing_life/address/ui/address_tag_item.dart';
import 'package:flutter_common/components/baixing_life/address/ui/select_text_Icon_item.dart';
import 'package:flutter_common/components/baixing_life/address/ui/text_field_Icon_item.dart';
import 'package:flutter_common/components/baixing_life/db/life_goods_provider.dart';

import 'life_add_address_bloc.dart';
import 'life_add_address_event.dart';
import 'life_add_address_state.dart';

///添加购物地址列表
class LifeAddAddressForm extends StatefulWidget {
  final LifeGoodsProvider provider;

  LifeAddAddressForm({Key key, this.provider})
      : assert(provider != null),
        super(key: key);

  @override
  State createState() => _LifeSettlementFormState();
}

class _LifeSettlementFormState extends State<LifeAddAddressForm> {
  var _nameController = TextEditingController();
  var _phoneController = TextEditingController();
  var _addressController = TextEditingController();
  bool _isDefault = false;
  String _region;

  @override
  Widget build(BuildContext context) {
    return BlocWidget<LifeAddAddressBloc>(
      builder: BlocBuilder<LifeAddAddressBloc, BlocState>(
        builder: (context, state) {
          if (state is SelectContactState) {
            _nameController.text = state.fullName;
            _phoneController.text = state.phoneNumber;
          }
          if (state is SwitchDefaultAddressState) {
            _isDefault = state.isSwitch;
          }
          if (state is SelectCityState) {
            StringBuffer buffer = new StringBuffer();
            buffer
                .write(state?.provinceName == null ? '' : state?.provinceName);
            buffer.write(state?.cityName == null ? '' : state?.cityName);
            buffer.write(state?.areaName == null ? '' : state?.areaName);
            if(buffer.toString().isNotEmpty){
              _region = buffer.toString();
            }
          }
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: _buildBodyWidget(),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBodyWidget() {
    return Column(
      children: <Widget>[
        TextFieldIcon(
          hintText: '收货人',
          maxLines: 1,
          height: Screen.hScree45,
          icon: InkWell(
            onTap: () => BlocProvider.of<LifeAddAddressBloc>(context)
                .add(SelectContactEvent()),
            child: Icon(
              Icons.assignment_ind,
              size: Screen.hScree20,
              color: grey500Color,
            ),
          ),
          controller: _nameController,
        ),
        Gaps.line,
        TextFieldIcon(
          hintText: '手机号码',
          maxLines: 1,
          maxLength: 11,
          keyboardType: TextInputType.phone,
          height: Screen.hScree45,
          controller: _phoneController,
        ),
        Gaps.line,
        InkWell(
          onTap: () => BlocProvider.of<LifeAddAddressBloc>(context)
              .add(SelectCityEvent(context: context)),
          child: SelectTextIcon(
            icon: Icon(
              Icons.arrow_forward_ios,
              size: Screen.wScreen12,
              color: grey50Color,
            ),
            height: Screen.hScree45,
            text: Text(
              _region == null ? '所在地区' : _region,
              style:
                  TextStyle(color: _region == null?grey500Color:grey900Color, fontSize: Screen.spScreen14),
            ),
          ),
        ),
        Gaps.line,
        TextFieldIcon(
          hintText: '详细地址：如街道、门牌号、小区、楼栋号、单元室等',
          maxLines: 3,
          height: Screen.hScree80,
          controller: _addressController,
        ),
        Gaps.line,
        Gaps.vGap20,
        AddressTagItem(
          text: '地址标签',
          height: Screen.hScree45,
          onTap: (value) {},
        ),
        Gaps.line,
        Container(
          height: Screen.hScree45,
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: Screen.wScreen10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('设置默认地址',
                  style: TextStyle(
                      color: grey900Color, fontSize: Screen.spScreen14)),
              Container(
                child: Switch(
                    value: _isDefault,
                    onChanged: (value) =>
                        BlocProvider.of<LifeAddAddressBloc>(context)
                            .add(SwitchDefaultAddressEvent(isSwitch: value))),
              )
            ],
          ),
        )
      ],
    );
  }
}
