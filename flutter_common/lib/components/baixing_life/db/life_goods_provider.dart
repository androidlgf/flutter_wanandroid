import 'package:flutter_common/common/orm/orm_helper.dart';
import 'package:flutter_common/components/baixing_life/goodsdetail/data/life_goods_detail_data.dart';
import 'package:flutter_orm_plugin/flutter_orm_plugin.dart';

class LifeGoodsProvider extends BaseOrmProvider {
  static String goodsId() => 'goodsId';

  static String goodsName() => 'goodsName';

  static String goodsAmount() => 'amount';

  static String goodsOriPrice() => 'oriPrice';

  static String goodsPresentPrice() => 'presentPrice';

  static String goodsComPic() => 'comPic';

  static String goodsCartNum() => 'cartNum';

  static String goodsIsCheck() => 'isCheck';

  static String goodsChecked() => '1'; //选中
  static String goodsUnChecked() => '0'; //未选中
  static String goodsAssure() => 'assure'; //无理由退换
  static String goodsAssureValue() => '7天无理由退换'; //7天无理由退换

  @override
  String tableName() {
    return 'cart_table';
  }

  @override
  String primaryKey() {
    return 'goodsId';
  }

  OrmHelper _helper;

  LifeGoodsProvider() {
    _helper = OrmHelper.getInstance();
    Map<String, dynamic> tableKey = {};
    tableKey.putIfAbsent(goodsName(), () => FieldType.Text);
    tableKey.putIfAbsent(goodsAmount(), () => FieldType.Text);
    tableKey.putIfAbsent(goodsOriPrice(), () => FieldType.Text);
    tableKey.putIfAbsent(goodsPresentPrice(), () => FieldType.Text);
    tableKey.putIfAbsent(goodsComPic(), () => FieldType.Text);
    tableKey.putIfAbsent(goodsCartNum(), () => FieldType.Integer);
    tableKey.putIfAbsent(goodsIsCheck(), () => FieldType.Text);
    _helper.createTable(tableName(), primaryKey(), tableKey);
  }

  ///保存购物车操作
  void saveGoods(GoodsProvider info) {
    _helper.insert(tableName(), info.toMap());
  }

  ///添加到购物车操作
  void addCartGoods(GoodInfo info) async {
    String goodsId = info.goodsId;
    if (goodsId == null || goodsId.isEmpty) {
      return;
    }
    GoodsProvider goodsProvider = new GoodsProvider(
        goodsId: info?.goodsId,
        goodsName: info?.goodsName,
        amount: info?.amount,
        oriPrice: info?.oriPrice,
        presentPrice: info?.presentPrice,
        comPic: info?.comPic);
    Map<dynamic, dynamic> queryData =
        await _helper.queryByPrimaryKeyFirst(tableName(), [goodsId]);
    if (queryData != null) {
      goodsProvider.goodsCartNum = queryData[goodsCartNum()] + 1;
      _helper.updateByPrimaryKey(
          tableName(), [goodsId], goodsProvider?.toMap());
    } else {
      goodsProvider.goodsCartNum = 1;
      goodsProvider.isCheck = goodsUnChecked();
      saveGoods(goodsProvider);
    }
  }

  ///购物车减少件数数据库商品操作
  void minusCartNumGoods(Map<dynamic, dynamic> cartData) async {
    if (cartData == null) return;
    GoodsProvider goodsProvider = GoodsProvider.fromMap(cartData);
    String goodsId = goodsProvider.goodsId;
    if (goodsId == null || goodsId.isEmpty) {
      return;
    }
    Map<dynamic, dynamic> queryData =
        await _helper.queryByPrimaryKeyFirst(tableName(), [goodsId]);
    if (queryData != null) {
      goodsProvider.goodsCartNum = (queryData[goodsCartNum()] - 1) > 0
          ? queryData[goodsCartNum()] - 1
          : 1;
      _helper.updateByPrimaryKey(tableName(), [goodsId],
          Map<String, dynamic>.from(goodsProvider?.toMap()));
    }
  }

  ///购物车添加件数数据库商品操作
  void addCartNumGoods(Map<dynamic, dynamic> cartData) async {
    if (cartData == null) return;
    GoodsProvider goodsProvider = GoodsProvider.fromMap(cartData);
    String goodsId = goodsProvider.goodsId;
    if (goodsId == null || goodsId.isEmpty) {
      return;
    }
    Map<dynamic, dynamic> queryData =
        await _helper.queryByPrimaryKeyFirst(tableName(), [goodsId]);
    if (queryData != null) {
      goodsProvider.goodsCartNum = queryData[goodsCartNum()] + 1;
      _helper.updateByPrimaryKey(tableName(), [goodsId],
          Map<String, dynamic>.from(goodsProvider?.toMap()));
    }
  }

  ///购物车是否选中数据库商品操作
  void changeCartGoodsIsCheck(Map<dynamic, dynamic> cartData) async {
    GoodsProvider goodsProvider = GoodsProvider.fromMap(cartData);
    String goodsId = goodsProvider.goodsId;
    if (goodsId == null || goodsId.isEmpty) {
      return;
    }
    Map<dynamic, dynamic> queryData =
        await _helper.queryByPrimaryKeyFirst(tableName(), [goodsId]);
    if (queryData != null) {
      goodsProvider.isCheck = queryData[goodsIsCheck()] == goodsUnChecked()
          ? goodsChecked()
          : goodsUnChecked();
      _helper.updateByPrimaryKey(tableName(), [goodsId],
          Map<String, dynamic>.from(goodsProvider?.toMap()));
    }
  }

  ///购物车全选数据库商品操作
  Future<List<dynamic>> checkAllCartGoods(
      bool isCheck, List<dynamic> listOfData) async {
    if (listOfData == null || listOfData.length <= 0) return listOfData;
    for (dynamic value in listOfData) {
      GoodsProvider goodsProvider = GoodsProvider.fromMap(value);
      String goodsId = goodsProvider.goodsId;
      if (goodsId == null || goodsId.isEmpty) {
        break;
      }
      goodsProvider.isCheck = isCheck ? goodsChecked() : goodsUnChecked();
      _helper.updateByPrimaryKey(tableName(), [goodsId],
          Map<String, dynamic>.from(goodsProvider?.toMap()));
    }
    return listOfData;
  }

  ///查询选购总价
  Future<double> queryTotalPrice(List<dynamic> listOfData) async {
    if (listOfData == null || listOfData.length <= 0) return 0;
    double totalPrice = 0;
    for (dynamic value in listOfData) {
      GoodsProvider goodsProvider = GoodsProvider.fromMap(value);
      if (goodsProvider.isCheck == goodsChecked()) {
        totalPrice += goodsProvider.goodsCartNum * goodsProvider.oriPrice;
      }
    }
    return totalPrice.floorToDouble();
  }

  ///查询所有购物车
  Future<List<dynamic>> queryGoods() {
    return _helper.queryAll(tableName());
  }
}

//商品数据库存储
class GoodsProvider {
  String goodsId;
  String goodsName;
  int amount;
  double oriPrice;
  double presentPrice;
  String comPic;
  int goodsCartNum;
  String isCheck;
  String assure;

  GoodsProvider(
      {this.goodsId,
      this.goodsName,
      this.amount,
      this.oriPrice,
      this.presentPrice,
      this.comPic,
      this.goodsCartNum,
      this.isCheck,
      this.assure});

  static GoodsProvider fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;
    GoodsProvider goodsProvider = GoodsProvider();
    goodsProvider.goodsId = map[LifeGoodsProvider.goodsId()];
    goodsProvider.goodsName = map[LifeGoodsProvider.goodsName()];
    goodsProvider.amount = int.parse(map[LifeGoodsProvider.goodsAmount()]);
    goodsProvider.oriPrice =
        double.parse(map[LifeGoodsProvider.goodsOriPrice()]);
    goodsProvider.presentPrice =
        double.parse(map[LifeGoodsProvider.goodsPresentPrice()]);
    goodsProvider.comPic = map[LifeGoodsProvider.goodsComPic()];
    goodsProvider.goodsCartNum = map[LifeGoodsProvider.goodsCartNum()];
    goodsProvider.isCheck = map[LifeGoodsProvider.goodsIsCheck()];
    return goodsProvider;
  }

  Map<dynamic, dynamic> toMap() => {
        '${LifeGoodsProvider.goodsId()}': goodsId,
        '${LifeGoodsProvider.goodsName()}': goodsName,
        '${LifeGoodsProvider.goodsAmount()}': amount,
        '${LifeGoodsProvider.goodsOriPrice()}': oriPrice,
        '${LifeGoodsProvider.goodsPresentPrice()}': presentPrice,
        '${LifeGoodsProvider.goodsComPic()}': comPic,
        '${LifeGoodsProvider.goodsCartNum()}': goodsCartNum,
        '${LifeGoodsProvider.goodsIsCheck()}': isCheck
      };

  @override
  String toString() {
    return '{goodsId: $goodsId, goodsName: $goodsName, amount: $amount, oriPrice: $oriPrice, presentPrice: $presentPrice, comPic: $comPic, goodsCartNum: $goodsCartNum, isCheck: $isCheck}';
  }
}
