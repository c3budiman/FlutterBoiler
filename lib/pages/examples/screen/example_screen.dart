import 'package:flutter/material.dart';
import 'package:flutterboiler/configs/colors.dart';
import 'package:flutterboiler/utils/navigator_custom.dart';
import 'package:flutterboiler/utils/provider/ui_provider.dart';
import 'package:flutterboiler/widgets/appbar/appbar_primary.dart';
import 'package:flutterboiler/widgets/drawer/drawer_primary.dart';

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
    return WillPopScope(
      onWillPop: () async {
        await NavigatorCustom.forwardNavigate(
          context: context,
          from: 'example',
          to: 'home',
        );
        return false;
      },
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.whiteTheme,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppbarPrimary(
            title: "Example",
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
      ),
    );
  }
}
