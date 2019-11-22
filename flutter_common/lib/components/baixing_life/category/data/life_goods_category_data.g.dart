// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'life_goods_category_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LifeGoodsCategoryData _$LifeGoodsCategoryDataFromJson(
    Map<String, dynamic> json) {
  return LifeGoodsCategoryData(
    json['code'] as String,
    json['message'] as String,
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : CategoryData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$LifeGoodsCategoryDataToJson(
        LifeGoodsCategoryData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.categoryData,
    };

CategoryData _$CategoryDataFromJson(Map<String, dynamic> json) {
  return CategoryData(
    json['mallCategoryId'] as String,
    json['mallCategoryName'] as String,
    (json['bxMallSubDto'] as List)
        ?.map((e) =>
            e == null ? null : BxMallSubDto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['image'] as String,
  );
}

Map<String, dynamic> _$CategoryDataToJson(CategoryData instance) =>
    <String, dynamic>{
      'mallCategoryId': instance.mallCategoryId,
      'mallCategoryName': instance.mallCategoryName,
      'bxMallSubDto': instance.bxMallSubDto,
      'image': instance.image,
    };

BxMallSubDto _$BxMallSubDtoFromJson(Map<String, dynamic> json) {
  return BxMallSubDto(
    json['mallSubId'] as String,
    json['mallCategoryId'] as String,
    json['mallSubName'] as String,
    json['comments'] as String,
  );
}

Map<String, dynamic> _$BxMallSubDtoToJson(BxMallSubDto instance) =>
    <String, dynamic>{
      'mallSubId': instance.mallSubId,
      'mallCategoryId': instance.mallCategoryId,
      'mallSubName': instance.mallSubName,
      'comments': instance.comments,
    };
