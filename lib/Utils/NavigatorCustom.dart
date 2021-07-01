import 'package:flutterboiler/Utils/PrintUtils.dart';
import 'package:flutter/material.dart';

class NavigatorCustom {
  static forwardNavigate({
    required context,
    required from,
    required to,
  }) async {
    if (from != to) {
      PrintUtils.printWhite("Navigating from : $from, to : $to");
      Navigator.of(context).pushReplacementNamed(to);
    } else {
      PrintUtils.printWhite("wont navigate because from and to same.");
    }
  }
}
