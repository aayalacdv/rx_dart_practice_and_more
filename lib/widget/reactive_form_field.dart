import 'package:flutter/material.dart';

class ReactiveField extends StatelessWidget {
  const ReactiveField(
      {Key? key, required this.sink, required this.stream, required this.label})
      : super(key: key);
  final Stream stream;
  final String label;
  final Sink sink;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: stream,
        builder: (context, snapshot) {
          return TextField(
            onChanged: sink.add,
            decoration: InputDecoration(
                errorText: snapshot.hasError ? snapshot.error.toString() : null,
                label: Text(label)),
          );
        });
  }
}
