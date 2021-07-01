import 'package:flutterboiler/Utils/NavigatorCustom.dart';

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
  }) async {
    var navigator = ['/home', '/example', '/profile'];
    await NavigatorCustom.forwardNavigate(
      context: context,
      from: navigator[currentIndex],
      to: navigator[gotoIndex],
    );
  }
}
