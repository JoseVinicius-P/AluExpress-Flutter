import 'package:flutter_test/flutter_test.dart';
import 'package:luguel/app/modules/presentation/presentation_store.dart';
 
void main() {
  late PresentationStore store;

  setUpAll(() {
    store = PresentationStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}