import 'bloc_index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_common/common/http/simple_work.dart';

class BlocCommon<V extends BlocEvent, T extends BlocState> extends BlocBase {
  final SimpleWork httpWork;

  BlocCommon({@required this.httpWork});

  @override
  get initialState => BlocInitial();

  @override
  Stream<BlocState> mapEventToState(BlocEvent event) async* {
    //网络请求事件处理
    if (event is BlocHttpEvent) {
      //改为加载loading状态
      yield BlocLoading();
      var response = await httpWork?.start(
          url: event?.url, params: event?.params, headers: event?.headers);
      if (response.success) {
        yield BlocSuccess(response: response?.result);
      } else {
        yield BlocFailure(error: '${response?.message}');
      }
      return;
    }
    if (event is BlocShowMessageEvent) {
      yield BlocShowMessage(message: '${event.message}');
      return;
    }
    if (event is BlocShowSnackBarEvent) {
      yield BlocShowSnackBar(message: '${event.message}');
      return;
    }
  }
}
