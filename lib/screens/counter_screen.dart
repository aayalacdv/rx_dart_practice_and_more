import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rx_dart/models/counter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterBlock manager = Provider.of<CounterBlock>(context);

    return Scaffold(
      body: StreamBuilder(
        stream: manager.counter$,
        builder: (context, snapshot) {
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: () => manager.increment(),
                    icon: const Icon(Icons.add)),
                Text('Counter: ' + snapshot.data.toString()),
                IconButton(
                    onPressed: () => manager.decrement(),
                    icon: const Icon(Icons.remove)),
              ],
            ),
          );
        },
      ),
    );
  }
}
