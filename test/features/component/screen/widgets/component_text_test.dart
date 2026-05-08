import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component_text.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_text.dart';
import 'package:flx_nocode_flutter/features/component/models/component_size_mode.dart';

void main() {
  group('ComponentText Styling Tests', () {
    testWidgets('toWidget should apply styling properties', (tester) async {
      final component = ComponentText(
        id: 'text_1',
        value: 'Hello World',
        fontSize: 24,
        fontWeight: 'bold',
        color: '#FF0000', // Red
        textAlign: 'center',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toWidget({}),
          ),
        ),
      );

      final textFinder = find.text('Hello World');
      expect(textFinder, findsOneWidget);

      final Text textWidget = tester.widget(textFinder);
      expect(textWidget.style?.fontSize, 24);
      expect(textWidget.style?.fontWeight, FontWeight.bold);
      expect(textWidget.style?.color, const Color(0xFFFF0000));
      expect(textWidget.textAlign, TextAlign.center);
    });

    testWidgets('toWidget should handle different font weights', (tester) async {
      final component = ComponentText(
        id: 'text_2',
        value: 'Weight Test',
        fontWeight: 'w100',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toWidget({}),
          ),
        ),
      );

      final Text textWidget = tester.widget(find.text('Weight Test'));
      expect(textWidget.style?.fontWeight, FontWeight.w100);
    });

    testWidgets('toWidget should handle widthMode fill', (tester) async {
      final component = ComponentText(
        id: 'text_3',
        value: 'Fill Test',
        widthMode: ComponentSizeMode.fill,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toWidget({}),
          ),
        ),
      );

      final sizedBoxFinder = find.byType(SizedBox);
      expect(sizedBoxFinder, findsOneWidget);
      
      final SizedBox sizedBox = tester.widget(sizedBoxFinder);
      expect(sizedBox.width, double.infinity);
    });

    testWidgets('toWidget should handle widthMode fixed', (tester) async {
      final component = ComponentText(
        id: 'text_4',
        value: 'Fixed Test',
        widthMode: ComponentSizeMode.fixed,
        width: 150,
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: component.toWidget({}),
          ),
        ),
      );

      final SizedBox sizedBox = tester.widget(find.byType(SizedBox));
      expect(sizedBox.width, 150);
    });
  });
}
