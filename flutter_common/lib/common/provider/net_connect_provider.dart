import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:connectivity/connectivity.dart';

class NetworkConnectProvider extends ChangeNotifier {
  ConnectivityResult _connectState;
  StreamSubscription<ConnectivityResult> _subscription;

  NetworkConnectProvider() {
    _init();
  }

  Future _init() async {
    _connectState = await (Connectivity().checkConnectivity());
    _subscription = new Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setConnectState(result);
    });
  }

  ConnectivityResult get connectState => _connectState;

  StreamSubscription<ConnectivityResult> get subscription => _subscription;

  //设置网络状态
  void setConnectState(connectState) async {
    _connectState = connectState;
    notifyListeners();
  }

  void pause() {
    _subscription?.pause();
  }

  void resume() {
    _subscription?.resume();
  }

  void cancel() {
    _subscription?.cancel();
  }
}
