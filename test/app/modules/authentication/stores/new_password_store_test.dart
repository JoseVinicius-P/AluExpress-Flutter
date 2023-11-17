import 'package:flutter_test/flutter_test.dart';
import 'package:luguel/app/modules/authentication/stores/new_password_store.dart';
 
void main() {
  late NewPasswordStore store;

  setUpAll(() {
    store = NewPasswordStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state);
    expect(store.state, equals(1));
  });
}