import 'package:bloc_flutter/logic/cubit/counter_cubit.dart';
import 'package:bloc_flutter/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {



  final AppRouter _appRouter = AppRouter();

  MyApp({super.key});



  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        onGenerateRoute: _appRouter.onGenerateRoute,
      ),
    );
  }
}
