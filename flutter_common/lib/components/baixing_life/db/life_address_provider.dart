import 'package:common_utils/common_utils.dart';
import 'package:flutter_common/common/orm/orm_helper.dart';
import 'package:flutter_orm_plugin/flutter_orm_plugin.dart';

class LifeAddressProvider extends BaseOrmProvider {
  static String addressId() => 'id';

  static String addressName() => 'name';

  static String addressPhone() => 'phone';

  static String addressTag() => 'tag';

  static String addressIsDefault() => 'isDefault'; //是否是默认地址

  static String addressDefault() => '1';

  static String addressUnDefault() => '0';

  static String addressIsSelect() => 'isSelect'; //是否是用户选择

  static String addressSelected() => '1';

  static String addressUnSelected() => '0';

  static String addressDetails() => 'address';

  static String addressProvince() => 'province';

  static String addressCity() => 'city';

  static String addressArea() => 'area';

  static String addressPrimaryId() => 'address_Id';

  static String addressTemporaryServer() => 'temporaryServer';

  static String addressTemporaryServerValue() => '收货不方便时,可选择免费暂存服务';

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
    tableKey.putIfAbsent(addressTemporaryServer(), () => FieldType.Text);
    ormHelper().createTable(tableName(), primaryKey(), tableKey);
  }

  //保存地址信息/
  void saveAddress(Address address) {
    if (address == null) {
      return;
    }
    String primaryValue = address?.id;
    if (primaryValue == null || primaryValue.isEmpty) {
      return;
    }
    if (address?.temporaryServer == null || address.temporaryServer.isEmpty) {
      address.temporaryServer =
          LifeAddressProvider.addressTemporaryServerValue();
    }
    if (address?.primaryId == null || address.primaryId.isEmpty) {
      address.primaryId = primaryValue;
    }
    if (address?.isSelect == null || address.isSelect.isEmpty) {
      address.isSelect = addressUnSelected();
    }

    ormHelper().insert(tableName(), address?.toMap());
  }

  //更新地址信息/
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

  //查询所有的收货地址/
  Future<List> queryAddress() {
    return ormHelper().queryAll(tableName());
  }

  //更新默认的收货地址/
  void updateDefaultAddress(Map<dynamic, dynamic> selectData) async {
    if (selectData == null || selectData.length <= 0) return;
    var queryAllAddress = await queryAddress();
    if (queryAllAddress == null) return;
    for (var value in queryAllAddress) {
      Address address = Address.fromMap(Map<String, dynamic>.from(value));
      if (address?.primaryId == selectData[addressPrimaryId()]) {
        address.isDefault = addressDefault();
      } else {
        address.isDefault = addressUnDefault();
      }
      await updateAddress(address);
    }
  }

  //查询默认的收货地址/
  Future<Map> queryDefaultAddress() async {
    var listOfAddress = await queryAddress();
    if (listOfAddress == null || listOfAddress.length <= 0) {
      return null;
    }
    Map defaultAddress;
    for (var value in listOfAddress) {
      if (value[LifeAddressProvider.addressIsDefault()] ==
          LifeAddressProvider.addressDefault()) {
        defaultAddress = value;
        break;
      }
    }
    if (defaultAddress == null) {
      defaultAddress = listOfAddress[0];
    }
    return defaultAddress;
  }
}

class Address {
  String id;
  String primaryId;
  String name;
  String phone;
  String isDefault;
  String isSelect;
  String tag;
  String address;
  String province;
  String city;
  String area;
  String temporaryServer;

  Address(
      {this.id,
      this.name,
      this.phone,
      this.isDefault,
      this.tag,
      this.address,
      this.province,
      this.city,
      this.area,
      this.temporaryServer});

  static Address fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
    Address addressBean = Address();
    addressBean.id = map[LifeAddressProvider.addressId()];
    addressBean.primaryId = map[LifeAddressProvider.addressPrimaryId()];
    addressBean.name = map[LifeAddressProvider.addressName()];
    addressBean.phone = map[LifeAddressProvider.addressPhone()];
    addressBean.isDefault = map[LifeAddressProvider.addressIsDefault()];
    addressBean.isSelect = map[LifeAddressProvider.addressSelected()];
    addressBean.tag = map[LifeAddressProvider.addressTag()];
    addressBean.address = map[LifeAddressProvider.addressDetails()];
    addressBean.province = map[LifeAddressProvider.addressProvince()];
    addressBean.city = map[LifeAddressProvider.addressCity()];
    addressBean.area = map[LifeAddressProvider.addressArea()];
    addressBean.temporaryServer =
        map[LifeAddressProvider.addressTemporaryServer()];
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
        '${LifeAddressProvider.addressIsDefault()}': isDefault,
        '${LifeAddressProvider.addressSelected()}': isSelect,
        '${LifeAddressProvider.addressTemporaryServer()}': temporaryServer
      };

  @override
  String toString() {
    return '{id: $id, name: $name, phone: $phone, isDefault: $isDefault, isSelect: $isSelect,tag: $tag, address: $address, province: $province, city: $city, county: $area,temporaryServer:$temporaryServer}';
  }
}
