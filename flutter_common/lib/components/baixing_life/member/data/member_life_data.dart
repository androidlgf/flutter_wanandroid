import 'package:json_annotation/json_annotation.dart';

part 'member_life_data.g.dart';


@JsonSerializable()
class MemberLifeData extends Object {

  @JsonKey(name: 'user')
  User user;

  @JsonKey(name: 'tool')
  List<Tool> tool;

  @JsonKey(name: 'order')
  List<Order> order;

  @JsonKey(name: 'equity')
  List<Equity> equity;

  @JsonKey(name: 'vip')
  Vip vip;

  @JsonKey(name: 'focus')
  List<Focus> focus;

  MemberLifeData(this.user,this.tool,this.order,this.equity,this.vip,this.focus,);

  factory MemberLifeData.fromJson(Map<String, dynamic> srcJson) => _$MemberLifeDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MemberLifeDataToJson(this);

}


@JsonSerializable()
class User extends Object {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'advert')
  String advert;

  @JsonKey(name: 'phone')
  String phone;

  @JsonKey(name: 'token')
  String token;

  @JsonKey(name: 'user_tab')
  List<User_tab> userTab;

  User(this.name,this.advert,this.phone,this.token,this.userTab,);

  factory User.fromJson(Map<String, dynamic> srcJson) => _$UserFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserToJson(this);

}


@JsonSerializable()
class User_tab extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'user_tab_title')
  String userTabTitle;

  @JsonKey(name: 'user_tab_num')
  int userTabNum;

  User_tab(this.id,this.userTabTitle,this.userTabNum,);

  factory User_tab.fromJson(Map<String, dynamic> srcJson) => _$User_tabFromJson(srcJson);

  Map<String, dynamic> toJson() => _$User_tabToJson(this);

}


@JsonSerializable()
class Tool extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'tool_icon')
  String toolIcon;

  @JsonKey(name: 'tool_title')
  String toolTitle;

  Tool(this.id,this.toolIcon,this.toolTitle,);

  factory Tool.fromJson(Map<String, dynamic> srcJson) => _$ToolFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ToolToJson(this);

}


@JsonSerializable()
class Order extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'order_icon')
  String orderIcon;

  @JsonKey(name: 'order_title')
  String orderTitle;

  Order(this.id,this.orderIcon,this.orderTitle,);

  factory Order.fromJson(Map<String, dynamic> srcJson) => _$OrderFromJson(srcJson);

  Map<String, dynamic> toJson() => _$OrderToJson(this);

}


@JsonSerializable()
class Equity extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'equity_icon')
  String equityIcon;

  @JsonKey(name: 'equity_title')
  String equityTitle;

  Equity(this.id,this.equityIcon,this.equityTitle,);

  factory Equity.fromJson(Map<String, dynamic> srcJson) => _$EquityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$EquityToJson(this);

}


@JsonSerializable()
class Vip extends Object {

  @JsonKey(name: 'vip_icon')
  String vipIcon;

  @JsonKey(name: 'vip_url')
  String vipUrl;

  @JsonKey(name: 'voucher')
  String voucher;

  @JsonKey(name: 'voucher_declare')
  String voucherDeclare;

  Vip(this.vipIcon,this.vipUrl,this.voucher,this.voucherDeclare,);

  factory Vip.fromJson(Map<String, dynamic> srcJson) => _$VipFromJson(srcJson);

  Map<String, dynamic> toJson() => _$VipToJson(this);

}


@JsonSerializable()
class Focus extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'focus_pay_icon')
  String focusPayIcon;

  @JsonKey(name: 'focus_pay_title')
  String focusPayTitle;

  @JsonKey(name: 'focus_button_title')
  String focusButtonTitle;

  @JsonKey(name: 'focus_pay_describe')
  String focusPayDescribe;

  @JsonKey(name: 'focus_content_title')
  String focusContentTitle;

  @JsonKey(name: 'focus_describe_title')
  String focusDescribeTitle;

  @JsonKey(name: 'focus_more_title')
  String focusMoreTitle;

  @JsonKey(name: 'content')
  List<Content> content;

  Focus(this.id,this.focusPayIcon,this.focusPayTitle,this.focusButtonTitle,this.focusPayDescribe,this.focusContentTitle,this.focusDescribeTitle,this.focusMoreTitle,this.content,);

  factory Focus.fromJson(Map<String, dynamic> srcJson) => _$FocusFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FocusToJson(this);

}


@JsonSerializable()
class Content extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'icon')
  String icon;

  @JsonKey(name: 'title')
  String title;

  Content(this.id,this.icon,this.title,);

  factory Content.fromJson(Map<String, dynamic> srcJson) => _$ContentFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ContentToJson(this);

}