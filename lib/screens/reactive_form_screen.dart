// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rx_dart/models/form_bloc.dart';
import 'package:rx_dart/widget/reactive_form_field.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FormBlock manager = Provider.of<FormBlock>(context);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30.0),
        color: Colors.white,
        child: Column(
          children: [
            Form(
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  ReactiveField(
                      sink: manager.inName,
                      stream: manager.name$,
                      label: 'Name'),
                  ReactiveField(
                      sink: manager.inEmail,
                      stream: manager.email$,
                      label: 'Email'),
                  ReactiveField(
                      sink: manager.inPassword,
                      stream: manager.password$,
                      label: 'Password'),
                ],
              ),
            ),
            Center(
              child: StreamBuilder<Object>(
                  stream: manager.isFormValid$,
                  builder: (context, snapshot) {
                    return MaterialButton(
                      onPressed: () {
                        if (snapshot.hasData) manager.sendData();
                      },
                      child: Text('Submit'),
                      color: Colors.white24,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
