import 'package:apple_ecommerce/providers/user_provider.dart';
import 'package:apple_ecommerce/utils/custom_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class UserController {
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');

  Future<void> saveUserData(BuildContext context) async {
    try {
      final user = Provider.of<UserProvider>(context, listen: false).user;
      await userCollection.doc(user!.uid).set(user.toJson());
      Logger().f('User data saved');
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
