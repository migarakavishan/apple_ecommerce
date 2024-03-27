import 'package:flutter/cupertino.dart';

class CustomNavigator {
  static void push(BuildContext context, Widget widget) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => widget));
  }

  static void pushReplacement(BuildContext context, Widget widget) {
    Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => widget));
  }
}
