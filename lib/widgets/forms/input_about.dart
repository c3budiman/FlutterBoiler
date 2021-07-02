import 'package:flutter/material.dart';
import 'package:flutterboiler/configs/colors.dart';

class InputAbout extends StatefulWidget {
  final Function onChanged;
  final String label;

  const InputAbout({Key? key, required this.onChanged, required this.label})
      : super(key: key);

  @override
  _InputAboutState createState() => _InputAboutState();
}

class _InputAboutState extends State<InputAbout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        textAlignVertical: TextAlignVertical.top,
        autofocus: false,
        textAlign: TextAlign.left,
        keyboardType: TextInputType.text,
        style: TextStyle(
            color: Theme.of(context).colorScheme.goldTheme, fontSize: 14.0),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          fillColor: Theme.of(context).colorScheme.blueOldTheme,
          hintText: widget.label,
          hintStyle: TextStyle(
              color: Theme.of(context).colorScheme.goldTheme, fontSize: 14.0),
        ),
        maxLines: null,
        expands: true,
        onChanged: (value) {
          widget.onChanged(value);
        },
      ),
    );
  }
}
