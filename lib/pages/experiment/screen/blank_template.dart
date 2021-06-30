import 'package:flutter/material.dart';
import 'package:flutterboiler/configs/colors.dart';
import 'package:flutterboiler/widgets/appbar/appbar_primary.dart';
import 'package:flutterboiler/widgets/drawer/drawer_primary.dart';

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
      endDrawer: DrawerPrimary(),
    );
  }
}
