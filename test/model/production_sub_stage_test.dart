import 'package:flexurio_chiron_production/src/app/model/production_sub_stage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('ProductionSubStage.fromJson', () {
    test('normal', () {
      final data = {
        'id': 90001,
        'created_at': '2023-01-27T06:43:33.53Z',
        'created_by_id': 100,
        'updated_at': '2023-01-27T09:43:33.53Z',
        'updated_by_id': 100,
        'name': 'Cleaning',
        'production_stage': {
          'id': 1,
          'created_at': '2022-11-01T03:49:27.653Z',
          'created_by_id': 2,
          'updated_at': '2022-11-01T03:49:48.199Z',
          'updated_by_id': 2,
          'name': 'Print',
        },
      };
      final productionSubStage = ProductionSubStage.fromJson(data);
      expect(productionSubStage.id, 90001);
      expect(productionSubStage.stage.id, 1);
      expect(productionSubStage.stage.name, 'Print');
      expect(
        DateFormat().format(productionSubStage.stage.createdAt),
        'November 1, 2022 10:49:27 AM',
      );
      expect(
        DateFormat().format(productionSubStage.stage.updatedAt),
        'November 1, 2022 10:49:48 AM',
      );
      expect(productionSubStage.name, 'Cleaning');
      expect(
        DateFormat().format(productionSubStage.createdAt),
        'January 27, 2023 1:43:33 PM',
      );
      expect(
        DateFormat().format(productionSubStage.updatedAt),
        'January 27, 2023 4:43:33 PM',
      );
    });
  });
}
