import 'package:apple_ecommerce/providers/auth_screen_provider.dart';
import 'package:apple_ecommerce/screens/splash_screens/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthStateScreen extends StatelessWidget {
  const AuthStateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            // Logger().e('Refreshing....');
            final splashType =
                Provider.of<AuthScreenProvider>(context, listen: false)
                    .splashState;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SizedBox();
            }
            if (snapshot.hasError) {
              return const SizedBox();
            }
            if (snapshot.data == null) {
              return SplashScreen(
                type: splashType,
              );
            } else {
              if (splashType == 'authScreen') {
                return const SplashScreen(
                  type: 'fetchData',
                );
              }
              return SplashScreen(
                type: splashType,
              );
            }
          },
        ));
  }
}
