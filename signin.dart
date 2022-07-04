// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:paymentsystem/home.dart';
import 'auth.dart';
import 'register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          colors: <Color>[
            Color.fromARGB(255, 9, 69, 165),
            Color.fromARGB(255, 57, 142, 227),
          ],
        )),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          const SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: const <Widget>[
                Text(
                  "Payment System",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontFamily: 'Lora-Regular'),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: const <Widget>[
                Text(
                  "Welcome back!",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Email",
                  hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: TextFormField(
              controller: _passwordController,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Password",
                  hintStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100),
            child: Container(
              width: double.infinity,
              child: RawMaterialButton(
                onPressed: () {
                  _authService
                      .signIn(_emailController.text, _passwordController.text)
                      .then((value) {
                    if (value != null) {
                      return Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                          (Route<dynamic> route) => false);
                    } else {
                      Widget okButton = TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      );
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("This account does not exist"),
                              actions: [okButton],
                            );
                          });
                    }
                  });
                },
                child: Text("Login"),
                fillColor: Color.fromARGB(255, 167, 227, 229),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 150),
            child: Container(
              width: double.infinity,
              child: RawMaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: Text("Sign Up"),
                fillColor: Color.fromARGB(255, 212, 246, 247),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
