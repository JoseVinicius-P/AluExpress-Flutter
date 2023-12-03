import 'package:flutter/material.dart';
import 'package:luguel/app/modules/profile/widgets/avatar_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:responsive_builder/responsive_builder.dart';

// Função auxiliar para envolver os widgets a serem testados.
Widget buildTestableWidget(Widget widget) =>
    ResponsiveApp(builder: (context) => MaterialApp(home: widget));

main() {
  group('AvatarWidget', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(AvatarWidget(placeholder: AssetImage(""), avatarImage: AssetImage(""),)));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}