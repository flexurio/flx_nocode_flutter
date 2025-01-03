import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('ProductionStage.fromJson', () {
    test('normal', () {
      final data = {
        'id': 30002,
        'created_at': '2022-11-21T04:24:58.841Z',
        'created_by_id': 100,
        'updated_at': '2022-11-21T06:24:58.841Z',
        'updated_by_id': 100,
        'name': 'Master Box',
      };
      final productionStage = ProductionStage.fromJson(data);
      expect(productionStage.id, 30002);
      expect(productionStage.name, 'Master Box');
      expect(
        DateFormat().format(productionStage.createdAt),
        'November 21, 2022 4:24:58 AM',
      );
      expect(
        DateFormat().format(productionStage.updatedAt),
        'November 21, 2022 6:24:58 AM',
      );
    });
  });
}
