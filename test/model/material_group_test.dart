import 'package:flexurio_chiron_material/src/app/model/material_group.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('MaterialGroup.fromJson', () {
    test('normal', () {
      final data = {
        'created_at': '2023-02-13T10:17:18.262Z',
        'created_by_id': 532,
        'updated_at': '2023-02-13T11:16:28.262Z',
        'updated_by_id': 532,
        'id': 'UMUM',
      };
      final materialGroup = MaterialGroup.fromJson(data);
      expect(materialGroup.id, 'UMUM');
      expect(
        DateFormat().format(materialGroup.createdAt),
        'February 13, 2023 10:17:18 AM',
      );
      expect(
        DateFormat().format(materialGroup.updatedAt),
        'February 13, 2023 11:16:28 AM',
      );
    });
  });
}
