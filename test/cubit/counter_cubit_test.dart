import 'package:bloc_flutter/cubit/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    late CounterCubit counterCubit;
    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });

    test('the initial state for CounterCubit is CounterState(counterValue:0)',
        () {
      expect(counterCubit.state,  const CounterState(counterValue: 0));
    });

    blocTest(
        'the cubit should emit a CounterState(counterValue:1, wasIncrement:true) when cubit.increment() function is called',
        build: ()=>counterCubit,
        act: (cubit)=> cubit.increment(),
        expect:()=> [const CounterState(counterValue: 1, wasIncremented: true)]
        
        
        );

           blocTest(
        'the cubit should emit a CounterState(counterValue:1, wasIncrement:true) when cubit.decrement() function is called',
        build: ()=>counterCubit,
        act: (cubit)=> cubit.decrement(),
        expect:()=> [const CounterState(counterValue: -1, wasIncremented: false)]
        
        
        );
  });
}
