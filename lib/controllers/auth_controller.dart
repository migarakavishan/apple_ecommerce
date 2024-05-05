import 'package:firebase_auth/firebase_auth.dart';
import 'package:logger/logger.dart';

class AuthController {
  static Future<void> createUserAccount(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Logger().e(e.code);
      } else {
        Logger().e(e.code);
      }
    } catch (e) {
      Logger().e(e);
    }
  }

  static Future<void> signInUser(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Logger().e('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        Logger().e('Wrong password provided for that user.');
      } else if (e.code == 'invalid-email') {
        Logger().e('Invalid email');
      }
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
