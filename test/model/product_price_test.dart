import 'package:flexurio_chiron_product/src/app/model/product_price.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('Product Price.fromJson', () {
    test('normal', () {
      final data = {
        'id': 2,
        'created_at': '2023-05-17T06:20:32.15Z',
        'created_by_id': 2302024,
        'updated_at': '2023-05-17T06:20:32.15Z',
        'updated_by_id': 2302024,
        'product_price': 122000,
        'bonus_price': 3,
        'primary_price': 10000,
        'strip_hpp': 1000,
        'strip_price': 12200,
        'tablet_price': 1220,
        'start_date': '2025-04-22T17:00:00Z',
        'end_date': '2025-04-22T17:00:00Z',
        'product': {
          'id': 'KL123',
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
          'mf_code': null,
          'tl_code': null,
          'is_toll_out': false,
          'expiry_period': 0,
          'nie': null,
          'unit_smallest': {
            'created_at': '0001-01-01T00:00:00Z',
            'created_by_id': 0,
            'updated_at': '0001-01-01T00:00:00Z',
            'updated_by_id': 0,
            'id': '',
            'type': '',
          },
          'product_group': {
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
        'currency': {
          'created_at': '0001-01-01T00:00:00Z',
          'created_by_id': 0,
          'updated_at': '0001-01-01T00:00:00Z',
          'updated_by_id': 0,
          'id': '',
        },
      };
      final productPrice = ProductPrice.fromJson(data);

      expect(productPrice.id, 2);
      expect(productPrice.product.id, 'KL123');
      expect(
        DateFormat.yMMMEd().format(productPrice.startDate),
        'Wed, Apr 23, 2025',
      );
      expect(
        DateFormat.yMMMEd()
            .format(productPrice.endDate ?? DateTime(2023, 4, 23)),
        'Wed, Apr 23, 2025',
      );
      expect(
        DateFormat.yMMMEd().format(productPrice.createdAt),
        'Wed, May 17, 2023',
      );
      expect(
        DateFormat.yMMMEd().format(productPrice.updateAt),
        'Wed, May 17, 2023',
      );
      expect(productPrice.price, 122000);
      expect(productPrice.bonusPrice, 3);
    });
  });
}
