import 'package:json_annotation/json_annotation.dart';

part 'i_brand_home_data.g.dart';


@JsonSerializable()
class IBrandHomeData extends Object {

  @JsonKey(name: 'status')
  bool status;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'data')
  IBrandData iBrandData;

  IBrandHomeData(this.status,this.code,this.iBrandData,);

  factory IBrandHomeData.fromJson(Map<String, dynamic> srcJson) => _$IBrandHomeDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$IBrandHomeDataToJson(this);

}


@JsonSerializable()
class IBrandData extends Object {

  @JsonKey(name: 'carousels')
  List<Carousels> carousels;

  @JsonKey(name: 'categories')
  List<Categories> categories;

  @JsonKey(name: 'boyCategory')
  BoyCategory boyCategory;

  @JsonKey(name: 'girlCategory')
  GirlCategory girlCategory;

  IBrandData(this.carousels,this.categories,this.boyCategory,this.girlCategory,);

  factory IBrandData.fromJson(Map<String, dynamic> srcJson) => _$IBrandDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$IBrandDataToJson(this);

}


@JsonSerializable()
class Carousels extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'advert_id')
  int advertId;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'sort')
  int sort;

  @JsonKey(name: 'created_at')
  String createdAt;

  @JsonKey(name: 'updated_at')
  String updatedAt;

  Carousels(this.id,this.advertId,this.name,this.image,this.link,this.sort,this.createdAt,this.updatedAt,);

  factory Carousels.fromJson(Map<String, dynamic> srcJson) => _$CarouselsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CarouselsToJson(this);

}


@JsonSerializable()
class Categories extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'advert_id')
  int advertId;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'sort')
  int sort;

  @JsonKey(name: 'created_at')
  String createdAt;

  @JsonKey(name: 'updated_at')
  String updatedAt;

  Categories(this.id,this.advertId,this.name,this.image,this.link,this.sort,this.createdAt,this.updatedAt,);

  factory Categories.fromJson(Map<String, dynamic> srcJson) => _$CategoriesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);

}


@JsonSerializable()
class BoyCategory extends Object {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'items')
  List<IBrandItems> iBrandItems;

  BoyCategory(this.name,this.link,this.iBrandItems,);

  factory BoyCategory.fromJson(Map<String, dynamic> srcJson) => _$BoyCategoryFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BoyCategoryToJson(this);

}


@JsonSerializable()
class IBrandItems extends Object {

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
  String tags;

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

  IBrandItems(this.id,this.name,this.goodsNo,this.brandId,this.modelId,this.minPrice,this.maxPrice,this.sellPrice,this.marketPrice,this.minMarketPrice,this.storeNums,this.img,this.content,this.sync,this.commentCount,this.visitCount,this.favoriteCount,this.saleCount,this.grade,this.tags,this.keywords,this.description,this.isDel,this.isLargess,this.isCommend,this.isNew,this.extra,this.createdAt,this.updatedAt,);

  factory IBrandItems.fromJson(Map<String, dynamic> srcJson) => _$IBrandItemsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$IBrandItemsToJson(this);

}


@JsonSerializable()
class GirlCategory extends Object {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'items')
  List<IBrandItems> iBrandItems;

  GirlCategory(this.name,this.link,this.iBrandItems,);

  factory GirlCategory.fromJson(Map<String, dynamic> srcJson) => _$GirlCategoryFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GirlCategoryToJson(this);

}


