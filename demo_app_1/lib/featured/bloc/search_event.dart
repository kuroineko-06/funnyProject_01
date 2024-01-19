part of 'search_bloc.dart';

@immutable
sealed class SearchEvent extends Equatable {
  const SearchEvent();
}

class SearchInitialEvent extends SearchEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
