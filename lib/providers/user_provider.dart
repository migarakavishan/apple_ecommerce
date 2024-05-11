import 'dart:io';

import 'package:apple_ecommerce/models/user_model.dart';
import 'package:apple_ecommerce/utils/custom_image_picker.dart';
import 'package:flutter/material.dart';

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
    notifyListeners();
  }
}
