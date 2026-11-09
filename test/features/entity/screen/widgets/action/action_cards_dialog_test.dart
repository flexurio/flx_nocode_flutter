import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/features/entity/models/action.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/features/entity/screen/widgets/entity_card_grid_view.dart';
import 'package:flx_nocode_flutter/features/field/models/field.dart';
import 'package:flx_nocode_flutter/src/app/model/entity_custom_query/entity_custom_query_bloc.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class _FakeEntityCustomQueryBloc extends EntityCustomQueryBloc {
  final List<Map<String, dynamic>> mockData;
  _FakeEntityCustomQueryBloc(this.mockData);

  @override
  void add(EntityCustomQueryEvent event) {
    emit(
      EntityCustomQueryState.loaded(
        PageOptions<Map<String, dynamic>>.empty().copyWith(
          data: mockData,
        ),
      ),
    );
  }
}

void main() {
  group('EntityCardGridView and Action view_type cards/grid', () {
    test('parses action with view_type cards correctly', () {
      final json = {
        'label': '01',
        'reference': '1',
        'type': 'number',
        'action': {
          'id': 'view_detail_1',
          'name': 'Detail Sales Target Bulan 01',
          'type': 'show_dialog',
          'view_type': 'cards',
          'target_entity': 'sales_target_monthly_trend_detail_summaries',
          'title': 'Sales Target Monthly Trend Detail Summaries - Bulan 01',
          'filters': [
            {'reference': 'tahun', 'value': '{{row.tahun}}'},
            {'reference': 'bulan', 'value': '01'}
          ],
        },
      };

      final field = EntityField.fromJson(json);

      expect(field.action, isNotNull);
      expect(field.action!.type, ActionType.showDialog);
      expect(field.action!.viewType, 'cards');
      expect(field.action!.targetEntityId,
          'sales_target_monthly_trend_detail_summaries');
      expect(field.action!.title,
          'Sales Target Monthly Trend Detail Summaries - Bulan 01');
    });

    testWidgets('EntityCardGridView renders context badges and metric cards',
        (tester) async {
      final entityJson = {
        'id': 'sales_target_monthly_trend_detail_summaries',
        'label': 'Sales Target Monthly Trend Detail Summaries',
        'description': 'Laporan ringkasan',
        'fields': [
          {'label': 'Year', 'reference': 'tahun', 'type': 'text'},
          {'label': 'Month', 'reference': 'bulan', 'type': 'text'},
          {
            'label': 'Estimation',
            'reference': 'sales_estimasi',
            'type': 'number',
            'action': {
              'id': 'click_estimasi',
              'name': 'Granular Detail',
              'type': 'show_dialog',
              'view_type': 'table',
              'target_entity': 'sales_target_monthly_trend_details',
            }
          },
          {
            'label': 'Actual',
            'reference': 'sales_actual',
            'type': 'number',
            'action': {
              'id': 'click_actual',
              'name': 'Granular Detail',
              'type': 'show_dialog',
              'view_type': 'table',
              'target_entity': 'sales_target_monthly_trend_details',
            }
          },
          {
            'label': 'Remaining',
            'reference': 'sales_remaining',
            'type': 'number',
            'action': {
              'id': 'click_remaining',
              'name': 'Granular Detail',
              'type': 'show_dialog',
              'view_type': 'table',
              'target_entity': 'sales_target_monthly_trend_details',
            }
          },
        ],
        'backend': {
          'read_all': {
            'method': 'GET',
            'url': 'http://localhost/test',
          }
        },
        'layout_table': {
          'tahun': 8,
          'bulan': 8,
          'sales_estimasi': 12,
          'sales_actual': 12,
          'sales_remaining': 12,
        },
      };

      final entity = EntityCustom.fromJson(entityJson);
      final fakeBloc = _FakeEntityCustomQueryBloc([
        {
          'tahun': '2026',
          'bulan': '01',
          'sales_estimasi': 11736606768.0,
          'sales_actual': 11736606768.0,
          'sales_remaining': 11736606768.0,
        }
      ]);

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: BlocProvider<EntityCustomQueryBloc>.value(
              value: fakeBloc,
              child: EntityCardGridView(
                entity: entity,
                initialFilters: const [],
                parentData: const [],
              ),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Check context badges (Year & Month)
      expect(find.text('Year: 2026'), findsOneWidget);
      expect(find.text('Month: 01'), findsOneWidget);

      // Check metric card labels
      expect(find.text('Estimation'), findsOneWidget);
      expect(find.text('Actual'), findsOneWidget);
      expect(find.text('Remaining'), findsOneWidget);

      // Check formatted numbers (11,736,606,768)
      expect(find.textContaining('11,736,606,768'), findsNWidgets(3));

      // Check clickable action indicator
      expect(find.text('Lihat Detail'), findsNWidgets(3));
    });
  });
}

