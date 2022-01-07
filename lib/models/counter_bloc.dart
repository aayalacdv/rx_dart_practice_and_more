import 'package:rxdart/rxdart.dart';

class CounterBlock {
  BehaviorSubject<int> _counter = BehaviorSubject<int>.seeded(0);

  int get counterValue => _counter.value;
  Stream<int> get counter$ => _counter.stream;

  void increment() => _counter.add(counterValue + 1);
  void decrement() => _counter.add(counterValue - 1);
}
