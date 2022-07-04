import 'package:flutter/material.dart';
import 'navBar.dart';
import 'constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double totalSubPrice = 0;
  List<bool> activeServices = [false, false, false, false, false];

  _getSubscriptionsPrice() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    double? subscriptionsPrice = prefs.getDouble("totalPrice");
    return subscriptionsPrice;
  }

  _getActiveServices() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getBool("1") == true) {
      activeServices[0] = true;
    } else {
      activeServices[0] = false;
    }
    if (prefs.getBool("2") == true) {
      activeServices[1] = true;
    } else {
      activeServices[1] = false;
    }
    if (prefs.getBool("3") == true) {
      activeServices[2] = true;
    } else {
      activeServices[2] = false;
    }
    if (prefs.getBool("4") == true) {
      activeServices[3] = true;
    } else {
      activeServices[3] = false;
    }
    if (prefs.getBool("5") == true) {
      activeServices[4] = true;
    } else {
      activeServices[4] = false;
    }

    return activeServices;
  }

  @override
  Widget build(BuildContext context) {
    @override
    void initState() {
      _getSubscriptionsPrice();
      _getActiveServices();
    }

    _getSubscriptionsPrice().then((value) {
      setState(() {
        totalSubPrice = value;
      });
    });

    _getActiveServices().then((value) {
      setState(() {
        activeServices = value;
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 9, 69, 165),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Active Subscriptions",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Netflix ",
                      style: TextStyle(
                        fontSize: 25,
                        color: activeServices[0]
                            ? Colors.red
                            : inactiveButtonColor,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text("BluTV ",
                      style: TextStyle(
                        fontSize: 25,
                        color: activeServices[1]
                            ? Color.fromARGB(255, 54, 228, 244)
                            : inactiveButtonColor,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Disney+ ",
                      style: TextStyle(
                        fontSize: 25,
                        color: activeServices[2]
                            ? Color.fromARGB(255, 8, 0, 244)
                            : inactiveButtonColor,
                      )),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("TurkcellTV+ ",
                      style: TextStyle(
                        fontSize: 25,
                        color: activeServices[3]
                            ? Color.fromARGB(255, 161, 157, 82)
                            : inactiveButtonColor,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Exxen ",
                      style: TextStyle(
                        fontSize: 25,
                        color: activeServices[4]
                            ? Color.fromARGB(255, 155, 54, 244)
                            : inactiveButtonColor,
                      )),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Total Subscriptions Price: $totalSubPrice",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: customNavBar(
        selectedMenu: menuState.home,
      ),
    );
  }
}
