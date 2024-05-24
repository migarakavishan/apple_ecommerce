import 'package:apple_ecommerce/controllers/auth_controller.dart';
import 'package:apple_ecommerce/utils/custom_dialog.dart';
import 'package:flutter/material.dart';

class AuthScreenProvider extends ChangeNotifier {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;
  TextEditingController get nameController => _nameController;

  String _splashState = 'authScreen';
  String get splashState => _splashState;

  void setSplashState(String type) {
    _splashState = type;
    notifyListeners();
  }

  void startSignUp(BuildContext context) {
    if (_emailController.text.trim().isEmpty) {
      CustomDialog.showDialog(context,
          title: 'Something went wrong', content: 'Please insert your email');
    } else if (_passwordController.text.trim().length < 6) {
      CustomDialog.showDialog(context,
          title: 'Something went wrong',
          content: 'Password must be 6 characters');
    } else if (_passwordController.text != _confirmPasswordController.text) {
      CustomDialog.showDialog(context,
          title: 'Something went wrong', content: 'Password missmatch');
    } else if (_nameController.text.trim().isEmpty) {
      CustomDialog.showDialog(context,
          title: 'Something went wrong', content: 'Please insert your name');
    } else {
      CustomDialog.showLoader();
      AuthController.createUserAccount(_emailController.text,
          _passwordController.text, _nameController.text, context);
    }
  }

  void startSignIn(BuildContext context) {
    if (_emailController.text.trim().isEmpty) {
      CustomDialog.showDialog(context,
          title: 'Something went wrong', content: 'Please insert your email');
    } else if (_passwordController.text.trim().length < 6) {
      CustomDialog.showDialog(context,
          title: 'Something went wrong',
          content: 'Password must be 6 characters');
    } else {
      CustomDialog.showLoader();
      AuthController.signInUser(
          _emailController.text, _passwordController.text, context);
    }
  }

  void clearFields() {
    _emailController.clear();
    _passwordController.clear();
    _confirmPasswordController.clear();
    _nameController.clear();

    notifyListeners();
  }

  void startSendPasswordResetEmail(BuildContext context) {
    if (_emailController.text.trim().length <= 4) {
      CustomDialog.showDialog(context,
          title: 'Something went wrong', content: 'Please insert your email');
    }
    CustomDialog.showLoader();
    AuthController.sendPasswordResetEmail(_emailController.text, context);
  }
}
