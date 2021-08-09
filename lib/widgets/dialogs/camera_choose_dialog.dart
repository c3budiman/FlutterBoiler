import 'package:flutter/material.dart';
import 'package:flutterboiler/widgets/buttons/button_primary.dart';
import 'package:flutterboiler/configs/colors.dart';

class CameraChooseDialog extends StatelessWidget {
  const CameraChooseDialog({Key? key, this.message}) : super(key: key);

  final String? message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.blueOldTheme,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15.0)),
      ),
      title: Center(
          child: Text(
        message!,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      )),
      content: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: double.infinity,
              child: ButtonPrimary(
                onTap: () async {
                  Navigator.pop(context, false);
                },
                backgroundColor: Theme.of(context).colorScheme.goldTheme,
                label: 'Gallery',
                fontColor: Theme.of(context).colorScheme.blueOldTheme,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            SizedBox(
              width: double.infinity,
              child: ButtonPrimary(
                onTap: () async {
                  Navigator.pop(context, true);
                },
                backgroundColor: Theme.of(context).colorScheme.goldTheme,
                label: 'Camera',
                fontColor: Theme.of(context).colorScheme.blueOldTheme,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
