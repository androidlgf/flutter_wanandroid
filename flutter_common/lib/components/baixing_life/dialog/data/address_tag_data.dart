import 'package:json_annotation/json_annotation.dart';

part 'address_tag_data.g.dart';


List<AddressTagData> getAddressTagDataList(List<dynamic> list){
  List<AddressTagData> result = [];
  list.forEach((item){
    result.add(AddressTagData.fromJson(item));
  });
  return result;
}
@JsonSerializable()
class AddressTagData extends Object {

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'path')
  String path;

  @JsonKey(name: 'id')
  int id;

  AddressTagData(this.title,this.path,this.id,);

  factory AddressTagData.fromJson(Map<String, dynamic> srcJson) => _$AddressTagDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AddressTagDataToJson(this);

}