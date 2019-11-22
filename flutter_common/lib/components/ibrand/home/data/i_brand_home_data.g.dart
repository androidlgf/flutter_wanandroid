// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'i_brand_home_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IBrandHomeData _$IBrandHomeDataFromJson(Map<String, dynamic> json) {
  return IBrandHomeData(
    json['status'] as bool,
    json['code'] as int,
    json['data'] == null
        ? null
        : IBrandData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$IBrandHomeDataToJson(IBrandHomeData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'data': instance.iBrandData,
    };

IBrandData _$IBrandDataFromJson(Map<String, dynamic> json) {
  return IBrandData(
    (json['carousels'] as List)
        ?.map((e) =>
            e == null ? null : Carousels.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['categories'] as List)
        ?.map((e) =>
            e == null ? null : Categories.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['boyCategory'] == null
        ? null
        : BoyCategory.fromJson(json['boyCategory'] as Map<String, dynamic>),
    json['girlCategory'] == null
        ? null
        : GirlCategory.fromJson(json['girlCategory'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$IBrandDataToJson(IBrandData instance) =>
    <String, dynamic>{
      'carousels': instance.carousels,
      'categories': instance.categories,
      'boyCategory': instance.boyCategory,
      'girlCategory': instance.girlCategory,
    };

Carousels _$CarouselsFromJson(Map<String, dynamic> json) {
  return Carousels(
    json['id'] as int,
    json['advert_id'] as int,
    json['name'] as String,
    json['image'] as String,
    json['link'] as String,
    json['sort'] as int,
    json['created_at'] as String,
    json['updated_at'] as String,
  );
}

Map<String, dynamic> _$CarouselsToJson(Carousels instance) => <String, dynamic>{
      'id': instance.id,
      'advert_id': instance.advertId,
      'name': instance.name,
      'image': instance.image,
      'link': instance.link,
      'sort': instance.sort,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

Categories _$CategoriesFromJson(Map<String, dynamic> json) {
  return Categories(
    json['id'] as int,
    json['advert_id'] as int,
    json['name'] as String,
    json['image'] as String,
    json['link'] as String,
    json['sort'] as int,
    json['created_at'] as String,
    json['updated_at'] as String,
  );
}

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'id': instance.id,
      'advert_id': instance.advertId,
      'name': instance.name,
      'image': instance.image,
      'link': instance.link,
      'sort': instance.sort,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };

BoyCategory _$BoyCategoryFromJson(Map<String, dynamic> json) {
  return BoyCategory(
    json['name'] as String,
    json['link'] as String,
    (json['items'] as List)
        ?.map((e) =>
            e == null ? null : IBrandItems.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$BoyCategoryToJson(BoyCategory instance) =>
    <String, dynamic>{
      'name': instance.name,
      'link': instance.link,
      'items': instance.iBrandItems,
    };

IBrandItems _$IBrandItemsFromJson(Map<String, dynamic> json) {
  return IBrandItems(
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
    json['tags'] as String,
    json['keywords'] as String,
    json['description'] as String,
    json['is_del'] as int,
    json['is_largess'] as int,
    json['is_commend'] as int,
    json['is_new'] as int,
    json['extra'] as String,
    json['created_at'] as String,
    json['updated_at'] as String,
  );
}

Map<String, dynamic> _$IBrandItemsToJson(IBrandItems instance) =>
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
    };

GirlCategory _$GirlCategoryFromJson(Map<String, dynamic> json) {
  return GirlCategory(
    json['name'] as String,
    json['link'] as String,
    (json['items'] as List)
        ?.map((e) =>
            e == null ? null : IBrandItems.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GirlCategoryToJson(GirlCategory instance) =>
    <String, dynamic>{
      'name': instance.name,
      'link': instance.link,
      'items': instance.iBrandItems,
    };
