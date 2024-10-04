import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/countdowns/data/repositories/countdown_repository_impl.dart';
import 'features/countdowns/presentation/manager/countdown_bloc.dart';
import 'features/countdowns/presentation/pages/countdown_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Countdown App',
      home: BlocProvider(
        create: (context) =>
            CountdownBloc(repository: CountdownRepositoryImpl())
              ..add(FetchCountdownItems()),
        child: CountdownPage(),
      ),
    );
  }
}
