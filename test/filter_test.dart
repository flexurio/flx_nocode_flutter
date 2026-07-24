import 'package:flutter_test/flutter_test.dart';
import 'package:flx_nocode_flutter/src/app/model/filter.dart';

void main() {
  group('Filter Class Tests', () {
    test('getKeyBackend returns standard reference with .eq by default', () {
      final filter = Filter(reference: 'status', value: 'active');
      expect(filter.getKeyBackend(), 'status.eq');
    });

    test('getKeyBackend returns customized backendKey if provided', () {
      final filter = Filter(
        reference: 'period',
        value: '202607',
        backendKey: 'visit_customers.period.eq',
      );
      expect(filter.getKeyBackend(), 'visit_customers.period.eq');
    });

    test('getKeyBackend returns multiple keys joined with .like if reference contains pipe', () {
      final filter = Filter(reference: 'name|code', value: 'abc');
      expect(filter.getKeyBackend(), 'name.like|code.like');
    });

    test('getBackendParams returns gte/lte map if value starts with __range__', () {
      final filter = Filter(reference: 'created_at', value: '__range__2026-01-01|2026-01-31');
      final params = filter.getBackendParams();
      expect(params, {
        'created_at.gte': '2026-01-01',
        'created_at.lte': '2026-01-31',
      });
    });

    test('getBackendParams returns backendKey matching value mapping', () {
      final filter = Filter(
        reference: 'period',
        value: '202607',
        backendKey: 'visit_customers.period.eq',
      );
      final params = filter.getBackendParams();
      expect(params, {
        'visit_customers.period.eq': '202607',
      });
    });

    test('copyWith preserves or overrides properties correctly', () {
      final filter = Filter(reference: 'ref', value: 'val', backendKey: 'bKey');
      
      final copied1 = filter.copyWith(value: 'newVal');
      expect(copied1.reference, 'ref');
      expect(copied1.value, 'newVal');
      expect(copied1.backendKey, 'bKey');

      final copied2 = filter.copyWith(backendKey: 'newBKey');
      expect(copied2.backendKey, 'newBKey');
    });
  });
}
