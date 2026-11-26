import 'package:flutter_test/flutter_test.dart';
import 'package:local_db_flutter/db_helper.dart';

void main() {
  test('Serializes note fields', () {
    final note = Note(id: 1, title: 'Title', content: 'Content');
    expect(note.toMap(), {'id': 1, 'title': 'Title', 'content': 'Content'});
  });
}
