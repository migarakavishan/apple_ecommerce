import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomDialog {
  static void showLoader() {
    EasyLoading.show(
        maskType: EasyLoadingMaskType.black,
        indicator: const SpinKitThreeInOut(
          color: Colors.blue,
        ));
  }

  static void dismissLoader() {
    EasyLoading.dismiss();
  }

  static void showDialog(BuildContext context,
      {required String title, required String content}) {
    showCupertinoDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              CupertinoDialogAction(
                child: const Text(
                  "ok",
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }
}
