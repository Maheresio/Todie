import 'package:flutter/material.dart';

import '../../enums.dart';

class AuthProvider extends ChangeNotifier {
  //controllers and form key

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

// password text form field obsecure text

  bool obsecureText = true;

  void showOrHideText() {
    obsecureText = !obsecureText;
    notifyListeners();
  }

//validate email and password
  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zAZ0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    final passwordRegex =
        RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)[A-Za-z\d@$!%*?&]{8,}$');
    if (!passwordRegex.hasMatch(value)) {
      return 'Password must contain at least one uppercase letter, one lowercase letter, and one number';
    }
    return null;
  }

  bool validate() {
    final formState = formKey.currentState;
    if (formState == null) return false;
    return formState.validate();
  }

//auth mode to toggle between auth screens
  AuthMode authMode = AuthMode.signUp;
  void toggleAuthMode() {
    authMode = authMode == AuthMode.signIn ? AuthMode.signUp : AuthMode.signIn;
    notifyListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }
}
