// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:paymentsystem/accountBalance.dart';
import 'package:paymentsystem/home.dart';
import 'package:paymentsystem/subscriptions.dart';
import 'get_account_balance.dart';
import 'searchMenu.dart';
import 'constants.dart';
import 'home.dart';

class customNavBar extends StatelessWidget {
  const customNavBar({
    Key? key,
    required this.selectedMenu,
  }) : super(key: key);

  final menuState selectedMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5), topRight: Radius.circular(5)),
      ),
      child: SafeArea(
        top: false,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          IconButton(
            icon: Icon(Icons.add_to_queue,
                color: menuState.subscriptions == selectedMenu
                    ? activeButtonColor
                    : inactiveButtonColor),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (builder) => subscriptionPage()),
                  (route) => false);
            },
          ),
          IconButton(
            icon: Icon(Icons.search,
                color: menuState.search == selectedMenu
                    ? activeButtonColor
                    : inactiveButtonColor),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (builder) => searchPage()),
                  (route) => false);
            },
          ),
          IconButton(
            icon: Icon(Icons.home,
                color: menuState.home == selectedMenu
                    ? activeButtonColor
                    : inactiveButtonColor),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (builder) => HomePage()),
                  (route) => false);
            },
          ),
          IconButton(
            icon: Icon(Icons.account_balance,
                color: menuState.balance == selectedMenu
                    ? activeButtonColor
                    : inactiveButtonColor),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (builder) => fetchBalance()),
                  (route) => false);
            },
          )
        ]),
      ),
    );
  }
}
