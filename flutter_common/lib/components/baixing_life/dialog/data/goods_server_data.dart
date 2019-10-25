import 'package:json_annotation/json_annotation.dart';

part 'goods_server_data.g.dart';


List<GoodsServerData> getGoodsServerDataList(List<dynamic> list){
  List<GoodsServerData> result = [];
  list.forEach((item){
    result.add(GoodsServerData.fromJson(item));
  });
  return result;
}
@JsonSerializable()
class GoodsServerData extends Object {

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'content')
  String content;

  @JsonKey(name: 'id')
  int id;

  GoodsServerData(this.title,this.content,this.id,);

  factory GoodsServerData.fromJson(Map<String, dynamic> srcJson) => _$GoodsServerDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GoodsServerDataToJson(this);

}