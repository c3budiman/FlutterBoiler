import 'package:flutter/material.dart';
import 'package:flutterboiler/utils/print_utils.dart';

extension NavigatorCustom on BuildContext {
  Future<T?> push<T>({required String to, Object? arguments}) async {
    final from = ModalRoute.of(this)?.settings.name ?? 'Unknown';
    PrintUtils.printWhite("Navigating from : $from, to : $to");
    return Navigator.of(this).pushNamed<T>(to, arguments: arguments);
  }

  Future<T?> pushReplacement<T>({required String to, Object? arguments}) async {
    final from = ModalRoute.of(this)?.settings.name ?? 'Unknown';
    PrintUtils.printWhite("Navigating replacement from : $from, to : $to");
    return Navigator.of(this).pushReplacementNamed(to, arguments: arguments);
  }

  Future<T?> pushAndRemoveUntil<T>(
      {required String to, Object? arguments}) async {
    final from = ModalRoute.of(this)?.settings.name ?? 'Unknown';
    PrintUtils.printWhite("Navigating replacement from : $from, to : $to");
    return Navigator.of(this).pushNamedAndRemoveUntil(
      to,
      (route) => false,
      arguments: arguments,
    );
  }
}
