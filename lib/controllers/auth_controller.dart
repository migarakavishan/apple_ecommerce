import 'package:apple_ecommerce/utils/custom_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AuthController {
  static Future<void> createUserAccount(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        CustomDialog.dismissLoader();
      });
    } on FirebaseAuthException catch (e) {
      CustomDialog.dismissLoader();
      if (e.code == 'email-already-in-use') {
        CustomDialog.showDialog(context,
            title: 'Something went wrong', content: 'Email already in use');
      } else if (e.code == 'invalid-email') {
        CustomDialog.showDialog(context,
            title: 'Something went wrong', content: 'Invalid Email Address');
      }
    } catch (e) {
      CustomDialog.dismissLoader();
      CustomDialog.showDialog(context,
          title: 'Something went wrong', content: e.toString());
    }
  }

  static Future<void> signInUser(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      CustomDialog.dismissLoader();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        CustomDialog.showDialog(context,
            title: 'Something went wrong',
            content: 'No user found for that email.');
        Logger().e('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        CustomDialog.showDialog(context,
            title: 'Something went wrong',
            content: 'Wrong password provided for that user.');
        Logger().e('Wrong password provided for that user.');
      } else if (e.code == 'invalid-email') {
        CustomDialog.showDialog(context,
            title: 'Something went wrong', content: 'Invalid email');
        Logger().e('Invalid email');
      }
      CustomDialog.dismissLoader();
    }
  }

  static Future<void> signOutuser() async {
    try {
      await FirebaseAuth.instance.signOut();
      Logger().f('User Signout');
    } catch (error) {
      Logger().e(error);
    }
  }
}
