import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutterboiler/Configs/Urls.dart';
import 'package:flutterboiler/Utils/Fetcher.dart';
import 'package:flutterboiler/Utils/NavigatorCustom.dart';
import 'package:flutterboiler/Utils/PrintUtils.dart';
import 'package:flutterboiler/Utils/SharedPreferencesUtils.dart';

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
      await SharedPreferencesUtils.saveData(
        'userData',
        json.encode(response['data']),
      );
    }

    return response;
  }

  static setUserData({
    required String id,
    required String username,
  }) {
    user = {
      'id': id,
      'username': username,
    };
  }

  static getUserData() async {
    var userdatastring = await SharedPreferencesUtils.getData('userData');
    if (userdatastring != '') {
      var userdata = json.decode(userdatastring);
      PrintUtils.printWarning('userdata: ' + userdata.toString());
      setUserData(
        id: userdata['id'].toString(),
        username: userdata['username'],
      );
    }
    return user;
  }

  static getUserDataSync() {
    return user;
  }

  static checkLogin(context) async {
    var userdata = await getUserData();
    if (userdata['id'] != '') {
      await NavigatorCustom.forwardNavigate(
        context: context,
        from: '/login',
        to: '/home',
      );
    }
  }
}
