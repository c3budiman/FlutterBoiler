import 'package:flutterboiler/configs/urls.dart';
import 'package:flutterboiler/utils/fetcher.dart';

class RegisterLogic {
  static doRegister({
    required String email,
    required String password,
    required String role,
    required String aboutMe,
  }) async {
    var response = await Fetcher.postData(
      uri: Urls.baseLogin + '/api/users/create',
      params: {
        "username": email,
        "password": password,
        "role": role == "Member" ? 1 : 2,
        "bio": aboutMe,
        "images":
            "https://d28hgpri8am2if.cloudfront.net/book_images/onix/cvr9781974722815/dragon-ball-super-vol-13-9781974722815_xlg.jpg"
      },
    );
    return response;
  }
}
