import 'package:dio/dio.dart';
import 'package:flutterboiler/Utils/PrintUtils.dart';
import 'package:flutter/material.dart';
import 'package:flutterboiler/Widgets/Dialogs/ErrorDialog.dart';
import 'package:connectivity/connectivity.dart';

class Fetcher {
  static cekKoneksi() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return (connectivityResult != ConnectivityResult.none);
  }

  static getData({
    var context,
    required String uri,
    Map<String, dynamic>? params,
    bool silent = true,
  }) async {
    try {
      var konek = await cekKoneksi();
      if (konek) {
        Response response;
        var dio = Dio();
        response = await dio.get(
          uri,
          queryParameters: params,
        );
        PrintUtils.printGreen("sukses fetch >>" + uri);
        PrintUtils.printGreen("with param >>" + params.toString());
        return response.data;
      } else {
        if (context != null && !silent) {
          showDialog(
            context: context,
            builder: (_) {
              return ErrorDialog(
                title: "Failed Fetch",
                message: "Anda sedang offline!",
              );
            },
          );
        }
        throw ("Anda sedang offline!");
      }
    } on DioError catch (e) {
      PrintUtils.printError("uri >>" + uri);
      PrintUtils.printError("params >>" + params.toString());

      if (e.response != null) {
        PrintUtils.printError("error >>" + e.response!.data);
        if (context != null && !silent) {
          showDialog(
            context: context,
            builder: (_) {
              return ErrorDialog(
                title: "Failed Fetch",
                message: e.response!.data.toString(),
              );
            },
          );
        }

        throw ("Catched an error : " + e.response!.data.toString());
      } else {
        PrintUtils.printError("error >>" + e.message);
        if (context != null && !silent) {
          showDialog(
            context: context,
            builder: (_) {
              return ErrorDialog(
                title: "Failed Fetch",
                message: e.message.toString(),
              );
            },
          );
        }

        throw ("Catched an error : " + e.message.toString());
      }
    }
  }
}
