part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeNotificationButtonClickEvent extends HomeEvent {}

class HomeAccountButtonClickEvent extends HomeEvent {}

class HomeSearchButtonClickEvent extends HomeEvent {}

class HomeNavigateToNotificationEvent extends HomeEvent {}

class HomeNavigateToAccountEvent extends HomeEvent {}

class HomeNavigateToSearchEvent extends HomeEvent {}
