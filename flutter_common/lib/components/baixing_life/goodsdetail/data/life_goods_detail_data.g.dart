// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'life_goods_detail_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LifeGoodsDetailData _$LifeGoodsDetailDataFromJson(Map<String, dynamic> json) {
  return LifeGoodsDetailData(
      json['code'] as String,
      json['message'] as String,
      json['data'] == null
          ? null
          : GoodsDetailData.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$LifeGoodsDetailDataToJson(
        LifeGoodsDetailData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.goodsDetailData
    };

GoodsDetailData _$GoodsDetailDataFromJson(Map<String, dynamic> json) {
  return GoodsDetailData(
      json['goodInfo'] == null
          ? null
          : GoodInfo.fromJson(json['goodInfo'] as Map<String, dynamic>),
      json['goodComments'] as List,
      json['advertesPicture'] == null
          ? null
          : AdvertesPicture.fromJson(
              json['advertesPicture'] as Map<String, dynamic>));
}

Map<String, dynamic> _$GoodsDetailDataToJson(GoodsDetailData instance) =>
    <String, dynamic>{
      'goodInfo': instance.goodInfo,
      'goodComments': instance.goodComments,
      'advertesPicture': instance.advertesPicture
    };

GoodInfo _$GoodInfoFromJson(Map<String, dynamic> json) {
  return GoodInfo(
      json['image5'] as String,
      json['amount'] as int,
      json['image3'] as String,
      json['image4'] as String,
      json['goodsId'] as String,
      json['isOnline'] as String,
      json['image1'] as String,
      json['image2'] as String,
      json['goodsSerialNumber'] as String,
      (json['oriPrice'] as num)?.toDouble(),
      json['presentPrice'],
      json['comPic'] as String,
      json['state'] as int,
      json['shopId'] as String,
      json['goodsName'] as String,
      json['goodsDetail'] as String);
}

Map<String, dynamic> _$GoodInfoToJson(GoodInfo instance) => <String, dynamic>{
      'image5': instance.image5,
      'amount': instance.amount,
      'image3': instance.image3,
      'image4': instance.image4,
      'goodsId': instance.goodsId,
      'isOnline': instance.isOnline,
      'image1': instance.image1,
      'image2': instance.image2,
      'goodsSerialNumber': instance.goodsSerialNumber,
      'oriPrice': instance.oriPrice,
      'presentPrice': instance.presentPrice,
      'comPic': instance.comPic,
      'state': instance.state,
      'shopId': instance.shopId,
      'goodsName': instance.goodsName,
      'goodsDetail': instance.goodsDetail
    };

AdvertesPicture _$AdvertesPictureFromJson(Map<String, dynamic> json) {
  return AdvertesPicture(
      json['PICTURE_ADDRESS'] as String, json['TO_PLACE'] as String);
}

Map<String, dynamic> _$AdvertesPictureToJson(AdvertesPicture instance) =>
    <String, dynamic>{
      'PICTURE_ADDRESS': instance.pICTUREADDRESS,
      'TO_PLACE': instance.tOPLACE
    };
