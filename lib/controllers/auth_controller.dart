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
}
