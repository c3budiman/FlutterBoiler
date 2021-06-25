import 'package:flutter/material.dart';
import 'package:flutterboiler/configs/colors.dart';
import 'package:flutterboiler/utils/print_utils.dart';

class MiddleWare extends StatefulWidget {
  MiddleWare();

  @override
  _MiddleWareState createState() => _MiddleWareState();
}

class _MiddleWareState extends State<MiddleWare> {
  @override
  void initState() {
    super.initState();
    PrintUtils.printGreen("tes green");
    PrintUtils.printMagenta("tes magenta");
    PrintUtils.printWarning("tes yellow");
    PrintUtils.printWhite("tes white");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.whiteTheme,
      appBar: AppBar(
        title: const Text('AppBar Demo'),
        actions: <Widget>[],
      ),
    );
  }
}
