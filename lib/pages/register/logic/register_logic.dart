import 'package:dio/dio.dart';
import 'package:flutterboiler/configs/urls.dart';
import 'package:flutterboiler/utils/fetcher.dart';

class RegisterLogic {
  static doRegister({
    required String email,
    required String password,
    required String role,
    required String aboutMe,
    required String imagePath,
  }) async {
    var formData = FormData.fromMap({
      "username": email,
      "password": password,
      "role": role == "Member" ? 1 : 2,
      "bio": aboutMe,
      "image": await MultipartFile.fromFile(imagePath,
          filename: '$email${DateTime.now()}')
    });
    var response = await Fetcher.postData(
      uri: Urls.baseLogin + '/api/users/createv2',
      paramsForm: formData,
    );
    return response;
  }
}
