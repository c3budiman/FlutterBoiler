import 'package:flutterboiler/Configs/Urls.dart';
import 'package:flutterboiler/Utils/Fetcher.dart';

class RegisterLogic {
  static doRegister({
    required String email,
    required String password,
  }) async {
    var response = await Fetcher.postData(
      uri: Urls.baseLogin + '/api/users/create',
      params: {
        "username": email,
        "password": password,
      },
    );
    return response;
  }
}
