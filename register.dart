// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:paymentsystem/signin.dart';
import 'auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repeatedPasswordController =
      TextEditingController();

  final AuthService _authService = AuthService();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          child: Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: const <Widget>[
                        Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontFamily: 'Lora-Regular'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: TextFormField(
                      controller: _emailController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) => isEmail(email),
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          errorStyle: TextStyle(color: Colors.yellow),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Email",
                          hintStyle:
                              TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (pass) => isPassword(pass),
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          errorStyle: TextStyle(color: Colors.yellow),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Password",
                          hintStyle:
                              TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                          prefixIcon: Icon(
                            Icons.lock,
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
                      controller: _repeatedPasswordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (repeatedPass) {
                        if (repeatedPass != _passwordController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                      obscureText: true,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          errorStyle: TextStyle(color: Colors.yellow),
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "Repeat Password",
                          hintStyle:
                              TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
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
                    padding: const EdgeInsets.symmetric(horizontal: 150),
                    child: Container(
                      width: double.infinity,
                      child: RawMaterialButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _authService
                                .signUp(
                              _emailController.text,
                              _passwordController.text,
                              _repeatedPasswordController.text,
                            )
                                .then((value) {
                              if (value != null) {
                                return Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()),
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
                                        title: Text("Email is already in use"),
                                        actions: [okButton],
                                      );
                                    });
                              }
                            });
                          }
                        },
                        child: Text("Sign Up"),
                        fillColor: Color.fromARGB(255, 212, 246, 247),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                    ),
                  ),
                ]),
          )),
    );
  }
}

//to check if it is a valid email
String? isEmail(String? input) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);
  if (input == null) {
    return "Null mail";
  } else if (input.isEmpty) {
    return "Enter a mail";
  } else if (!regExp.hasMatch(input)) {
    return "Fix characters according to mail format";
  }
  return null;
}

String? isPassword(String? input) {
  if (input == null) {
    return "Null password";
  } else if (input.isEmpty) {
    return "Enter a password";
  } else if (input.length < 6) {
    return "Password must be at least 6 characters";
  }
  return null;
}
