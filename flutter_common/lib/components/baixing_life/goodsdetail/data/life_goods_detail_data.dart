import 'package:json_annotation/json_annotation.dart';

part 'life_goods_detail_data.g.dart';

@JsonSerializable()
class LifeGoodsDetailData extends Object {
  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  GoodsDetailData goodsDetailData;

  LifeGoodsDetailData(
    this.code,
    this.message,
    this.goodsDetailData,
  );

  factory LifeGoodsDetailData.fromJson(Map<String, dynamic> srcJson) =>
      _$LifeGoodsDetailDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LifeGoodsDetailDataToJson(this);
}

@JsonSerializable()
class GoodsDetailData extends Object {
  @JsonKey(name: 'goodInfo')
  GoodInfo goodInfo;

  @JsonKey(name: 'goodComments')
  List<dynamic> goodComments;

  @JsonKey(name: 'advertesPicture')
  AdvertesPicture advertesPicture;

  GoodsDetailData(
    this.goodInfo,
    this.goodComments,
    this.advertesPicture,
  );

  factory GoodsDetailData.fromJson(Map<String, dynamic> srcJson) =>
      _$GoodsDetailDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GoodsDetailDataToJson(this);
}

@JsonSerializable()
class GoodInfo extends Object {
  @JsonKey(name: 'image5')
  String image5;

  @JsonKey(name: 'amount')
  int amount;

  @JsonKey(name: 'image3')
  String image3;

  @JsonKey(name: 'image4')
  String image4;

  @JsonKey(name: 'goodsId')
  String goodsId;

  @JsonKey(name: 'isOnline')
  String isOnline;

  @JsonKey(name: 'image1')
  String image1;

  @JsonKey(name: 'image2')
  String image2;

  @JsonKey(name: 'goodsSerialNumber')
  String goodsSerialNumber;

  @JsonKey(name: 'oriPrice')
  double oriPrice;

  @JsonKey(name: 'presentPrice')
  dynamic presentPrice;

  @JsonKey(name: 'comPic')
  String comPic;

  @JsonKey(name: 'state')
  int state;

  @JsonKey(name: 'shopId')
  String shopId;

  @JsonKey(name: 'goodsName')
  String goodsName;

  @JsonKey(name: 'goodsDetail')
  String goodsDetail;
  @JsonKey(name: 'goodsCartNum')
  int goodsCartNum;
  @JsonKey(name: 'isCheck')
  bool isCheck;

  GoodInfo(
      this.image5,
      this.amount,
      this.image3,
      this.image4,
      this.goodsId,
      this.isOnline,
      this.image1,
      this.image2,
      this.goodsSerialNumber,
      this.oriPrice,
      this.presentPrice,
      this.comPic,
      this.state,
      this.shopId,
      this.goodsName,
      this.goodsDetail,
      this.isCheck,
      this.goodsCartNum);

  factory GoodInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$GoodInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GoodInfoToJson(this);
}

@JsonSerializable()
class AdvertesPicture extends Object {
  @JsonKey(name: 'PICTURE_ADDRESS')
  String pICTUREADDRESS;

  @JsonKey(name: 'TO_PLACE')
  String tOPLACE;

  AdvertesPicture(
    this.pICTUREADDRESS,
    this.tOPLACE,
  );

  factory AdvertesPicture.fromJson(Map<String, dynamic> srcJson) =>
      _$AdvertesPictureFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AdvertesPictureToJson(this);
}
