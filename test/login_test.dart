import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutterboiler/pages/login/screen/login_screen.dart';

void main() {
  testWidgets(
    'Render Login Screen',
    (WidgetTester tester) async {
      // Create the widget by telling the tester to build it.
      Widget testWidget = new MediaQuery(
        data: new MediaQueryData(),
        child: new MaterialApp(
          home: new LoginScreen(),
        ),
      );
      await tester.pumpWidget(testWidget);

      // Create the Finders.
      final emailFinder = find.text('Email Address');
      final passwordFinder = find.text('Password');

      expect(emailFinder, findsOneWidget);
      expect(passwordFinder, findsOneWidget);
    },
  );
}
