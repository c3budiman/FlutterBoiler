import 'package:flutter_test/flutter_test.dart';
import 'package:flutterboiler/Utils/Fetcher.dart';

void main() {
  test('Testing Fetcher Get, Shoulda return a correct response', () async {
    var result = await Fetcher.getData(
      'https://60c8c3513fcd810017036b8c.mockapi.io/Blog',
      {'page': 1, 'limit': 10},
    );

    expect(result.length, 10);
  });
}
