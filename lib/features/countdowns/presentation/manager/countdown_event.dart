part of 'countdown_bloc.dart';

sealed class CountdownEvent extends Equatable {
  const CountdownEvent();
}
class FetchCountdownItems extends CountdownEvent {
  @override
  List<Object> get props => [];
}
class FetchMoreCountdownItems extends CountdownEvent {
  @override
  List<Object> get props => [];
}