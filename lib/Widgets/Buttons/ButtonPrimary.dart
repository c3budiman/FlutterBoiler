import 'package:flutter/material.dart';

class ButtonPrimary extends StatefulWidget {
  ButtonPrimary({
    required this.onTap,
    required this.label,
    required this.backgroundColor,
    required this.fontColor,
  });
  final Function onTap;
  final String label;
  final Color backgroundColor;
  final Color fontColor;

  @override
  _ButtonPrimaryState createState() => _ButtonPrimaryState();
}

class _ButtonPrimaryState extends State<ButtonPrimary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ConstrainedBox(
        constraints: BoxConstraints.tightFor(
          width: MediaQuery.of(context).size.width - 45,
          height: 40,
        ),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: widget.backgroundColor,
            onPrimary: widget.fontColor,
            textStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          child: Text(widget.label),
          onPressed: () {
            print('Pressed');
            widget.onTap();
          },
        ),
      ),
    );
  }
}
