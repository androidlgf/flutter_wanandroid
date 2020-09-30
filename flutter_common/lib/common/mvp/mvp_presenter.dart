import 'package:flutter_common/common/mvp/i_presenter.dart';
import 'package:flutter_common/common/mvp/mvp_view.dart';

abstract class MvpPresenter<V extends MvpView> implements IPresenter<V> {
  V _mvpView;

  @override
  void initState(V view) {
    _mvpView = view;
  }

  @override
  void dispose() {
    _mvpView = null;
  }

  V get mvpView => _mvpView;
}
