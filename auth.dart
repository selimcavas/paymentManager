import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //sign in function
  Future<User?> signIn(String email, String password) async {
    try {
      var user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return user.user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out function
  signOut() async {
    return await _auth.signOut();
  }

  //sign up function
  Future<User?> signUp(
      String email, String password, String repeatedPass) async {
    try {
      var user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      _firestore.collection('Users').doc(user.user?.uid).set({
        'email': email,
        'password': password,
        'balance': 0,
      });
      return user.user;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
