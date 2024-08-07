import 'package:bloc_flutter/logic/cubit/counter_cubit.dart';
import 'package:bloc_flutter/presentation/screens/home_screen.dart';
import 'package:bloc_flutter/presentation/screens/second_screen.dart';
import 'package:bloc_flutter/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();
  @override
  void dispose() {
    _counterCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        routes: {
          '/': (context) => BlocProvider.value(
                value: _counterCubit,
                child: const HomeScreen(
                    title: "Home Screen", color: Colors.blueAccent),
              ),
          '/second': (context) => BlocProvider.value(
                value: _counterCubit,
                child: const SecondScreen(
                    title: "Second Screen", color: Colors.orangeAccent),
              ),
          '/third': (context) => BlocProvider.value(
                value: _counterCubit,
                child: const ThirdScreen(
                    title: "Third Screen", color: Colors.greenAccent),
              ),
        },
      ),
    );
  }
}
