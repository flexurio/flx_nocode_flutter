import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('WorkHourShift.fromJson', () {
    test('normal', () {
      final data = {
        'id': 1,
        'created_at': '2022-11-08T08:10:32.855Z',
        'created_by_id': 2,
        'updated_at': '2022-11-08T10:10:32.855Z',
        'updated_by_id': 2,
        'name': 'Shift A1',
        'start_period': '2022-01-01',
        'end_period': '2022-12-31',
      };
      final workHourShift = WorkHourShift.fromJson(data);
      expect(workHourShift.id, 1);
      expect(workHourShift.periodStart, '2022-01-01');
      expect(workHourShift.periodEnd, '2022-12-31');
      expect(workHourShift.name, 'Shift A1');
      expect(
        DateFormat().format(workHourShift.createdAt),
        'November 8, 2022 8:10:32 AM',
      );
      expect(
        DateFormat().format(workHourShift.updatedAt),
        'November 8, 2022 10:10:32 AM',
      );
    });
  });
}
