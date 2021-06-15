import 'package:flutter/material.dart';
import 'package:flutterboiler/Configs/Colors.dart';
import 'package:flutterboiler/Widgets/Appbar/AppbarPrimary.dart';
import 'package:flutterboiler/Widgets/BottomNavbar/BottomNavbarPrimary.dart';
import 'package:flutterboiler/Widgets/BottomNavbar/Logic/NavbarLogic.dart';

class ExamplesScreen extends StatefulWidget {
  ExamplesScreen();

  @override
  _ExamplesScreenState createState() => _ExamplesScreenState();
}

class _ExamplesScreenState extends State<ExamplesScreen> {
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
          title: "Example",
          fontColor: Theme.of(context).colorScheme.whiteTheme,
          backgroundColor: Theme.of(context).colorScheme.blueOldTheme,
        ),
      ),
      endDrawer: Drawer(),
      bottomNavigationBar: BottomNavbarPrimary(
        activeBar: 1,
        onTap: (index) {
          NavbarLogic.navbarNavigation(
            context: context,
            currentIndex: 1,
            gotoIndex: index,
          );
        },
      ),
    );
  }
}
