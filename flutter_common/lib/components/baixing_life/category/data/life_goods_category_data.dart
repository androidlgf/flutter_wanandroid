import 'package:json_annotation/json_annotation.dart';

part 'life_goods_category_data.g.dart';


@JsonSerializable()
class LifeGoodsCategoryData extends Object {

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  List<CategoryData> categoryData;

  LifeGoodsCategoryData(this.code,this.message,this.categoryData,);

  factory LifeGoodsCategoryData.fromJson(Map<String, dynamic> srcJson) => _$LifeGoodsCategoryDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LifeGoodsCategoryDataToJson(this);

}


@JsonSerializable()
class CategoryData extends Object {

  @JsonKey(name: 'mallCategoryId')
  String mallCategoryId;

  @JsonKey(name: 'mallCategoryName')
  String mallCategoryName;

  @JsonKey(name: 'bxMallSubDto')
  List<BxMallSubDto> bxMallSubDto;

  @JsonKey(name: 'image')
  String image;

  CategoryData(this.mallCategoryId,this.mallCategoryName,this.bxMallSubDto,this.image,);

  factory CategoryData.fromJson(Map<String, dynamic> srcJson) => _$CategoryDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryDataToJson(this);

}


@JsonSerializable()
class BxMallSubDto extends Object {

  @JsonKey(name: 'mallSubId')
  String mallSubId;

  @JsonKey(name: 'mallCategoryId')
  String mallCategoryId;

  @JsonKey(name: 'mallSubName')
  String mallSubName;

  @JsonKey(name: 'comments')
  String comments;

  BxMallSubDto(this.mallSubId,this.mallCategoryId,this.mallSubName,this.comments,);

  factory BxMallSubDto.fromJson(Map<String, dynamic> srcJson) => _$BxMallSubDtoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BxMallSubDtoToJson(this);

}


