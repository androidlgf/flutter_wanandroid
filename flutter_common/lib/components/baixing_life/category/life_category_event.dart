import 'package:equatable/equatable.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}
class CategoryLoadingEvent extends CategoryEvent {
  const CategoryLoadingEvent();
}
