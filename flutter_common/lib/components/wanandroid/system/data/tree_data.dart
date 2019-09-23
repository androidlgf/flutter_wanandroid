import 'package:json_annotation/json_annotation.dart';

part 'tree_data.g.dart';


@JsonSerializable()
class TreeData extends Object {

  @JsonKey(name: 'data')
  List<SystemData> systemData;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  TreeData(this.systemData,this.errorCode,this.errorMsg,);

  factory TreeData.fromJson(Map<String, dynamic> srcJson) => _$TreeDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TreeDataToJson(this);

}


@JsonSerializable()
class SystemData extends Object {

  @JsonKey(name: 'children')
  List<Children> children;

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

  SystemData(this.children,this.courseId,this.id,this.name,this.order,this.parentChapterId,this.userControlSetTop,this.visible,);

  factory SystemData.fromJson(Map<String, dynamic> srcJson) => _$SystemDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SystemDataToJson(this);

}


@JsonSerializable()
class Children extends Object {

  @JsonKey(name: 'children')
  List<dynamic> children;

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

  Children(this.children,this.courseId,this.id,this.name,this.order,this.parentChapterId,this.userControlSetTop,this.visible,);

  factory Children.fromJson(Map<String, dynamic> srcJson) => _$ChildrenFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ChildrenToJson(this);

}