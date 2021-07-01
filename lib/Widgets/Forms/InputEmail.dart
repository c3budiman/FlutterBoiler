import 'package:flutter/material.dart';
import 'package:flutterboiler/Configs/Colors.dart';

class InputEmail extends StatefulWidget {
  InputEmail({required this.onChanged, required this.label});

  final Function onChanged;
  final String label;

  @override
  _InputEmailState createState() => _InputEmailState();
}

class _InputEmailState extends State<InputEmail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        style: TextStyle(
          height: 0.8,
          fontSize: 14.0,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelStyle: TextStyle(color: Theme.of(context).colorScheme.goldTheme),
          prefixIcon: Icon(
            Icons.mail_outline,
            color: Theme.of(context).colorScheme.goldTheme,
          ),
          fillColor: Theme.of(context).colorScheme.blueOldTheme,
          labelText: widget.label,
        ),
        onChanged: (e) {
          widget.onChanged(e);
        },
      ),
    );
  }
}
