part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

class SearchActionState extends SearchState {}

class SearchSuccessState extends SearchState {
  final List<DataModel> dataItems;
  SearchSuccessState({required this.dataItems});
}
