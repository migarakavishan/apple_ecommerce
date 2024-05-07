import 'package:apple_ecommerce/models/user_model.dart';
import 'package:apple_ecommerce/utils/custom_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserController {
  CollectionReference userCollection =
      FirebaseFirestore.instance.collection('Users');

  Future<void> saveUserData(UserModel user, BuildContext context) async {
    try {
      await userCollection.doc(user.uid).set(user.toJson());
      CustomDialog.dismissLoader();
    } catch (e) {
      CustomDialog.showDialog(context,
          title: 'Something went wrong', content: e.toString());
      CustomDialog.dismissLoader();
    }
  }
}
