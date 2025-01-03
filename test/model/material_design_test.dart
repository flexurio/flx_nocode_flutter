import 'package:flexurio_chiron_material/src/app/model/material_design.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('Products.fromJson', () {
    test('normal', () {
      final data = {
        'id': 1,
        'created_at': '2023-02-03T08:27:07.679Z',
        'created_by_id': 120120,
        'updated_at': '2023-02-03T08:27:07.679Z',
        'updated_by_id': 120120,
        'design_code': '0045',
        'material_id': 0,
        'material_unit_id': '',
        'material_group_id': '',
        'unit_stock': 'KG',
        'formulation_id': 12,
        'is_lock': 'N',
        'material': {
          'id': 0,
          'created_at': '0001-01-01T00:00:00Z',
          'created_by_id': 0,
          'updated_at': '0001-01-01T00:00:00Z',
          'updated_by_id': 0,
          'name': 'testing 1',
          'type': '',
          'import': null,
          'is_active': null,
          'adjustment': null,
          'is_asset': null,
          'halal_certificate_date': null,
          'material_unit': {
            'created_at': '0001-01-01T00:00:00Z',
            'created_by_id': 0,
            'updated_at': '0001-01-01T00:00:00Z',
            'updated_by_id': 0,
            'id': '',
            'type': '',
          },
          'material_group': {
            'created_at': '0001-01-01T00:00:00Z',
            'created_by_id': 0,
            'updated_at': '0001-01-01T00:00:00Z',
            'updated_by_id': 0,
            'id': '',
          },
        },
        'material_group': {
          'created_at': '0001-01-01T00:00:00Z',
          'created_by_id': 0,
          'updated_at': '0001-01-01T00:00:00Z',
          'updated_by_id': 0,
          'id': '',
        },
        'material_unit': {
          'created_at': '0001-01-01T00:00:00Z',
          'created_by_id': 0,
          'updated_at': '0001-01-01T00:00:00Z',
          'updated_by_id': 0,
          'id': '12',
          'type': 'Mat',
        },
      };

      // final data = {
      //   'id': '1',
      //   'designCode': '0012',
      //   'enabled': false,
      // };
      final materialDesign = MaterialDesign.fromJson(data);

      expect(materialDesign.material.name, 'testing 1');
      expect(materialDesign.id, 1);
      expect(materialDesign.designCode, '0045');
      expect(materialDesign.isLock, 'N');
      expect(
        DateFormat().format(materialDesign.createAt),
        'February 3, 2023 3:27:07 PM',
      );
      expect(
        DateFormat().format(materialDesign.updatedAt),
        'February 3, 2023 3:27:07 PM',
      );
      expect(materialDesign.designCode, '0045');
    });
  });
}
