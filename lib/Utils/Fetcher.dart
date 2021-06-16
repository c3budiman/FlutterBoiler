import 'package:dio/dio.dart';
import 'package:flutterboiler/Utils/PrintUtils.dart';

class Fetcher {
  static getData(String uri, Map<String, dynamic>? params) async {
    try {
      Response response;
      var dio = Dio();
      response = await dio.get(
        uri,
        queryParameters: params,
      );
      PrintUtils.printGreen("sukses fetch >>" + uri);
      PrintUtils.printGreen("with param >>" + params.toString());
      return response.data;
    } on DioError catch (e) {
      PrintUtils.printError("uri >>" + uri);
      PrintUtils.printError("params >>" + params.toString());

      if (e.response != null) {
        PrintUtils.printError("error >>" + e.response!.data);
        throw ("Catched an error : " + e.response!.data.toString());
      } else {
        PrintUtils.printError("error >>" + e.message);
        throw ("Catched an error : " + e.message.toString());
      }
    }
  }
}
