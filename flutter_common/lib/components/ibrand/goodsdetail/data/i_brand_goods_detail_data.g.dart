// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'i_brand_goods_detail_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IBrandGoodsDetailData _$IBrandGoodsDetailDataFromJson(
    Map<String, dynamic> json) {
  return IBrandGoodsDetailData(
    json['status'] as bool,
    json['data'] == null
        ? null
        : GoodsDetailData.fromJson(json['data'] as Map<String, dynamic>),
    json['meta'] == null
        ? null
        : Meta.fromJson(json['meta'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$IBrandGoodsDetailDataToJson(
        IBrandGoodsDetailData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.goodsDetailData,
      'meta': instance.meta,
    };

GoodsDetailData _$GoodsDetailDataFromJson(Map<String, dynamic> json) {
  return GoodsDetailData(
    json['id'] as int,
    json['name'] as String,
    json['goods_no'] as String,
    json['brand_id'] as int,
    json['model_id'] as int,
    json['min_price'] as String,
    json['max_price'] as String,
    json['sell_price'] as String,
    json['market_price'] as String,
    json['min_market_price'] as String,
    json['store_nums'] as int,
    json['img'] as String,
    json['content'] as String,
    json['sync'] as int,
    json['comment_count'] as int,
    json['visit_count'] as int,
    json['favorite_count'] as int,
    json['sale_count'] as int,
    json['grade'] as int,
    json['tags'] as List,
    json['keywords'] as String,
    json['description'] as String,
    json['is_del'] as int,
    json['is_largess'] as int,
    json['is_commend'] as int,
    json['is_new'] as int,
    json['extra'] as String,
    json['created_at'] as String,
    json['updated_at'] as String,
    json['weight'] as String,
    json['contentpc'] as String,
    json['collocation'] as String,
    json['deleted_at'] as String,
  );
}

Map<String, dynamic> _$GoodsDetailDataToJson(GoodsDetailData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'goods_no': instance.goodsNo,
      'brand_id': instance.brandId,
      'model_id': instance.modelId,
      'min_price': instance.minPrice,
      'max_price': instance.maxPrice,
      'sell_price': instance.sellPrice,
      'market_price': instance.marketPrice,
      'min_market_price': instance.minMarketPrice,
      'store_nums': instance.storeNums,
      'img': instance.img,
      'content': instance.content,
      'sync': instance.sync,
      'comment_count': instance.commentCount,
      'visit_count': instance.visitCount,
      'favorite_count': instance.favoriteCount,
      'sale_count': instance.saleCount,
      'grade': instance.grade,
      'tags': instance.tags,
      'keywords': instance.keywords,
      'description': instance.description,
      'is_del': instance.isDel,
      'is_largess': instance.isLargess,
      'is_commend': instance.isCommend,
      'is_new': instance.isNew,
      'extra': instance.extra,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'weight': instance.weight,
      'contentpc': instance.contentpc,
      'collocation': instance.collocation,
      'deleted_at': instance.deletedAt,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return Meta();
}

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{};
