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

  group('EntityField Custom Colors Tests', () {
    test('fromJson parses background_colors and text_colors correctly', () {
      final jsonRaw = {
        'label': 'PIC Initial',
        'reference': 'initiator_initials',
        'type': 'text',
        'background_colors': {
          'BFW': '#E8F5E9',
          'ABN': '#E3F2FD'
        },
        'text_colors': {
          'BFW': '#2E7D32',
          'ABN': '#1565C0'
        }
      };

      final field = EntityField.fromJson(jsonRaw);

      expect(field.backgroundColors, isNotNull);
      expect(field.textColors, isNotNull);
      expect(field.backgroundColors!['BFW'], '#E8F5E9');
      expect(field.textColors!['ABN'], '#1565C0');
    });

    testWidgets('EntityFieldDisplay wraps with correct custom background/text container', (tester) async {
      const jsonRaw = '''
      {
        "id": "test_entity",
        "label": "Test Entity",
        "description": "Colors tests",
        "fields": [
          {
            "label": "PIC Initial",
            "reference": "initiator_initials",
            "type": "text",
            "background_colors": {
              "BFW": "#E8F5E9"
            },
            "text_colors": {
              "BFW": "#2E7D32"
            }
          }
        ],
        "backend": {
          "others": []
        },
        "layout_table": {}
      }
      ''';
      final entity = EntityCustom.fromJson(json.decode(jsonRaw));

      final widget = EntityFieldDisplay.build(
        entity,
        'initiator_initials',
        'BFW',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: widget,
          ),
        ),
      );

      final containerFinder = find.byWidgetPredicate(
        (widget) => widget is Container && (widget.decoration == null) && widget.color != null,
      );
      expect(containerFinder, findsOneWidget);

      final container = tester.widget<Container>(containerFinder);
      expect(container.color, const Color(0XFFE8F5E9));

      final textFinder = find.text('BFW');
      expect(textFinder, findsOneWidget);

      final textWidget = tester.widget<Text>(textFinder);
      expect(textWidget.style?.color, const Color(0XFF2E7D32));
      expect(textWidget.style?.fontSize, 13);
      expect(textWidget.style?.fontWeight, FontWeight.normal);
    });

    testWidgets('EntityFieldDisplay auto-estimates text brightness color if text_colors is omitted', (tester) async {
      const jsonRaw = '''
      {
        "id": "test_entity",
        "label": "Test Entity",
        "description": "Colors tests",
        "fields": [
          {
            "label": "PIC Initial",
            "reference": "initiator_initials",
            "type": "text",
            "background_colors": {
              "DARK": "#000000",
              "LIGHT": "#FFFFFF"
            }
          }
        ],
        "backend": {
          "others": []
        },
        "layout_table": {}
      }
      ''';
      final entity = EntityCustom.fromJson(json.decode(jsonRaw));

      // Dark background test
      final widgetDark = EntityFieldDisplay.build(
        entity,
        'initiator_initials',
        'DARK',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: widgetDark,
          ),
        ),
      );

      final textDarkFinder = find.text('DARK');
      final textDarkWidget = tester.widget<Text>(textDarkFinder);
      expect(textDarkWidget.style?.color, Colors.white);

      // Light background test
      final widgetLight = EntityFieldDisplay.build(
        entity,
        'initiator_initials',
        'LIGHT',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: widgetLight,
          ),
        ),
      );

      final textLightFinder = find.text('LIGHT');
      final textLightWidget = tester.widget<Text>(textLightFinder);
      expect(textLightWidget.style?.color, Colors.black87);
    });
    testWidgets('EntityFieldDisplay parses, applies, and serializes background_colors and text_colors as a single string', (tester) async {
      const jsonRaw = '''
      {
        "id": "test_entity",
        "label": "Test Entity",
        "description": "Colors tests",
        "fields": [
          {
            "label": "PIC Initial",
            "reference": "initiator_initials",
            "type": "text",
            "background_colors": "#E8F5E9",
            "text_colors": "#2E7D32"
          }
        ],
        "backend": {
          "others": []
        },
        "layout_table": {}
      }
      ''';
      final entity = EntityCustom.fromJson(json.decode(jsonRaw));
      final field = entity.fields.first;

      // Verify deserialization mapped wildcard color to '*'
      expect(field.backgroundColors, {'*': '#E8F5E9'});
      expect(field.textColors, {'*': '#2E7D32'});

      // Verify serialization returns a string
      final serializedJson = field.toJson();
      expect(serializedJson['background_colors'], '#E8F5E9');
      expect(serializedJson['text_colors'], '#2E7D32');

      // Verify widget rendering applies color to any value
      final widget = EntityFieldDisplay.build(
        entity,
        'initiator_initials',
        'ANYVALUE',
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: widget,
          ),
        ),
      );

      final containerFinder = find.byWidgetPredicate(
        (widget) => widget is Container && (widget.decoration == null) && widget.color != null,
      );
      expect(containerFinder, findsOneWidget);

      final container = tester.widget<Container>(containerFinder);
      expect(container.color, const Color(0XFFE8F5E9));

      final textFinder = find.text('ANYVALUE');
      expect(textFinder, findsOneWidget);

      final textWidget = tester.widget<Text>(textFinder);
      expect(textWidget.style?.color, const Color(0XFF2E7D32));
    });
  });
}
