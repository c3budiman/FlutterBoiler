import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutterboiler/Configs/Colors.dart';
import 'package:flutterboiler/Widgets/Appbar/Widgets/OfflineMessage.dart';

class AppbarPrimary extends StatefulWidget {
  const AppbarPrimary({required this.title});
  final String title;

  @override
  _AppbarPrimaryState createState() => _AppbarPrimaryState();
}

class _AppbarPrimaryState extends State<AppbarPrimary> {
  var subscription;
  bool connected = false;

  @override
  void initState() {
    super.initState();
    subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        setState(() {
          connected = (result != ConnectivityResult.none);
        });
      },
    );
  }

  @override
  dispose() {
    super.dispose();
    if (subscription != null) {
      subscription.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: <Widget>[],
      backgroundColor: Theme.of(context).colorScheme.blueOldTheme,
      brightness: Brightness.dark,
      // elevation: 60.0,
      elevation: 0,
      leading: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/c3budiman.jpeg',
              height: 35,
            ),
          ],
        ),
      ),
      centerTitle: false,
      titleSpacing: 0.0,
      title: Transform(
        transform: Matrix4.translationValues(-5.0, 0.0, 0.0),
        child: Text(
          widget.title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.whiteTheme,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      leadingWidth: 80,
      bottom: PreferredSize(
        child: Visibility(
          visible: !connected,
          child: OfflineMessage(),
        ),
        preferredSize: Size.fromHeight(10.0),
      ),
    );
  }
}
