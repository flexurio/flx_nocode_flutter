import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('WorkHour.fromJson', () {
    test('normal', () {
      final data = {
        'id': 3,
        'created_at': '2022-11-17T04:37:28.44Z',
        'created_by_id': 2,
        'updated_at': '2022-11-17T05:02:58.787Z',
        'updated_by_id': 2,
        'day': 'Monday',
        'work_hour_start': '07:00',
        'work_hour_end': '09:00',
        'work_hour_shift': {
          'id': 1,
          'created_at': '2022-11-08T08:10:32.855Z',
          'created_by_id': 2,
          'updated_at': '2022-11-08T08:10:32.855Z',
          'updated_by_id': 2,
          'name': 'Pagi',
          'start_period': '2022-01-01',
          'end_period': '2022-12-31',
        },
      };
      final workHour = WorkHour.fromJson(data);
      expect(workHour.id, 3);
      expect(workHour.day, 'Monday');
      expect(workHour.start, '07:00');
      expect(workHour.end, '09:00');
      expect(
        DateFormat().format(workHour.createdAt),
        'November 17, 2022 4:37:28 AM',
      );
      expect(
        DateFormat().format(workHour.updatedAt),
        'November 17, 2022 5:02:58 AM',
      );
    });
  });
}
