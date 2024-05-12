import 'dart:io';

import 'package:apple_ecommerce/controllers/user_controller.dart';
import 'package:apple_ecommerce/models/user_model.dart';
import 'package:apple_ecommerce/utils/custom_dialog.dart';
import 'package:apple_ecommerce/utils/custom_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  UserModel? get user => _user;

  File? _pickedImage;
  File? get pickedImage => _pickedImage;

  final TextEditingController _nameUpdateController = TextEditingController();
  TextEditingController get nameUpdateController => _nameUpdateController;

  void setUser(UserModel userModel) {
    _user = userModel;
    _nameUpdateController.text = userModel.name;
    notifyListeners();
  }

  Future<void> pickProfilePicture() async {
    _pickedImage = await CustomImagePicker().pickImage();
    Logger().f(_pickedImage!.path);
    notifyListeners();
  }

  void startUserUpdate(BuildContext context) {
    if (_nameUpdateController.text.trim().length < 3) {
      CustomDialog.showDialog(context,
          title: 'Something went wrong', content: 'Please check your username');
    } else {
      CustomDialog.showLoader();
      UserController().updateUserData(
          _pickedImage, _nameUpdateController.text, _user!.uid, context);
    }
  }

  void updateUserModel(String? name, String? image) {
    _pickedImage = null;
    if (name != null) {
      _user!.name = name;
    }
    if (image != null) {
      _user!.image = image;
    }
    notifyListeners();
  }
}
