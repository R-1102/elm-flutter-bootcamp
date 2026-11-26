import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reminder_notification_app/InputScreen.dart';
import 'package:reminder_notification_app/DetailScreen.dart';

void main() {
  testWidgets('Shows reminder input screen', (tester) async {
    await tester.pumpWidget(MaterialApp(home: InputScreen()));
    expect(find.text('Set Reminder'), findsOneWidget);
    expect(find.text('Schedule Reminder'), findsOneWidget);
  });
  testWidgets('Shows the reminder payload', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: DetailScreen(payload: 'Study')));
    expect(find.text('Reminder: Study'), findsOneWidget);
  });
}
