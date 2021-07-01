import 'package:flutter/material.dart';
import 'package:flutterboiler/utils/print_utils.dart';

class NavigatorCustom {
  static forwardNavigate({
    required context,
    required from,
    required to,
    arguments,
  }) async {
    if (from != to) {
      PrintUtils.printWhite("Navigating from : $from, to : $to");
      Navigator.of(context).pushNamed(to, arguments: arguments);
    } else {
      PrintUtils.printWhite("wont navigate because from and to same.");
    }
  }

  static forwardNavigateReplacement({
    required context,
    required from,
    required to,
    arguments,
  }) async {
    if (from != to) {
      PrintUtils.printWhite("Navigating replacement from : $from, to : $to");
      Navigator.of(context).pushReplacementNamed(to, arguments: arguments);
    } else {
      PrintUtils.printWhite("wont navigate because from and to same.");
    }
  }

  static forwardNavigateRemoveUntil({
    required context,
    required from,
    required to,
    arguments,
  }) async {
    if (from != to) {
      PrintUtils.printWhite("Navigating replacement from : $from, to : $to");
      Navigator.of(context).pushNamedAndRemoveUntil(
        to,
        (route) => false,
        arguments: arguments,
      );
    } else {
      PrintUtils.printWhite("wont navigate because from and to same.");
    }
  }
}
