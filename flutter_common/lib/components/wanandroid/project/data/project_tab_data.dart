import 'package:json_annotation/json_annotation.dart';

part 'project_tab_data.g.dart';


@JsonSerializable()
class ProjectTabData extends Object {

  @JsonKey(name: 'data')
  List<ProjectData> projectData;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  ProjectTabData(this.projectData,this.errorCode,this.errorMsg,);

  factory ProjectTabData.fromJson(Map<String, dynamic> srcJson) => _$ProjectTabDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProjectTabDataToJson(this);

}


@JsonSerializable()
class ProjectData extends Object {

  @JsonKey(name: 'children')
  List<dynamic> projectChildren;

  @JsonKey(name: 'courseId')
  int courseId;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'parentChapterId')
  int parentChapterId;

  @JsonKey(name: 'userControlSetTop')
  bool userControlSetTop;

  @JsonKey(name: 'visible')
  int visible;

  ProjectData(this.projectChildren,this.courseId,this.id,this.name,this.order,this.parentChapterId,this.userControlSetTop,this.visible,);

  factory ProjectData.fromJson(Map<String, dynamic> srcJson) => _$ProjectDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProjectDataToJson(this);

}