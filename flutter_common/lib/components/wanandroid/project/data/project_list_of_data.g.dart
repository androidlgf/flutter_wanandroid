// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_list_of_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectListOfData _$ProjectListOfDataFromJson(Map<String, dynamic> json) {
  return ProjectListOfData(
      json['data'] == null
          ? null
          : ProjectListData.fromJson(json['data'] as Map<String, dynamic>),
      json['errorCode'] as int,
      json['errorMsg'] as String);
}

Map<String, dynamic> _$ProjectListOfDataToJson(ProjectListOfData instance) =>
    <String, dynamic>{
      'data': instance.projectListData,
      'errorCode': instance.errorCode,
      'errorMsg': instance.errorMsg
    };

ProjectListData _$ProjectListDataFromJson(Map<String, dynamic> json) {
  return ProjectListData(
      json['curPage'] as int,
      (json['datas'] as List)
          ?.map((e) => e == null
              ? null
              : ProjectDatas.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['offset'] as int,
      json['over'] as bool,
      json['pageCount'] as int,
      json['size'] as int,
      json['total'] as int);
}

Map<String, dynamic> _$ProjectListDataToJson(ProjectListData instance) =>
    <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.projectDatas,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total
    };

ProjectDatas _$ProjectDatasFromJson(Map<String, dynamic> json) {
  return ProjectDatas(
      json['apkLink'] as String,
      json['audit'] as int,
      json['author'] as String,
      json['chapterId'] as int,
      json['chapterName'] as String,
      json['collect'] as bool,
      json['courseId'] as int,
      json['desc'] as String,
      json['envelopePic'] as String,
      json['fresh'] as bool,
      json['id'] as int,
      json['link'] as String,
      json['niceDate'] as String,
      json['niceShareDate'] as String,
      json['origin'] as String,
      json['prefix'] as String,
      json['projectLink'] as String,
      json['publishTime'] as int,
      json['shareUser'] as String,
      json['superChapterId'] as int,
      json['superChapterName'] as String,
      (json['tags'] as List)
          ?.map((e) =>
              e == null ? null : Tags.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['title'] as String,
      json['type'] as int,
      json['userId'] as int,
      json['visible'] as int,
      json['zan'] as int);
}

Map<String, dynamic> _$ProjectDatasToJson(ProjectDatas instance) =>
    <String, dynamic>{
      'apkLink': instance.apkLink,
      'audit': instance.audit,
      'author': instance.author,
      'chapterId': instance.chapterId,
      'chapterName': instance.chapterName,
      'collect': instance.collect,
      'courseId': instance.courseId,
      'desc': instance.desc,
      'envelopePic': instance.envelopePic,
      'fresh': instance.fresh,
      'id': instance.id,
      'link': instance.link,
      'niceDate': instance.niceDate,
      'niceShareDate': instance.niceShareDate,
      'origin': instance.origin,
      'prefix': instance.prefix,
      'projectLink': instance.projectLink,
      'publishTime': instance.publishTime,
      'shareUser': instance.shareUser,
      'superChapterId': instance.superChapterId,
      'superChapterName': instance.superChapterName,
      'tags': instance.tags,
      'title': instance.title,
      'type': instance.type,
      'userId': instance.userId,
      'visible': instance.visible,
      'zan': instance.zan
    };

Tags _$TagsFromJson(Map<String, dynamic> json) {
  return Tags(json['name'] as String, json['url'] as String);
}

Map<String, dynamic> _$TagsToJson(Tags instance) =>
    <String, dynamic>{'name': instance.name, 'url': instance.url};
