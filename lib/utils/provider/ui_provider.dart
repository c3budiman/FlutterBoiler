import 'package:flutter/material.dart';

class UIProvider extends ChangeNotifier {
  static final instance = UIProvider();

  bool _showNavbar = true;

  bool get showNavbar => _showNavbar;

  void navbarShow() {
    _showNavbar = true;
    notifyListeners();
  }

  void navbarHide() {
    _showNavbar = false;
    notifyListeners();
  }
}
