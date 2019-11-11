import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'data/life_goods_category_data.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryFailure extends CategoryState {
  final String error;

  const CategoryFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'CategoryFailure { error: $error }';
}

class CategorySuccess extends CategoryState {
  final LifeGoodsCategoryData categoryData;

  const CategorySuccess({@required this.categoryData});

  @override
  List<Object> get props => [categoryData];

  @override
  String toString() => 'CategorySuccess { error: $categoryData }';
}
