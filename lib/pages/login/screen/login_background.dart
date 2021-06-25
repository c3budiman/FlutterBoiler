import 'package:flutter/material.dart';

class LoginBackground extends StatefulWidget {
  @override
  _LoginBackgroundState createState() => _LoginBackgroundState();
}

class _LoginBackgroundState extends State<LoginBackground> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image(
        image: AssetImage("assets/images/vector.png"),
        fit: BoxFit.cover,
      ),
    );
  }
}
