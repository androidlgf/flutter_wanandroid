import 'package:json_annotation/json_annotation.dart';

part 'home_banner_data.g.dart';


@JsonSerializable()
class HomeBannerData extends Object {

  @JsonKey(name: 'data')
  List<BannerData> bannerData;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  HomeBannerData(this.bannerData,this.errorCode,this.errorMsg,);

  factory HomeBannerData.fromJson(Map<String, dynamic> srcJson) => _$HomeBannerDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeBannerDataToJson(this);

}


@JsonSerializable()
class BannerData extends Object {

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'imagePath')
  String imagePath;

  @JsonKey(name: 'isVisible')
  int isVisible;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'url')
  String url;

  BannerData(this.desc,this.id,this.imagePath,this.isVisible,this.order,this.title,this.type,this.url,);

  factory BannerData.fromJson(Map<String, dynamic> srcJson) => _$BannerDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BannerDataToJson(this);

}


