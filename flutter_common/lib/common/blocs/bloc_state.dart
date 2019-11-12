import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class BlocState extends Equatable {
  const BlocState();

  @override
  List<Object> get props => [];
}

class BlocInitial extends BlocState {}

class BlocLoading extends BlocState {}

class BlocFailure extends BlocState {
  final String error;

  const BlocFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'BlocFailure { error: $error }';
}
class BlocSuccess<T> extends BlocState {
  final T response;

  const BlocSuccess({@required this.response});

  @override
  List<Object> get props => [response];

  @override
  String toString() => 'BlocSuccess { error: $response }';
}
