import 'package:modular_test/modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:luguel/app/modules/presentation/presentation_module.dart';
 
void main() {

  setUpAll(() {
    initModule(PresentationModule());
  });
}