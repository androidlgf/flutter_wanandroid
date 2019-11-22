// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tree_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TreeData _$TreeDataFromJson(Map<String, dynamic> json) {
  return TreeData(
    (json['data'] as List)
        ?.map((e) =>
            e == null ? null : SystemData.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['errorCode'] as int,
    json['errorMsg'] as String,
  );
}

Map<String, dynamic> _$TreeDataToJson(TreeData instance) => <String, dynamic>{
      'data': instance.systemData,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg,
    };

SystemData _$SystemDataFromJson(Map<String, dynamic> json) {
  return SystemData(
    (json['children'] as List)
        ?.map((e) =>
            e == null ? null : Children.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['courseId'] as int,
    json['id'] as int,
    json['name'] as String,
    json['order'] as int,
    json['parentChapterId'] as int,
    json['userControlSetTop'] as bool,
    json['visible'] as int,
  );
}

Map<String, dynamic> _$SystemDataToJson(SystemData instance) =>
    <String, dynamic>{
      'children': instance.children,
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible,
    };

Children _$ChildrenFromJson(Map<String, dynamic> json) {
  return Children(
    json['children'] as List,
    json['courseId'] as int,
    json['id'] as int,
    json['name'] as String,
    json['order'] as int,
    json['parentChapterId'] as int,
    json['userControlSetTop'] as bool,
    json['visible'] as int,
  );
}

Map<String, dynamic> _$ChildrenToJson(Children instance) => <String, dynamic>{
      'children': instance.children,
      'courseId': instance.courseId,
      'id': instance.id,
      'name': instance.name,
      'order': instance.order,
      'parentChapterId': instance.parentChapterId,
      'userControlSetTop': instance.userControlSetTop,
      'visible': instance.visible,
    };
