// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_life_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberLifeData _$MemberLifeDataFromJson(Map<String, dynamic> json) {
  return MemberLifeData(
    json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
    (json['tool'] as List)
        ?.map(
            (e) => e == null ? null : Tool.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['order'] as List)
        ?.map(
            (e) => e == null ? null : Order.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['equity'] as List)
        ?.map((e) =>
            e == null ? null : Equity.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['vip'] == null
        ? null
        : Vip.fromJson(json['vip'] as Map<String, dynamic>),
    (json['focus'] as List)
        ?.map(
            (e) => e == null ? null : Focus.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MemberLifeDataToJson(MemberLifeData instance) =>
    <String, dynamic>{
      'user': instance.user,
      'tool': instance.tool,
      'order': instance.order,
      'equity': instance.equity,
      'vip': instance.vip,
      'focus': instance.focus,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    json['name'] as String,
    json['advert'] as String,
    json['phone'] as String,
    json['token'] as String,
    (json['user_tab'] as List)
        ?.map((e) =>
            e == null ? null : User_tab.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'advert': instance.advert,
      'phone': instance.phone,
      'token': instance.token,
      'user_tab': instance.userTab,
    };

User_tab _$User_tabFromJson(Map<String, dynamic> json) {
  return User_tab(
    json['id'] as int,
    json['user_tab_title'] as String,
    json['user_tab_num'] as int,
  );
}

Map<String, dynamic> _$User_tabToJson(User_tab instance) => <String, dynamic>{
      'id': instance.id,
      'user_tab_title': instance.userTabTitle,
      'user_tab_num': instance.userTabNum,
    };

Tool _$ToolFromJson(Map<String, dynamic> json) {
  return Tool(
    json['id'] as int,
    json['tool_icon'] as String,
    json['tool_title'] as String,
  );
}

Map<String, dynamic> _$ToolToJson(Tool instance) => <String, dynamic>{
      'id': instance.id,
      'tool_icon': instance.toolIcon,
      'tool_title': instance.toolTitle,
    };

Order _$OrderFromJson(Map<String, dynamic> json) {
  return Order(
    json['id'] as int,
    json['order_icon'] as String,
    json['order_title'] as String,
  );
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'order_icon': instance.orderIcon,
      'order_title': instance.orderTitle,
    };

Equity _$EquityFromJson(Map<String, dynamic> json) {
  return Equity(
    json['id'] as int,
    json['equity_icon'] as String,
    json['equity_title'] as String,
  );
}

Map<String, dynamic> _$EquityToJson(Equity instance) => <String, dynamic>{
      'id': instance.id,
      'equity_icon': instance.equityIcon,
      'equity_title': instance.equityTitle,
    };

Vip _$VipFromJson(Map<String, dynamic> json) {
  return Vip(
    json['vip_icon'] as String,
    json['vip_url'] as String,
    json['voucher'] as String,
    json['voucher_declare'] as String,
  );
}

Map<String, dynamic> _$VipToJson(Vip instance) => <String, dynamic>{
      'vip_icon': instance.vipIcon,
      'vip_url': instance.vipUrl,
      'voucher': instance.voucher,
      'voucher_declare': instance.voucherDeclare,
    };

Focus _$FocusFromJson(Map<String, dynamic> json) {
  return Focus(
    json['id'] as int,
    json['focus_pay_icon'] as String,
    json['focus_pay_title'] as String,
    json['focus_button_title'] as String,
    json['focus_pay_describe'] as String,
    json['focus_content_title'] as String,
    json['focus_describe_title'] as String,
    json['focus_more_title'] as String,
    (json['content'] as List)
        ?.map((e) =>
            e == null ? null : Content.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$FocusToJson(Focus instance) => <String, dynamic>{
      'id': instance.id,
      'focus_pay_icon': instance.focusPayIcon,
      'focus_pay_title': instance.focusPayTitle,
      'focus_button_title': instance.focusButtonTitle,
      'focus_pay_describe': instance.focusPayDescribe,
      'focus_content_title': instance.focusContentTitle,
      'focus_describe_title': instance.focusDescribeTitle,
      'focus_more_title': instance.focusMoreTitle,
      'content': instance.content,
    };

Content _$ContentFromJson(Map<String, dynamic> json) {
  return Content(
    json['id'] as int,
    json['icon'] as String,
    json['title'] as String,
  );
}

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'title': instance.title,
    };
