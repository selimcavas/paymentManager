// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:paymentsystem/wrapper.dart';
import 'wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _init = Firebase.initializeApp();

    return FutureBuilder(
        future: _init,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Container();
          } else if (snapshot.hasData) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: wrapper(),
            );
          } else {
            return CircularProgressIndicator();
          }
        });
  }
}
