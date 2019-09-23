// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_banner_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBannerData _$HomeBannerDataFromJson(Map<String, dynamic> json) {
  return HomeBannerData(
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : BannerData.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['errorCode'] as int,
      json['errorMsg'] as String);
}

Map<String, dynamic> _$HomeBannerDataToJson(HomeBannerData instance) =>
    <String, dynamic>{
      'data': instance.bannerData,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg
    };

BannerData _$BannerDataFromJson(Map<String, dynamic> json) {
  return BannerData(
      json['desc'] as String,
      json['id'] as int,
      json['imagePath'] as String,
      json['isVisible'] as int,
      json['order'] as int,
      json['title'] as String,
      json['type'] as int,
      json['url'] as String);
}

Map<String, dynamic> _$BannerDataToJson(BannerData instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'id': instance.id,
      'imagePath': instance.imagePath,
      'isVisible': instance.isVisible,
      'order': instance.order,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url
    };
