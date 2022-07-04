// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'constants.dart';
import 'navBar.dart';

class accountBalancePage extends StatefulWidget {
  final int balance;
  const accountBalancePage({Key? key, required this.balance}) : super(key: key);

  @override
  State<accountBalancePage> createState() => _accountBalancePageState();
}

class _accountBalancePageState extends State<accountBalancePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Balance'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 9, 69, 165),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 50),
          child: Row(
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
        ),
      ),
      bottomNavigationBar: customNavBar(selectedMenu: menuState.balance),
    );
  }
}
