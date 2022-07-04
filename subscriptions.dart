import 'package:flutter/material.dart';
import 'package:paymentsystem/auth.dart';
import 'navBar.dart';
import 'constants.dart';

class subscriptionPage extends StatefulWidget {
  const subscriptionPage({Key? key}) : super(key: key);

  @override
  State<subscriptionPage> createState() => _subscriptionPageState();
}

class _subscriptionPageState extends State<subscriptionPage> {
  bool? _isChecked1 = false;
  double netflixPrice = 30;
  bool? _isChecked2 = false;
  double blutvPrice = 40;
  bool? _isChecked3 = false;
  double disneyPrice = 20;

  double totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Subscriptions'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 9, 69, 165),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CheckboxListTile(
              title: Text("Netflix"),
              value: _isChecked1,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked1 = value;
                });
                if (_isChecked1 == true) {
                  totalPrice += netflixPrice;
                } else {
                  totalPrice -= netflixPrice;
                }
                print(totalPrice);
              },
              activeColor: Color.fromARGB(255, 9, 69, 165),
              checkColor: Colors.white,
              controlAffinity: ListTileControlAffinity.leading,
              tileColor: Colors.white10,
              subtitle: Text("30 TL"),
            ),
            CheckboxListTile(
              title: Text("BluTV"),
              value: _isChecked2,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked2 = value;
                });
                if (_isChecked2 == true) {
                  totalPrice += blutvPrice;
                } else {
                  totalPrice -= blutvPrice;
                }
                print(totalPrice);
              },
              activeColor: Color.fromARGB(255, 9, 69, 165),
              checkColor: Colors.white,
              controlAffinity: ListTileControlAffinity.leading,
              tileColor: Colors.white10,
              subtitle: Text("40 TL"),
            ),
            CheckboxListTile(
              title: Text("Disney+"),
              value: _isChecked3,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked3 = value;
                });
                if (_isChecked3 == true) {
                  totalPrice += disneyPrice;
                } else {
                  totalPrice -= disneyPrice;
                }
                print(totalPrice);
              },
              activeColor: Color.fromARGB(255, 9, 69, 165),
              checkColor: Colors.white,
              controlAffinity: ListTileControlAffinity.leading,
              tileColor: Colors.white10,
              subtitle: Text("20 TL"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Total Price: ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                Text(
                  "-" + totalPrice.toString(),
                  style: TextStyle(
                    color: totalPrice > 0 ? Colors.red : Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: customNavBar(selectedMenu: menuState.subscriptions),
    );
  }
}
