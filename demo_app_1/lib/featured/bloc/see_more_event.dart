part of 'see_more_bloc.dart';

@immutable
sealed class SeeMoreEvent extends Equatable {
  const SeeMoreEvent();
}

class SeeMoreInitialEvent extends SeeMoreEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
