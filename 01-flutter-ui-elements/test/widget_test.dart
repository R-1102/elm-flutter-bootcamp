import 'package:flutter_test/flutter_test.dart';
import 'package:ui_elements/main.dart';

void main() {
  testWidgets('Displays four numbered boxes', (tester) async {
    await tester.pumpWidget(const MyApp());
    for (var i = 1; i <= 4; i++) {
      expect(find.text('$i'), findsOneWidget);
    }
  });
}
