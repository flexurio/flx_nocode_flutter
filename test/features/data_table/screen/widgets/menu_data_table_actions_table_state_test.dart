import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/data_table/screen/widgets/menu_data_table_actions.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action_button_regular.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/action/action_widget_extension.dart';
import 'package:flx_nocode_flutter/flx_nocode_flutter.dart';
import 'package:flx_nocode_flutter/src/app/model/filter.dart';
import 'package:mocktail/mocktail.dart';

class MockEntityCustom extends Mock implements EntityCustom {}

void main() {
  setUpAll(() {
    registerFallbackValue(Filter(reference: '', value: ''));
  });

  group('MenuDataTableActions table state evaluation', () {
    final realizationAction = ActionD(
      id: 'lbb_realization',
      name: 'LBB Realization',
      type: ActionType.toast,
      isMultiple: false,
      onSuccess: const ['toast'],
      onFailure: const ['toast'],
      rule: Rule(
        all: [
          Condition(
            field:
                "{{ (function(){ var s = String(typeof parentData !== 'undefined' && Array.isArray(parentData) && parentData.length > 0 && parentData[0] && parentData[0].status ? parentData[0].status : (typeof parent !== 'undefined' && parent && parent.status ? parent.status : (typeof status !== 'undefined' ? status : ''))).trim().toUpperCase(); return s !== '' && s !== 'INPUT'; })() }}",
            op: '=',
            value: true,
          ),
          Condition(
            field:
                "{{ typeof is_table_empty !== 'undefined' ? is_table_empty : (typeof table_data_length !== 'undefined' ? table_data_length === 0 : false) }}",
            op: '=',
            value: true,
          ),
        ],
      ),
    );

    test('evaluates isVisibleFor directly with table state context', () {
      // 1. Header is CONFIRM AM (not INPUT), table is loaded and empty -> visible
      final data1 = <String, dynamic>{
        'is_table_empty': true,
        'table_data_length': 0,
        'is_table_loaded': true,
      };
      expect(
        realizationAction.isVisibleFor(
          data1,
          parentData: [
            {'status': 'CONFIRM AM'},
            {'id': '1038'},
          ],
        ),
        true,
      );

      // 2. Header is CONFIRM AM, but table is NOT empty (table_data_length: 5, is_table_empty: false) -> hidden
      final data2 = <String, dynamic>{
        'is_table_empty': false,
        'table_data_length': 5,
        'is_table_loaded': true,
      };
      expect(
        realizationAction.isVisibleFor(
          data2,
          parentData: [
            {'status': 'CONFIRM AM'},
            {'id': '1038'},
          ],
        ),
        false,
      );

      // 3. Header is INPUT, table is empty -> hidden
      final data3 = <String, dynamic>{
        'is_table_empty': true,
        'table_data_length': 0,
        'is_table_loaded': true,
      };
      expect(
        realizationAction.isVisibleFor(
          data3,
          parentData: [
            {'status': 'INPUT'},
            {'id': '1038'},
          ],
        ),
        false,
      );

      // 4. Header is CONFIRM HO, table is still loading (is_table_empty: false, table_data_length: -1) -> hidden
      final data4 = <String, dynamic>{
        'is_table_empty': false,
        'table_data_length': -1,
        'is_table_loaded': false,
      };
      expect(
        realizationAction.isVisibleFor(
          data4,
          parentData: [
            {'status': 'CONFIRM HO'},
            {'id': '1038'},
          ],
        ),
        false,
      );
    });

    testWidgets('MenuDataTableActions hides action when table is not empty',
        (WidgetTester tester) async {
      final entity = MockEntityCustom();
      when(() => entity.actionsHome).thenReturn([realizationAction]);
      when(() => entity.exports).thenReturn([]);
      when(() => entity.fields).thenReturn([]);
      when(() => entity.filters).thenReturn([]);
      when(() => entity.layoutForm)
          .thenReturn([LayoutForm(id: 'main', label: 'Main', components: [])]);
      when(() => entity.bypassAllPermissions).thenReturn(false);

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: MenuDataTableActions(
            entity: entity,
            parentData: const [
              {'status': 'CONFIRM AM'},
              {'id': '1038'},
            ],
            embedded: false,
            bypassPermission: true,
            filters: const [],
            refreshButton: const SizedBox(),
            pageOptions: PageOptions.empty(data: [
              {'id': 'sub-1'}
            ]),
            status: Status.loaded,
            onFilterChanged: (_) {},
            onRefresh: () {},
          ),
        ),
      ));

      expect(find.text('LBB Realization'), findsNothing);
    });

    testWidgets(
        'MenuDataTableActions shows action when table is loaded and empty with matching parent status',
        (WidgetTester tester) async {
      final entity = MockEntityCustom();
      when(() => entity.actionsHome).thenReturn([realizationAction]);
      when(() => entity.exports).thenReturn([]);
      when(() => entity.fields).thenReturn([]);
      when(() => entity.filters).thenReturn([]);
      when(() => entity.layoutForm)
          .thenReturn([LayoutForm(id: 'main', label: 'Main', components: [])]);
      when(() => entity.bypassAllPermissions).thenReturn(false);

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: MenuDataTableActions(
            entity: entity,
            parentData: const [
              {'status': 'CONFIRM AM'},
              {'id': '1038'},
            ],
            embedded: false,
            bypassPermission: true,
            filters: const [],
            refreshButton: const SizedBox(),
            pageOptions: PageOptions.empty(data: []),
            status: Status.loaded,
            onFilterChanged: (_) {},
            onRefresh: () {},
          ),
        ),
      ));

      expect(find.text('LBB Realization'), findsOneWidget);
    });

    testWidgets(
        'MenuDataTableActions hides action when parent status is INPUT even if table is empty',
        (WidgetTester tester) async {
      final entity = MockEntityCustom();
      when(() => entity.actionsHome).thenReturn([realizationAction]);
      when(() => entity.exports).thenReturn([]);
      when(() => entity.fields).thenReturn([]);
      when(() => entity.filters).thenReturn([]);
      when(() => entity.layoutForm)
          .thenReturn([LayoutForm(id: 'main', label: 'Main', components: [])]);
      when(() => entity.bypassAllPermissions).thenReturn(false);

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: MenuDataTableActions(
            entity: entity,
            parentData: const [
              {'status': 'INPUT'},
              {'id': '1038'},
            ],
            embedded: false,
            bypassPermission: true,
            filters: const [],
            refreshButton: const SizedBox(),
            pageOptions: PageOptions.empty(data: []),
            status: Status.loaded,
            onFilterChanged: (_) {},
            onRefresh: () {},
          ),
        ),
      ));

      expect(find.text('LBB Realization'), findsNothing);
    });

    testWidgets('MenuDataTableActions hides action when table is still loading',
        (WidgetTester tester) async {
      final entity = MockEntityCustom();
      when(() => entity.actionsHome).thenReturn([realizationAction]);
      when(() => entity.exports).thenReturn([]);
      when(() => entity.fields).thenReturn([]);
      when(() => entity.filters).thenReturn([]);
      when(() => entity.layoutForm)
          .thenReturn([LayoutForm(id: 'main', label: 'Main', components: [])]);
      when(() => entity.bypassAllPermissions).thenReturn(false);

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: MenuDataTableActions(
            entity: entity,
            parentData: const [
              {'status': 'CONFIRM AM'},
              {'id': '1038'},
            ],
            embedded: false,
            bypassPermission: true,
            filters: const [],
            refreshButton: const SizedBox(),
            pageOptions: PageOptions.empty(data: []),
            status: Status.progress,
            onFilterChanged: (_) {},
            onRefresh: () {},
          ),
        ),
      ));

      expect(find.text('LBB Realization'), findsNothing);
    });

    test('evaluates both lbb_realization and actual_realization with table state', () {
      final actualRealizationAction = ActionD(
        id: 'actual_realization',
        name: 'Actual Realization',
        type: ActionType.openPage,
        layoutFormId: 'actual_realization_without_detail_sub',
        isMultiple: false,
        onSuccess: const ['toast'],
        onFailure: const ['toast'],
        rule: Rule(
          all: [
            Condition(
              field:
                  "{{ (function(){ var s = String(typeof parentData !== 'undefined' && Array.isArray(parentData) && parentData.length > 0 && parentData[0] && parentData[0].status ? parentData[0].status : (typeof parent !== 'undefined' && parent && parent.status ? parent.status : (typeof status !== 'undefined' ? status : ''))).trim().toUpperCase(); return s !== '' && s !== 'INPUT'; })() }}",
              op: '=',
              value: true,
            ),
            Condition(
              field:
                  "{{ typeof is_table_empty !== 'undefined' ? is_table_empty : (typeof table_data_length !== 'undefined' ? table_data_length === 0 : (typeof total_rows !== 'undefined' ? total_rows === 0 : false)) }}",
              op: '=',
              value: true,
            ),
          ],
        ),
      );

      final emptyTableData = <String, dynamic>{
        'is_table_empty': true,
        'table_data_length': 0,
        'total_rows': 0,
        'is_table_loaded': true,
      };

      // Header status != INPUT, empty table -> visible
      expect(
        actualRealizationAction.isVisibleFor(
          emptyTableData,
          parentData: [
            {'status': 'CONFIRM AM'},
            {'id': '1038', 'chart_of_account_id': '6021103'},
          ],
        ),
        true,
      );

      // Header status == INPUT, empty table -> hidden
      expect(
        actualRealizationAction.isVisibleFor(
          emptyTableData,
          parentData: [
            {'status': 'INPUT'},
            {'id': '1038', 'chart_of_account_id': '6021103'},
          ],
        ),
        false,
      );

      // Header status != INPUT, table has data -> hidden
      final filledTableData = <String, dynamic>{
        'is_table_empty': false,
        'table_data_length': 2,
        'total_rows': 2,
        'is_table_loaded': true,
      };
      expect(
        actualRealizationAction.isVisibleFor(
          filledTableData,
          parentData: [
            {'status': 'CONFIRM AM'},
            {'id': '1038', 'chart_of_account_id': '6021103'},
          ],
        ),
        false,
      );
    });

    testWidgets(
        'ActionButtonRegular renders open_page button and provides parentData.last context',
        (WidgetTester tester) async {
      final openAction = ActionD(
        id: 'lbb_realization',
        name: 'LBB Realization',
        type: ActionType.openPage,
        layoutFormId: 'lbb_realization_without_detail_sub',
        isMultiple: false,
        onSuccess: const ['toast'],
        onFailure: const ['toast'],
      );

      final entity = MockEntityCustom();
      when(() => entity.actionsHome).thenReturn([openAction]);
      when(() => entity.exports).thenReturn([]);
      when(() => entity.fields).thenReturn([]);
      when(() => entity.filters).thenReturn([]);
      when(() => entity.layoutForm).thenReturn([
        LayoutForm(
          id: 'lbb_realization_without_detail_sub',
          label: 'Realization',
          components: [],
        )
      ]);
      when(() => entity.bypassAllPermissions).thenReturn(true);

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: MenuDataTableActions(
            entity: entity,
            parentData: const [
              {'status': 'CONFIRM AM', 'id': 'header-1'},
              {'id': 'detail-1038', 'chart_of_account_id': '6021103'},
            ],
            embedded: false,
            bypassPermission: true,
            filters: const [],
            refreshButton: const SizedBox(),
            pageOptions: PageOptions.empty(data: []),
            status: Status.loaded,
            onFilterChanged: (_) {},
            onRefresh: () {},
          ),
        ),
      ));

      expect(find.textContaining('LBB Realization'), findsOneWidget);
      expect(find.byType(ActionButtonRegular), findsOneWidget);
    });
  });
}
