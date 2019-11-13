import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class BlocState extends Equatable {
  const BlocState();

  @override
  List<Object> get props => [];
}

///初始化事件状态
class BlocInitial extends BlocState {}

///网络加载事件状态
class BlocLoading extends BlocState {}

///空布局事件状态
class BlocEmpty extends BlocState {}

///展示Toast事件状态
/// * [message]显示内容
class BlocShowMessage extends BlocState {
  final String message;

  const BlocShowMessage({@required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'BlocShowMessage { showMessage: $message }';
}

///展示Snackbar事件状态
/// * [message]显示内容；
class BlocShowSnackBar extends BlocState {
  final String message;

  const BlocShowSnackBar({@required this.message});

  @override
  List<Object> get props => [message];

  @override
  String toString() => 'BlocShowSnackBar { showMessage: $message }';
}

///网络请求成功事件状态
/// * [response]请求返回数据；
class BlocSuccess<T> extends BlocState {
  final T response;
  final String url;

  const BlocSuccess({@required this.url, @required this.response});

  @override
  List<Object> get props => [response];

  @override
  String toString() => 'BlocSuccess { response: $response }';
}

///失败错误信息事件状态
/// * [error]错误信息；
class BlocFailure extends BlocState {
  final String error;

  const BlocFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'BlocFailure { error: $error }';
}
