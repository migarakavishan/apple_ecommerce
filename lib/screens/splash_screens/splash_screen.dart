import 'dart:async';

import 'package:apple_ecommerce/screens/auth_screens/auth_screen.dart';
import 'package:apple_ecommerce/utils/custom_navigator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({required this.type, super.key});

  final String type;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    if (widget.type == 'authScreen') {
      Timer(Duration(seconds: 3), () {
        CustomNavigator.pushReplacement(context, AuthScreen());
      });
    } else if(widget.type == 'addUser') {

    } else if(widget.type == 'fetchUser') {


    }
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
