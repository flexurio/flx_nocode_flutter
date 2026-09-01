import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/data_table/screen/widgets/menu_data_table_custom_table_view.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';

void main() {
  testWidgets(
    'MenuDataTableCustomTableView assigns pinned and pinPosition to DTColumn',
    (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1400, 1000);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      final entity = EntityCustom.fromJson({
        'id': 'test_lbb_detail',
        'label': 'Expense Detail',
        'description': 'Test Description',
        'pinned_columns': ['subordinate_name', 'description'],
        'fields': [
          {
            'label': 'Subordinate Name',
            'reference': 'subordinate_name',
            'type': 'text',
          },
          {
            'label': 'Description',
            'reference': 'description',
            'type': 'text',
          },
          {
            'label': 'Area Value',
            'reference': 'area_value',
            'type': 'number',
            'is_pinned': true,
          },
          {
            'label': 'NIP',
            'reference': 'nip',
            'type': 'text',
          },
        ],
        'backend': {
          'read_all': {
            'method': 'GET',
            'url': 'http://localhost/test',
          }
        },
        'layout_table': {
          'subordinate_name': 10,
          'description': 10,
          'area_value': 8,
          'nip': 4,
        },
      });

      final pageOptions = PageOptions<Map<String, dynamic>>.empty(
        data: const [
          {
            'subordinate_name': 'Andri Indrayana',
            'description': 'Biaya Operasional',
            'area_value': 500000,
            'nip': '1182090',
          }
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MenuDataTableCustomTableView(
              entity: entity,
              status: Status.loaded,
              pageOptions: pageOptions,
              embedded: false,
              parentData: const [],
              bypassPermission: true,
              filtersMap: const {},
              actionLeft: const [],
              actionRightBuilder: (refresh) => [refresh],
              onChanged: (_) {},
              onRefresh: ([_]) async {},
            ),
          ),
        ),
      );

      final dataTableFinder =
          find.byType(DataTableBackend<Map<String, dynamic>>);
      expect(dataTableFinder, findsOneWidget);

      final dataTableBackend =
          tester.widget<DataTableBackend<Map<String, dynamic>>>(dataTableFinder);
      final columns = dataTableBackend.columns;

      // Expect at least 4 data columns
      expect(columns.length, greaterThanOrEqualTo(4));

      // Column 0: subordinate_name (configured via entity pinned_columns)
      expect(columns[0].head.label, equals('Subordinate Name'));
      expect(columns[0].pinned, isTrue);
      expect(columns[0].pinPosition, equals(TablePinPosition.left));

      // Column 1: description (configured via entity pinned_columns)
      expect(columns[1].head.label, equals('Description'));
      expect(columns[1].pinned, isTrue);
      expect(columns[1].pinPosition, equals(TablePinPosition.left));

      // Column 2: area_value (configured via field is_pinned: true)
      expect(columns[2].head.label, equals('Area Value'));
      expect(columns[2].pinned, isTrue);
      expect(columns[2].pinPosition, equals(TablePinPosition.left));

      // Column 3: nip (unpinned)
      expect(columns[3].head.label, equals('NIP'));
      expect(columns[3].pinned, isFalse);
      expect(columns[3].pinPosition, equals(TablePinPosition.none));
    },
  );
}
