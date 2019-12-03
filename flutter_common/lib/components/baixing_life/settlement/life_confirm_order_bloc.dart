import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/blocs/bloc_common.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/components/baixing_life/dio/life_http_post_dio.dart';

class LifeConfirmOrderBloc extends BlocCommon<BlocEvent, BlocState> {
  final ILifeHttpPostWork httpWork;

  LifeConfirmOrderBloc({@required this.httpWork});

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {}
}
