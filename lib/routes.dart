import 'package:flutter/material.dart';
import 'package:flutterboiler/pages/404/404_page.dart';
import 'package:flutterboiler/pages/login/screen/login_screen.dart';
import 'package:flutterboiler/pages/register/screen/register_screen.dart';
import 'package:flutterboiler/utils/provider/auth_provider.dart';
import 'package:flutterboiler/widgets/bottom_navbar/bottom_navbar_primary.dart';

Route<dynamic>? generateRoutes(RouteSettings settings) {
  final isLogin = AuthProvider.instance.isLogin;
  final uri = Uri.parse(settings.name!);
  final segments = uri.pathSegments;

  //Check if already login or not
  if (segments.isEmpty) {
    return MaterialPageRoute(
      settings: settings.copyWith(name: isLogin ? 'home' : 'login'),
      builder: (BuildContext context) =>
          isLogin ? BottomNavBarPrimary() : LoginScreen(),
    );
  }

  final path = segments.first;

  Widget? screen;

  switch (path) {
    case "login":
      screen = LoginScreen();
      break;
    case "register":
      screen = RegisterScreen();
      break;
    case "home":
      screen = BottomNavBarPrimary();
      break;
    default:
      screen = NotFoundPage();
      break;
  }

  return MaterialPageRoute(
    builder: (_) => screen!,
    settings: settings,
  );
}
