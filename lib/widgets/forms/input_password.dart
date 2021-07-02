import 'package:flutter/material.dart';
import 'package:flutterboiler/configs/colors.dart';

class InputPassword extends StatefulWidget {
  InputPassword(
      {required this.onChanged, required this.label, this.isBottom = false});

  final Function onChanged;
  final String label;
  final bool isBottom;

  @override
  _InputPasswordState createState() => _InputPasswordState();
}

class _InputPasswordState extends State<InputPassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: TextField(
        obscureText: true,
        style: TextStyle(
          fontSize: 14.0,
          color: Theme.of(context).colorScheme.goldTheme,
        ),
        decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(
            borderRadius: widget.isBottom
                ? BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )
                : BorderRadius.circular(0),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.goldTheme),
          prefixIcon: Icon(
            Icons.lock_outline,
            color: Theme.of(context).colorScheme.goldTheme,
          ),
          fillColor: Theme.of(context).colorScheme.blueOldTheme,
          hintText: widget.label,
        ),
        onChanged: (e) {
          widget.onChanged(e);
        },
      ),
    );
  }
}
