import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/field/models/field.dart';
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

  group('EntityField Model Chip Parsing Tests', () {
    test('fromJson parses is_chip and chip_colors correctly', () {
      final jsonRaw = {
        'label': 'Status',
        'reference': 'status',
        'type': 'text',
        'is_chip': true,
        'chip_colors': {
          'REJECT': '#E53935',
          'APPROVE': '#43A047'
        }
      };

      final field = EntityField.fromJson(jsonRaw);

      expect(field.isChip, isTrue);
      expect(field.chipColors, isNotNull);
      expect(field.chipColors!['REJECT'], '#E53935');
      expect(field.chipColors!['APPROVE'], '#43A047');
    });

    test('toJson serializes is_chip and chip_colors correctly', () {
      final field = EntityField(
        label: 'Status',
        reference: 'status',
        type: 'text',
        isChip: true,
        chipColors: {
          'REJECT': '#E53935',
          'APPROVE': '#43A047'
        },
      );

      final map = field.toJson();

      expect(map['is_chip'], isTrue);
      expect(map['chip_colors'], isNotNull);
      expect(map['chip_colors']['REJECT'], '#E53935');
    });
  });

  group('EntityFieldDisplay Chip Rendering Widget Tests', () {
    late EntityCustom entity;

    setUp(() {
      const jsonRaw = '''
      {
        "id": "test_entity",
        "label": "Test Entity",
        "description": "Chip tests",
        "fields": [
          {
            "label": "Status",
            "reference": "status",
            "type": "text",
            "is_chip": true,
            "chip_colors": {
              "REJECT QA": "#E53935"
            }
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

    testWidgets('renders as chip container and uses custom color when configured',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: EntityFieldDisplay.build(
                entity,
                'status',
                'REJECT QA',
              ),
            ),
          ),
        ),
      );

      expect(find.text('REJECT QA'), findsOneWidget);

      // Verify that Container with custom background is rendered
      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);

      final containerWidget = tester.widget<Container>(containerFinder);
      final boxDecoration = containerWidget.decoration as BoxDecoration;
      
      // Hex #E53935 resolved color should be red
      expect(boxDecoration.color, const Color(0XFFE53935).withValues(alpha: 0.12));
    });

    testWidgets('renders as chip container and uses default keyword color as fallback',
        (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: EntityFieldDisplay.build(
                entity,
                'status',
                'APPROVED BY MANAGER',
              ),
            ),
          ),
        ),
      );

      expect(find.text('APPROVED BY MANAGER'), findsOneWidget);

      final containerFinder = find.byType(Container);
      expect(containerFinder, findsOneWidget);

      final containerWidget = tester.widget<Container>(containerFinder);
      final boxDecoration = containerWidget.decoration as BoxDecoration;
      
      // Default keyword APPROVED matches const Color(0XFF43A047) (Green)
      expect(boxDecoration.color, const Color(0XFF43A047).withValues(alpha: 0.12));
    });
  });
}
