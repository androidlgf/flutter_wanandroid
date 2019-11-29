import 'package:json_annotation/json_annotation.dart';

part 'life_home_data.g.dart';


@JsonSerializable()
class LifeHomeData extends Object {

  @JsonKey(name: 'code')
  String code;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'data')
  HomeData homeData;

  LifeHomeData(this.code,this.message,this.homeData,);

  factory LifeHomeData.fromJson(Map<String, dynamic> srcJson) => _$LifeHomeDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LifeHomeDataToJson(this);

}


@JsonSerializable()
class HomeData extends Object {

  @JsonKey(name: 'slides')
  List<Slides> slides;

  @JsonKey(name: 'shopInfo')
  ShopInfo shopInfo;

  @JsonKey(name: 'integralMallPic')
  IntegralMallPic integralMallPic;

  @JsonKey(name: 'toShareCode')
  ToShareCode toShareCode;

  @JsonKey(name: 'recommend')
  List<Recommend> recommend;

  @JsonKey(name: 'advertesPicture')
  AdvertesPicture advertesPicture;

  @JsonKey(name: 'floor1')
  List<Floor1> floor1;

  @JsonKey(name: 'floor2')
  List<Floor2> floor2;

  @JsonKey(name: 'floor3')
  List<Floor3> floor3;

  @JsonKey(name: 'saoma')
  Saoma saoma;

  @JsonKey(name: 'newUser')
  NewUser newUser;

  @JsonKey(name: 'floor1Pic')
  Floor1Pic floor1Pic;

  @JsonKey(name: 'floor2Pic')
  Floor2Pic floor2Pic;

  @JsonKey(name: 'floorName')
  FloorName floorName;

  @JsonKey(name: 'category')
  List<Category> category;

  @JsonKey(name: 'floor3Pic')
  Floor3Pic floor3Pic;

  @JsonKey(name: 'reservationGoods')
  List<dynamic> reservationGoods;

  HomeData(this.slides,this.shopInfo,this.integralMallPic,this.toShareCode,this.recommend,this.advertesPicture,this.floor1,this.floor2,this.floor3,this.saoma,this.newUser,this.floor1Pic,this.floor2Pic,this.floorName,this.category,this.floor3Pic,this.reservationGoods,);

  factory HomeData.fromJson(Map<String, dynamic> srcJson) => _$HomeDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeDataToJson(this);

}


@JsonSerializable()
class Slides extends Object {

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'goodsId')
  String goodsId;

  Slides(this.image,this.goodsId,);

  factory Slides.fromJson(Map<String, dynamic> srcJson) => _$SlidesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SlidesToJson(this);

}


@JsonSerializable()
class ShopInfo extends Object {

  @JsonKey(name: 'leaderImage')
  String leaderImage;

  @JsonKey(name: 'leaderPhone')
  String leaderPhone;

  ShopInfo(this.leaderImage,this.leaderPhone,);

  factory ShopInfo.fromJson(Map<String, dynamic> srcJson) => _$ShopInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ShopInfoToJson(this);

}


@JsonSerializable()
class IntegralMallPic extends Object {

  @JsonKey(name: 'PICTURE_ADDRESS')
  String pICTUREADDRESS;

  @JsonKey(name: 'TO_PLACE')
  String tOPLACE;

  IntegralMallPic(this.pICTUREADDRESS,this.tOPLACE,);

  factory IntegralMallPic.fromJson(Map<String, dynamic> srcJson) => _$IntegralMallPicFromJson(srcJson);

  Map<String, dynamic> toJson() => _$IntegralMallPicToJson(this);

}


@JsonSerializable()
class ToShareCode extends Object {

  @JsonKey(name: 'PICTURE_ADDRESS')
  String pICTUREADDRESS;

  @JsonKey(name: 'TO_PLACE')
  String tOPLACE;

  ToShareCode(this.pICTUREADDRESS,this.tOPLACE,);

  factory ToShareCode.fromJson(Map<String, dynamic> srcJson) => _$ToShareCodeFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ToShareCodeToJson(this);

}


@JsonSerializable()
class Recommend extends Object {

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'mallPrice')
  dynamic mallPrice;

  @JsonKey(name: 'goodsName')
  String goodsName;

  @JsonKey(name: 'goodsId')
  String goodsId;

  @JsonKey(name: 'price')
  dynamic price;

  Recommend(this.image,this.mallPrice,this.goodsName,this.goodsId,this.price,);

  factory Recommend.fromJson(Map<String, dynamic> srcJson) => _$RecommendFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RecommendToJson(this);

}


@JsonSerializable()
class AdvertesPicture extends Object {

  @JsonKey(name: 'PICTURE_ADDRESS')
  String pICTUREADDRESS;

  @JsonKey(name: 'TO_PLACE')
  String tOPLACE;

  AdvertesPicture(this.pICTUREADDRESS,this.tOPLACE,);

  factory AdvertesPicture.fromJson(Map<String, dynamic> srcJson) => _$AdvertesPictureFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AdvertesPictureToJson(this);

}


@JsonSerializable()
class Floor1 extends Object {

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'goodsId')
  String goodsId;

  Floor1(this.image,this.goodsId,);

  factory Floor1.fromJson(Map<String, dynamic> srcJson) => _$Floor1FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Floor1ToJson(this);

}


@JsonSerializable()
class Floor2 extends Object {

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'goodsId')
  String goodsId;

  Floor2(this.image,this.goodsId,);

  factory Floor2.fromJson(Map<String, dynamic> srcJson) => _$Floor2FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Floor2ToJson(this);

}


@JsonSerializable()
class Floor3 extends Object {

  @JsonKey(name: 'image')
  String image;

  @JsonKey(name: 'goodsId')
  String goodsId;

  Floor3(this.image,this.goodsId,);

  factory Floor3.fromJson(Map<String, dynamic> srcJson) => _$Floor3FromJson(srcJson);

  Map<String, dynamic> toJson() => _$Floor3ToJson(this);

}


@JsonSerializable()
class Saoma extends Object {

  @JsonKey(name: 'PICTURE_ADDRESS')
  String pICTUREADDRESS;

  @JsonKey(name: 'TO_PLACE')
  String tOPLACE;

  Saoma(this.pICTUREADDRESS,this.tOPLACE,);

  factory Saoma.fromJson(Map<String, dynamic> srcJson) => _$SaomaFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SaomaToJson(this);

}


@JsonSerializable()
class NewUser extends Object {

  @JsonKey(name: 'PICTURE_ADDRESS')
  String pICTUREADDRESS;

  @JsonKey(name: 'TO_PLACE')
  String tOPLACE;

  NewUser(this.pICTUREADDRESS,this.tOPLACE,);

  factory NewUser.fromJson(Map<String, dynamic> srcJson) => _$NewUserFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NewUserToJson(this);

}


@JsonSerializable()
class Floor1Pic extends Object {

  @JsonKey(name: 'PICTURE_ADDRESS')
  String pICTUREADDRESS;

  @JsonKey(name: 'TO_PLACE')
  String tOPLACE;

  Floor1Pic(this.pICTUREADDRESS,this.tOPLACE,);

  factory Floor1Pic.fromJson(Map<String, dynamic> srcJson) => _$Floor1PicFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Floor1PicToJson(this);

}


@JsonSerializable()
class Floor2Pic extends Object {

  @JsonKey(name: 'PICTURE_ADDRESS')
  String pICTUREADDRESS;

  @JsonKey(name: 'TO_PLACE')
  String tOPLACE;

  Floor2Pic(this.pICTUREADDRESS,this.tOPLACE,);

  factory Floor2Pic.fromJson(Map<String, dynamic> srcJson) => _$Floor2PicFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Floor2PicToJson(this);

}


@JsonSerializable()
class FloorName extends Object {

  @JsonKey(name: 'floor1')
  String floor1;

  @JsonKey(name: 'floor2')
  String floor2;

  @JsonKey(name: 'floor3')
  String floor3;

  FloorName(this.floor1,this.floor2,this.floor3,);

  factory FloorName.fromJson(Map<String, dynamic> srcJson) => _$FloorNameFromJson(srcJson);

  Map<String, dynamic> toJson() => _$FloorNameToJson(this);

}


@JsonSerializable()
class Category extends Object {

  @JsonKey(name: 'mallCategoryId')
  String mallCategoryId;

  @JsonKey(name: 'mallCategoryName')
  String mallCategoryName;

  @JsonKey(name: 'bxMallSubDto')
  List<BxMallSubDto> bxMallSubDto;

  @JsonKey(name: 'image')
  String image;

  Category(this.mallCategoryId,this.mallCategoryName,this.bxMallSubDto,this.image,);

  factory Category.fromJson(Map<String, dynamic> srcJson) => _$CategoryFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

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


@JsonSerializable()
class Floor3Pic extends Object {

  @JsonKey(name: 'PICTURE_ADDRESS')
  String pICTUREADDRESS;

  @JsonKey(name: 'TO_PLACE')
  String tOPLACE;

  Floor3Pic(this.pICTUREADDRESS,this.tOPLACE,);

  factory Floor3Pic.fromJson(Map<String, dynamic> srcJson) => _$Floor3PicFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Floor3PicToJson(this);

}