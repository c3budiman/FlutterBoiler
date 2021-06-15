import 'package:flutter/material.dart';
import 'package:flutterboiler/Pages/midleware.dart';
import 'package:flutterboiler/Configs/Colors.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Boiler',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Theme.of(context).colorScheme.whiteTheme,
      ),
      home: MiddleWare(),
    );
  }
}