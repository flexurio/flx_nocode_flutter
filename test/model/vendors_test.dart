import 'package:flexurio_chiron_vendor/flexurio_chiron_vendor.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  group('Vendors.fromJson', () {
    test('normal', () {
      final data = {
        'id': 100,
        'name': 'William',
        'address': 'Jl. Europa',
        'city_id': 'JKT',
        'country_id': 100,
        'postal_code': 15151,
        'phone': 6288901779725,
        'fax': '(021) 2190345',
        'pic': 'Eva',
        'email': 'william@gmail.com',
        'npwp': '08.178.554.2-123.321',
        'created_at': '2023-01-09T06:16:58.262Z',
        'updated_at': '2023-01-09T08:16:58.262Z',
      };
      final vendors = Vendor.fromJson(data);
      expect(vendors.id, 100);
      expect(vendors.name, 'William');
      expect(vendors.address, 'Jl. Europa');
      expect(vendors.city, 'JKT');
      expect(vendors.country, 100);
      expect(vendors.postalCode, 15151);
      expect(vendors.fax, '(021) 2190345');
      expect(vendors.pic, 'Eva');
      expect(vendors.email, 'william@gmail.com');
      expect(vendors.npwp, '08.178.554.2-123.321');
      expect(
        DateFormat().format(vendors.createdAt),
        'January 9, 2023 6:16:58 AM',
      );
      expect(
        DateFormat().format(vendors.updatedAt),
        'January 9, 2023 8:16:58 AM',
      );
    });
  });
}
