import 'package:flexurio_chiron_production/flexurio_chiron_production.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('ProductionMachine.fromJson', () {
    test('normal', () {
      final data = {
        'id': 30002,
        'created_at': '2023-02-15T10:57:28.432Z',
        'created_by_id': 6110462,
        'updated_at': '2023-02-15T11:57:28.432Z',
        'updated_by_id': 6110462,
        'name': 'Mixer Manual P.80',
      };
      final productionMachine = ProductionMachine.fromJson(data);
      expect(productionMachine.id, 30002);
      expect(productionMachine.name, 'Mixer Manual P.80');
      expect(
        DateFormat().format(productionMachine.createdAt),
        'February 15, 2023 10:57:28 AM',
      );
      expect(
        DateFormat().format(productionMachine.updatedAt),
        'February 15, 2023 11:57:28 AM',
      );
    });
  });
}
