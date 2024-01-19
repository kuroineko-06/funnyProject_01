part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class HomeInitialEvent extends HomeEvent {
  List<Object?> get props => [];
}

class HomeNotificationButtonClickEvent extends HomeEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeAccountButtonClickEvent extends HomeEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeSearchButtonClickEvent extends HomeEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeNavigateToNotificationEvent extends HomeEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeNavigateToAccountEvent extends HomeEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeNavigateToSearchEvent extends HomeEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
