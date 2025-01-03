import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('periodMonthToDateFormatUs', () {
    test('20230101', () {
      expect(periodMonthToDateFormatUs('20230101'), 'January 1, 2023');
    });
  });
}
