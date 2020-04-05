import 'package:app/AfterLogin/afterLoginHomePage.dart';
import 'package:app/BeforeLogin/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthServ {
  static final _auth = FirebaseAuth.instance;
  static final _firestore = Firestore.instance;
  static AuthResult authRes;
  static void signUpUser(
      BuildContext context,
      String firstName,
      String lastName,
      String email,
      String password,
      String telephone,
      String type,
      String street,
      String aptfloor,
      String pcode,
      String city) async {
    try {
      authRes = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser signedInUser = authRes.user; // handles auth
      // handles writing to the db
      if (signedInUser != null) {
        _firestore.collection('/users').document(signedInUser.uid).setData({
          'userId': authRes.user.uid,
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'telephone': telephone,
          'type': type,
          'street': street,
          'aptFloor': aptfloor,
          'pcode': pcode,
          'city': city
        });
        Navigator.pushReplacementNamed(
            context, AfterLoginHomePage.id); // not to be able to come back
      }
    } catch (e) {
      Widget okBut = FlatButton(
        child: Text("OK"),
        onPressed: () => Navigator.of(context).pop(),
      );

      AlertDialog alert = AlertDialog(
        title: Text("Error"),
        content: Text("Email already used"),
        actions: [
          okBut,
        ],
      );

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return alert;
          });
    }
  }

  static void logout(BuildContext context) {
    _auth.signOut();
    Navigator.pushReplacementNamed(context, LoginScreen.id);
  }

  static Future<bool> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      return false;
    }
    return true;
  }

  static AuthResult getAuth() {
    return authRes;
  }
}
