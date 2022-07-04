import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paymentsystem/home.dart';
import 'package:paymentsystem/signin.dart';

class wrapper extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return HomePage();
    } else {
      return LoginPage();
    }
  }
}
