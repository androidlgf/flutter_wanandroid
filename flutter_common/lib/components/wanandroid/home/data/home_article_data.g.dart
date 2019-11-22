// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_article_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeArticleData _$HomeArticleDataFromJson(Map<String, dynamic> json) {
  return HomeArticleData(
    json['data'] == null
        ? null
        : ArticleData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$HomeArticleDataToJson(HomeArticleData instance) =>
    <String, dynamic>{
      'data': instance.articleData,
    };

ArticleData _$ArticleDataFromJson(Map<String, dynamic> json) {
  return ArticleData(
    json['curPage'] as int,
    (json['datas'] as List)
        ?.map(
            (e) => e == null ? null : Datas.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    json['offset'] as int,
    json['over'] as bool,
    json['pageCount'] as int,
    json['size'] as int,
    json['total'] as int,
  );
}

Map<String, dynamic> _$ArticleDataToJson(ArticleData instance) =>
    <String, dynamic>{
      'curPage': instance.curPage,
      'datas': instance.datas,
      'offset': instance.offset,
      'over': instance.over,
      'pageCount': instance.pageCount,
      'size': instance.size,
      'total': instance.total,
    };

Datas _$DatasFromJson(Map<String, dynamic> json) {
  return Datas(
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
    json['shareDate'] as int,
    json['shareUser'] as String,
    json['superChapterId'] as int,
    json['superChapterName'] as String,
    json['tags'] as List,
    json['title'] as String,
    json['type'] as int,
    json['userId'] as int,
    json['visible'] as int,
    json['zan'] as int,
  );
}

Map<String, dynamic> _$DatasToJson(Datas instance) => <String, dynamic>{
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
      'shareDate': instance.shareDate,
      'shareUser': instance.shareUser,
      'superChapterId': instance.superChapterId,
      'superChapterName': instance.superChapterName,
      'tags': instance.tags,
      'title': instance.title,
      'type': instance.type,
      'userId': instance.userId,
      'visible': instance.visible,
      'zan': instance.zan,
    };
