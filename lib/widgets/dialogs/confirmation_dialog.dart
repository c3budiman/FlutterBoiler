import 'package:flutter/material.dart';
import 'package:flutterboiler/configs/colors.dart';

class ConfirmationDialog extends StatefulWidget {
  final String message;

  const ConfirmationDialog({required this.message});
  @override
  _ConfirmationDialogState createState() => _ConfirmationDialogState();
}

class _ConfirmationDialogState extends State<ConfirmationDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.blueOldTheme,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.logout,
              color: Colors.white,
              size: 120,
            ),
            Text(
              widget.message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    onPressed: () async {
                      ///Do something like set speed to shared preferences etc
                      Navigator.pop(context, false);
                    },
                    color: Colors.red.shade900,
                    child:
                        Text('Cancel', style: TextStyle(color: Colors.white)),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  // ignore: deprecated_member_use
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0)),
                    onPressed: () async {
                      ///Do something like set speed to shared preferences etc
                      Navigator.pop(context, true);
                    },
                    color: Theme.of(context).colorScheme.goldTheme,
                    child: Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
