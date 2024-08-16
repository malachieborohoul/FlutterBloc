import 'package:bloc_flutter/logic/cubit/counter_cubit.dart';
import 'package:bloc_flutter/logic/cubit/internet_cubit.dart';
import 'package:bloc_flutter/presentation/router/app_router.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter(),connectivity: Connectivity(),));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter ;
  final Connectivity connectivity;

  MyApp({super.key, required this.connectivity, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(create: (context)=>InternetCubit(connectivity: connectivity)),
        BlocProvider<CounterCubit>(create: (context)=>CounterCubit(internetCubit: BlocProvider.of<InternetCubit>(context)))
      ],
      child: MaterialApp(
        onGenerateRoute: appRouter.onGenerateRoute,
      ),
    );
  }
}
