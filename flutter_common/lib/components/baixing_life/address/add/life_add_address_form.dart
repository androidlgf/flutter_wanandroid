import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/common/blocs/bloc_widget.dart';
import 'package:flutter_common/common/common_index.dart';
import 'package:flutter_common/components/baixing_life/address/ui/address_tag_item.dart';
import 'package:flutter_common/components/baixing_life/address/ui/select_text_Icon_item.dart';
import 'package:flutter_common/components/baixing_life/address/ui/text_field_Icon_item.dart';
import 'package:flutter_common/components/baixing_life/db/life_address_provider.dart';
import 'package:flutter_common/components/baixing_life/db/life_goods_provider.dart';
import 'package:flutter_common/components/baixing_life/dialog/data/address_tag_data.dart';

import 'life_add_address_bloc.dart';
import 'life_add_address_event.dart';
import 'life_add_address_state.dart';

///添加购物地址列表
class LifeAddAddressForm extends StatefulWidget {
  final LifeGoodsProvider provider;
  final LifeAddressProvider addressProvider;
  final Address address;

  LifeAddAddressForm(
      {Key key, this.provider, this.addressProvider, this.address})
      : assert(provider != null),
        super(key: key);

  @override
  State createState() => _LifeSettlementFormState();
}

class _LifeSettlementFormState extends State<LifeAddAddressForm> {
  var _nameController = TextEditingController();
  var _phoneController = TextEditingController();
  var _addressController = TextEditingController();
  AddressTagData _tag;
  bool _isDefault = false;
  String _region;

  @override
  void initState() {
    super.initState();
    if (widget?.address != null) {
      _nameController.text = widget?.address?.name;
      _phoneController.text = widget?.address?.phone;
      _addressController.text = widget?.address?.address;
      _region = widget?.address?.province;
      _tag = AddressTagData.fromJson(json.decode(widget?.address?.tag));
      _isDefault = widget?.address?.isDefault==LifeAddressProvider.addressDefault();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${S.of(context).life_add_address_title}',
          style: TextStyle(fontSize: Screen.spScreen16),
        ),
        centerTitle: true,
        actions: <Widget>[
          RaisedButton(
              onPressed: () {
                if (widget?.address == null) {
                  BlocProvider.of<LifeAddAddressBloc>(context).add(
                      SaveAddressEvent(
                          provider: widget.addressProvider,
                          context: this.context,
                          name: _nameController.text,
                          phone: _phoneController.text,
                          address: _addressController.text,
                          province: _region,
                          city: _region,
                          area: _region,
                          isDefault: _isDefault,
                          tag: jsonEncode(_tag.toJson())));
                } else {
                  BlocProvider.of<LifeAddAddressBloc>(context).add(
                      UpdateAddressEvent(
                          context: this.context,
                          provider: widget.addressProvider,
                          id: widget?.address?.id,
                          name: _nameController.text,
                          phone: _phoneController.text,
                          address: _addressController.text,
                          province: _region,
                          city: _region,
                          area: _region,
                          isDefault: _isDefault,
                          tag: jsonEncode(_tag.toJson())));
                }
              },
              color: colorPrimary,
              child: Text('${S.of(context).life_add_address_save}',
                  style: TextStyle(
                      fontSize: Screen.spScreen16, color: Colors.white)))
        ],
      ),
      body: BlocWidget<LifeAddAddressBloc>(
        builder: BlocBuilder<LifeAddAddressBloc, BlocState>(
          builder: (ctx, state) {
            if (state is SelectContactState) {
              _nameController.text = state.fullName;
              _phoneController.text = state.phoneNumber;
            }
            if (state is SwitchDefaultAddressState) {
              print('==state=isSwitch='+state.isSwitch.toString());
              _isDefault = state.isSwitch;
            }
            if (state is SelectCityState) {
              StringBuffer buffer = new StringBuffer();
              buffer.write(
                  state?.provinceName == null ? '' : state?.provinceName);
              buffer.write(state?.cityName == null ? '' : state?.cityName);
              buffer.write(state?.areaName == null ? '' : state?.areaName);
              if (buffer.toString().isNotEmpty) {
                _region = buffer.toString();
              }
            }
            return SingleChildScrollView(
              child: _buildBodyWidget(),
            );
          },
        ),
      ),
    );
  }

  Widget _buildBodyWidget() {
    return Column(
      children: <Widget>[
        TextFieldIcon(
          hintText: '${S.of(context).life_add_address_consignee_hint}',
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
          hintText: '${S.of(context).life_add_address_phone_hint}',
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
              _region == null
                  ? '${S.of(context).life_add_address_location_hint}'
                  : _region,
              style: TextStyle(
                  color: _region == null ? grey500Color : grey900Color,
                  fontSize: Screen.spScreen14),
            ),
          ),
        ),
        Gaps.line,
        TextFieldIcon(
          hintText: '${S.of(context).life_add_address_location_details_hint}',
          maxLines: 3,
          height: Screen.hScree80,
          controller: _addressController,
        ),
        Gaps.line,
        Gaps.vGap20,
        AddressTagItem(
          value: _tag,
          text: '${S.of(context).life_add_address_tag_hint}',
          height: Screen.hScree45,
          onTap: (value) {
            _tag = value;
          },
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
              Text('${S.of(context).life_add_address_default_hint}',
                  style: TextStyle(
                      color: grey900Color, fontSize: Screen.spScreen14)),
              Container(
                child: Switch(
                    value: _isDefault,
                    onChanged: (value) =>
                        BlocProvider.of<LifeAddAddressBloc>(context)
                            .add(SwitchDefaultAddressEvent(isSwitch: !value))),
              )
            ],
          ),
        )
      ],
    );
  }
}
