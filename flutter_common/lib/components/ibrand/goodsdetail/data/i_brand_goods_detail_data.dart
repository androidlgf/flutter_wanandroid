import 'package:json_annotation/json_annotation.dart';

part 'i_brand_goods_detail_data.g.dart';

@JsonSerializable()
class IBrandGoodsDetailData extends Object {
  @JsonKey(name: 'status')
  bool status;

  @JsonKey(name: 'data')
  GoodsDetailData goodsDetailData;

  @JsonKey(name: 'meta')
  Meta meta;

  IBrandGoodsDetailData(
    this.status,
    this.goodsDetailData,
    this.meta,
  );

  factory IBrandGoodsDetailData.fromJson(Map<String, dynamic> srcJson) =>
      _$IBrandGoodsDetailDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$IBrandGoodsDetailDataToJson(this);
}

@JsonSerializable()
class GoodsDetailData extends Object {
  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'goods_no')
  String goodsNo;

  @JsonKey(name: 'brand_id')
  int brandId;

  @JsonKey(name: 'model_id')
  int modelId;

  @JsonKey(name: 'min_price')
  String minPrice;

  @JsonKey(name: 'max_price')
  String maxPrice;

  @JsonKey(name: 'sell_price')
  String sellPrice;

  @JsonKey(name: 'market_price')
  String marketPrice;

  @JsonKey(name: 'min_market_price')
  String minMarketPrice;

  @JsonKey(name: 'store_nums')
  int storeNums;

  @JsonKey(name: 'img')
  String img;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'sync')
  int sync;

  @JsonKey(name: 'comment_count')
  int commentCount;

  @JsonKey(name: 'visit_count')
  int visitCount;

  @JsonKey(name: 'favorite_count')
  int favoriteCount;

  @JsonKey(name: 'sale_count')
  int saleCount;

  @JsonKey(name: 'grade')
  int grade;

  @JsonKey(name: 'tags')
  List<dynamic> tags;

  @JsonKey(name: 'keywords')
  String keywords;

  @JsonKey(name: 'description')
  String description;

  @JsonKey(name: 'is_del')
  int isDel;

  @JsonKey(name: 'is_largess')
  int isLargess;

  @JsonKey(name: 'is_commend')
  int isCommend;

  @JsonKey(name: 'is_new')
  int isNew;

  @JsonKey(name: 'extra')
  String extra;

  @JsonKey(name: 'created_at')
  String createdAt;

  @JsonKey(name: 'updated_at')
  String updatedAt;

  @JsonKey(name: 'weight')
  String weight;

  @JsonKey(name: 'contentpc')
  String contentpc;

  @JsonKey(name: 'collocation')
  String collocation;

  @JsonKey(name: 'deleted_at')
  String deletedAt;

  GoodsDetailData(
    this.id,
    this.name,
    this.goodsNo,
    this.brandId,
    this.modelId,
    this.minPrice,
    this.maxPrice,
    this.sellPrice,
    this.marketPrice,
    this.minMarketPrice,
    this.storeNums,
    this.img,
    this.content,
    this.sync,
    this.commentCount,
    this.visitCount,
    this.favoriteCount,
    this.saleCount,
    this.grade,
    this.tags,
    this.keywords,
    this.description,
    this.isDel,
    this.isLargess,
    this.isCommend,
    this.isNew,
    this.extra,
    this.createdAt,
    this.updatedAt,
    this.weight,
    this.contentpc,
    this.collocation,
    this.deletedAt,
  );

  factory GoodsDetailData.fromJson(Map<String, dynamic> srcJson) =>
      _$GoodsDetailDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GoodsDetailDataToJson(this);
}

@JsonSerializable()
class Meta extends Object {
  Meta();

  factory Meta.fromJson(Map<String, dynamic> srcJson) =>
      _$MetaFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}
