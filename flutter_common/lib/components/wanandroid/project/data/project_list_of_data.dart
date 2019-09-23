import 'package:json_annotation/json_annotation.dart';

part 'project_list_of_data.g.dart';


@JsonSerializable()
class ProjectListOfData extends Object {

  @JsonKey(name: 'data')
  ProjectListData projectListData;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  ProjectListOfData(this.projectListData,this.errorCode,this.errorMsg,);

  factory ProjectListOfData.fromJson(Map<String, dynamic> srcJson) => _$ProjectListOfDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProjectListOfDataToJson(this);

}


@JsonSerializable()
class ProjectListData extends Object {

  @JsonKey(name: 'curPage')
  int curPage;

  @JsonKey(name: 'datas')
  List<ProjectDatas> projectDatas;

  @JsonKey(name: 'offset')
  int offset;

  @JsonKey(name: 'over')
  bool over;

  @JsonKey(name: 'pageCount')
  int pageCount;

  @JsonKey(name: 'size')
  int size;

  @JsonKey(name: 'total')
  int total;

  ProjectListData(this.curPage,this.projectDatas,this.offset,this.over,this.pageCount,this.size,this.total,);

  factory ProjectListData.fromJson(Map<String, dynamic> srcJson) => _$ProjectListDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProjectListDataToJson(this);

}


@JsonSerializable()
class ProjectDatas extends Object {

  @JsonKey(name: 'apkLink')
  String apkLink;

  @JsonKey(name: 'audit')
  int audit;

  @JsonKey(name: 'author')
  String author;

  @JsonKey(name: 'chapterId')
  int chapterId;

  @JsonKey(name: 'chapterName')
  String chapterName;

  @JsonKey(name: 'collect')
  bool collect;

  @JsonKey(name: 'courseId')
  int courseId;

  @JsonKey(name: 'desc')
  String desc;

  @JsonKey(name: 'envelopePic')
  String envelopePic;

  @JsonKey(name: 'fresh')
  bool fresh;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'niceDate')
  String niceDate;

  @JsonKey(name: 'niceShareDate')
  String niceShareDate;

  @JsonKey(name: 'origin')
  String origin;

  @JsonKey(name: 'prefix')
  String prefix;

  @JsonKey(name: 'projectLink')
  String projectLink;

  @JsonKey(name: 'publishTime')
  int publishTime;

  @JsonKey(name: 'shareUser')
  String shareUser;

  @JsonKey(name: 'superChapterId')
  int superChapterId;

  @JsonKey(name: 'superChapterName')
  String superChapterName;

  @JsonKey(name: 'tags')
  List<Tags> tags;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  int type;

  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'visible')
  int visible;

  @JsonKey(name: 'zan')
  int zan;

  ProjectDatas(this.apkLink,this.audit,this.author,this.chapterId,this.chapterName,this.collect,this.courseId,this.desc,this.envelopePic,this.fresh,this.id,this.link,this.niceDate,this.niceShareDate,this.origin,this.prefix,this.projectLink,this.publishTime,this.shareUser,this.superChapterId,this.superChapterName,this.tags,this.title,this.type,this.userId,this.visible,this.zan,);

  factory ProjectDatas.fromJson(Map<String, dynamic> srcJson) => _$ProjectDatasFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProjectDatasToJson(this);

}


@JsonSerializable()
class Tags extends Object {

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'url')
  String url;

  Tags(this.name,this.url,);

  factory Tags.fromJson(Map<String, dynamic> srcJson) => _$TagsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TagsToJson(this);

}