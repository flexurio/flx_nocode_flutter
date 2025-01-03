import 'package:flexurio_chiron_product/flexurio_chiron_product.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('Product.fromJson', () {
    test('normal', () {
      final data = {
        'id': '4456',
        'created_at': '2023-04-28T04:23:10.388Z',
        'created_by_id': 2170817,
        'updated_at': '2023-05-03T01:55:22.602Z',
        'updated_by_id': 2170817,
        'name': 'Test',
        'product_no': 'T002',
        'type': 'KAPLET',
        'quantity_pack': 30,
        'quantity_batch': 2900,
        'quantity_strip': 10,
        'quantity_tablet': 10,
        'division': 'ETH',
        'mf_code': 'test 1',
        'tl_code': 'test 2',
        'is_toll_out': true,
        'expiry_period': 2,
        'nie': 'nie123456',
        'unit_smallest': {
          'created_at': '2023-04-28T03:49:31.579Z',
          'created_by_id': 2170817,
          'updated_at': '2023-04-28T03:49:31.579Z',
          'updated_by_id': 2170817,
          'id': 'KAPSUL',
          'type': 'PRODUCT',
        },
        'product_group': {
          'created_at': '2023-04-28T03:48:03.443Z',
          'created_by_id': 2170817,
          'updated_at': '2023-04-28T03:48:03.443Z',
          'updated_by_id': 2170817,
          'id': 'PRODUCT',
        },
        'unit_packing': {
          'created_at': '2023-04-28T03:49:16.121Z',
          'created_by_id': 2170817,
          'updated_at': '2023-04-28T03:49:16.121Z',
          'updated_by_id': 2170817,
          'id': 'BOX',
          'type': 'PRODUCT',
        },
      };
      final product = Product.fromJson(data);

      expect(product.id, '4456');
      expect(
        DateFormat().format(product.createAt),
        'April 28, 2023 11:23:10 AM',
      );

      expect(product.createdById, 2170817);
      expect(
        DateFormat().format(product.updatedAt),
        'May 3, 2023 8:55:22 AM',
      );
      expect(product.updateById, 2170817);
      expect(product.productNo, 'T002');
      expect(product.name, 'Test');
      expect(product.productNo, 'T002');
      expect(product.productType.productType, 'KAPLET');
      expect(product.quantityPack, 30);
      expect(product.quantityBatch, 2900);
      expect(product.quantityStrip, 10);
      expect(product.quantityTablet, 10);
      expect(product.division, 'ETH');
      expect(product.tollOut, true);
      expect(product.expiryPeriod, 2);
      expect(product.nie, 'nie123456');
      expect(
        DateFormat().format(product.productGroup.createdAt),
        'April 28, 2023 10:48:03 AM',
      );
      expect(
        DateFormat().format(product.productGroup.updatedAt),
        'April 28, 2023 10:48:03 AM',
      );
      expect(
        DateFormat().format(product.unitSmallest.createdAt),
        'April 28, 2023 10:49:31 AM',
      );
      expect(
        DateFormat().format(product.unitSmallest.updatedAt),
        'April 28, 2023 10:49:31 AM',
      );
      expect(product.unitSmallest.id, 'KAPSUL');
      expect(product.unitSmallest.type, 'PRODUCT');
      expect(
        DateFormat().format(product.unitPacking.createdAt),
        'April 28, 2023 10:49:16 AM',
      );
      expect(
        DateFormat().format(product.unitPacking.updatedAt),
        'April 28, 2023 10:49:16 AM',
      );
      expect(product.unitPacking.id, 'BOX');
      expect(product.unitPacking.type, 'PRODUCT');
    });
  });
}
