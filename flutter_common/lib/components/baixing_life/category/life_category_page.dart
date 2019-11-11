import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_common/components/baixing_life/category/life_category_bloc.dart';
import 'package:flutter_common/components/baixing_life/dio/life_http_post_dio.dart';

import 'life_category_body.dart';

class CategoryBxLifePage extends StatelessWidget {
  final String index;
  final String title;

  CategoryBxLifePage({Key key, this.title, this.index})
      : assert(index != null, title != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (BuildContext context) {
        return CategoryBloc(httpPostWork: ILifeHttpPostWork());
      },
      child: CategoryBxLifeWidget(),
    );
  }
}
