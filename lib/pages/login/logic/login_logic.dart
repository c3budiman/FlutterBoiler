import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutterboiler/configs/urls.dart';
import 'package:flutterboiler/utils/fetcher.dart';
import 'package:flutterboiler/utils/provider/auth_provider.dart';

class LoginLogic {
  static Map user = {
    'name': 'Cecep Budiman',
    'username': '',
    'id': '',
  };

  static doLogin({
    required String email,
    required String password,
  }) async {
    var bytesPassword = utf8.encode(password);
    var digestPassword = md5.convert(bytesPassword);

    var response = await Fetcher.postData(
      uri: Urls.baseLogin + '/api/auth/signin',
      params: {
        "username": email,
        "password": digestPassword.toString(),
      },
    );

    if (response['code'] == 0) {
      await AuthProvider.instance.setLoginData(
        data: response['data'],
        token: response['token']['token'],
      );
    }

    return response;
  }
}
