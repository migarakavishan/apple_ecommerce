import 'dart:async';

import 'package:apple_ecommerce/screens/auth_screens/auth_screen.dart';
import 'package:apple_ecommerce/screens/homepage/homepage.dart';
import 'package:apple_ecommerce/utils/custom_navigator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          Logger().e('User is currently signed out!');
          CustomNavigator.push(context, const AuthScreen());
        } else {
          Logger().f('User is signed in!');
          CustomNavigator.push(context, const HomePage());
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Center(
            child: Image.asset(
              'assets/images/logo.png',
              width: size.width * 0.3,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsetsDirectional.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CupertinoActivityIndicator(
                    color: Colors.black,
                  ),
                  Text(
                    'From Apple.Inc',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
