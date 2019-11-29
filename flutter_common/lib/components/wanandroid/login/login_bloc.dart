import 'package:bloc/bloc.dart';
import 'package:flutter_common/components/wanandroid/login/login_event.dart';
import 'package:flutter_common/components/wanandroid/login/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  @override
  get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
    }
    print("==login====111="+state.toString());
//    yield LoginInitial();
  }
}
