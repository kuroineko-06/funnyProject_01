part of 'home_bloc.dart';

@immutable
sealed class HomeState extends Equatable {}

// ignore: must_be_immutable
abstract class HomeActionState extends HomeState {}

// ignore: must_be_immutable
final class HomeInitial extends HomeState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

// ignore: must_be_immutable
class HomeLoadingState extends HomeState {
  List<Object?> get props => [];
}

class HomeLoadedSuccessState extends HomeState {
  final List<DataCategoriesModel> data_categories;

  HomeLoadedSuccessState(this.data_categories);
  List<Object?> get props => [data_categories];
}

class HomeErrorState extends HomeState {
  final String error;
  HomeErrorState(this.error);
  @override
  List<Object?> get props => [error];
}

class HomeNavigateToNotificationPagesToAction extends HomeActionState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeNavigateToCardPagesToAction extends HomeActionState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeNavigateToSearchPagesToAction extends HomeActionState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
