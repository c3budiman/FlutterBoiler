import 'package:flutter/material.dart';
import 'package:flutterboiler/Configs/Colors.dart';
import 'package:flutterboiler/Widgets/Appbar/AppbarPrimary.dart';
import 'package:flutterboiler/Widgets/BottomNavbar/BottomNavbarPrimary.dart';
import 'package:flutterboiler/Widgets/BottomNavbar/Logic/NavbarLogic.dart';

class BlankTemplate extends StatefulWidget {
  BlankTemplate();

  @override
  _BlankTemplateState createState() => _BlankTemplateState();
}

class _BlankTemplateState extends State<BlankTemplate> {
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
      endDrawer: Drawer(),
      bottomNavigationBar: BottomNavbarPrimary(
        activeBar: 0,
        onTap: (index) {
          NavbarLogic.navbarNavigation(
            context: context,
            currentIndex: 0,
            gotoIndex: index,
          );
        },
      ),
    );
  }
}
