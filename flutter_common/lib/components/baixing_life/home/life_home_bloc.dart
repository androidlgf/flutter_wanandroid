import 'package:amap_base_location/amap_base_location.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_common/api/api.dart';
import 'package:flutter_common/common/blocs/bloc_common.dart';
import 'package:flutter_common/common/blocs/bloc_index.dart';
import 'package:flutter_common/components/baixing_life/dio/life_http_post_dio.dart';

import 'life_home_bloc_event.dart';

class LifeHomeBloc extends BlocCommon {
  final ILifeHttpPostWork httpWork;
  final AMapLocation location;

  LifeHomeBloc({@required this.httpWork, @required this.location});

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    if (state is BlocInitial) {
      location?.init();
    }
    //网络请求事件处理
    if (event is BlocHttpEvent) {
      var response = await httpWork?.start(
          url: event?.url, params: event?.params, headers: event?.headers);
      if (response.success) {
        yield BlocSuccess(response: response?.result, url: event?.url);
      } else {
        yield BlocFailure(error: '${response?.message}');
      }
    }
    if (event is BlocShowMessageEvent) {
      yield BlocShowMessage(message: '${event.message}');
    }
    if (event is BlocShowSnackBarEvent) {
      yield BlocShowSnackBar(message: '${event.message}');
    }
    if (event is LocationEvent) {
      final options = LocationClientOptions(
        isOnceLocation: true,
        locatingWithReGeocode: true,
      );
      num longitude = 0.0;
      num latitude = 0.0;
      if (await Permissions.requestMapPermission()) {
        var mapLocation = await location?.getLocation(options);
        longitude = mapLocation?.longitude;
        latitude = mapLocation?.latitude;
      } else {
        yield BlocShowSnackBar(message: '权限不足');
      }
      //改为加载loading状态
      yield BlocLoading();
      var response = await httpWork?.start(url: Api.LIFE_HOME, params: {
        'lon': longitude == 0.0 ? '115.02932' : longitude,
        'lat': latitude == 0.0 ? '35.76189' : latitude
      });
      if (response.success) {
        yield BlocSuccess(response: response?.result);
      } else {
        yield BlocFailure(error: '${response?.message}');
      }
    }
  }
}
