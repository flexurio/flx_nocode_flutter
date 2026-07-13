import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/field/presentation/widgets/entity_field_tooltip.dart';
import 'package:flx_nocode_flutter/features/field/presentation/widgets/entity_field_display.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:get/get.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    Get.testMode = true;
    Configuration.instance = Configuration.empty();
  });

  tearDown(() {
    Get.reset();
  });

  group('EntityFieldTooltip Widget Tests', () {
    testWidgets('renders child widget and shows tooltip message on hover',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: EntityFieldTooltip(
                message: 'Hello, World!',
                child: Text('Hover target'),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Hover target'), findsOneWidget);

      // Verify that the tooltip wrapper (Tooltip) is in the tree
      final tooltipFinder = find.byType(Tooltip);
      expect(tooltipFinder, findsOneWidget);

      // Inspect Tooltip properties
      final tooltipWidget = tester.widget<Tooltip>(tooltipFinder);
      expect(tooltipWidget.message, 'Hello, World!');
    });

    testWidgets('does not wrap child in Tooltip if message is empty',
        (tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Center(
              child: EntityFieldTooltip(
                message: '   ',
                child: Text('No tooltip target'),
              ),
            ),
          ),
        ),
      );

      expect(find.text('No tooltip target'), findsOneWidget);
      expect(find.byType(Tooltip), findsNothing);
    });
  });

  group('EntityFieldDisplay Integration Tests with Tooltip', () {
    late EntityCustom entity;

    setUp(() {
      const jsonRaw = '''
      {
        "id": "test_entity",
        "label": "Test Entity",
        "description": "Tooltip tests",
        "fields": [
          {
            "label": "Custom Field Label Tooltip",
            "reference": "name",
            "type": "text",
            "is_tooltip": true
          },
          {
            "label": "No Tooltip Field",
            "reference": "no_tooltip",
            "type": "text",
            "is_tooltip": false
          }
        ],
        "backend": {
          "others": []
        },
        "layout_table": {}
      }
      ''';
      entity = EntityCustom.fromJson(json.decode(jsonRaw));
    });

    testWidgets(
        'wraps rendered display cell with EntityFieldTooltip when is_tooltip is true',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: EntityFieldDisplay.build(
                entity,
                'name',
                'DeepMind Test',
              ),
            ),
          ),
        ),
      );

      expect(find.text('DeepMind Test'), findsOneWidget);
      expect(find.byType(EntityFieldTooltip), findsOneWidget);

      final tooltipWidget =
          tester.widget<EntityFieldTooltip>(find.byType(EntityFieldTooltip));
      expect(tooltipWidget.message, 'DeepMind Test');
    });

    testWidgets(
        'does not wrap rendered display cell with EntityFieldTooltip when is_tooltip is false or absent',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: EntityFieldDisplay.build(
                entity,
                'no_tooltip',
                'DeepMind Test 2',
              ),
            ),
          ),
        ),
      );

      expect(find.text('DeepMind Test 2'), findsOneWidget);
      expect(find.byType(EntityFieldTooltip), findsNothing);
    });
  });
}
