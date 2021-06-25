import 'package:flutterboiler/configs/colors.dart';
import 'package:flutter/material.dart';

class OfflineMessage extends StatelessWidget {
  const OfflineMessage();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(top: 5, bottom: 5),
      color: Theme.of(context).colorScheme.goldTheme,
      height: 30.0,
      child: Container(
        child: Align(
          alignment: Alignment.center,
          child: Text(
            "Anda Sedang Offline!",
            style: TextStyle(color: Theme.of(context).colorScheme.blueOldTheme),
          ),
        ),
      ),
    );
  }
}
