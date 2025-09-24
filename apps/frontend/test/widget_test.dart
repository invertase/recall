// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:frontend/main.dart';

void main() {
  testWidgets('Recall landing page smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const RecallApp());

    // Verify that the Recall title is displayed (this will be shown in mobile layout in test environment).
    expect(find.text('Recall'), findsOneWidget);

    // Verify that sign in buttons are present.
    expect(find.text('Sign in with Google'), findsOneWidget);
    expect(find.text('Sign in with GitHub'), findsOneWidget);

    // Verify that footer text is present.
    expect(find.text('Recall, built by Globe.'), findsOneWidget);
  });
}
