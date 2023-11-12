import 'package:flutter_test/flutter_test.dart';
import 'package:luguel/app/modules/authentication/stores/forgot_password_store.dart';
 
void main() {
  late ForgotPasswordStore store;

  setUpAll(() {
    store = ForgotPasswordStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}