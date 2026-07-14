import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/component/models/component_field_display.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_field_display.dart';
import 'package:get/get.dart';
import 'package:flx_nocode_flutter/src/app/model/configuration.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    Get.testMode = true;
    Configuration.instance = Configuration.empty();
  });

  tearDown(() {
    Get.reset();
  });

  group('ComponentFieldDisplay Chip Model Tests', () {
    test('fromMap parses is_chip and chip_colors correctly', () {
      final map = {
        'id': 'test_field_display',
        'type': 'field_display',
        'label': 'Status',
        'value': '{{data.status}}',
        'is_chip': true,
        'chip_colors': {
          'INPUT': '#1E88E5',
          'CANCEL': '#757575'
        }
      };

      final component = ComponentFieldDisplay.fromMap(map);

      expect(component.isChip, isTrue);
      expect(component.chipColors, isNotNull);
      expect(component.chipColors!['INPUT'], '#1E88E5');
    });

    test('toMap serializes is_chip and chip_colors correctly', () {
      final component = ComponentFieldDisplay(
        id: 'test_field_display',
        label: 'Status',
        value: '{{data.status}}',
        isChip: true,
        chipColors: {
          'INPUT': '#1E88E5'
        },
      );

      final map = component.toMap();

      expect(map['is_chip'], isTrue);
      expect(map['chip_colors'], isNotNull);
      expect(map['chip_colors']['INPUT'], '#1E88E5');
    });
  });

  group('ComponentFieldDisplay Widget Chip Tests', () {
    testWidgets('renders as chip container inside TileDataVertical', (tester) async {
      final component = ComponentFieldDisplay(
        id: 'test_field_display',
        label: 'Status',
        value: 'INPUT',
        isChip: true,
        chipColors: {
          'INPUT': '#1E88E5'
        },
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: component.toWidget({}),
            ),
          ),
        ),
      );

      expect(find.text('Status'), findsOneWidget);
      expect(find.text('INPUT'), findsOneWidget);

      // Verify that the child is wrapped in a Container with correct chip styling
      final containerFinder = find.byWidgetPredicate(
        (widget) => widget is Container && widget.padding == const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      );
      expect(containerFinder, findsOneWidget);

      final containerWidget = tester.widget<Container>(containerFinder);
      final boxDecoration = containerWidget.decoration as BoxDecoration;
      
      expect(boxDecoration.color, const Color(0XFF1E88E5).withValues(alpha: 0.12));
    });
  });
}
