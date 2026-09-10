import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/src/app/view/widget/filter.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_table.dart';

void main() {
  setUp(() {
    Get.testMode = true;
    Configuration.instance = Configuration.empty();
  });

  tearDown(() {
    Get.reset();
  });

  group('ComponentTable nested cell ComponentTextField (isSmall)', () {
    testWidgets('evaluates initialValue from row data when cell value is empty',
        (WidgetTester tester) async {
      const jsonRaw = '''
      {
        "id": "test_table_inline_edit",
        "reference_id": "test_table_inline_edit",
        "width": 800,
        "columns": [
          { "header": "Realization Value", "body": "realization_value", "width": 200 },
          {
            "header": "Confirmation Realization Value",
            "body": "confirmation_realization_value",
            "width": 250,
            "component": {
              "id": "confirmation_realization_value",
              "type": "text_field",
              "label": "Confirmation Realization Value",
              "initialValue": "{{ row.realization_value }}"
            }
          }
        ]
      }
      ''';

      final map = json.decode(jsonRaw) as Map<String, dynamic>;
      final component = ComponentTable.fromMap(map);

      final rowData = [
        {
          'id': 1,
          'realization_value': '150000',
          'confirmation_realization_value': '',
        },
      ];

      final contextData = {
        'test_table_inline_edit': rowData,
      };

      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: component.toWidget(contextData),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Verify FTextFieldSmall is rendered
      expect(find.byType(FTextFieldSmall), findsOneWidget);

      final fTextField = tester.widget<FTextFieldSmall>(find.byType(FTextFieldSmall));
      expect(fTextField.controller.text, '150000');

      // Verify that table controller row was updated with evaluated initialValue
      final tableState = tester.state(find.byWidgetPredicate(
        (w) => w.runtimeType.toString() == '_ComponentTableWidget',
      ));
      expect((tableState as dynamic).controller.rows[0]['confirmation_realization_value'], '150000');
    });

    testWidgets('preserves existing cell value if non-empty and does not overwrite with initialValue',
        (WidgetTester tester) async {
      const jsonRaw = '''
      {
        "id": "test_table_preserve",
        "reference_id": "test_table_preserve",
        "width": 800,
        "columns": [
          { "header": "Realization Value", "body": "realization_value", "width": 200 },
          {
            "header": "Confirmation Realization Value",
            "body": "confirmation_realization_value",
            "width": 250,
            "component": {
              "id": "confirmation_realization_value",
              "type": "text_field",
              "label": "Confirmation Realization Value",
              "initialValue": "{{ row.realization_value }}"
            }
          }
        ]
      }
      ''';

      final map = json.decode(jsonRaw) as Map<String, dynamic>;
      final component = ComponentTable.fromMap(map);

      final rowData = [
        {
          'id': 1,
          'realization_value': '150000',
          'confirmation_realization_value': '200000',
        },
      ];

      final contextData = {
        'test_table_preserve': rowData,
      };

      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: component.toWidget(contextData),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(FTextFieldSmall), findsOneWidget);
      // Row 1 confirmation_realization_value should keep '200000', not '150000'
      expect(find.text('200000'), findsOneWidget);
      expect(rowData[0]['confirmation_realization_value'], '200000');
    });

    testWidgets('entering text in cell triggers onRowChanged and updates row',
        (WidgetTester tester) async {
      const jsonRaw = '''
      {
        "id": "test_table_change",
        "reference_id": "test_table_change",
        "width": 800,
        "columns": [
          {
            "header": "Remark",
            "body": "remark",
            "width": 300,
            "component": {
              "id": "remark",
              "type": "text_field",
              "label": "Remark",
              "initialValue": ""
            }
          }
        ]
      }
      ''';

      final map = json.decode(jsonRaw) as Map<String, dynamic>;
      final component = ComponentTable.fromMap(map);

      final rowData = [
        {'id': 1, 'remark': ''},
      ];

      final contextData = {
        'test_table_change': rowData,
      };

      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: component.toWidget(contextData),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(FTextFieldSmall), findsOneWidget);

      await tester.enterText(find.byType(FTextFieldSmall), 'Approved by Manager');
      await tester.pumpAndSettle();

      expect(find.text('Approved by Manager'), findsOneWidget);

      final tableState = tester.state(find.byWidgetPredicate(
        (w) => w.runtimeType.toString() == '_ComponentTableWidget',
      ));
      expect((tableState as dynamic).controller.rows[0]['remark'], 'Approved by Manager');
    });

    testWidgets('formats initial value from float or integer into thousand-separated currency',
        (WidgetTester tester) async {
      const jsonRaw = '''
      {
        "id": "test_table_currency",
        "reference_id": "test_table_currency",
        "width": 800,
        "columns": [
          { "header": "Realization Value", "body": "realization_value", "width": 200 },
          {
            "header": "Confirmation Realization Value",
            "body": "confirmation_realization_value",
            "width": 250,
            "component": {
              "id": "confirmation_realization_value_field",
              "type": "text_field",
              "label": "Confirmation Realization Value",
              "is_currency": true,
              "initialValue": "{{ row.confirmation_realization_value || row.realization_value || '' }}"
            }
          }
        ]
      }
      ''';

      final map = json.decode(jsonRaw) as Map<String, dynamic>;
      final component = ComponentTable.fromMap(map);

      final rowData = [
        {
          'id': 1,
          'realization_value': '6000000.0',
          'confirmation_realization_value': '',
        },
        {
          'id': 2,
          'realization_value': '3000000',
          'confirmation_realization_value': '',
        },
      ];

      final contextData = {
        'test_table_currency': rowData,
      };

      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: component.toWidget(contextData),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final fields = tester.widgetList<FTextFieldSmall>(find.byType(FTextFieldSmall)).toList();
      expect(fields.length, 2);

      // Verify row 1 formatted 6000000.0 into 6,000,000
      expect(fields[0].controller.text, '6,000,000');
      expect(fields[0].textAlign, TextAlign.end);
      expect(fields[0].keyboardType, TextInputType.number);
      expect(fields[0].inputFormatters, isNotNull);

      // Verify row 2 formatted 3000000 into 3,000,000
      expect(fields[1].controller.text, '3,000,000');

      // Verify table controller rows were updated
      final tableState = tester.state(find.byWidgetPredicate(
        (w) => w.runtimeType.toString() == '_ComponentTableWidget',
      ));
      expect((tableState as dynamic).controller.rows[0]['confirmation_realization_value'], '6,000,000');
      expect((tableState as dynamic).controller.rows[1]['confirmation_realization_value'], '3,000,000');
    });

    testWidgets('formats user typing with thousand separators in table cell',
        (WidgetTester tester) async {
      const jsonRaw = '''
      {
        "id": "test_table_currency_typing",
        "reference_id": "test_table_currency_typing",
        "width": 800,
        "columns": [
          {
            "header": "Amount",
            "body": "amount",
            "width": 250,
            "component": {
              "id": "amount_field",
              "type": "text_field",
              "label": "Amount",
              "is_currency": true,
              "initialValue": ""
            }
          }
        ]
      }
      ''';

      final map = json.decode(jsonRaw) as Map<String, dynamic>;
      final component = ComponentTable.fromMap(map);

      final rowData = [
        {'id': 1, 'amount': ''},
      ];

      final contextData = {
        'test_table_currency_typing': rowData,
      };

      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: component.toWidget(contextData),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final textFieldFinder = find.byType(TextField);
      expect(textFieldFinder, findsOneWidget);

      await tester.enterText(textFieldFinder, '5000000');
      await tester.pumpAndSettle();

      final fTextField = tester.widget<FTextFieldSmall>(find.byType(FTextFieldSmall));
      expect(fTextField.controller.text, '5,000,000');

      final tableState = tester.state(find.byWidgetPredicate(
        (w) => w.runtimeType.toString() == '_ComponentTableWidget',
      ));
      expect((tableState as dynamic).controller.rows[0]['amount'], '5,000,000');
    });
  });

  group('ComponentTable refresh button padding gaps', () {
    testWidgets('renders refresh button with custom refresh_gap_top and refresh_gap_bottom',
        (WidgetTester tester) async {
      const jsonRaw = '''
      {
        "id": "tbl_with_custom_gaps",
        "reference_id": "tbl_with_custom_gaps",
        "show_refresh": true,
        "refresh_gap_top": 24.0,
        "refresh_gap_bottom": 16.0,
        "columns": [
          { "header": "Name", "body": "name", "width": 200 }
        ]
      }
      ''';

      final map = json.decode(jsonRaw) as Map<String, dynamic>;
      final component = ComponentTable.fromMap(map);

      final contextData = {
        'tbl_with_custom_gaps': [
          {'name': 'Item 1'}
        ]
      };

      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: component.toWidget(contextData),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Refresh'), findsOneWidget);

      // Verify the Padding widget wrapping the refresh button row
      final paddingFinder = find.ancestor(
        of: find.byIcon(Icons.refresh),
        matching: find.byType(Padding),
      );

      expect(paddingFinder, findsWidgets);

      final paddingWidgets = tester.widgetList<Padding>(paddingFinder);
      final gapPadding = paddingWidgets.firstWhere(
        (p) => p.padding == const EdgeInsets.only(top: 24.0, bottom: 16.0),
      );

      expect(gapPadding.padding, const EdgeInsets.only(top: 24.0, bottom: 16.0));
    });

    testWidgets('defaults to 12.0 padding for top and bottom when gaps are not configured',
        (WidgetTester tester) async {
      const jsonRaw = '''
      {
        "id": "tbl_default_gaps",
        "reference_id": "tbl_default_gaps",
        "show_refresh": true,
        "columns": [
          { "header": "Name", "body": "name", "width": 200 }
        ]
      }
      ''';

      final map = json.decode(jsonRaw) as Map<String, dynamic>;
      final component = ComponentTable.fromMap(map);

      final contextData = {
        'tbl_default_gaps': [
          {'name': 'Item 1'}
        ]
      };

      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: component.toWidget(contextData),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Refresh'), findsOneWidget);

      final paddingFinder = find.ancestor(
        of: find.byIcon(Icons.refresh),
        matching: find.byType(Padding),
      );

      final paddingWidgets = tester.widgetList<Padding>(paddingFinder);
      final gapPadding = paddingWidgets.firstWhere(
        (p) => p.padding == const EdgeInsets.only(top: 12.0, bottom: 12.0),
      );

      expect(gapPadding.padding, const EdgeInsets.only(top: 12.0, bottom: 12.0));
    });

    testWidgets('does not render refresh button or padding when show_refresh is false',
        (WidgetTester tester) async {
      const jsonRaw = '''
      {
        "id": "tbl_hidden_refresh",
        "reference_id": "tbl_hidden_refresh",
        "show_refresh": false,
        "columns": [
          { "header": "Name", "body": "name", "width": 200 }
        ]
      }
      ''';

      final map = json.decode(jsonRaw) as Map<String, dynamic>;
      final component = ComponentTable.fromMap(map);

      final contextData = {
        'tbl_hidden_refresh': [
          {'name': 'Item 1'}
        ]
      };

      await tester.pumpWidget(
        GetMaterialApp(
          home: Scaffold(
            body: component.toWidget(contextData),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Refresh'), findsNothing);
      expect(find.byIcon(Icons.refresh), findsNothing);
    });
  });
}
