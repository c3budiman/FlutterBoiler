import 'package:dio/dio.dart';
import 'package:flutterboiler/configs/urls.dart';
import 'package:flutterboiler/utils/fetcher.dart';
import 'package:flutterboiler/utils/provider/auth_provider.dart';

class ProfileLogic {
  static fetchProfile() async {
    var response = await Fetcher.postData(
      uri: Urls.baseLogin + '/api/users/profile',
      token: AuthProvider.instance.token,
    );

    if (response['code'] == 0) {
      await AuthProvider.instance.setLoginData(data: response['data']);
    }

    return response;
  }

  static editProfile({
    required String role,
    required String aboutMe,
  }) async {
    var response = await Fetcher.putData(
      uri: Urls.baseLogin + '/api/users/editdata',
      token: AuthProvider.instance.token,
      params: {
        "role": role == "Member" ? 1 : 2,
        "bio": aboutMe,
      },
    );

    return response;
  }

  static editAvatar({
    required String email,
    required String imagePath,
  }) async {
    var formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(imagePath,
          filename: '$email${DateTime.now()}')
    });
    var response = await Fetcher.putData(
      uri: Urls.baseLogin + '/api/users/editpoto',
      token: AuthProvider.instance.token,
      paramsForm: formData,
    );

    return response;
  }
}
