// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_hot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchHotModel _$SearchHotModelFromJson(Map<String, dynamic> json) {
  return SearchHotModel(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : SearchData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['errorCode'] as int,
    json['errorMsg'] as String,
  );
}

Map<String, dynamic> _$SearchHotModelToJson(SearchHotModel instance) =>
    <String, dynamic>{
      'data': instance.searchData,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

SearchData _$SearchDataFromJson(Map<String, dynamic> json) {
  return SearchData(
    json['id'] as int,
    json['link'] as String,
    json['name'] as String,
    json['order'] as int,
    json['visible'] as int,
  );
}

Map<String, dynamic> _$SearchDataToJson(SearchData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'link': instance.link,
      'name': instance.name,
      'order': instance.order,
      'visible': instance.visible,
    };
