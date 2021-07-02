import 'package:flutter/material.dart';
import 'package:flutterboiler/configs/colors.dart';

class DropdownRole extends StatefulWidget {
  final String hintText;
  final String? value;
  final List<String> choice;
  final Function onChanged;

  const DropdownRole(
      {Key? key,
      required this.hintText,
      required this.choice,
      required this.onChanged,
      required this.value})
      : super(key: key);

  @override
  _DropdownRoleState createState() => _DropdownRoleState();
}

class _DropdownRoleState extends State<DropdownRole> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.blueOldTheme,
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        style: TextStyle(
            color: Theme.of(context).colorScheme.goldTheme, fontSize: 14),
        underline: SizedBox(),
        hint: Row(
          children: [
            SizedBox(
              width: 13,
            ),
            Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.goldTheme,
            ),
            SizedBox(
              width: 12,
            ),
            Text(
              widget.hintText,
              style: TextStyle(
                  color: Theme.of(context).colorScheme.goldTheme, fontSize: 14),
            ),
          ],
        ),
        value: widget.value,
        dropdownColor: Theme.of(context).colorScheme.blueOldTheme,
        items: widget.choice.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            child: Row(
              children: [
                SizedBox(
                  width: 13,
                ),
                Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.goldTheme,
                ),
                SizedBox(
                  width: 12,
                ),
                Text(
                  value,
                ),
              ],
            ),
            value: value,
          );
        }).toList(),
        icon: Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Icon(
            Icons.arrow_drop_down,
            color: Theme.of(context).colorScheme.goldTheme,
          ),
        ),
        onChanged: (value) {
          widget.onChanged(value);
        },
      ),
    );
  }
}
