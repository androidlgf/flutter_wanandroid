// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'life_home_hot_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LifeHomeHotData _$LifeHomeHotDataFromJson(Map<String, dynamic> json) {
  return LifeHomeHotData(
      json['code'] as String,
      json['message'] as String,
      (json['data'] as List)
          ?.map((e) =>
              e == null ? null : LifeGood.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$LifeHomeHotDataToJson(LifeHomeHotData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.lifeGood
    };

LifeGood _$LifeGoodFromJson(Map<String, dynamic> json) {
  return LifeGood(
      json['name'] as String,
      json['image'] as String,
      (json['mallPrice'] as num)?.toDouble(),
      json['goodsId'] as String,
      (json['price'] as num)?.toDouble());
}

Map<String, dynamic> _$LifeGoodToJson(LifeGood instance) => <String, dynamic>{
      'name': instance.name,
      'image': instance.image,
      'mallPrice': instance.mallPrice,
      'goodsId': instance.goodsId,
      'price': instance.price
    };
