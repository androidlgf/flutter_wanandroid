import 'package:flutter_orm_plugin/flutter_orm_plugin.dart';

class OrmHelper {
  static OrmHelper _ormHelper;

  static OrmHelper getInstance() {
    if (_ormHelper == null) {
      _ormHelper = new OrmHelper();
    }
    return _ormHelper;
  }

  ///创建表
  /// * [tableName]表名
  /// *[primaryKey]主键
  /// * [tableKey]存储key集合 例如tableKey={'name':FieldType,'age':FieldType}，
  /// * [class Field]
  /// final FieldType type;//类型包括Integer、Real、Blob、Char、Text、Boolean
  /// bool unique;//是否惟一
  /// int maxLength;
  /// bool primaryKey;//是否主键
  /// bool foreignKey;//是否外键
  ///  bool autoIncrement;//是否自增
  ///  String to;//关联外键表，以DBName_TableName命名
  ///  bool index;//是否有索引
  void createTable(String tableName, String primaryKey, Map tableKey) {
    Map<String, Field> fields = new Map<String, Field>();
    fields[primaryKey] =
        Field(FieldType.Text, primaryKey: true, autoIncrement: true);
    tableKey.forEach((key, value) {
      fields[key] = Field(value);
    });
    FlutterOrmPlugin.createTable('orm_db', tableName, fields);
  }

  ///单条插入
  void insert(String tableName, Map data) {
    if (data == null) return;
    FlutterOrmPlugin.saveOrm(tableName, data);
  }

  ///批量插入
  void inserts(String tableName, List data) {
    if (data == null) return;
    FlutterOrmPlugin.batchSaveOrms(tableName, data);
  }

  ///根据主键查询
  void selectWithPrimaryKey(String tableName, List<dynamic> primaryKeys) {
    Query(tableName).primaryKey(primaryKeys).all().then((List l) {});
  }

  ///where条件查询
  void selectWhere() {}

  ////////////////////////////////
  ///查询第一条
  ///*[tableName]表名
  Future<Map<dynamic, dynamic>> queryFirst(String tableName) {
    return Query(tableName).first();
  }

  ///查询全部
  ///*[tableName]表名
  Future<List<dynamic>> queryAll(String tableName) {
    return Query(tableName).all();
  }

  ///查询当前主键第一条
  ///*[tableName]表名
  ///*[primaryKey]主键集合 例如{1,3,5}
  Future<Map<dynamic, dynamic>> queryByPrimaryKeyFirst(
      String tableName, List<dynamic> primaryKey) {
    return Query(tableName).primaryKey(primaryKey).first();
  }

  ///查询当前主键第一条全部
  ///*[tableName]表名
  Future<List<dynamic>> queryByPrimaryKeyAll(
      String tableName, List<dynamic> primaryKey) {
    return Query(tableName).primaryKey(primaryKey).all();
  }

  ///单个条件下查询
  ///*[tableName]表名
  ///*[whereCondictions]条件 例如 Query(tableName).whereByColumFilters([WhereCondiction("columName", WhereCondictionType.EQ_OR_MORE_THEN, 90)]).all();
  ///*[WhereCondiction] columName 主健
  Future<List<dynamic>> queryWhereByColumFilters(
      String tableName, List<WhereCondiction> whereCondictions) {
    return Query(tableName).whereByColumFilters(whereCondictions).all();
  }

  ///单个条件下查询
  ///*[tableName]表名
  ///*[whereCondictions]条件 例如 Query(tableName).whereByColumFilters([WhereCondiction("columName", WhereCondictionType.EQ_OR_MORE_THEN, 90)]).all();
  ///*[WhereCondiction] columName 主健
  Future<Map<dynamic, dynamic>> queryWhereByColumFiltersFirst(
      String tableName, List<WhereCondiction> whereCondictions) {
    return Query(tableName).whereByColumFilters(whereCondictions).first();
  }

  ///全部更新
  ///*[tableName]表名
  ///*[updateValue] 要更新的Data
  Future<void> updateAll(String tableName, Map<dynamic, dynamic> updateValue) {
    return Query(tableName).update(updateValue);
  }

  ///根据主键更新
  ///*[tableName]表名
  ///*[primaryKey] 主健集合
  ///*[updateValue] 要更新的Data
  Future<void> updateByPrimaryKey(String tableName, List<dynamic> primaryKey,
      Map<dynamic, dynamic> updateValue) {
    return Query(tableName).primaryKey(primaryKey).update(updateValue);
  }

  ///根据特定条件更新
  ///*[tableName]表名
  ///*[whereCondictions]条件 例如 Query("Student").whereByColumFilters([WhereCondiction("studentId", WhereCondictionType.LESS_THEN, 5),WhereCondiction("score", WhereCondictionType.EQ_OR_MORE_THEN, 0)]).update({"score":100});
  ///*[WhereCondiction] columName 主健
  Future<Map<dynamic, dynamic>> updateWhereByColumFilters(
      String tableName, List<WhereCondiction> whereCondictions) {
    return Query("Student").whereByColumFilters([
      WhereCondiction("studentId", WhereCondictionType.LESS_THEN, 5),
      WhereCondiction("score", WhereCondictionType.EQ_OR_MORE_THEN, 0)
    ]).update({"score": 100});
  }

  ///全部删除
  ///*[tableName]表名
  Future<void> deleteAll(String tableName) {
    return Query(tableName).delete();
  }

  ///根据主键删除
  ///*[tableName]表名
  ///*[primaryKey] 主健集合
  Future<void> deleteByPrimaryKey(String tableName, List<dynamic> primaryKey) {
    return Query(tableName).primaryKey(primaryKey).delete();
  }
}

abstract class BaseOrmProvider {
  bool isTableExits = false;
  OrmHelper _helper;

  //获取表名
  String tableName();

  //获取主键Key
  String primaryKey();

  //获取OrmHelper
  OrmHelper ormHelper() => _initOrmHelper();

  OrmHelper _initOrmHelper() {
    if (_helper == null) {
      _helper = OrmHelper.getInstance();
    }
    return _helper;
  }
}
