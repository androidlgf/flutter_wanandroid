// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'life_home_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LifeHomeData _$LifeHomeDataFromJson(Map<String, dynamic> json) {
  return LifeHomeData(
    json['code'] as String,
    json['message'] as String,
    json['data'] == null
        ? null
        : HomeData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LifeHomeDataToJson(LifeHomeData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'data': instance.homeData,
    };

HomeData _$HomeDataFromJson(Map<String, dynamic> json) {
  return HomeData(
    (json['slides'] as List)
        ?.map((e) =>
            e == null ? null : Slides.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['shopInfo'] == null
        ? null
        : ShopInfo.fromJson(json['shopInfo'] as Map<String, dynamic>),
    json['integralMallPic'] == null
        ? null
        : IntegralMallPic.fromJson(
            json['integralMallPic'] as Map<String, dynamic>),
    json['toShareCode'] == null
        ? null
        : ToShareCode.fromJson(json['toShareCode'] as Map<String, dynamic>),
    (json['recommend'] as List)
        ?.map((e) =>
            e == null ? null : Recommend.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['advertesPicture'] == null
        ? null
        : AdvertesPicture.fromJson(
            json['advertesPicture'] as Map<String, dynamic>),
    (json['floor1'] as List)
        ?.map((e) =>
            e == null ? null : Floor1.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['floor2'] as List)
        ?.map((e) =>
            e == null ? null : Floor2.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['floor3'] as List)
        ?.map((e) =>
            e == null ? null : Floor3.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['saoma'] == null
        ? null
        : Saoma.fromJson(json['saoma'] as Map<String, dynamic>),
    json['newUser'] == null
        ? null
        : NewUser.fromJson(json['newUser'] as Map<String, dynamic>),
    json['floor1Pic'] == null
        ? null
        : Floor1Pic.fromJson(json['floor1Pic'] as Map<String, dynamic>),
    json['floor2Pic'] == null
        ? null
        : Floor2Pic.fromJson(json['floor2Pic'] as Map<String, dynamic>),
    json['floorName'] == null
        ? null
        : FloorName.fromJson(json['floorName'] as Map<String, dynamic>),
    (json['category'] as List)
        ?.map((e) =>
            e == null ? null : Category.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['floor3Pic'] == null
        ? null
        : Floor3Pic.fromJson(json['floor3Pic'] as Map<String, dynamic>),
    json['reservationGoods'] as List,
  );
}

Map<String, dynamic> _$HomeDataToJson(HomeData instance) => <String, dynamic>{
      'slides': instance.slides,
      'shopInfo': instance.shopInfo,
      'integralMallPic': instance.integralMallPic,
      'toShareCode': instance.toShareCode,
      'recommend': instance.recommend,
      'advertesPicture': instance.advertesPicture,
      'floor1': instance.floor1,
      'floor2': instance.floor2,
      'floor3': instance.floor3,
      'saoma': instance.saoma,
      'newUser': instance.newUser,
      'floor1Pic': instance.floor1Pic,
      'floor2Pic': instance.floor2Pic,
      'floorName': instance.floorName,
      'category': instance.category,
      'floor3Pic': instance.floor3Pic,
      'reservationGoods': instance.reservationGoods,
    };

Slides _$SlidesFromJson(Map<String, dynamic> json) {
  return Slides(
    json['image'] as String,
    json['goodsId'] as String,
  );
}

Map<String, dynamic> _$SlidesToJson(Slides instance) => <String, dynamic>{
      'image': instance.image,
      'goodsId': instance.goodsId,
    };

ShopInfo _$ShopInfoFromJson(Map<String, dynamic> json) {
  return ShopInfo(
    json['leaderImage'] as String,
    json['leaderPhone'] as String,
  );
}

Map<String, dynamic> _$ShopInfoToJson(ShopInfo instance) => <String, dynamic>{
      'leaderImage': instance.leaderImage,
      'leaderPhone': instance.leaderPhone,
    };

IntegralMallPic _$IntegralMallPicFromJson(Map<String, dynamic> json) {
  return IntegralMallPic(
    json['PICTURE_ADDRESS'] as String,
    json['TO_PLACE'] as String,
  );
}

Map<String, dynamic> _$IntegralMallPicToJson(IntegralMallPic instance) =>
    <String, dynamic>{
      'PICTURE_ADDRESS': instance.pICTUREADDRESS,
      'TO_PLACE': instance.tOPLACE,
    };

ToShareCode _$ToShareCodeFromJson(Map<String, dynamic> json) {
  return ToShareCode(
    json['PICTURE_ADDRESS'] as String,
    json['TO_PLACE'] as String,
  );
}

Map<String, dynamic> _$ToShareCodeToJson(ToShareCode instance) =>
    <String, dynamic>{
      'PICTURE_ADDRESS': instance.pICTUREADDRESS,
      'TO_PLACE': instance.tOPLACE,
    };

Recommend _$RecommendFromJson(Map<String, dynamic> json) {
  return Recommend(
    json['image'] as String,
    json['mallPrice'],
    json['goodsName'] as String,
    json['goodsId'] as String,
    json['price'],
  );
}

Map<String, dynamic> _$RecommendToJson(Recommend instance) => <String, dynamic>{
      'image': instance.image,
      'mallPrice': instance.mallPrice,
      'goodsName': instance.goodsName,
      'goodsId': instance.goodsId,
      'price': instance.price,
    };

AdvertesPicture _$AdvertesPictureFromJson(Map<String, dynamic> json) {
  return AdvertesPicture(
    json['PICTURE_ADDRESS'] as String,
    json['TO_PLACE'] as String,
  );
}

Map<String, dynamic> _$AdvertesPictureToJson(AdvertesPicture instance) =>
    <String, dynamic>{
      'PICTURE_ADDRESS': instance.pICTUREADDRESS,
      'TO_PLACE': instance.tOPLACE,
    };

Floor1 _$Floor1FromJson(Map<String, dynamic> json) {
  return Floor1(
    json['image'] as String,
    json['goodsId'] as String,
  );
}

Map<String, dynamic> _$Floor1ToJson(Floor1 instance) => <String, dynamic>{
      'image': instance.image,
      'goodsId': instance.goodsId,
    };

Floor2 _$Floor2FromJson(Map<String, dynamic> json) {
  return Floor2(
    json['image'] as String,
    json['goodsId'] as String,
  );
}

Map<String, dynamic> _$Floor2ToJson(Floor2 instance) => <String, dynamic>{
      'image': instance.image,
      'goodsId': instance.goodsId,
    };

Floor3 _$Floor3FromJson(Map<String, dynamic> json) {
  return Floor3(
    json['image'] as String,
    json['goodsId'] as String,
  );
}

Map<String, dynamic> _$Floor3ToJson(Floor3 instance) => <String, dynamic>{
      'image': instance.image,
      'goodsId': instance.goodsId,
    };

Saoma _$SaomaFromJson(Map<String, dynamic> json) {
  return Saoma(
    json['PICTURE_ADDRESS'] as String,
    json['TO_PLACE'] as String,
  );
}

Map<String, dynamic> _$SaomaToJson(Saoma instance) => <String, dynamic>{
      'PICTURE_ADDRESS': instance.pICTUREADDRESS,
      'TO_PLACE': instance.tOPLACE,
    };

NewUser _$NewUserFromJson(Map<String, dynamic> json) {
  return NewUser(
    json['PICTURE_ADDRESS'] as String,
    json['TO_PLACE'] as String,
  );
}

Map<String, dynamic> _$NewUserToJson(NewUser instance) => <String, dynamic>{
      'PICTURE_ADDRESS': instance.pICTUREADDRESS,
      'TO_PLACE': instance.tOPLACE,
    };

Floor1Pic _$Floor1PicFromJson(Map<String, dynamic> json) {
  return Floor1Pic(
    json['PICTURE_ADDRESS'] as String,
    json['TO_PLACE'] as String,
  );
}

Map<String, dynamic> _$Floor1PicToJson(Floor1Pic instance) => <String, dynamic>{
      'PICTURE_ADDRESS': instance.pICTUREADDRESS,
      'TO_PLACE': instance.tOPLACE,
    };

Floor2Pic _$Floor2PicFromJson(Map<String, dynamic> json) {
  return Floor2Pic(
    json['PICTURE_ADDRESS'] as String,
    json['TO_PLACE'] as String,
  );
}

Map<String, dynamic> _$Floor2PicToJson(Floor2Pic instance) => <String, dynamic>{
      'PICTURE_ADDRESS': instance.pICTUREADDRESS,
      'TO_PLACE': instance.tOPLACE,
    };

FloorName _$FloorNameFromJson(Map<String, dynamic> json) {
  return FloorName(
    json['floor1'] as String,
    json['floor2'] as String,
    json['floor3'] as String,
  );
}

Map<String, dynamic> _$FloorNameToJson(FloorName instance) => <String, dynamic>{
      'floor1': instance.floor1,
      'floor2': instance.floor2,
      'floor3': instance.floor3,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return Category(
    json['mallCategoryId'] as String,
    json['mallCategoryName'] as String,
    (json['bxMallSubDto'] as List)
        ?.map((e) =>
            e == null ? null : BxMallSubDto.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['image'] as String,
  );
}

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'mallCategoryId': instance.mallCategoryId,
      'mallCategoryName': instance.mallCategoryName,
      'bxMallSubDto': instance.bxMallSubDto,
      'image': instance.image,
    };

BxMallSubDto _$BxMallSubDtoFromJson(Map<String, dynamic> json) {
  return BxMallSubDto(
    json['mallSubId'] as String,
    json['mallCategoryId'] as String,
    json['mallSubName'] as String,
    json['comments'] as String,
  );
}

Map<String, dynamic> _$BxMallSubDtoToJson(BxMallSubDto instance) =>
    <String, dynamic>{
      'mallSubId': instance.mallSubId,
      'mallCategoryId': instance.mallCategoryId,
      'mallSubName': instance.mallSubName,
      'comments': instance.comments,
    };

Floor3Pic _$Floor3PicFromJson(Map<String, dynamic> json) {
  return Floor3Pic(
    json['PICTURE_ADDRESS'] as String,
    json['TO_PLACE'] as String,
  );
}

Map<String, dynamic> _$Floor3PicToJson(Floor3Pic instance) => <String, dynamic>{
      'PICTURE_ADDRESS': instance.pICTUREADDRESS,
      'TO_PLACE': instance.tOPLACE,
    };
