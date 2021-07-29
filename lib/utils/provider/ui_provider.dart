import 'package:flutter/material.dart';

class UIProvider extends ChangeNotifier {
  static final instance = UIProvider();

  bool _showNavbar = true;
  bool _isDeviceSupport = false;

  bool get showNavbar => _showNavbar;
  bool get isDeviceSupport => _isDeviceSupport;

  set isDeviceSupport(bool value) {
    _isDeviceSupport = value;
    notifyListeners();
  }

  void navbarShow() {
    _showNavbar = true;
    notifyListeners();
  }

  void navbarHide() {
    _showNavbar = false;
    notifyListeners();
  }
}
