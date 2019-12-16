import 'package:city_pickers/city_pickers.dart';
import 'package:city_pickers/modal/result.dart';
import 'package:flutter/cupertino.dart';
import 'package:native_contact_picker/native_contact_picker.dart';

class PickerUtil {
  ///获取选择联系人有效信息
  static Future<Contact> selectContact() async {
    final NativeContactPicker _contactPicker = new NativeContactPicker();
    return await _contactPicker.selectContact();
  }

  static Future<Result> showCityPicker(BuildContext context) async {
    return await CityPickers.showCityPicker(
      context: context,
    );
  }

  static Future<Result> showFullPageCityPicker(BuildContext context) async {
    return await CityPickers.showFullPageCityPicker(
      context: context,
    );
  }

  static Future<Result> showCitiesSelector(BuildContext context) async {
    return await CityPickers.showCitiesSelector(
      context: context,
    );
  }
}
