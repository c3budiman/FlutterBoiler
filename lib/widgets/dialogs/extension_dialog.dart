import 'package:flutter/material.dart';
import 'package:flutterboiler/widgets/dialogs/confirmation_dialog.dart';
import 'package:flutterboiler/widgets/dialogs/error_dialog.dart';
import 'package:flutterboiler/widgets/dialogs/loading_dialog.dart';
import 'package:flutterboiler/widgets/dialogs/success_dialog.dart';

extension ExtensionDialog on BuildContext {
  ///Hide loading
  void hideDialog() => Navigator.of(this).pop();

  ///Show Loading
  Future<T?> showLoading<T>() {
    return showDialog(
      barrierDismissible: false,
      context: this,
      builder: (_) => LoadingDialog(),
    );
  }

  ///Show Error
  Future<T?> showError<T>(String message) {
    return showDialog(
      context: this,
      builder: (_) => ErrorDialog(message: message),
    );
  }

  ///Show Success
  Future<T?> showSuccess<T>(String message) {
    return showDialog(
      context: this,
      builder: (_) => SuccessDialog(message: message),
    );
  }

  ///Show Confirmation
  Future<bool?> showConfirmation(String message) {
    return showDialog(
      context: this,
      builder: (_) => ConfirmationDialog(message: message),
    );
  }
}
