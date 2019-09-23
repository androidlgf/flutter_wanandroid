import 'package:json_annotation/json_annotation.dart'; 
  
part 'theme_change_data.g.dart';


List<ThemeChangeData> getThemeChangeDataList(List<dynamic> list){
    List<ThemeChangeData> result = [];
    list.forEach((item){
      result.add(ThemeChangeData.fromJson(item));
    });
    return result;
  }
@JsonSerializable()
  class ThemeChangeData extends Object {

  @JsonKey(name: 'theme')
  String theme;

  @JsonKey(name: 'themeName')
  String themeName;

  @JsonKey(name: 'id')
  int id;

  ThemeChangeData(this.theme,this.themeName,this.id,);

  factory ThemeChangeData.fromJson(Map<String, dynamic> srcJson) => _$ThemeChangeDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ThemeChangeDataToJson(this);

}

  
