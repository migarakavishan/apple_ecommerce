import 'package:apple_ecommerce/models/user_model.dart';
import 'package:apple_ecommerce/providers/auth_screen_provider.dart';
import 'package:apple_ecommerce/providers/user_provider.dart';
import 'package:apple_ecommerce/utils/custom_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class AuthController {
  static Future<void> createUserAccount(
      String email, String password, String name, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        Logger().f('User Created');

        UserModel user = UserModel(
            name: name, email: value.user!.email!, uid: value.user!.uid);
        Provider.of<UserProvider>(context, listen: false).setUser(user);
        Provider.of<AuthScreenProvider>(context, listen: false)
            .setSplashState('addData');
        Logger().f('Splash State Set');
        CustomDialog.dismissLoader();
      });
    } on FirebaseAuthException catch (e) {
      CustomDialog.dismissLoader();
      if (context.mounted) {
        if (e.code == 'email-already-in-use') {
          CustomDialog.showDialog(context,
              title: 'Something went wrong', content: 'Email already in use');
        } else if (e.code == 'invalid-email') {
          CustomDialog.showDialog(context,
              title: 'Something went wrong', content: 'Invalid Email Address');
        }
      }
    } catch (e) {
      CustomDialog.dismissLoader();
      if (context.mounted) {
        CustomDialog.showDialog(context,
            title: 'Something went wrong', content: e.toString());
      }
    }
  }

  static Future<void> signInUser(
      String email, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (context.mounted) {
        Provider.of<AuthScreenProvider>(context, listen: false)
            .setSplashState('fetchData');
      }
      CustomDialog.dismissLoader();
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
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
      }
      CustomDialog.dismissLoader();
    }
  }

  static Future<void> signOutuser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut().then((value) {
        Provider.of<AuthScreenProvider>(context, listen: false).clearFields();
      });
      if (context.mounted) {
        Provider.of<AuthScreenProvider>(context, listen: false)
            .setSplashState('authScreen');
      }
      Logger().f('User Signout');
    } catch (error) {
      Logger().e(error);
    }
  }

  static Future<void> sendPasswordResetEmail(
      String email, BuildContext context) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      if (context.mounted) {
        Provider.of<AuthScreenProvider>(context, listen: false).clearFields();
        CustomDialog.showDialog(context,
            title: 'Success', content: 'Please check your emails');
      }
      CustomDialog.dismissLoader();
    } catch (e) {
      if (context.mounted) {
        CustomDialog.showDialog(context,
            title: 'Something went wrong', content: e.toString());
      }
      CustomDialog.dismissLoader();
    }
  }
}
