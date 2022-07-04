import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'navBar.dart';
import 'constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<FirebaseApp> _initializeFirebase() async {
    final FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home Page'),
      ),
      bottomNavigationBar: customNavBar(
        selectedMenu: menuState.home,
      ),
    );
  }
}
