import 'package:flutter_common/common/orm/orm_helper.dart';
import 'package:flutter_common/components/baixing_life/goodsdetail/data/life_goods_detail_data.dart';
import 'package:flutter_orm_plugin/flutter_orm_plugin.dart';

class LifeGoodsProvider {
  // ignore: non_constant_identifier_names
  final String TABLE_NAME = 'cart_table';

// ignore: non_constant_identifier_names
  final String GOODS_ID = 'goodsId';

  // ignore: non_constant_identifier_names
  final String GOODS_NAME = 'goodsName';

  // ignore: non_constant_identifier_names
  final String GOODS_AMOUNT = 'amount';

  // ignore: non_constant_identifier_names
  final String GOODS_ORIPRICE = 'oriPrice'; //市场价
  // ignore: non_constant_identifier_names
  final String GOODS_PRESENTPRICE = 'presentPrice'; //市场价
  // ignore: non_constant_identifier_names
  final String GOODS_IMAGE = 'comPic';

  // ignore: non_constant_identifier_names
  final String GOODS_CART_NUM = 'goodsCartNum'; //购物车数量
  // ignore: non_constant_identifier_names
  final String GOODS_CART_CHECK = 'isCheck'; //是否选中
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
    tableKey.putIfAbsent(GOODS_CART_CHECK, () => FieldType.Boolean);
    _helper.createTable(TABLE_NAME, GOODS_ID, tableKey);
  }

  void saveGoods(GoodInfo info) {
    _helper.insert(TABLE_NAME, info.toJson());
  }

  //添加购物车操作
  void addCardGoods(GoodInfo info) async {
    String goodsId = info.goodsId;
    if (goodsId == null || goodsId.isEmpty) {
      return;
    }
    Map<dynamic, dynamic> queryData =
        await _helper.queryByPrimaryKeyFirst(TABLE_NAME, [goodsId]);
    if (queryData != null) {
      info.goodsCartNum = queryData[GOODS_CART_NUM] + 1;
      _helper.updateByPrimaryKey(TABLE_NAME, [goodsId], info?.toJson());
    } else {
      info.goodsCartNum = 1;
      info.isCheck = false;
      saveGoods(info);
    }
  }
  Future<List<dynamic>> queryGoods() {
    return _helper.queryAll(TABLE_NAME);
  }
}
