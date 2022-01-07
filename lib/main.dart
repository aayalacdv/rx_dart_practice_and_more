import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rx_dart/models/counter_bloc.dart';
import 'package:rx_dart/models/form_bloc.dart';
import 'package:rx_dart/screens/counter_screen.dart';
import 'package:rx_dart/screens/reactive_form_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(providers: [
        Provider<CounterBlock>(
          create: (context) => CounterBlock(),
        ),
        Provider<FormBlock>(
          create: (context) => FormBlock(),
        ),
      ], child: FormScreen()),
    );
  }
}
