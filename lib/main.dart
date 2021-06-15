import 'package:flutter/material.dart';
import 'package:flutterboiler/Pages/Home/Screen/HomeScreen.dart';
import 'package:flutterboiler/Pages/Login/Screen/LoginScreen.dart';
import 'package:flutterboiler/Configs/Colors.dart';
import 'package:flutter/services.dart';

void main() {
  // biar appbarnya bening / transparent color
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));

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
      home: LoginScreen(),
      routes: {
        "/login": (BuildContext context) => LoginScreen(),
        "/home": (BuildContext context) => HomeScreen(),
      },
    );
  }
}