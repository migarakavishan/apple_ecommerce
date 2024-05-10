import 'package:apple_ecommerce/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  UserModel? get user => _user;

  final TextEditingController _nameUpdateController = TextEditingController();
  TextEditingController get nameUpdateController => _nameUpdateController;

  void setUser(UserModel userModel) {
    _user = userModel;
    _nameUpdateController.text = userModel.name;
    notifyListeners();
  }
}
