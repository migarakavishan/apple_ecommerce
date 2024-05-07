import 'package:apple_ecommerce/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;
  UserModel? get user => _user;

  void setUser(UserModel userModel) {
    _user = userModel;
    notifyListeners();
  }
}
