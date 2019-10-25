import 'package:json_annotation/json_annotation.dart';

part 'life_goods_category_data.g.dart';


@JsonSerializable()
class LifeGoodsCategoryData extends Object {

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  List<CategoryGoodsData> categoryGoodsData;

  LifeGoodsCategoryData(this.code,this.message,this.categoryGoodsData,);

  factory LifeGoodsCategoryData.fromJson(Map<String, dynamic> srcJson) => _$LifeGoodsCategoryDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LifeGoodsCategoryDataToJson(this);

}


@JsonSerializable()
class CategoryGoodsData extends Object {

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'oriPrice')
  double oriPrice;

  @JsonKey(name: 'presentPrice')
  double presentPrice;

  @JsonKey(name: 'goodsName')
  String goodsName;

  @JsonKey(name: 'goodsId')
  String goodsId;

  CategoryGoodsData(this.image,this.oriPrice,this.presentPrice,this.goodsName,this.goodsId,);

  factory CategoryGoodsData.fromJson(Map<String, dynamic> srcJson) => _$CategoryGoodsDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryGoodsDataToJson(this);

}