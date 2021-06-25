import 'package:flutter/material.dart';

class ErrorDialog extends StatefulWidget {
  final String title, message;

  const ErrorDialog({required this.title, required this.message});
  @override
  _ErrorDialogState createState() => _ErrorDialogState();
}

class _ErrorDialogState extends State<ErrorDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 120,
            ),
            Text(
              widget.message,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              // ignore: deprecated_member_use
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                onPressed: () async {
                  ///Do something like set speed to shared preferences etc
                  Navigator.pop(context);
                },
                color: Colors.red,
                child: Text('Ok', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
