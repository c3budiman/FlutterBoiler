import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: SpinKitFoldingCube(
            color: Colors.white,
            size: 70.0,
          ),
        ),
      );
}
