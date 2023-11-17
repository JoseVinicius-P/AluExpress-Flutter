import 'package:flutter_test/flutter_test.dart';
import 'package:luguel/app/modules/authentication/stores/verify_code_store.dart';
 
void main() {
  late VerifyCodeStore store;

  setUpAll(() {
    store = VerifyCodeStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state);
    expect(store.state, equals(1));
  });
}