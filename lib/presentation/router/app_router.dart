import 'package:bloc_flutter/logic/cubit/counter_cubit.dart';
import 'package:bloc_flutter/presentation/screens/home_screen.dart';
import 'package:bloc_flutter/presentation/screens/second_screen.dart';
import 'package:bloc_flutter/presentation/screens/third_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  final CounterCubit _counterCubit = CounterCubit();
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(
                title: "title", color: Colors.blueAccent));

      case '/second':
        return MaterialPageRoute(
            builder: (_) => const SecondScreen(
                title: "title", color: Colors.redAccent));

      case '/third':
        return MaterialPageRoute(
            builder: (_) => const ThirdScreen(
                title: "title", color: Colors.greenAccent));
      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
  }
}
