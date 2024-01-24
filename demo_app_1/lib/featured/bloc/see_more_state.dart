part of 'see_more_bloc.dart';

@immutable
sealed class SeeMoreState {}

final class SeeMoreInitial extends SeeMoreState {}

class SeeMoreActionState extends SeeMoreState {}

class SeeMoreSuccessState extends SeeMoreState {
  final List<DataCategoriesModel> dataItems;
  SeeMoreSuccessState(this.dataItems);
  List<Object?> get props => [dataItems];
}
