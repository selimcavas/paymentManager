import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:paymentsystem/accountBalance.dart';

class fetchBalance extends StatelessWidget {
  fetchBalance({Key? key}) : super(key: key);
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    String uid = _auth.currentUser!.uid;

    final CollectionReference userRef =
        FirebaseFirestore.instance.collection("Users");

    return Scaffold(
      body: FutureBuilder<DocumentSnapshot>(
        future: userRef.doc(uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else if (snapshot.hasData &&
              snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return accountBalancePage(balance: data['balance']);
          } else {
            return Center(child: Text('Loading...'));
          }
        },
      ),
    );
  }
}
