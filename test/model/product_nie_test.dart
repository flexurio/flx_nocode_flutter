import 'package:flexurio_chiron_product/src/app/model/product_nie.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('ProductsNie.fromJson', () {
    test('normal', () {
      final data = {
        'id': '30001',
        'created_at': '2023-02-20T20:18:04.000Z',
        'created_by_id': 2302024,
        'updated_at': '2023-02-20T20:18:04.000Z',
        'updated_by_id': 2302024,
        'start_period': '2023-02-20T20:18:04.000Z',
        'end_period': '2024-02-20T20:18:04.000Z',
        'publisher': 'BPOM',
        'product': {
          'created_at': '2023-06-08T04:19:57.59Z',
          'created_by_id': 2302024,
          'updated_at': '2023-06-11T15:33:17.066Z',
          'updated_by_id': 2302024,
          'id': '62',
          'name': 'hello 1',
          'product_no': '23',
          'type': 'ANTIBIOTIK',
          'quantity_pack': 33,
          'quantity_batch': 34,
          'quantity_strip': 32,
          'quantity_tablet': 2,
          'division': 'ETH',
          'mf_code': '',
          'tl_code': '',
          'is_toll_out': true,
          'expiry_period': 21,
          'nie': '3333444455',
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
      };
      final productNie = ProductNie.fromJson(data);

      expect(productNie.id, '30001');
      expect(
        DateFormat.yMMMEd().format(productNie.periodStart),
        'Tue, Feb 21, 2023',
      );
      expect(
        DateFormat.yMMMEd().format(productNie.periodEnd),
        'Wed, Feb 21, 2024',
      );
      expect(
        DateFormat.yMMMEd().format(productNie.createAt),
        'Tue, Feb 21, 2023',
      );
      expect(
        DateFormat.yMMMEd().format(productNie.updatedAt),
        'Tue, Feb 21, 2023',
      );
      expect(productNie.publisher, 'BPOM');
    });
  });
}
