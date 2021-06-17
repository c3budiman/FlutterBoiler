import 'package:flutter/material.dart';
import 'package:flutterboiler/Configs/Colors.dart';
import 'package:flutterboiler/Widgets/Appbar/AppbarPrimary.dart';
import 'package:flutterboiler/Widgets/BottomNavbar/BottomNavbarPrimary.dart';
import 'package:flutterboiler/Widgets/BottomNavbar/Logic/NavbarLogic.dart';
import 'package:flutterboiler/Widgets/Drawer/DrawerPrimary.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen();

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.whiteTheme,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppbarPrimary(
          title: "Home",
          fontColor: Theme.of(context).colorScheme.whiteTheme,
          backgroundColor: Theme.of(context).colorScheme.blueOldTheme,
        ),
      ),
      endDrawer: DrawerPrimary(),
      bottomNavigationBar: BottomNavbarPrimary(
        activeBar: 2,
        onTap: (index) {
          NavbarLogic.navbarNavigation(
            context: context,
            currentIndex: 2,
            gotoIndex: index,
          );
        },
      ),
    );
  }
}
