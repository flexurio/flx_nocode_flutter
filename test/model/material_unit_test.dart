import 'package:flexurio_chiron_material/src/app/model/material_unit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('MaterialUnit.fromJson', () {
    test('normal', () {
      final data = {
        'created_at': '2023-01-09T06:16:58.262Z',
        'created_by_id': 532,
        'updated_at': '2023-01-09T08:16:58.262Z',
        'updated_by_id': 532,
        'id': 'KG',
        'type': 'Material',
      };
      final productionLine = MaterialUnit.fromJson(data);
      expect(productionLine.id, 'KG');
      expect(productionLine.type, MaterialUnitType.material);
      expect(
        DateFormat().format(productionLine.createdAt),
        'January 9, 2023 1:16:58 PM',
      );
      expect(
        DateFormat().format(productionLine.updatedAt),
        'January 9, 2023 3:16:58 PM',
      );
    });
  });
}
