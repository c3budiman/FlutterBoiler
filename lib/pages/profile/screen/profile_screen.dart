import 'package:flutter/material.dart';
import 'package:flutterboiler/configs/colors.dart';
import 'package:flutterboiler/utils/provider/ui_provider.dart';
import 'package:flutterboiler/widgets/appbar/appbar_primary.dart';
import 'package:flutterboiler/widgets/drawer/drawer_primary.dart';

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
          title: "Profile",
          fontColor: Theme.of(context).colorScheme.whiteTheme,
          backgroundColor: Theme.of(context).colorScheme.blueOldTheme,
        ),
      ),
      endDrawer: DrawerPrimary(),
      onEndDrawerChanged: (val) {
        if (val)
          UIProvider.instance.navbarHide();
        else
          UIProvider.instance.navbarShow();
      },
    );
  }
}
