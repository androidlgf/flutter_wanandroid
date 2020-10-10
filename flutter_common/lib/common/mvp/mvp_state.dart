import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_common/common/mvp/mvp_view.dart';
import 'package:flutter_common/common/utils/network_connect_util.dart';
import 'package:flutter_common/common/widget/load_dialog.dart';
import 'i_presenter.dart';

abstract class MvpState<V extends StatefulWidget> extends State<V>
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
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return LoadDialog();
        });
  }

  //隐藏网络加载loading/
  @override
  void hideLoading() {
    Navigator.pop(context);
  }

  //关闭键盘/
  @override
  void hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  //网络是否可用/
  @override
  Future<bool> isNetworkConnected() {
    return NetworkConnectUtil.isNetworkConnected();
  }

//底部错误提示/
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
