import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/countdown_bloc.dart';
import '../widgets/countdown_list_item.dart';

class CountdownPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Countdown List')),
      body: BlocConsumer<CountdownBloc, CountdownState>(
        listener: (context, state){},
        builder: (context, state) {
          if(state is CountdownLoading) {
            return const Center(child: CircularProgressIndicator(),);
          } else if(state is CountdownError){
            return const Center(child: Text('Failed to load items'));
          } else {
            final items = state.items;

            return ListView.builder(
              controller: context.read<CountdownBloc>().controller
                ..addListener(() => context.read<CountdownBloc>().add(FetchMoreCountdownItems())),
              itemCount: state is CountdownLoadMore
                  ? items.length + 1 : items.length ,
              itemBuilder: (context, index) {
                if(index < items.length) {
                  final item = items[index];
                  return CountdownListItem(item: item);
                } else {
                  return const Center(child: CircularProgressIndicator(),);
                }
              },
            );
          }
        },
      ),
    );
  }

  Widget otherWid(){
    return BlocConsumer<CountdownBloc, CountdownState>(
      listener: (context, state){},
      builder: (context, state) {
        if(state is CountdownLoading) {
          return const Center(child: CircularProgressIndicator(),);
        } else if(state is CountdownError){
          return const Center(child: Text('Failed to load items'));
        } else {
          final items = state.items;

          return ListView.builder(
            controller: context.read<CountdownBloc>().controller
              ..addListener(() => context.read<CountdownBloc>().add(FetchMoreCountdownItems())),
            itemCount: state is CountdownLoadMore
                ? items.length + 1 : items.length ,
            itemBuilder: (context, index) {
              if(index < items.length) {
                final item = items[index];
                return CountdownListItem(item: item);
              } else {
                return const Center(child: CircularProgressIndicator(),);
              }
            },
          );
        }
      },
    );
  }
}
