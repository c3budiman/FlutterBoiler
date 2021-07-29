import 'package:flutter_test/flutter_test.dart';
import 'package:flutterboiler/utils/fetcher.dart';

void main() {
  test(
    'Testing Fetcher Get, Shoulda return a correct response',
    () async {
      var result = await Fetcher.getData(
        context: null,
        uri: 'https://60c8c3513fcd810017036b8c.mockapi.io/Blog',
        params: {'page': 1, 'limit': 10},
        silent: true,
      );

      expect(result.length, 10);
    },
  );
}
