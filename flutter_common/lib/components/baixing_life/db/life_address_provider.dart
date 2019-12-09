import 'package:flutter_common/common/orm/orm_helper.dart';
import 'package:flutter_orm_plugin/flutter_orm_plugin.dart';

class LifeAddressProvider extends BaseOrmProvider {
  static String addressId() => 'id';

  static String addressName() => 'name';

  static String addressPhone() => 'phone';

  static String addressTag() => 'tag';

  static String addressIsDefault() => 'isDefault';

  static String addressDefault() => '1';

  static String addressUnDefault() => '0';

  static String addressDetails() => 'address';

  static String addressProvince() => 'province';

  static String addressCity() => 'city';

  static String addressArea() => 'area';

  static String addressPrimaryId() => 'address_Id';

  @override
  String tableName() {
    return 'address_table';
  }

  @override
  String primaryKey() {
    return 'address_Id';
  }

  LifeAddressProvider() {
    Map<String, dynamic> tableKey = {};
    tableKey.putIfAbsent(addressName(), () => FieldType.Text);
    tableKey.putIfAbsent(addressId(), () => FieldType.Text);
    tableKey.putIfAbsent(addressPhone(), () => FieldType.Text);
    tableKey.putIfAbsent(addressDetails(), () => FieldType.Text);
    tableKey.putIfAbsent(addressIsDefault(), () => FieldType.Text);
    tableKey.putIfAbsent(addressProvince(), () => FieldType.Text);
    tableKey.putIfAbsent(addressCity(), () => FieldType.Text);
    tableKey.putIfAbsent(addressArea(), () => FieldType.Text);
    tableKey.putIfAbsent(addressTag(), () => FieldType.Text);
    ormHelper().createTable(tableName(), primaryKey(), tableKey);
  }

  void saveAddress(Address address) {
    if (address == null) {
      return;
    }
    String primaryValue = address?.id;
    if (primaryValue == null || primaryValue.isEmpty) {
      return;
    }
    address.primaryId = primaryValue;
    ormHelper().insert(tableName(), address?.toMap());
  }

  void updateAddress(Address address) async {
    if (address == null) {
      return;
    }
    String primaryValue = address.id;
    if (primaryValue == null || primaryValue.isEmpty) {
      return;
    }
    var queryData =
        await ormHelper().queryByPrimaryKeyFirst(tableName(), [primaryValue]);
    if (queryData != null) {
      ormHelper()
          .updateByPrimaryKey(tableName(), [primaryValue], address?.toMap());
    } else {
      ormHelper().insert(tableName(), address?.toMap());
    }
  }

  Future<List> queryAddress() {
    return ormHelper().queryAll(tableName());
  }
}

class Address {
  String id;
  String primaryId;
  String name;
  String phone;
  String isDefault;
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
    addressBean.primaryId = map[LifeAddressProvider.addressPrimaryId()];
    addressBean.name = map[LifeAddressProvider.addressName()];
    addressBean.phone = map[LifeAddressProvider.addressPhone()];
    addressBean.isDefault = map[LifeAddressProvider.addressIsDefault()];
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
        '${LifeAddressProvider.addressId()}': id,
        '${LifeAddressProvider.addressPrimaryId()}': id,
        '${LifeAddressProvider.addressIsDefault()}': isDefault
      };

  @override
  String toString() {
    return '{id: $id, name: $name, phone: $phone, isDefault: $isDefault,tag: $tag, address: $address, province: $province, city: $city, county: $area}';
  }
}
