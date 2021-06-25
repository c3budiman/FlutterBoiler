import 'package:flutter/material.dart';
import 'package:flutterboiler/configs/colors.dart';

class SuccessDialog extends StatefulWidget {
  final String message;

  const SuccessDialog({required this.message});
  @override
  _SuccessDialogState createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog> {
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
              Icons.download_done_outlined,
              color: Colors.green,
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
                color: Colors.green,
                child: Text('Mengerti', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
