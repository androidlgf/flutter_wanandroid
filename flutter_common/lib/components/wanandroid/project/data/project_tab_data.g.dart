// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_tab_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectTabData _$ProjectTabDataFromJson(Map<String, dynamic> json) {
  return ProjectTabData(
      (json['data'] as List)
          ?.map((e) => e == null
              ? null
              : ProjectData.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['errorCode'] as int,
      json['errorMsg'] as String);
}

Map<String, dynamic> _$ProjectTabDataToJson(ProjectTabData instance) =>
    <String, dynamic>{
      'data': instance.projectData,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg
    };

ProjectData _$ProjectDataFromJson(Map<String, dynamic> json) {
  return ProjectData(
      json['children'] as List,
      json['courseId'] as int,
      json['id'] as int,
      json['name'] as String,
      json['order'] as int,
      json['parentChapterId'] as int,
      json['userControlSetTop'] as bool,
      json['visible'] as int);
}

Map<String, dynamic> _$ProjectDataToJson(ProjectData instance) =>
    <String, dynamic>{
      'children': instance.projectChildren,
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible
    };
