import 'package:flutter/cupertino.dart';
import 'package:flutter_common/api/api.dart';
import 'package:flutter_common/components/baixing_life/dio/life_http_post_dio.dart';

import 'data/life_goods_category_data.dart';
import 'life_index_category.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  ILifeHttpPostWork httpPostWork;

  CategoryBloc({@required this.httpPostWork});

  @override
  get initialState => CategoryInitial();

  @override
  Stream<CategoryState> mapEventToState(CategoryEvent event) async* {
    if (state is CategoryInitial) {
      yield CategoryLoading();
      var response = await httpPostWork.start(url: Api.LIFE_GOODS_CATEGORY);
      if (response.success) {
        yield CategorySuccess(
            categoryData: LifeGoodsCategoryData.fromJson(response?.result));
      } else {
        yield CategoryFailure(error: response?.message);
      }
    }
  }
}
