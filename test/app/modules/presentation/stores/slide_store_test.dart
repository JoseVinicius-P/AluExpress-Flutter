import 'package:flutter_test/flutter_test.dart';
import 'package:luguel/app/modules/presentation/stores/slide_store.dart';
 
void main() {
  late SlideStore store;

  setUpAll(() {
    store = SlideStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}