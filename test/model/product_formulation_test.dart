// // import 'package:appointment/src/app/model/product_formulation.dart';
// // import 'package:flutter_test/flutter_test.dart';

// // void main() {
// //   group('ProductFormulation.fromJson', () {
// //     test('normal', () {
// //       final data = {
// //         'id': 26,
// //         'created_at': '2023-01-09T06:16:58.262Z',
// //         'updated_at': '2023-01-09T08:16:58.262Z',
// //         'type': 'BAKU',
// //         'quantity': 100,
// //         'scale': 'PILOT',
// //         'is_confirm': false,
// //         'is_active': true,
// //         'unit': {
// //           'created_at': '2023-05-04T09:45:44.736Z',
// //           'created_by_id': 2170817,
// //           'updated_at': '2023-05-04T09:45:44.736Z',
// //           'updated_by_id': 2170817,
// //           'id': 'KG',
// //           'type': 'MATERIAL',
// //         },
// //         'product': {
// //           'id': 31,
// //           'created_at': '2023-05-16T06:23:39.299Z',
// //           'created_by_id': 2302024,
// //           'updated_at': '2023-05-22T03:35:30.897Z',
// //           'updated_by_id': 2302024,
// //           'name': 'Test again 2',
// //           'product_no': 'T222',
// //           'type': 'KAPSUL',
// //           'quantity_pack': 3011,
// //           'quantity_batch': 29,
// //           'quantity_strip': 1010,
// //           'quantity_tablet': 1010,
// //           'division': 'ETH',
// //           'mf_code': '',
// //           'tl_code': '',
// //           'is_toll_out': true,
// //           'expiry_period': 3555,
// //           'nie': 'DL1234567897',
// //           'unit_smallest': {
// //             'created_at': '0001-01-01T00:00:00Z',
// //             'created_by_id': 0,
// //             'updated_at': '0001-01-01T00:00:00Z',
// //             'updated_by_id': 0,
// //             'id': '',
// //             'type': '',
// //           },
// //           'material_group': {
// //             'created_at': '0001-01-01T00:00:00Z',
// //             'created_by_id': 0,
// //             'updated_at': '0001-01-01T00:00:00Z',
// //             'updated_by_id': 0,
// //             'id': '',
// //           },
// //           'unit_packing': {
// //             'created_at': '0001-01-01T00:00:00Z',
// //             'created_by_id': 0,
// //             'updated_at': '0001-01-01T00:00:00Z',
// //             'updated_by_id': 0,
// //             'id': '',
// //             'type': '',
// //           },
// //         },
// //       };

//       final data2 = {
//         'id': 35,
//         'created_at': '2023-05-29T07:19:18.335Z',
//         'created_by_id': 2206002,
//         'updated_at': '2023-05-29T07:19:18.335Z',
//         'updated_by_id': 2206002,
//         'type': 'BAKU',
//         'quantity': 100,
//         'scale': 'PILOT',
//         'is_confirm': false,
//         'is_active': true,
//         'unit': {
//           'created_at': '2023-05-04T09:45:44.736Z',
//           'created_by_id': 2170817,
//           'updated_at': '2023-05-04T09:45:44.736Z',
//           'updated_by_id': 2170817,
//           'id': 'KG',
//           'type': 'MATERIAL',
//         },
//         'product': {
//           'id': 31,
//           'created_at': '2023-05-16T06:23:39.299Z',
//           'created_by_id': 2302024,
//           'updated_at': '2023-05-22T03:35:30.897Z',
//           'updated_by_id': 2302024,
//           'name': 'Test again 2',
//           'product_no': 'T222',
//           'type': 'KAPSUL',
//           'quantity_pack': 3011,
//           'quantity_batch': 29,
//           'quantity_strip': 1010,
//           'quantity_tablet': 1010,
//           'division': 'ETH',
//           'mf_code': '',
//           'tl_code': '',
//           'is_toll_out': true,
//           'expiry_period': 3555,
//           'nie': 'DL1234567897',
//           'unit_smallest': {
//             'created_at': '0001-01-01T00:00:00Z',
//             'created_by_id': 0,
//             'updated_at': '0001-01-01T00:00:00Z',
//             'updated_by_id': 0,
//             'id': '',
//             'type': '',
//           },
//           'material_group': {
//             'created_at': '0001-01-01T00:00:00Z',
//             'created_by_id': 0,
//             'updated_at': '0001-01-01T00:00:00Z',
//             'updated_by_id': 0,
//             'id': '',
//           },
//           'unit_packing': {
//             'created_at': '0001-01-01T00:00:00Z',
//             'created_by_id': 0,
//             'updated_at': '0001-01-01T00:00:00Z',
//             'updated_by_id': 0,
//             'id': '',
//             'type': '',
//           },
//         },
//       };
//       final productFormulation = ProductFormulation.fromJson(data);
//       final productFormulation2 = ProductFormulation.fromJson(data2);
//       expect(productFormulation.id, 26);
//       // expect(
//       //   DateFormat().format(productFormulation.createdAt),
//       //   'January 9, 2023 6:16:58 AM',
//       // );
//       // expect(
//       //   DateFormat().format(productFormulation.updatedAt),
//       //   'January 9, 2023 8:16:58 AM',
//       // );
//       expect(productFormulation.type, ProductFormulationType.baku);
//       expect(productFormulation.quantity, 100);
//       expect(productFormulation.scale, ProductFormulationScale.pilot);
//       expect(productFormulation.isConfirm, false);
//       expect(productFormulation.isActive, true);
//       expect(productFormulation.unit, 'KG');
//       expect(productFormulation.product.id, 31);

//       expect(productFormulation2.id, 35);
//       // expect(
//       //   DateFormat().format(productFormulation.createdAt),
//       //   'January 9, 2023 6:16:58 AM',
//       // );
//       // expect(
//       //   DateFormat().format(productFormulation.updatedAt),
//       //   'January 9, 2023 8:16:58 AM',
//       // );
//       expect(productFormulation2.type, ProductFormulationType.baku);
//       expect(productFormulation2.quantity, 100);
//       expect(productFormulation2.scale, ProductFormulationScale.pilot);
//       expect(productFormulation2.isConfirm, false);
//       expect(productFormulation2.isActive, true);
//       expect(productFormulation2.unit, 'KG');
//       expect(productFormulation2.product.id, 31);
//     });
//   });
// }
