// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_tab_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalTabData _$LocalTabDataFromJson(Map<String, dynamic> json) {
  return LocalTabData(
    json['tab'] as String,
    json['imagePath'] as String,
    json['id'] as int,
  );
}

Map<String, dynamic> _$LocalTabDataToJson(LocalTabData instance) =>
    <String, dynamic>{
      'tab': instance.tab,
      'imagePath': instance.imagePath,
      'id': instance.id,
    };
