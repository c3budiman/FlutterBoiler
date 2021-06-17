import 'package:flutterboiler/Pages/Examples/Screen/ExamplesScreen.dart';
import 'package:flutterboiler/Pages/Home/Screen/HomeScreen.dart';
import 'package:flutterboiler/Pages/Login/Screen/LoginScreen.dart';
import 'package:flutterboiler/Pages/Profile/Screen/ProfileScreen.dart';

class Routes {
  static final mainRoutes = {
    "/login": (context) => LoginScreen(),
    "/home": (context) => HomeScreen(),
    "/example": (context) => ExamplesScreen(),
    "/profile": (context) => ProfileScreen(),
  };
}
