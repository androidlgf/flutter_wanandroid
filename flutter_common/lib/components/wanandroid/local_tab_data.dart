import 'package:json_annotation/json_annotation.dart'; 
  
part 'local_tab_data.g.dart';


List<LocalTabData> getLocalTabDataList(List<dynamic> list){
    List<LocalTabData> result = [];
    list.forEach((item){
      result.add(LocalTabData.fromJson(item));
    });
    return result;
  }
@JsonSerializable()
  class LocalTabData extends Object {

  @JsonKey(name: 'tab')
  String tab;

  @JsonKey(name: 'imagePath')
  String imagePath;

  @JsonKey(name: 'id')
  int id;

  LocalTabData(this.tab,this.imagePath,this.id,);

  factory LocalTabData.fromJson(Map<String, dynamic> srcJson) => _$LocalTabDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$LocalTabDataToJson(this);

}

  
