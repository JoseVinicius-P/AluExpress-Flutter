import 'package:luguel/app/modules/presentation/widgets/gradiend_background_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

// Função auxiliar para envolver os widgets a serem testados.
Widget buildTestableWidget(Widget widget) =>
    ResponsiveApp(builder: (context) => MaterialApp(home: widget));

main() {
  group('GradiendBackgroundWidget', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(const GradiendBackgroundWidget(child: SizedBox())));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}