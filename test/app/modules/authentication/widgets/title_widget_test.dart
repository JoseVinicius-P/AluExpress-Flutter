import 'package:flutter/material.dart';
import 'package:luguel/app/modules/authentication/widgets/title_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:responsive_builder/responsive_builder.dart';

// Função auxiliar para envolver os widgets a serem testados.
Widget buildTestableWidget(Widget widget) =>
    ResponsiveApp(builder: (context) => MaterialApp(home: widget));

main() {
  group('TitleWidget', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(const TitleWidget(text: "",textAlign: TextAlign.center,)));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}