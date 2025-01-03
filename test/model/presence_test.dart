import 'package:flexurio_chiron_presence/src/app/model/presence.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('Presence.fromJson', () {
    test('normal', () {
      final data = {
        'user_id': 1801008,
        'user_name': 'Mualip Suhal',
        'office_id': 1,
        'office_name': 'Metiska Farma',
        'in_date_time': '2023-02-01T09:08:11.884Z',
        'in_radius_from_office': 51.7897,
        'out_date_time': '2023-02-01T09:31:27.007Z',
        'out_radius_from_office': 51.866264,
      };
      final presence = Presence.fromJson(data);
      expect(
        DateFormat().format(presence.inDateTime!),
        'February 1, 2023 4:08:11 PM',
      );
      expect(
        DateFormat().format(presence.inDateTime!),
        'February 1, 2023 4:32:27 PM',
      );
      expect(presence.userName, 'Mualip Suhal');
      expect(presence.userId, 1801008);
      expect(presence.inRadiusFromOffice, 51.7897);
      expect(presence.outRadiusFromOffice, 51.866264);
      expect(presence.inTime, '16:08');
      expect(presence.outTime, '16:31');
    });
  });
}
