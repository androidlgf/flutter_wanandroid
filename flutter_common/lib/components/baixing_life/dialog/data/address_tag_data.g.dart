// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_tag_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressTagData _$AddressTagDataFromJson(Map<String, dynamic> json) {
  return AddressTagData(
    json['title'] as String,
    json['path'] as String,
    json['id'] as int,
  );
}

Map<String, dynamic> _$AddressTagDataToJson(AddressTagData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'path': instance.path,
      'id': instance.id,
    };
