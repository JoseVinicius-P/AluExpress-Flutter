import 'package:flutter/material.dart';
import 'package:luguel/app/modules/authentication/widgets/resend_code_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:responsive_builder/responsive_builder.dart';


// Função auxiliar para envolver os widgets a serem testados.
Widget buildTestableWidget(Widget widget) =>
    ResponsiveApp(builder: (context) => MaterialApp(home: widget));

main() {
  group('ResendCodeWidget', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(ResendCodeWidget(onTapResendCode: (){}, countdownSeconds: 10,)));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}