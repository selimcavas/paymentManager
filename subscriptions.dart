import 'package:flutter/material.dart';
import 'navBar.dart';
import 'constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  bool? _isChecked4 = false;
  double turkcellPrice = 35;
  bool? _isChecked5 = false;
  double exxenPrice = 25;

  double totalPrice = 0;

  @override
  void initState() {
    _getSavedValues();
  }

  _getSavedValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    setState(() {
      _isChecked1 = (prefs.getBool('1')) ?? false;
      _isChecked2 = (prefs.getBool('2')) ?? false;
      _isChecked3 = (prefs.getBool('3')) ?? false;
      _isChecked4 = (prefs.getBool('4')) ?? false;
      _isChecked5 = (prefs.getBool('5')) ?? false;
      netflixPrice = (prefs.getDouble('netflixPrice')) ?? 30;
      blutvPrice = (prefs.getDouble('blutvPrice')) ?? 40;
      disneyPrice = (prefs.getDouble('disneyPrice')) ?? 20;
      turkcellPrice = (prefs.getDouble('turkcellPrice')) ?? 35;
      exxenPrice = (prefs.getDouble('exxenPrice')) ?? 25;
      totalPrice = (prefs.getDouble('totalPrice')) ?? 0;
    });
  }

  _saveValues() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefs.setBool("1", _isChecked1!);
      prefs.setBool("2", _isChecked2!);
      prefs.setBool("3", _isChecked3!);
      prefs.setBool("4", _isChecked4!);
      prefs.setBool("5", _isChecked5!);
      prefs.setDouble("netflixPrice", 30);
      prefs.setDouble("blutvPrice", 40);
      prefs.setDouble("disneyPrice", 20);
      prefs.setDouble("turkcellPrice", 35);
      prefs.setDouble("exxenPrice", 25);
      prefs.setDouble("totalPrice", totalPrice);
    });
  }

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
                  _saveValues();
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
                  _saveValues();
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
                  _saveValues();
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
            CheckboxListTile(
              title: Text("TurkcellTV+"),
              value: _isChecked4,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked4 = value;
                  _saveValues();
                });
                if (_isChecked4 == true) {
                  totalPrice += turkcellPrice;
                } else {
                  totalPrice -= turkcellPrice;
                }
                print(totalPrice);
              },
              activeColor: Color.fromARGB(255, 9, 69, 165),
              checkColor: Colors.white,
              controlAffinity: ListTileControlAffinity.leading,
              tileColor: Colors.white10,
              subtitle: Text("35 TL"),
            ),
            CheckboxListTile(
              title: Text("Exxen"),
              value: _isChecked5,
              onChanged: (bool? value) {
                setState(() {
                  _isChecked5 = value;
                  _saveValues();
                });
                if (_isChecked5 == true) {
                  totalPrice += exxenPrice;
                } else {
                  totalPrice -= exxenPrice;
                }
                print(totalPrice);
              },
              activeColor: Color.fromARGB(255, 9, 69, 165),
              checkColor: Colors.white,
              controlAffinity: ListTileControlAffinity.leading,
              tileColor: Colors.white10,
              subtitle: Text("25 TL"),
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
