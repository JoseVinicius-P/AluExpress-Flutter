import 'package:flutter_test/flutter_test.dart';
import 'package:luguel/app/modules/houses/details_house_store.dart';
 
void main() {
  late DetailsHouseStore store;

  setUpAll(() {
    store = DetailsHouseStore();
  });

  test('increment count', () async {
    expect(store.state, equals(0));
    store.update(store.state + 1);
    expect(store.state, equals(1));
  });
}