// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_change_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThemeChangeData _$ThemeChangeDataFromJson(Map<String, dynamic> json) {
  return ThemeChangeData(
    json['theme'] as String,
    json['themeName'] as String,
    json['id'] as int,
  );
}

Map<String, dynamic> _$ThemeChangeDataToJson(ThemeChangeData instance) =>
    <String, dynamic>{
      'theme': instance.theme,
      'themeName': instance.themeName,
      'id': instance.id,
    };
