import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutterboiler/Widgets/Appbar/Widgets/OfflineMessage.dart';

class AppbarPrimary extends StatefulWidget {
  const AppbarPrimary({
    required this.title,
    required this.backgroundColor,
    required this.fontColor,
    Function? this.connectionChange,
  });
  final String title;
  final Color backgroundColor;
  final Color fontColor;
  final connectionChange;

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
        if (result != ConnectivityResult.none) {
          setState(() {
            connected = true;
          });
          if (widget.connectionChange != null) {
            widget.connectionChange(true);
          }
        } else {
          print('masuk false');
          setState(() {
            connected = false;
          });
          if (widget.connectionChange != null) {
            widget.connectionChange(false);
          }
        }
      },
    );
    checkCon();
  }

  checkCon() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    setState(() {
      connected = (connectivityResult != ConnectivityResult.none);
    });
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
      backgroundColor: widget.backgroundColor,
      brightness: Brightness.dark,
      elevation: 50.0,
      // elevation: 0,
      // leading: Container(
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Image.asset(
      //         Images.logo,
      //         height: 35,
      //       ),
      //     ],
      //   ),
      // ),
      centerTitle: false,
      titleSpacing: 0.0,
      title: Transform(
        transform: Matrix4.translationValues(20, 0.0, 0.0),
        child: Text(
          widget.title,
          style: TextStyle(
            color: widget.fontColor,
            fontWeight: FontWeight.bold,
            fontSize: 30,
            fontFamily: 'Billabong',
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
