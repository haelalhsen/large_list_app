import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/countdown_item.dart';
import '../../domain/repositories/countdown_repository.dart';

part 'countdown_event.dart';

part 'countdown_state.dart';

class CountdownBloc extends Bloc<CountdownEvent, CountdownState> {
  final CountdownRepository repository;
  int currentPage = 0; // Track the current page
  final ScrollController controller = ScrollController();

  CountdownBloc({
    required this.repository,
  }) : super(const CountdownInitial([])) {
    on<FetchCountdownItems>((event, emit) async {
      emit(const CountdownLoading([]));
      final newItems = await repository.getCountdownItems(currentPage);
      emit(CountdownLoaded(items: newItems));
    });
    on<FetchMoreCountdownItems>((event, emit) async {
      if (controller.position.pixels == controller.position.maxScrollExtent &&
          currentPage < 10) {
        emit(CountdownLoadMore(items: state.items));
        currentPage++;
        final newItems = await repository.getCountdownItems(currentPage);
        emit(CountdownLoaded(items: [...state.items, ...newItems]));
      }
    });
  }
}
