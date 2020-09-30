import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/common/mvp/mvp_view.dart';
import 'i_presenter.dart';

abstract class MvpStatefulWidget extends StatefulWidget {}

abstract class MvpState<V extends MvpStatefulWidget> extends State<V>
    implements MvpView {
  IPresenter presenter;

  IPresenter createPresenter();

  @override
  void initState() {
    presenter = createPresenter();
    if (presenter != null) {
      presenter.initState(this);
    }
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (presenter != null) {
      presenter.didChangeDependencies();
    }
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    if (presenter != null) {
      presenter.deactivate();
    }
    super.deactivate();
  }

  @override
  void dispose() {
    if (presenter != null) {
      presenter.dispose();
    }
    super.dispose();
  }

  @override
  void reassemble() {
    if (presenter != null) {
      presenter.reassemble();
    }
    super.reassemble();
  }

  //显示网络加载loading/
  @override
  void showLoading() {
    // TODO: implement showLoading
  }

  //隐藏网络加载loading/
  @override
  void hideLoading() {
    // TODO: implement build
  }

  @override
  void hideKeyboard() {
    // TODO: implement hideKeyboard
  }

  @override
  bool isNetworkConnected() {
    // TODO: implement isNetworkConnected
    return true;
  }

  @override
  void onError(String message) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  void openActivityOnTokenExpire() {
    // TODO: implement openActivityOnTokenExpire
  }

  @override
  void showMessage(String message) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
}
