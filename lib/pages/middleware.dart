import 'package:flutter/material.dart';
import 'package:flutterboiler/utils/navigator_custom.dart';
import 'package:flutterboiler/utils/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class MiddlewareState<T extends StatefulWidget> extends State<T> {
  @protected
  bool get needAuth => true;

  @mustCallSuper
  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    final authProvider = context.watch<AuthProvider>();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      final currentRoute = ModalRoute.of(context);
      if (needAuth && !authProvider.isLogin) {
        if (currentRoute!.isFirst) {
          context.pushReplacement(to: 'login');
          return null;
        }
        if (!currentRoute.isCurrent)
          navigator.removeRoute(currentRoute);
        else
          navigator.pop();
      }
    });

    return Container();
  }
}
