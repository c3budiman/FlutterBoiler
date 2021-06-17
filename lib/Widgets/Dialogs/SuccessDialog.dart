import 'package:flutter/material.dart';

class SuccessDialog extends StatefulWidget {
  final String title, message;

  const SuccessDialog({required this.title, required this.message});
  @override
  _SuccessDialogState createState() => _SuccessDialogState();
}

class _SuccessDialogState extends State<SuccessDialog> {
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
              Icons.download_done_outlined,
              color: Colors.blueAccent,
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
                color: Colors.blueAccent,
                child: Text('Mengerti', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
