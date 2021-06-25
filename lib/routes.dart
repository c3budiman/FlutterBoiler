import 'package:flutter/material.dart';
import 'package:flutterboiler/pages/404/404_page.dart';
import 'package:flutterboiler/pages/login/screen/login_screen.dart';
import 'package:flutterboiler/pages/register/screen/register_screen.dart';
import 'package:flutterboiler/widgets/bottom_navbar/bottom_navbar_primary.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  final uri = Uri.parse(settings.name!);
  final segments = uri.pathSegments;

  if (segments.isEmpty) {
    return MaterialPageRoute(
      builder: (BuildContext context) => NotFoundPage(),
    );
  }
  final path = segments.first;

  switch (path) {
    case "login":
      return MaterialPageRoute(
        builder: (BuildContext context) => LoginScreen(),
      );
    case "register":
      return MaterialPageRoute(
        builder: (BuildContext context) => RegisterScreen(),
      );
    case "home":
      return MaterialPageRoute(
        builder: (BuildContext context) => BottomNavBarPrimary(),
      );
    default:
      return MaterialPageRoute(
        builder: (BuildContext context) => NotFoundPage(),
      );
  }
}
