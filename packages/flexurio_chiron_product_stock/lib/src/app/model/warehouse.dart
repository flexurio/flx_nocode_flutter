import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

enum Warehouse implements ColorType {
  unknown('⚠️', Colors.transparent),
  bulk('RUAHAN', Colors.blueGrey),
  treatment('PENGOBATAN', Colors.blueGrey),
  finishedProduct('PRODUK JADI', Colors.blueGrey),
  alkes('ALKES', Colors.green),
  ppic('IC', Colors.pink),
  engineering('EN', Colors.blue),
  cs('CS', Colors.purple),
  rnd('R&D', Colors.orange);

  const Warehouse(this.id, this.color);
  final String id;

  @override
  String get label => id;

  @override
  final Color color;

  static List<Warehouse> get products => [
        Warehouse.bulk,
        Warehouse.finishedProduct,
        Warehouse.alkes,
        Warehouse.rnd,
        Warehouse.treatment,
      ];

  static List<Warehouse> get material => [
        Warehouse.ppic,
        Warehouse.engineering,
        Warehouse.cs,
        Warehouse.rnd,
      ];

  static List<Warehouse> get all => [
        Warehouse.bulk,
        Warehouse.treatment,
        Warehouse.finishedProduct,
        Warehouse.alkes,
        Warehouse.ppic,
        Warehouse.engineering,
        Warehouse.cs,
        Warehouse.rnd,
      ];

  static Warehouse fromString(String id) {
    for (final type in all) {
      if (type.id == id) {
        return type;
      }
    }
    return Warehouse.unknown;
  }
}
