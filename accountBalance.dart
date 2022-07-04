// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:paymentsystem/get_account_balance.dart';
import 'package:paymentsystem/signin.dart';
import 'constants.dart';
import 'navBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class accountBalancePage extends StatefulWidget {
  final int balance;
  const accountBalancePage({Key? key, required this.balance}) : super(key: key);

  @override
  State<accountBalancePage> createState() => _accountBalancePageState();
}

class _accountBalancePageState extends State<accountBalancePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  int? balance;

  @override
  Widget build(BuildContext context) {
    String uid = _auth.currentUser!.uid;
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Balance'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 9, 69, 165),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Acount Balance: ',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(widget.balance.toString(),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green)),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Add Balance',
                    labelStyle: TextStyle(fontSize: 18),
                  ),
                  style: TextStyle(fontSize: 20),
                  onSaved: (value) {
                    if (value != null &&
                        value != '' &&
                        !(value.contains('.') ||
                            value.contains(',') ||
                            value.contains(' '))) {
                      setState(() {
                        balance = int.parse(value.toString());
                      });
                    } else {
                      setState(() {
                        balance = null;
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      if (balance == 0 || balance == null || balance! > 500) {
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
                                title: Text(
                                    "Enter a valid balance that is smaller than 500"),
                                actions: [okButton],
                              );
                            });
                      } else {
                        _firestore.collection('Users').doc(uid).update({
                          'balance': widget.balance + balance!
                        }).then((value) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => fetchBalance()),
                              (route) => false);
                        });
                      }
                    }
                  },
                  child: Text('Deposit'),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red)),
                  onPressed: () {
                    _auth.signOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (builder) => LoginPage()),
                        (route) => false);
                  },
                  child: Text(
                    'Sign Out',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: customNavBar(selectedMenu: menuState.balance),
    );
  }
}
