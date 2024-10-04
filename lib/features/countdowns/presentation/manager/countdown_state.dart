part of 'countdown_bloc.dart';

sealed class CountdownState extends Equatable {
  final List<CountdownItem> items;
  const CountdownState(this.items);
}

final class CountdownInitial extends CountdownState {
  const CountdownInitial(super.items);

  @override
  List<Object> get props => [];
}
class CountdownLoading extends CountdownState {
  const CountdownLoading(super.items);

  @override
  List<Object> get props => [];
}

class CountdownLoaded extends CountdownState {
  const CountdownLoaded({required List<CountdownItem> items}) : super (items);

  @override
  List<Object> get props => [items];
}
class CountdownLoadMore extends CountdownState {
  const CountdownLoadMore({required List<CountdownItem> items}) : super (items);

  @override
  List<Object> get props => [items];
}

class CountdownError extends CountdownState {
  const CountdownError(super.items);

  @override
  List<Object> get props => [];
}