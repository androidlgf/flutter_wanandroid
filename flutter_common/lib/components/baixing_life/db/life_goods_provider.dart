import 'package:flutter_common/common/orm/orm_helper.dart';
import 'package:flutter_common/components/baixing_life/goodsdetail/data/life_goods_detail_data.dart';
import 'package:flutter_orm_plugin/flutter_orm_plugin.dart';

class LifeGoodsProvider {
  // ignore: non_constant_identifier_names
  static final String TABLE_NAME = 'cart_table';

// ignore: non_constant_identifier_names
  static final String GOODS_ID = 'goodsId';

  // ignore: non_constant_identifier_names
  static final String GOODS_NAME = 'goodsName';

  // ignore: non_constant_identifier_names
  static final String GOODS_AMOUNT = 'amount';

  // ignore: non_constant_identifier_names
  static final String GOODS_ORIPRICE = 'oriPrice'; //市场价
  // ignore: non_constant_identifier_names
  static final String GOODS_PRESENTPRICE = 'presentPrice'; //市场价
  // ignore: non_constant_identifier_names
  static final String GOODS_IMAGE = 'comPic';

  // ignore: non_constant_identifier_names
  static final String GOODS_CART_NUM = 'goodsCartNum'; //购物车数量
  // ignore: non_constant_identifier_names
  static final String GOODS_CART_CHECK = 'isCheck'; //是否选中
// ignore: non_constant_identifier_names
  static final String GOODS_CART_CHECKED = '1';

  // ignore: non_constant_identifier_names
  static final String GOODS_CART_NO_CHECK = '0';
  OrmHelper _helper;

  LifeGoodsProvider() {
    _helper = OrmHelper.getInstance();
    Map<String, dynamic> tableKey = {};
    tableKey.putIfAbsent(GOODS_NAME, () => FieldType.Text);
    tableKey.putIfAbsent(GOODS_AMOUNT, () => FieldType.Text);
    tableKey.putIfAbsent(GOODS_ORIPRICE, () => FieldType.Text);
    tableKey.putIfAbsent(GOODS_PRESENTPRICE, () => FieldType.Text);
    tableKey.putIfAbsent(GOODS_IMAGE, () => FieldType.Text);
    tableKey.putIfAbsent(GOODS_CART_NUM, () => FieldType.Integer);
    tableKey.putIfAbsent(GOODS_CART_CHECK, () => FieldType.Text);
    _helper.createTable(TABLE_NAME, GOODS_ID, tableKey);
  }

  void saveGoods(GoodsProvider info) {
    _helper.insert(TABLE_NAME, info.toMap());
  }

  //添加购物车操作
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
        await _helper.queryByPrimaryKeyFirst(TABLE_NAME, [goodsId]);
    if (queryData != null) {
      goodsProvider.goodsCartNum = queryData[GOODS_CART_NUM] + 1;
      _helper.updateByPrimaryKey(TABLE_NAME, [goodsId], goodsProvider?.toMap());
    } else {
      goodsProvider.goodsCartNum = 1;
      goodsProvider.isCheck = GOODS_CART_NO_CHECK;
      saveGoods(goodsProvider);
    }
  }

  void minusCartNumGoods(Map<dynamic, dynamic> cartData) async {
    if (cartData == null) return;
    GoodsProvider goodsProvider = GoodsProvider.fromMap(cartData);
    String goodsId = goodsProvider.goodsId;
    if (goodsId == null || goodsId.isEmpty) {
      return;
    }
    Map<dynamic, dynamic> queryData =
        await _helper.queryByPrimaryKeyFirst(TABLE_NAME, [goodsId]);
    if (queryData != null) {
      goodsProvider.goodsCartNum = (queryData[GOODS_CART_NUM] - 1) > 0
          ? queryData[GOODS_CART_NUM] - 1
          : 1;
      _helper.updateByPrimaryKey(TABLE_NAME, [goodsId],
          Map<String, dynamic>.from(goodsProvider?.toMap()));
    }
  }

  void addCartNumGoods(Map<dynamic, dynamic> cartData) async {
    if (cartData == null) return;
    GoodsProvider goodsProvider = GoodsProvider.fromMap(cartData);
    String goodsId = goodsProvider.goodsId;
    if (goodsId == null || goodsId.isEmpty) {
      return;
    }
    Map<dynamic, dynamic> queryData =
        await _helper.queryByPrimaryKeyFirst(TABLE_NAME, [goodsId]);
    if (queryData != null) {
      goodsProvider.goodsCartNum = queryData[GOODS_CART_NUM] + 1;
      _helper.updateByPrimaryKey(TABLE_NAME, [goodsId],
          Map<String, dynamic>.from(goodsProvider?.toMap()));
    }
  }

  void changeCartGoodsIsCheck(Map<dynamic, dynamic> cartData) async {
    GoodsProvider goodsProvider = GoodsProvider.fromMap(cartData);
    String goodsId = goodsProvider.goodsId;
    if (goodsId == null || goodsId.isEmpty) {
      return;
    }
    Map<dynamic, dynamic> queryData =
        await _helper.queryByPrimaryKeyFirst(TABLE_NAME, [goodsId]);
    if (queryData != null) {
      goodsProvider.isCheck = queryData[GOODS_CART_CHECK] == GOODS_CART_NO_CHECK
          ? GOODS_CART_CHECKED
          : GOODS_CART_NO_CHECK;
      _helper.updateByPrimaryKey(TABLE_NAME, [goodsId],
          Map<String, dynamic>.from(goodsProvider?.toMap()));
    }
  }

  Future<List<dynamic>> checkAllCartGoods(
      bool isCheck, List<dynamic> listOfData) async {
    if (listOfData == null || listOfData.length <= 0) return listOfData;
    for (dynamic value in listOfData) {
      GoodsProvider goodsProvider = GoodsProvider.fromMap(value);
      String goodsId = goodsProvider.goodsId;
      if (goodsId == null || goodsId.isEmpty) {
        break;
      }
      goodsProvider.isCheck =
          isCheck ? GOODS_CART_CHECKED : GOODS_CART_NO_CHECK;
      _helper.updateByPrimaryKey(TABLE_NAME, [goodsId],
          Map<String, dynamic>.from(goodsProvider?.toMap()));
    }
    return listOfData;
  }

  Future<double> queryTotalPrice(List<dynamic> listOfData) async {
    if (listOfData == null || listOfData.length <= 0) return 0;
    double totalPrice = 0;
    for (dynamic value in listOfData) {
      GoodsProvider goodsProvider = GoodsProvider.fromMap(value);
      if (goodsProvider.isCheck == GOODS_CART_CHECKED) {
        totalPrice += goodsProvider.goodsCartNum * goodsProvider.oriPrice;
      }
    }
    return totalPrice.floorToDouble();
  }

  //查询所有购物车
  Future<List<dynamic>> queryGoods() {
    return _helper.queryAll(TABLE_NAME);
  }
}

class GoodsProvider {
  String goodsId;
  String goodsName;
  int amount;
  double oriPrice;
  double presentPrice;
  String comPic;
  int goodsCartNum;
  String isCheck;

  GoodsProvider(
      {this.goodsId,
      this.goodsName,
      this.amount,
      this.oriPrice,
      this.presentPrice,
      this.comPic,
      this.goodsCartNum,
      this.isCheck});

  static GoodsProvider fromMap(Map<dynamic, dynamic> map) {
    if (map == null) return null;
    GoodsProvider goodsProvider = GoodsProvider();
    goodsProvider.goodsId = map[LifeGoodsProvider.GOODS_ID];
    goodsProvider.goodsName = map[LifeGoodsProvider.GOODS_NAME];
    goodsProvider.amount = int.parse(map[LifeGoodsProvider.GOODS_AMOUNT]);
    goodsProvider.oriPrice =
        double.parse(map[LifeGoodsProvider.GOODS_ORIPRICE]);
    goodsProvider.presentPrice =
        double.parse(map[LifeGoodsProvider.GOODS_PRESENTPRICE]);
    goodsProvider.comPic = map[LifeGoodsProvider.GOODS_IMAGE];
    goodsProvider.goodsCartNum = map[LifeGoodsProvider.GOODS_CART_NUM];
    goodsProvider.isCheck = map[LifeGoodsProvider.GOODS_CART_CHECK];
    return goodsProvider;
  }

  Map<dynamic, dynamic> toMap() => {
        '${LifeGoodsProvider.GOODS_ID}': goodsId,
        '${LifeGoodsProvider.GOODS_NAME}': goodsName,
        '${LifeGoodsProvider.GOODS_AMOUNT}': amount,
        '${LifeGoodsProvider.GOODS_ORIPRICE}': oriPrice,
        '${LifeGoodsProvider.GOODS_PRESENTPRICE}': presentPrice,
        '${LifeGoodsProvider.GOODS_IMAGE}': comPic,
        '${LifeGoodsProvider.GOODS_CART_NUM}': goodsCartNum,
        '${LifeGoodsProvider.GOODS_CART_CHECK}': isCheck
      };

  @override
  String toString() {
    return '{goodsId: $goodsId, goodsName: $goodsName, amount: $amount, oriPrice: $oriPrice, presentPrice: $presentPrice, comPic: $comPic, goodsCartNum: $goodsCartNum, isCheck: $isCheck}';
  }
}
