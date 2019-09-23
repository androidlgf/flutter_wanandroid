import 'package:json_annotation/json_annotation.dart';

part 'search_hot_model.g.dart';


@JsonSerializable()
class SearchHotModel extends Object {

  @JsonKey(name: 'data')
  List<SearchData> searchData;

  @JsonKey(name: 'errorCode')
  int errorCode;

  @JsonKey(name: 'errorMsg')
  String errorMsg;

  SearchHotModel(this.searchData,this.errorCode,this.errorMsg,);

  factory SearchHotModel.fromJson(Map<String, dynamic> srcJson) => _$SearchHotModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SearchHotModelToJson(this);

}


@JsonSerializable()
class SearchData extends Object {

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'name')
  String name;

  @JsonKey(name: 'order')
  int order;

  @JsonKey(name: 'visible')
  int visible;

  SearchData(this.id,this.link,this.name,this.order,this.visible,);

  factory SearchData.fromJson(Map<String, dynamic> srcJson) => _$SearchDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SearchDataToJson(this);

}