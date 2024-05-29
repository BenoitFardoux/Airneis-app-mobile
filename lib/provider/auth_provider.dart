import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    notifyListeners();
    print('dans le login de notifier');
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners();
  }
}
