
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class AuthService extends ChangeNotifier {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;



  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> signIn( BuildContext context) async {
//get the auth services

    final authService = Provider.of<AuthService>(context , listen: false);
    try {
      await authService.signInWithEmailandPassword(
          emailController.text, passwordController.text);



    } catch (e) {
      ScaffoldMessenger.of(context ).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));

    }
    notifyListeners();
  }













  Future<UserCredential> signInWithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      _firebaseFirestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,
      },SetOptions(merge: true),);
      notifyListeners();

      return userCredential;
    } on FirebaseException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<UserCredential> signUpWithEmailandPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      //create a document for the user for in the user collection

      _firebaseFirestore.collection('users').doc(userCredential.user!.uid).set({
        'uid': userCredential.user!.uid,
        'email': email,

      });
      notifyListeners();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }

  }

  //

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }


}
