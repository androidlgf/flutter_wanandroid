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
          ?.map((e) => e == null
              ? null
              : CategoryGoodsData.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$LifeGoodsCategoryDataToJson(
        LifeGoodsCategoryData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.categoryGoodsData
    };

CategoryGoodsData _$CategoryGoodsDataFromJson(Map<String, dynamic> json) {
  return CategoryGoodsData(
      json['image'] as String,
      (json['oriPrice'] as num)?.toDouble(),
      (json['presentPrice'] as num)?.toDouble(),
      json['goodsName'] as String,
      json['goodsId'] as String);
}

Map<String, dynamic> _$CategoryGoodsDataToJson(CategoryGoodsData instance) =>
    <String, dynamic>{
      'image': instance.image,
      'oriPrice': instance.oriPrice,
      'presentPrice': instance.presentPrice,
      'goodsName': instance.goodsName,
      'goodsId': instance.goodsId
    };
