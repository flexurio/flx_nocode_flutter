import 'package:flutter_test/flutter_test.dart';
import 'package:flx_core_flutter/flx_core_flutter.dart';
import 'package:flx_nocode_flutter/src/app/model/entity_field_options_source.dart';
import 'package:flx_nocode_flutter/src/app/resource/entity_custom.dart';
import 'package:mocktail/mocktail.dart';

class MockEntityCustomRepository extends Mock
    implements EntityCustomRepository {}

void main() {
  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    registerFallbackValue(PageOptions<Map<String, dynamic>>.emptyNoLimit());
  });

  group('OptionsSource Placeholder Resolution & Backend Source', () {
    test('backendSource parses entity, key, value, and query parameters', () {
      final source = OptionsSource(
        optionsSource:
            'backend.vw_lbb_expense_transaction_detail_search({subordinate_name}:{subordinate_name})?lbb_expense_transaction_header_id.eq={{lbb_expense_transaction_header_id}}',
      );

      final backend = source.backendSource(parentData: const []);
      expect(backend.entity, 'vw_lbb_expense_transaction_detail_search');
      expect(backend.key, 'subordinate_name');
      expect(backend.value, 'subordinate_name');
      expect(
        backend.queryParams['lbb_expense_transaction_header_id.eq'],
        '{{lbb_expense_transaction_header_id}}',
      );
    });

    test('extractValues parses static values correctly', () {
      final source = OptionsSource(
        optionsSource:
            "values('ANDRI':'Andri Indrayana','BUDI':'Budi Santoso')",
      );
      final values = source.extractValues();
      expect(values['ANDRI'], 'Andri Indrayana');
      expect(values['BUDI'], 'Budi Santoso');
      expect(values.length, 2);
    });

    test(
        'extractBackend resolves {{placeholder}}, deduplicates entries, and filters empty keys',
        () async {
      final mockRepo = MockEntityCustomRepository();
      EntityCustomRepository.instance = mockRepo;

      final source = OptionsSource(
        optionsSource:
            'backend.vw_lbb_expense_transaction_detail_search({subordinate_name}:{subordinate_name})?lbb_expense_transaction_header_id.eq={{lbb_expense_transaction_header_id}}',
      );

      // Parent data containing the active filter
      final parentData = [
        {'lbb_expense_transaction_header_id': 'PBO/2026/08/001'}
      ];

      // Mocked backend response with duplicates and an empty item
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
          )).thenAnswer((invocation) async {
        final filterMap =
            invocation.namedArguments[#filterMap] as Map<String, dynamic>;
        expect(filterMap['lbb_expense_transaction_header_id.eq'],
            'PBO/2026/08/001');

        return PageOptions<Map<String, dynamic>>.emptyNoLimit().copyWith(
          data: [
            {'subordinate_name': 'Andri Indrayana'},
            {'subordinate_name': 'Andri Indrayana'}, // Duplicate
            {'subordinate_name': 'Budi Santoso'},
            {'subordinate_name': ''}, // Empty key - should be skipped
            {'subordinate_name': null}, // Null key - should be skipped
          ],
        );
      });

      final options = await source.extractBackend(parentData: parentData);

      // Verify unique items and no null/empty keys
      expect(options.length, 2);
      expect(options['Andri Indrayana'], 'Andri Indrayana');
      expect(options['Budi Santoso'], 'Budi Santoso');
      expect(options.containsKey(''), isFalse);
      expect(options.containsKey(null), isFalse);
    });

    test('extractBackend resolves {parent.field} and {page[0].field}', () async {
      final mockRepo = MockEntityCustomRepository();
      EntityCustomRepository.instance = mockRepo;

      final source = OptionsSource(
        optionsSource:
            'backend.vw_lbb_expense_transaction_detail_search({description}:{description})?lbb_expense_transaction_header_id.eq={parent.header_id}',
      );

      final parentData = [
        {'header_id': 'EVENT/2026/09/001'}
      ];

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
          )).thenAnswer((invocation) async {
        final filterMap =
            invocation.namedArguments[#filterMap] as Map<String, dynamic>;
        expect(filterMap['lbb_expense_transaction_header_id.eq'],
            'EVENT/2026/09/01' == 'EVENT/2026/09/01' ? 'EVENT/2026/09/001' : '');

        return PageOptions<Map<String, dynamic>>.emptyNoLimit().copyWith(
          data: [
            {'description': 'PROMOTION EXPENSE'},
            {'description': 'TRAVEL EXPENSE'},
          ],
        );
      });

      final options = await source.extractBackend(parentData: parentData);
      expect(options.length, 2);
      expect(options['PROMOTION EXPENSE'], 'PROMOTION EXPENSE');
      expect(options['TRAVEL EXPENSE'], 'TRAVEL EXPENSE');
    });
  });
}
