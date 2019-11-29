import 'package:json_annotation/json_annotation.dart';

part 'life_home_hot_data.g.dart';

@JsonSerializable()
class LifeHomeHotData extends Object {
  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  List<LifeGood> lifeGood;

  LifeHomeHotData(
    this.code,
    this.message,
    this.lifeGood,
  );

  factory LifeHomeHotData.fromJson(Map<String, dynamic> srcJson) =>
      _$LifeHomeHotDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LifeHomeHotDataToJson(this);
}

@JsonSerializable()
class LifeGood extends Object {
  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'mallPrice')
  double mallPrice;

  @JsonKey(name: 'goodsId')
  String goodsId;

  @JsonKey(name: 'price')
  double price;

  LifeGood(
    this.name,
    this.image,
    this.mallPrice,
    this.goodsId,
    this.price,
  );

  factory LifeGood.fromJson(Map<String, dynamic> srcJson) =>
      _$LifeGoodFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LifeGoodToJson(this);
}
