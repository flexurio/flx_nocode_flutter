import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flx_nocode_flutter/features/component/models/component.dart';
import 'package:flx_nocode_flutter/features/component/screen/widgets/component_field_array.dart';
import 'package:flx_nocode_flutter/features/layout_form/screen/controllers/utils/create_page_controller_utils.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';

void main() {
  setUp(() {
    Get.testMode = true;
  });

  tearDown(() {
    Get.reset();
  });

  group('ComponentFieldArray model', () {
    test('parses grouped schema and auto-defaults column component id & label',
        () {
      final jsonMap = json.decode('''
      {
        "id": "sources",
        "type": "field_array",
        "label": "Sumber Deviasi",
        "presentation": "table",
        "constraints": {
          "min_rows": 1,
          "max_rows": 5,
          "unique_by": ["source_type", "source_record_no"]
        },
        "row_actions": {
          "allow_add": true,
          "allow_delete": true,
          "add_label": "Tambah baris",
          "empty_message": "Belum ada baris"
        },
        "default_row": {
          "source_type": "Batch Record",
          "source_record_no": ""
        },
        "columns": [
          {
            "header": "Jenis sumber",
            "body": "source_type",
            "width": 200,
            "component": {
              "type": "dropdown",
              "required": true,
              "options": ["Batch Record", "Inspeksi"]
            }
          },
          {
            "header": "Nomor rekaman",
            "body": "source_record_no",
            "width": 220,
            "component": {
              "type": "text_field",
              "required": true
            }
          }
        ]
      }
      ''') as Map<String, dynamic>;

      final comp = Component.fromMap(jsonMap);
      expect(comp, isA<ComponentFieldArray>());

      final fieldArray = comp as ComponentFieldArray;
      expect(fieldArray.id, 'sources');
      expect(fieldArray.label, 'Sumber Deviasi');
      expect(fieldArray.presentation, FieldArrayPresentation.table);
      expect(fieldArray.constraints.minRows, 1);
      expect(fieldArray.constraints.maxRows, 5);
      expect(fieldArray.constraints.uniqueBy, ['source_type', 'source_record_no']);
      expect(fieldArray.rowActions.allowAdd, isTrue);
      expect(fieldArray.rowActions.allowDelete, isTrue);
      expect(fieldArray.rowActions.addLabel, 'Tambah baris');
      expect(fieldArray.rowActions.emptyMessage, 'Belum ada baris');
      expect(fieldArray.defaultRow, {
        'source_type': 'Batch Record',
        'source_record_no': '',
      });
      expect(fieldArray.columns.length, 2);
      expect(fieldArray.columns[0].component?.id, 'source_type');
      expect((fieldArray.columns[0].component as ComponentDropdown).label,
          'Jenis sumber');
      expect(fieldArray.columns[1].component?.id, 'source_record_no');
      expect((fieldArray.columns[1].component as ComponentTextField).required,
          isTrue);

      final roundTrip = ComponentFieldArray.fromMap(fieldArray.toMap());
      expect(roundTrip.id, fieldArray.id);
      expect(roundTrip.constraints.minRows, 1);
      expect(roundTrip.columns.length, 2);
    });

    test('supports shorthand aliases and card presentation with fields alias',
        () {
      final comp = Component.fromMap({
        'id': 'items',
        'type': 'field_array',
        'presentation': 'card',
        'min_rows': 2,
        'max_rows': 8,
        'add_row_label': 'Add item',
        'allow_delete_row': false,
        'fields': [
          {
            'header': 'Item Name',
            'body': 'name',
            'component': {'type': 'text_field', 'required': true},
          },
        ],
      }) as ComponentFieldArray;

      expect(comp.presentation, FieldArrayPresentation.card);
      expect(comp.constraints.minRows, 2);
      expect(comp.constraints.maxRows, 8);
      expect(comp.rowActions.addLabel, 'Add item');
      expect(comp.rowActions.allowDelete, isFalse);
      expect(comp.columns.length, 1);
    });

    test('Component.empty creates ComponentFieldArray', () {
      final empty = Component.empty(ComponentType.fieldArray);
      expect(empty, isA<ComponentFieldArray>());
      expect(empty.type, 'field_array');
    });
  });

  group('Typed List extraction in CreatePageControllerUtils', () {
    test('extractCurrentData returns native List<Map> for ComponentFieldArray',
        () {
      final fieldArray = ComponentFieldArray.fromMap({
        'id': 'sources',
        'type': 'field_array',
        'columns': [
          {'header': 'Code', 'body': 'code'},
        ],
      });
      final legacyTable = ComponentTable.fromMap({
        'id': 'legacy_table',
        'type': 'table',
        'columns': [
          {'header': 'Code', 'body': 'code'},
        ],
      });

      final rowsJson = jsonEncode([
        {'code': 'A-01'},
        {'code': 'B-02'},
      ]);

      final extracted = CreatePageControllerUtils.extractCurrentData(
        components: [fieldArray, legacyTable],
        fields: const [],
        controllers: {
          'sources': TextEditingController(text: rowsJson),
          'legacy_table': TextEditingController(text: rowsJson),
        },
      );

      // ComponentFieldArray produces a native List<Map<String, dynamic>>
      expect(extracted['sources'], isA<List<Map<String, dynamic>>>());
      expect(extracted['sources'], [
        {'code': 'A-01'},
        {'code': 'B-02'},
      ]);

      // Legacy ComponentTable remains a JSON string for backward compatibility
      expect(extracted['legacy_table'], isA<String>());
      expect(extracted['legacy_table'], rowsJson);
    });

    test('extractCurrentData returns empty list when field_array is empty', () {
      final fieldArray = ComponentFieldArray.empty('sources');
      final extracted = CreatePageControllerUtils.extractCurrentData(
        components: [fieldArray],
        fields: const [],
        controllers: {
          'sources': TextEditingController(text: ''),
        },
      );
      expect(extracted['sources'], isA<List<Map<String, dynamic>>>());
      expect(extracted['sources'], isEmpty);
    });
  });

  group('ComponentFieldArray widget & validation', () {
    Widget buildTestHost({
      required ComponentFieldArray component,
      required GlobalKey<FormState> formKey,
      Map<String, dynamic>? extraData,
    }) {
      return MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: component.toWidget({
                ...?extraData,
              }),
            ),
          ),
        ),
      );
    }

    testWidgets('validates min_rows, per-cell required, and max_rows',
        (tester) async {
      final formKey = GlobalKey<FormState>();
      List<Map<String, dynamic>> latestRows = const [];
      final formController = TextEditingController();

      final component = ComponentFieldArray.fromMap({
        'id': 'sources',
        'type': 'field_array',
        'label': 'Sumber',
        'constraints': {
          'min_rows': 1,
          'max_rows': 2,
        },
        'row_actions': {
          'allow_add': true,
          'allow_delete': true,
          'add_label': 'Tambah baris',
        },
        'columns': [
          {
            'header': 'Nomor rekaman',
            'body': 'source_record_no',
            'width': 220,
            'component': {
              'type': 'text_field',
              'required': true,
            },
          },
        ],
      });

      await tester.pumpWidget(
        buildTestHost(
          component: component,
          formKey: formKey,
          extraData: {
            'allControllers': {'sources': formController},
            'onFieldArrayChanged': (List<Map<String, dynamic>> rows) {
              latestRows = rows;
            },
          },
        ),
      );
      await tester.pumpAndSettle();

      // 0 rows -> min_rows = 1 fails validation
      expect(formKey.currentState!.validate(), isFalse);
      await tester.pumpAndSettle();
      expect(find.textContaining('Minimal 1 baris'), findsOneWidget);

      // Add 1 row -> min_rows passes, but required cell is still empty
      await tester.tap(find.byKey(const Key('field_array_sources_add')));
      await tester.pumpAndSettle();
      expect(latestRows.length, 1);

      expect(formKey.currentState!.validate(), isFalse);
      await tester.pumpAndSettle();
      expect(find.textContaining('is required'), findsOneWidget);

      // Fill required cell -> validation passes
      await tester.enterText(find.byType(TextField).first, 'REC-001');
      await tester.pumpAndSettle();
      expect(latestRows.first['source_record_no'], 'REC-001');
      expect(
        jsonDecode(formController.text),
        [
          {'source_record_no': 'REC-001'}
        ],
      );
      expect(formKey.currentState!.validate(), isTrue);

      // Add 2nd row -> hits max_rows = 2 -> Add button becomes disabled
      await tester.tap(find.byKey(const Key('field_array_sources_add')));
      await tester.pumpAndSettle();
      expect(latestRows.length, 2);

      // Tapping disabled add button does not add a 3rd row
      await tester.tap(find.byKey(const Key('field_array_sources_add')));
      await tester.pumpAndSettle();
      expect(latestRows.length, 2);
    });

    testWidgets('deleting first row preserves values of remaining rows',
        (tester) async {
      final formKey = GlobalKey<FormState>();
      List<Map<String, dynamic>> latestRows = const [];

      final component = ComponentFieldArray.fromMap({
        'id': 'notes',
        'type': 'field_array',
        'initial_value': [
          {'title': 'Row A'},
          {'title': 'Row B'},
        ],
        'columns': [
          {
            'header': 'Title',
            'body': 'title',
            'width': 220,
            'component': {'type': 'text_field', 'required': true},
          },
        ],
      });

      await tester.pumpWidget(
        buildTestHost(
          component: component,
          formKey: formKey,
          extraData: {
            'onFieldArrayChanged': (List<Map<String, dynamic>> rows) {
              latestRows = rows;
            },
          },
        ),
      );
      await tester.pumpAndSettle();

      // Delete row 0 ("Row A")
      await tester.tap(find.byKey(const Key('field_array_notes_delete_0')));
      await tester.pumpAndSettle();

      expect(latestRows.length, 1);
      expect(latestRows.first['title'], 'Row B');
      expect(find.text('Row B'), findsOneWidget);
      expect(find.text('Row A'), findsNothing);
    });

    testWidgets('validates unique_by constraint across rows', (tester) async {
      final formKey = GlobalKey<FormState>();

      final component = ComponentFieldArray.fromMap({
        'id': 'unique_items',
        'type': 'field_array',
        'constraints': {
          'unique_by': ['code'],
        },
        'initial_value': [
          {'code': 'DUP-1'},
          {'code': 'DUP-1'},
        ],
        'columns': [
          {
            'header': 'Code',
            'body': 'code',
            'width': 200,
            'component': {'type': 'text_field', 'required': true},
          },
        ],
      });

      await tester.pumpWidget(
        buildTestHost(component: component, formKey: formKey),
      );
      await tester.pumpAndSettle();

      expect(formKey.currentState!.validate(), isFalse);
      await tester.pumpAndSettle();
      expect(find.textContaining('duplikat'), findsOneWidget);

      // Change second row to unique value -> passes
      await tester.enterText(find.byType(TextField).at(1), 'DUP-2');
      await tester.pumpAndSettle();
      expect(formKey.currentState!.validate(), isTrue);
    });

    testWidgets('renders card presentation and hides controls in view mode',
        (tester) async {
      final formKey = GlobalKey<FormState>();

      final component = ComponentFieldArray.fromMap({
        'id': 'card_items',
        'type': 'field_array',
        'label': 'Items',
        'presentation': 'card',
        'initial_value': [
          {'name': 'Material X'},
        ],
        'columns': [
          {
            'header': 'Name',
            'body': 'name',
            'component': {'type': 'text_field'},
          },
        ],
      });

      await tester.pumpWidget(
        buildTestHost(
          component: component,
          formKey: formKey,
          extraData: {'dataAction': DataAction.view},
        ),
      );
      await tester.pumpAndSettle();

      expect(find.text('#1'), findsOneWidget);
      expect(find.byKey(const Key('field_array_card_items_add')), findsNothing);
      expect(
        find.byKey(const Key('field_array_card_items_delete_0')),
        findsNothing,
      );
    });
  });
}
