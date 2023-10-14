import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:luguel/app/modules/presentation/widgets/animated_background_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modular_test/modular_test.dart';
import 'package:responsive_builder/responsive_builder.dart';

// Função auxiliar para envolver os widgets a serem testados.
Widget buildTestableWidget(Widget widget) =>
    ResponsiveApp(builder: (context) => MaterialApp(home: widget));

main() {
  group('AnimatedBackgroundContainerWidget', () {
    testWidgets('has a title and message', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget(const AnimatedBackgroundWidget(image: Image(image: AssetImage("/"),), child: SizedBox(),)));
      final titleFinder = find.text('T');
      expect(titleFinder, findsOneWidget);
    });
  });
}