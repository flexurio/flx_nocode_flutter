import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';

enum TaxType implements ColorType {
  empty('', '', Colors.transparent, 0, 0),
  tax23Non('23 NON', '23', Colors.green, 4, 0),
  tax23Npwp('23 NPWP', '23', Colors.green, 2, 0),
  tax23_26('23/26', '23', Colors.green, 20, 0),
  tax21Non('21 NON', '21', Colors.blue, 3, 0),
  tax21Npwp('21 NPWP', '21', Colors.blue, 2.5, 0),
  tax21_9('21/9', '21', Colors.blue, 9, 0),
  tax21_7_5('21/7.5', '21', Colors.blue, 7.5, 0),
  tax21_0('21/0', '21', Colors.blue, 0, 0),
  tax22Sale('22 SALE', '22', Colors.pink, 0, 0.3),
  taxFinal('FINAL', '', Colors.purple, 0.5, 0),
  taxNone('NONE', '', Colors.purple, 0, 0);

  const TaxType(
    this.label,
    this.type,
    this.color,
    this.taxPercent,
    this.pph22Percent,
  );

  final double taxPercent;
  final double pph22Percent;
  final String type;

  @override
  final Color color;

  @override
  final String label;

  static List<TaxType> get list => [
        TaxType.tax23Non,
        TaxType.tax23Npwp,
        TaxType.tax23_26,
        TaxType.tax21Non,
        TaxType.tax21Npwp,
        TaxType.tax21_9,
        TaxType.tax21_7_5,
        TaxType.tax21_0,
        TaxType.tax22Sale,
        TaxType.taxFinal,
        TaxType.taxNone,
      ];

  static TaxType fromString(String label) {
    if (label == TaxType.empty.label) {
      return TaxType.empty;
    }
    if (label == TaxType.tax23Non.label) {
      return TaxType.tax23Non;
    }
    if (label == TaxType.tax23Npwp.label) {
      return TaxType.tax23Npwp;
    }
    if (label == TaxType.tax23_26.label) {
      return TaxType.tax23_26;
    }
    if (label == TaxType.tax21Non.label) {
      return TaxType.tax21Non;
    }
    if (label == TaxType.tax21Npwp.label) {
      return TaxType.tax21Npwp;
    }
    if (label == TaxType.tax21_9.label) {
      return TaxType.tax21_9;
    }
    if (label == TaxType.tax21_7_5.label) {
      return TaxType.tax21_7_5;
    }
    if (label == TaxType.tax21_0.label) {
      return TaxType.tax21_0;
    }
    if (label == TaxType.tax22Sale.label) {
      return TaxType.tax22Sale;
    }
    if (label == TaxType.taxFinal.label) {
      return TaxType.taxFinal;
    }
    if (label == TaxType.taxNone.label) {
      return TaxType.taxNone;
    }
    return TaxType.empty;
  }

  static TaxType fromPercent(double taxPercent) {
    if (taxPercent == TaxType.empty.taxPercent) {
      return TaxType.empty;
    }
    if (taxPercent == TaxType.tax23Non.taxPercent) {
      return TaxType.tax23Non;
    }
    if (taxPercent == TaxType.tax23Npwp.taxPercent) {
      return TaxType.tax23Npwp;
    }
    if (taxPercent == TaxType.tax23_26.taxPercent) {
      return TaxType.tax23_26;
    }
    if (taxPercent == TaxType.tax21Non.taxPercent) {
      return TaxType.tax21Non;
    }
    if (taxPercent == TaxType.tax21Npwp.taxPercent) {
      return TaxType.tax21Npwp;
    }
    if (taxPercent == TaxType.tax21_9.taxPercent) {
      return TaxType.tax21_9;
    }
    if (taxPercent == TaxType.tax21_7_5.taxPercent) {
      return TaxType.tax21_7_5;
    }
    if (taxPercent == TaxType.tax21_0.taxPercent) {
      return TaxType.tax21_0;
    }
    if (taxPercent == TaxType.tax22Sale.taxPercent) {
      return TaxType.tax22Sale;
    }
    if (taxPercent == TaxType.taxFinal.taxPercent) {
      return TaxType.taxFinal;
    }
    if (taxPercent == TaxType.taxNone.taxPercent) {
      return TaxType.taxNone;
    }
    return TaxType.empty;
  }
}

enum Ppn implements ColorType {
  empty(0, '', Colors.transparent),
  none(0, 'None', Colors.blueGrey),
  ppn10(10, '10 %', Colors.green),
  ppn11(11, '11 %', Colors.blue),
  ppn12(12, '12 %', Colors.orange);

  const Ppn(this.id, this.label, this.color);

  final double id;

  @override
  final Color color;

  @override
  final String label;

  static List<Ppn> get list => [
        Ppn.ppn10,
        Ppn.ppn11,
        Ppn.ppn12,
        Ppn.none,
      ];

  static Ppn fromNum(num ppn) {
    if (ppn == Ppn.ppn10.id) {
      return Ppn.ppn10;
    }
    if (ppn == Ppn.ppn11.id) {
      return Ppn.ppn11;
    }
    if (ppn == Ppn.ppn12.id) {
      return Ppn.ppn12;
    }
    return Ppn.empty;
  }
}

enum PurchaseOrderPaymentType implements ColorType {
  empty('', '', Colors.transparent),
  termOfPayment('Term of Payment', 'Term of Payment', Colors.green),
  pettyCash('Petty Cash', 'Petty Cash', Colors.blue);

  const PurchaseOrderPaymentType(this.id, this.label, this.color);

  final String id;

  @override
  final Color color;

  @override
  final String label;

  static List<PurchaseOrderPaymentType> get list => [
        PurchaseOrderPaymentType.termOfPayment,
        PurchaseOrderPaymentType.pettyCash,
      ];

  static PurchaseOrderPaymentType fromString(String id) {
    if (id == PurchaseOrderPaymentType.empty.id) {
      return PurchaseOrderPaymentType.empty;
    }
    if (id == PurchaseOrderPaymentType.termOfPayment.id) {
      return PurchaseOrderPaymentType.termOfPayment;
    }
    if (id == PurchaseOrderPaymentType.pettyCash.id) {
      return PurchaseOrderPaymentType.pettyCash;
    }
    return PurchaseOrderPaymentType.empty;
  }
}
