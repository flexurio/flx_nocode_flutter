import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/data_table/screen/widgets/menu_data_table_custom_table_view.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/features/field/models/field.dart';

void main() {
  group('EntityField with action and view_type', () {
    test('parses action with view_type table correctly', () {
      final json = {
        'label': '09',
        'reference': '9',
        'type': 'number',
        'column_width': 8,
        'action': {
          'id': 'view_detail_09',
          'name': 'Detail Sales Target Bulan 09',
          'type': 'show_dialog',
          'view_type': 'table',
          'target_entity': 'sales_target_monthly_trend_details',
          'title': 'Sales Target Monthly Trend Detail',
          'filters': [
            {'reference': 'tahun', 'value': '{{row.tahun}}'},
            {'reference': 'bulan', 'value': '09'}
          ],
        },
      };

      final field = EntityField.fromJson(json);

      expect(field.label, '09');
      expect(field.reference, '9');
      expect(field.action, isNotNull);
      expect(field.action!.id, 'view_detail_09');
      expect(field.action!.type, ActionType.showDialog);
      expect(field.action!.viewType, 'table');
      expect(field.action!.targetEntityId,
          'sales_target_monthly_trend_details');
      expect(field.action!.title, 'Sales Target Monthly Trend Detail');
      expect(field.action!.filters, hasLength(2));
    });

    test('parses action with type_view alias correctly', () {
      final json = {
        'label': '01',
        'reference': '1',
        'type': 'number',
        'action': {
          'id': 'view_detail_01',
          'type': 'show_dialog',
          'type_view': 'table',
          'entity_id': 'sales_target_monthly_trend_details',
          'params': {
            'tahun.eq': '{{row.tahun}}',
            'bulan.eq': '01',
          },
        },
      };

      final field = EntityField.fromJson(json);

      expect(field.action, isNotNull);
      expect(field.action!.viewType, 'table');
      expect(field.action!.targetEntityId,
          'sales_target_monthly_trend_details');
      expect(field.action!.params, containsPair('tahun.eq', '{{row.tahun}}'));
      expect(field.action!.params, containsPair('bulan.eq', '01'));
    });

    test('EntityField.toJson and ActionD.toJson serialize action properties', () {
      final action = ActionD(
        id: 'test_action',
        type: ActionType.showDialog,
        name: 'Test Name',
        isMultiple: false,
        onSuccess: const ['toast'],
        onFailure: const ['toast'],
        viewType: 'table',
        targetEntityId: 'target_entity_123',
        title: 'Dialog Title',
        filters: [
          {'reference': 'year', 'value': '2026'}
        ],
        params: {'key': 'value'},
      );

      final field = EntityField(
        label: 'Test Field',
        reference: 'test_ref',
        type: 'number',
        action: action,
      );

      final json = field.toJson();
      expect(json['action'], isNotNull);
      final actionJson = json['action'] as Map<String, dynamic>;
      expect(actionJson['view_type'], 'table');
      expect(actionJson['target_entity'], 'target_entity_123');
      expect(actionJson['title'], 'Dialog Title');
      expect(actionJson['filters'], hasLength(1));
      expect(actionJson['params'], containsPair('key', 'value'));
    });

    test('ActionD.copyWith updates viewType and targetEntityId', () {
      final action = ActionD(
        id: 'action_1',
        type: ActionType.showDialog,
        name: 'Action 1',
        isMultiple: false,
        onSuccess: const [],
        onFailure: const [],
        viewType: 'table',
        targetEntityId: 'entity_1',
      );

      final updated = action.copyWith(
        viewType: 'form',
        targetEntityId: 'entity_2',
      );

      expect(updated.viewType, 'form');
      expect(updated.targetEntityId, 'entity_2');
    });

    testWidgets(
      'MenuDataTableCustomTableView assigns cell onTap when field.action is defined',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1200, 800);
        tester.view.devicePixelRatio = 1.0;
        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final entity = EntityCustom.fromJson({
          'id': 'sales_estimation',
          'label': 'Sales Estimation',
          'description': 'Test',
          'fields': [
            {
              'label': 'Year',
              'reference': 'tahun',
              'type': 'text',
              'column_width': 6,
            },
            {
              'label': '01',
              'reference': '1',
              'type': 'number',
              'column_width': 8,
              'action': {
                'id': 'view_detail_1',
                'name': 'Detail 01',
                'type': 'show_dialog',
                'view_type': 'table',
                'target_entity': 'detail_entity',
              },
            },
          ],
          'backend': {
            'read_all': {
              'method': 'GET',
              'url': 'http://localhost/test',
            }
          },
          'layout_table': {
            'tahun': 6,
            '1': 8,
          },
        });

        final pageOptions = PageOptions<Map<String, dynamic>>.empty(
          data: const [
            {
              'tahun': '2026',
              '1': 100000,
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
                embedded: true,
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

        final dataTableBackend = tester
            .widget<DataTableBackend<Map<String, dynamic>>>(dataTableFinder);
        final columns = dataTableBackend.columns;

        // Expect 2 data columns plus optional actions column (total 3)
        expect(columns.length, greaterThanOrEqualTo(2));

        // Column 1 is '01'
        expect(columns[1].head.label, equals('01'));

        // Evaluate body for row data
        final rowData = {'tahun': '2026', '1': 100000};

        // Column 1 (index 1) has field.action, so its DataCell must have an onTap handler
        final cellCol1 = columns[1].body(rowData);
        expect(cellCol1.onTap, isNotNull,
            reason: 'DataCell for column with field.action must have an onTap callback');
      },
    );
  });
}
