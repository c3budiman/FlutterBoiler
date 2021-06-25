import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutterboiler/utils/print_utils.dart';
import 'package:flutterboiler/widgets/dialogs/error_dialog.dart';

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
      Response response;
      var dio = Dio();
      response = await dio.get(
        uri,
        queryParameters: params,
      );
      PrintUtils.printGreen("sukses get >>" + uri);
      PrintUtils.printGreen("with param >>" + params.toString());
      return response.data;
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
                title: "Failed get",
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
                title: "Failed get",
                message: e.message.toString(),
              );
            },
          );
        }

        throw ("Catched an error : " + e.message.toString());
      }
    }
  }

  static postData({
    var context,
    required String uri,
    Map<String, dynamic>? params,
    bool silent = true,
  }) async {
    try {
      Response response;
      var dio = Dio();
      response = await dio.post(
        uri,
        data: params,
      );
      PrintUtils.printGreen("sukses post >>" + uri);
      PrintUtils.printGreen("with param >>" + params.toString());
      return response.data;
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
                title: "Failed post",
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
                title: "Failed post",
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
