import 'package:flexurio_chiron_product/src/app/model/product_formulation_detail.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProductFormulationDetail.fromJson', () {
    test('normal', () {
      final data = {
        'id': 3,
        'created_at': '2023-05-29T08:30:28.074Z',
        'updated_at': '2023-05-29T08:30:28.074Z',
        'quantity': 1,
        'material': {
          'id': 2,
          'created_at': '2023-05-29T02:59:43.112Z',
          'created_by_id': 6110462,
          'updated_at': '2023-05-29T02:59:43.112Z',
          'updated_by_id': 6110462,
          'name': 'Ammonium Chlorida',
          'is_active': true,
          'is_assetS': false,
          'halal_certificate_id': '',
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
          'material_type': {
            'created_at': '0001-01-01T00:00:00Z',
            'created_by_id': 0,
            'updated_at': '0001-01-01T00:00:00Z',
            'updated_by_id': 0,
            'id': '',
            'material_group': {
              'created_at': '0001-01-01T00:00:00Z',
              'created_by_id': 0,
              'updated_at': '0001-01-01T00:00:00Z',
              'updated_by_id': 0,
              'id': '',
            },
          },
        },
        'formulation': {
          'id': 47,
          'created_at': '2023-05-29T08:30:27.815Z',
          'created_by_id': 2206002,
          'updated_at': '2023-05-29T08:30:27.815Z',
          'updated_by_id': 2206002,
          'type': 'BAKU',
          'quantity': 100,
          'scale': 'PILOT',
          'is_confirm': false,
          'is_active': true,
          'unit': {
            'created_at': '0001-01-01T00:00:00Z',
            'created_by_id': 0,
            'updated_at': '0001-01-01T00:00:00Z',
            'updated_by_id': 0,
            'id': '',
            'type': '',
          },
          'product': {
            'id': 0,
            'created_at': '0001-01-01T00:00:00Z',
            'created_by_id': 0,
            'updated_at': '0001-01-01T00:00:00Z',
            'updated_by_id': 0,
            'name': '',
            'product_no': '',
            'type': '',
            'quantity_pack': 0,
            'quantity_batch': 0,
            'quantity_strip': 0,
            'quantity_tablet': 0,
            'division': '',
            'mf_code': '',
            'tl_code': '',
            'is_toll_out': '',
            'expiry_period': 0,
            'nie': '',
            'unit_smallest': {
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
            'unit_packing': {
              'created_at': '0001-01-01T00:00:00Z',
              'created_by_id': 0,
              'updated_at': '0001-01-01T00:00:00Z',
              'updated_by_id': 0,
              'id': '',
              'type': '',
            },
          },
        },
        'unit': {
          'created_at': '0001-01-01T00:00:00Z',
          'created_by_id': 0,
          'updated_at': '0001-01-01T00:00:00Z',
          'updated_by_id': 0,
          'id': '',
          'type': '',
        },
      };
      final productFormulationDetail = ProductFormulationDetail.fromJson(data);
      expect(productFormulationDetail.id, 3);
      expect(productFormulationDetail.quantity, 1);
      expect(productFormulationDetail.material.id, 2);
      expect(productFormulationDetail.formulation.id, 47);
      // expect(
      //   DateFormat().format(productFormulationDetail.createdAt),
      //   'February 13, 2023 10:17:18 AM',
      // );
      // expect(
      //   DateFormat().format(productFormulationDetail.updatedAt),
      //   'February 13, 2023 10:17:18 AM',
      // );
    });
  });
}
