import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class BlocEvent extends Equatable {
  const BlocEvent();

  @override
  List<Object> get props => [];
}

/// 初始化State执行顺序: initState > didChangeDependencies > Widget build
///对应State initState()生命周期
class BlocInitStateEvent extends BlocEvent {}

///对应State didChangeDependencies()生命周期
class BlocDidChangeDependenciesEvent extends BlocEvent {}

///对应State Widget build()生命周期
class BlocBuildEvent extends BlocEvent {}

/// 组件移除执行顺序: initState > 页面销毁的时候会依次执行：deactivate > dispose
class BlocDeactivateEvent extends BlocEvent {}

class BlocDisposeEvent extends BlocEvent {}

// ignore: must_be_immutable
class BlocHttpEvent extends BlocEvent {
  String url;
  Map<String, dynamic> params;
  Map<String, dynamic> headers;

  BlocHttpEvent({@required this.url, this.params, this.headers});

  @override
  List<Object> get props => [url, params, headers];
}
