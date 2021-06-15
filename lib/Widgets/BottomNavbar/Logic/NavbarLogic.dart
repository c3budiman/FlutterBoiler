import 'package:flutter/material.dart';
import 'package:flutterboiler/Pages/Examples/Screen/ExamplesScreen.dart';
import 'package:flutterboiler/Pages/Home/Screen/HomeScreen.dart';
import 'package:flutterboiler/Pages/Profile/Screen/ProfileScreen.dart';

///
///This Function class for handling the bottom navbar navigation
///thru the apps
///
class NavbarLogic {
  ///
  ///This Function for navigating the bottom navbar
  ///Current index is from the current pages, and the gotoindex is from the
  ///Bottom navigation bar index
  ///
  static navbarNavigation({
    required context,
    required int currentIndex,
    required int gotoIndex,
  }) {
    if (gotoIndex == 0 && currentIndex != 0) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
    }
    if (gotoIndex == 1 && currentIndex != 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ExamplesScreen(),
        ),
      );
    }
    if (gotoIndex == 2 && currentIndex != 2) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(),
        ),
      );
    }
  }
}
