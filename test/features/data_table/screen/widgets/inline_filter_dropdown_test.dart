import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/features/data_table/screen/widgets/inline_filter.dart';
import 'package:flx_nocode_flutter/features/entity/models/entity.dart';
import 'package:flx_nocode_flutter/features/field/models/field.dart';
import 'package:flx_nocode_flutter/src/app/model/filter.dart';
import 'package:flx_nocode_flutter/src/app/resource/entity_custom.dart';
import 'package:mocktail/mocktail.dart';

class MockEntityCustomRepository extends Mock
    implements EntityCustomRepository {}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    registerFallbackValue(PageOptions<Map<String, dynamic>>.emptyNoLimit());
  });

  group('InlineFilter Dropdown & always_include', () {
    testWidgets('renders dropdown search when config type is select',
        (WidgetTester tester) async {
      final mockRepo = MockEntityCustomRepository();
      EntityCustomRepository.instance = mockRepo;

      when(() => mockRepo.fetch(
            accessToken: any(named: 'accessToken'),
            pageOptions: any(named: 'pageOptions'),
            method: any(named: 'method'),
            path: any(named: 'path'),
            filterMap: any(named: 'filterMap'),
            headers: any(named: 'headers'),
            cachedDurationSeconds: any(named: 'cachedDurationSeconds'),
            mockEnabled: any(named: 'mockEnabled'),
            mockData: any(named: 'mockData'),
          )).thenAnswer((_) async {
        return PageOptions<Map<String, dynamic>>.emptyNoLimit().copyWith(
          data: [
            {'subordinate_name': 'Andri Indrayana'},
            {'subordinate_name': 'Budi Santoso'},
          ],
        );
      });

      final field = EntityField(
        label: 'Subordinate Name',
        reference: 'subordinate_name',
        type: 'text',
      );

      String? selectedVal;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: InlineFilter(
              field: field,
              config: const {
                'type': 'select',
                'width': 500.0,
                'options_source':
                    'backend.vw_lbb_expense_transaction_detail_search({subordinate_name}:{subordinate_name})',
                'always_include': true,
                'default': '',
              },
              parentData: const [],
              initialValue: '',
              onChanged: (val) {
                selectedVal = val;
              },
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Dropdown should be rendered with label containing 'Subordinate Name'
      expect(find.textContaining('Subordinate Name'), findsOneWidget);
      expect(selectedVal, isNull);
    });

    test('always_include filter parameter formatting', () {
      final filterEmpty = Filter(
        reference: 'subordinate_name',
        value: '',
      );

      expect(filterEmpty.getBackendParams(), {'subordinate_name.eq': ''});

      final filterWithValue = Filter(
        reference: 'subordinate_name',
        value: 'Andri Indrayana',
      );

      expect(filterWithValue.getBackendParams(),
          {'subordinate_name.eq': 'Andri Indrayana'});
    });

    test('EntityCustom parses filter with always_include and type select', () {
      final entity = EntityCustom.fromJson({
        'id': 'test_detail',
        'label': 'Test Detail',
        'description': 'Test Description',
        'fields': [
          {
            'label': 'Subordinate Name',
            'reference': 'subordinate_name',
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
        },
        'filters': [
          {
            'reference': 'subordinate_name',
            'type': 'select',
            'options_source':
                'backend.vw_lbb_expense_transaction_detail_search({subordinate_name}:{subordinate_name})?lbb_expense_transaction_header_id.eq={{lbb_expense_transaction_header_id}}',
            'always_include': true,
            'default': '',
          },
        ],
      });

      expect(entity.filters.length, 1);
      final filterOpt = entity.filters.first;
      expect(filterOpt.reference, 'subordinate_name');
      expect(filterOpt.config['type'], 'select');
      expect(filterOpt.config['always_include'], true);
      expect(filterOpt.config['default'], '');
      expect(
        filterOpt.config['options_source'],
        'backend.vw_lbb_expense_transaction_detail_search({subordinate_name}:{subordinate_name})?lbb_expense_transaction_header_id.eq={{lbb_expense_transaction_header_id}}',
      );
    });

    test('views.filter chips are separated from inline filters in action bar', () {
      final entity = EntityCustom.fromJson({
        'id': 'test_detail',
        'label': 'Test Detail',
        'description': 'Test Description',
        'fields': [
          {
            'label': 'Subordinate Name',
            'reference': 'subordinate_name',
            'type': 'text',
          },
          {
            'label': 'Header ID',
            'reference': 'lbb_expense_transaction_header_id',
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
        },
        'filters': [
          {
            'reference': 'subordinate_name',
            'type': 'select',
            'width': 260.0,
            'always_include': true,
            'default': '',
          },
        ],
      });

      // Filter from views.filter
      final parentFilter = Filter(
        reference: 'lbb_expense_transaction_header_id',
        value: 'PBO/2026/08/001',
      );

      // Verify that parent filter is NOT considered an inline filter
      final isInline = entity.filters.any((e) => e.reference == parentFilter.reference);
      expect(isInline, isFalse);

      // Inline filter is configured with custom width
      expect(entity.filters.first.config['width'], 260.0);
    });
  });
}
