import 'package:flutter_common/common/orm/orm_helper.dart';
import 'package:flutter_orm_plugin/flutter_orm_plugin.dart';

class LifeAddressProvider extends BaseOrmProvider {
  static String addressId() => 'id';

  static String addressName() => 'name';

  static String addressPhone() => 'phone';

  static String addressTag() => 'tag';

  static String addressIsDefault() => 'isDefault';

  static String addressDetails() => 'address';

  static String addressProvince() => 'province';

  static String addressCity() => 'city';

  static String addressArea() => 'area';

  @override
  String tableName() {
    return 'address_table';
  }

  @override
  String primaryKey() {
    return 'id';
  }

  LifeAddressProvider() {
    Map<String, dynamic> tableKey = {};
    tableKey.putIfAbsent(addressId(), () => FieldType.Text);
    tableKey.putIfAbsent(addressName(), () => FieldType.Text);
    tableKey.putIfAbsent(addressPhone(), () => FieldType.Text);
    tableKey.putIfAbsent(addressIsDefault(), () => FieldType.Boolean);
    tableKey.putIfAbsent(addressProvince(), () => FieldType.Text);
    tableKey.putIfAbsent(addressCity(), () => FieldType.Integer);
    tableKey.putIfAbsent(addressArea(), () => FieldType.Text);
    ormHelper().createTable(tableName(), primaryKey(), tableKey);
  }
}

class Address {
  String id;
  String name;
  String phone;
  bool isDefault;
  String tag;
  String address;
  String province;
  String city;
  String area;

  Address(
      {this.id,
      this.name,
      this.phone,
      this.isDefault,
      this.tag,
      this.address,
      this.province,
      this.city,
      this.area});

  static Address fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Address addressBean = Address();
    addressBean.id = map[LifeAddressProvider.addressId()];
    addressBean.name = map[LifeAddressProvider.addressName()];
    addressBean.phone = map[LifeAddressProvider.addressPhone()];
    addressBean.isDefault = map[LifeAddressProvider.addressIsDefault()] == 1;
    addressBean.tag = map[LifeAddressProvider.addressTag()];
    addressBean.address = map[LifeAddressProvider.addressDetails()];
    addressBean.province = map[LifeAddressProvider.addressProvince()];
    addressBean.city = map[LifeAddressProvider.addressCity()];
    addressBean.area = map[LifeAddressProvider.addressArea()];
    return addressBean;
  }

  Map<String, dynamic> toMap() => {
        '${LifeAddressProvider.addressName()}': name,
        '${LifeAddressProvider.addressPhone()}': phone,
        '${LifeAddressProvider.addressCity()}': city,
        '${LifeAddressProvider.addressProvince()}': province,
        '${LifeAddressProvider.addressTag()}': tag,
        '${LifeAddressProvider.addressDetails()}': address,
        '${LifeAddressProvider.addressArea()}': area,
        '${LifeAddressProvider.addressIsDefault()}': isDefault ? 1 : 0
      };

  @override
  String toString() {
    return '{id: $id, name: $name, phone: $phone, isDefault: $isDefault,tag: $tag, address: $address, province: $province, city: $city, county: $area}';
  }
}
