import 'package:flexurio_chiron_vendor/src/app/model/material_supplier_leadtime.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('MaterialSupplierLeadtime.fromJson', () {
    test('normal', () {
      final data = {
        'id': 1,
        'vendor': {
          'id': 101,
          'name': 'Thomas',
          'address': 'Thomas Address',
          'city_id': 101,
          'country_id': 101,
          'postal_code': 112244,
          'phone': 6282112297034,
          'fax': '(021) 7876233',
          'pic': 'Isco',
          'email': 'thomas@gmail.com',
          'npwp': '167267617226133',
          'coa': 'THMS',
        },
        'material': {
          'id': 90003,
          'created_at': '2023-03-07T03:35:53.097Z',
          'created_by_id': 1801008,
          'updated_at': '2023-03-07T03:35:53.097Z',
          'updated_by_id': 1801008,
          'vendor_id': 101,
          'material_id': 10,
          'material': {
            'id': 10,
            'created_at': '0001-01-01T00:00:00Z',
            'created_by_id': 0,
            'updated_at': '0001-01-01T00:00:00Z',
            'updated_by_id': 0,
            'name': 'material',
            'latitude': 0,
            'longitude': 0,
            'radius': 0,
            'description': '',
            'address': '',
          },
        },
        'lead_time': 2,
        'created_at': '2023-01-09T06:16:58.262Z',
        'updated_at': '2023-01-09T08:16:58.262Z',
      };
      final materialSupplierLeadtime = MaterialSupplierLeadTime.fromJson(data);
      expect(materialSupplierLeadtime.id, 1);
      expect(materialSupplierLeadtime.leadTime, 2);
      expect(
        DateFormat().format(materialSupplierLeadtime.createdAt),
        'January 9, 2023 6:16:58 AM',
      );
      expect(
        DateFormat().format(materialSupplierLeadtime.updatedAt),
        'January 9, 2023 8:16:58 AM',
      );
    });
  });
}
