import 'package:bloc_flutter/constants/enums.dart';
import 'package:bloc_flutter/logic/cubit/counter_cubit.dart';
import 'package:bloc_flutter/logic/cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title, required this.color});

  final String title;
  final Color color;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.Wifi) {
          BlocProvider.of<CounterCubit>(context).increment();
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.Mobile) {
                    BlocProvider.of<CounterCubit>(context).decrement();

        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<InternetCubit, InternetState>(
                  builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Wifi) {
                  return const Text("Wifi");
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Mobile) {
                  return const Text("Mobile");
                } else if (state is InternetDisconnected) {
                  return const Text("Disonnected");
                }
                return const CircularProgressIndicator();
              }),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.wasIncremented == true
                        ? "Increment"
                        : "Decrement"),
                    duration: const Duration(milliseconds: 300),
                  ));
                },
                builder: (context, state) {
                  return Text(state.counterValue.toString());
                },
              ),
              // const SizedBox(
              //   height: 10,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     FloatingActionButton(
              //       heroTag: Text("${widget.title}1"),
              //       onPressed: () {
              //         BlocProvider.of<CounterCubit>(context).decrement();
              //       },
              //       child: const Icon(Icons.remove),
              //     ),
              //     FloatingActionButton(
              //       heroTag: Text("${widget.title}2"),
              //       onPressed: () {
              //         BlocProvider.of<CounterCubit>(context).increment();
              //       },
              //       child: const Icon(Icons.add),
              //     ),
              //   ],
              // ),
              // const SizedBox(
              //   height: 25,
              // ),
              // MaterialButton(
              //   color: widget.color,
              //   onPressed: () {
              //     Navigator.pushNamed(context, '/second');
              //   },
              //   child: const Text("Go to the second screen"),
              // ),
              // MaterialButton(
              //   color: widget.color,
              //   onPressed: () {
              //     Navigator.pushNamed(context, '/third');
              //   },
              //   child: const Text("Go to the third screen"),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
