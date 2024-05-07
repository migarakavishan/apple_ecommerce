import 'package:apple_ecommerce/screens/splash_screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthStateScreen extends StatelessWidget {
  const AuthStateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SizedBox();
          }
          if (snapshot.hasError) {
            return const SizedBox();
          }
          if (snapshot.data == null) {
            return const SplashScreen(
              type: 'authScreen',
            );
          } else {
            return const SplashScreen(
              type: '',
            );
          }
        },
      ),
    );
  }
}
