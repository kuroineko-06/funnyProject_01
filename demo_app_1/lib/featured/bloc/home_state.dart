part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

abstract class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  final List<DataModel> data;
  HomeLoadedSuccessState({required this.data});
}

class HomeErrorState extends HomeState {}

class HomeNavigateToNotificationPagesToAction extends HomeActionState {}

class HomeNavigateToCardPagesToAction extends HomeActionState {}

class HomeNavigateToSearchPagesToAction extends HomeActionState {}
