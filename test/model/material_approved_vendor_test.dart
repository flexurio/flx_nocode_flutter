// import 'package:appointment/src/app/model/city.dart';
// import 'package:appointment/src/app/model/country.dart';
// import 'package:flexurio_chiron_vendor/src/app/model/material_approved_vendor.dart';
// import 'package:appointment/src/app/model/supplier.dart';
// import 'package:appointment/src/app/model/vendors.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:intl/intl.dart';

// void main() {
//   group('MaterialApprovedVendor.fromJson', () {
//     test('normal', () {
//       final data = {
//         'id': 1,
//         'material_id': 1,
//         'vendor': {
//           'id': 11,
//           'created_at': '2023-05-03T06:23:05.636Z',
//           'created_by_id': 2206002,
//           'updated_at': '2023-05-03T06:23:05.636Z',
//           'updated_by_id': 2206002,
//           'name': 'asdf',
//           'address': 'address',
//           'postal_code': 21321,
//           'phone': '6282112297031',
//           'fax': '111-111 1111',
//           'pic': 'Akbar',
//           'email': 'asdf@gmail.com',
//           'npwp': '11.111.111.1-111.111',
//           'coa': 1,
//           'country': {
//             'id': 1,
//             'created_at': '2022-11-02T06:16:00.393Z',
//             'created_by_id': 43,
//             'updated_at': '2022-11-02T06:16:00.393Z',
//             'updated_by_id': 43,
//             'name': 'Engineer',
//             'email': 'engineer@gmail.com',
//             'department_group': {
//               'id': 0,
//               'created_at': '0001-01-01T00:00:00Z',
//               'created_by_id': 0,
//               'updated_at': '0001-01-01T00:00:00Z',
//               'updated_by_id': 0,
//               'name': '',
//               'email': ''
//             },
//             'department_type': {
//               'id': 0,
//               'created_at': '0001-01-01T00:00:00Z',
//               'created_by_id': 0,
//               'updated_at': '0001-01-01T00:00:00Z',
//               'updated_by_id': 0,
//               'name': ''
//             }
//           },
//           'city': {
//             'id': '',
//             'created_at': '0001-01-01T00:00:00Z',
//             'created_by_id': {'name': '', 'id': 0},
//             'updated_at': '0001-01-01T00:00:00Z',
//             'updated_by_id': {'name': '', 'id': 0},
//             'name': ''
//           }
//         },
//         'supplier': {
//           'id': 9,
//           'created_at': '2023-05-03T06:10:08.889Z',
//           'created_by_id': 2206002,
//           'updated_at': '2023-05-03T06:10:33.832Z',
//           'updated_by_id': 2206002,
//           'name': 'name',
//           'address': 'address',
//           'postal_code': 21312,
//           'phone': '6288901779725',
//           'fax': '213-123 1231',
//           'pic': 'PIC',
//           'email': 'email@gmail.com',
//           'npwp': '23.123.123.1-231.231',
//           'coa': 1,
//           'country': {
//             'id': 1,
//             'created_at': '2022-11-02T06:16:00.393Z',
//             'created_by_id': 43,
//             'updated_at': '2022-11-02T06:16:00.393Z',
//             'updated_by_id': 43,
//             'name': 'Engineer',
//             'email': 'engineer@gmail.com',
//             'department_group': {
//               'id': 0,
//               'created_at': '0001-01-01T00:00:00Z',
//               'created_by_id': 0,
//               'updated_at': '0001-01-01T00:00:00Z',
//               'updated_by_id': 0,
//               'name': '',
//               'email': ''
//             },
//             'department_type': {
//               'id': 0,
//               'created_at': '0001-01-01T00:00:00Z',
//               'created_by_id': 0,
//               'updated_at': '0001-01-01T00:00:00Z',
//               'updated_by_id': 0,
//               'name': ''
//             }
//           },
//           'city': {
//             'id': 'jkt',
//             'created_at': '0001-01-01T00:00:00Z',
//             'created_by_id': {'name': '', 'id': 0},
//             'updated_at': '0001-01-01T00:00:00Z',
//             'updated_by_id': {'name': '', 'id': 0},
//             'name': 'jakarta'
//           }
//         },
//         'halal_certificate_expired': '2023-01-09T06:16:58.262Z',
//         'halal_institution': 'MUI',
//         'halal_no_certificate': '1290',
//         'document': 'document',
//         'description': 'description',
//         'storage_procedure': 'storage',
//         'category': 'HERBAL',
//         'type': 'APML',
//         'is_enable': true,
//         'created_at': '2023-01-09T06:16:58.262Z',
//         'updated_at': '2023-01-09T08:16:58.262Z',
//       };
//       final materialApprovedVendor = MaterialApprovedVendor.fromJson(data);

//       expect(materialApprovedVendor.id, 1);
//       expect(materialApprovedVendor.material.id, 1);
//       expect(
//         materialApprovedVendor.vendor,
//         Vendors(
//           address: 'address',
//           city: City(
//             createdAt: DateTime.parse('0001-01-01T00:00:00Z'),
//             id: '',
//             name: '',
//             updatedAt: DateTime.parse('0001-01-01T00:00:00Z'),
//           ),
//           // coa: 1,
//           country: Country(
//             createdAt: DateTime.parse('2022-11-02T06:16:00.393Z'),
//             email: 'engineer@gmail.com',
//             id: 1,
//             name: 'Engineer',
//             updatedAt: DateTime.parse('2022-11-02T06:16:00.393Z'),
//           ),
//           createdAt: DateTime.parse('2023-05-03T06:23:05.636Z'),
//           email: 'asdf@gmail.com',
//           fax: '111-111 1111',
//           id: 11,
//           name: 'asdf',
//           npwp: '11.111.111.1-111.111',
//           phone: '6282112297031',
//           pic: 'Akbar',
//           postalCode: 21321,
//           updatedAt: DateTime.parse('2023-05-03T06:23:05.636Z'),
//         ),
//       );
//       expect(
//         materialApprovedVendor.supplier,
//         Supplier(
//           address: 'address',
//           city: City(
//             createdAt: DateTime.parse('0001-01-01T00:00:00Z'),
//             id: 'jkt',
//             name: 'jakarta',
//             updatedAt: DateTime.parse('0001-01-01T00:00:00Z'),
//           ),
//           // coa: 1,
//           country: Country(
//             createdAt: DateTime.parse('2022-11-02T06:16:00.393Z'),
//             email: 'engineer@gmail.com',
//             id: 1,
//             name: 'Engineer',
//             updatedAt: DateTime.parse('2022-11-02T06:16:00.393Z'),
//           ),
//           createdAt: DateTime.parse('2023-05-03T06:10:08.889Z'),
//           email: 'email@gmail.com',
//           fax: '213-123 1231',
//           id: 9,
//           name: 'name',
//           npwp: '23.123.123.1-231.231',
//           phone: '6288901779725',
//           pic: 'PIC',
//           postalCode: 21312,
//           updatedAt: DateTime.parse('2023-05-03T06:10:33.832Z'),
//         ),
//       );
//       // expect(
//       //   DateFormat().format(materialApprovedVendor.halalCertificateExpired),
//       //   'January 9, 2023 6:16:58 AM',
//       // );
//       expect(materialApprovedVendor.halalInstitution, 'MUI');
//       expect(materialApprovedVendor.halalNoCertificate, '1290');
//       expect(materialApprovedVendor.storageProcedure, 'document');
//       expect(materialApprovedVendor.description, 'description');
//       expect(materialApprovedVendor.storageProcedure, 'storage');
//       expect(
//         materialApprovedVendor.category,
//         MaterialApprovedVendorCategory.herbs,
//       );
//       expect(materialApprovedVendor.type, MaterialApprovedVendorType.apml);
//       expect(materialApprovedVendor.isEnable, true);
//       expect(
//         DateFormat().format(materialApprovedVendor.createdAt),
//         'January 9, 2023 6:16:58 AM',
//       );
//       expect(
//         DateFormat().format(materialApprovedVendor.updatedAt),
//         'January 9, 2023 8:16:58 AM',
//       );
//     });
//   });
// }
