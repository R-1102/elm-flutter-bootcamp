import 'package:flutter_test/flutter_test.dart';
import 'package:api_integration/user_model.dart';

void main() {
  test('Parses user ID and name from JSON', () {
    final user = User.fromJson({'id': 1, 'name': 'Sample User'});
    expect(user.id, 1);
    expect(user.name, 'Sample User');
  });
}
