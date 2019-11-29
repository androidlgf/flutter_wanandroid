// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goods_server_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsServerData _$GoodsServerDataFromJson(Map<String, dynamic> json) {
  return GoodsServerData(
    json['title'] as String,
    json['content'] as String,
    json['id'] as int,
  );
}

Map<String, dynamic> _$GoodsServerDataToJson(GoodsServerData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'id': instance.id,
    };
