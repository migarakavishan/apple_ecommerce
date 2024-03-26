import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
                  const CupertinoActivityIndicator(color: Colors.black,),
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
