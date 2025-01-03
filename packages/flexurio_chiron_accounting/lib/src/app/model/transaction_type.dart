import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'transaction_type.freezed.dart';
part 'transaction_type.g.dart';

enum TransactionTypeFlag implements ColorType {
  empty('', '', Colors.transparent),
  fpjk('FPJK', 'FPJK', Colors.orange),
  perkiraanRetur('PERKIRAAN RETUR', 'Perkiraan Retur', Colors.blue),
  perkiraanDiskon('PERKIRAAN DISKON', 'Perkiraan Diskon', Colors.purple),
  perkiraanJual('PERKIRAAN JUAL', 'Perkiraan Jual', Colors.blueGrey),
  department('DEPARTMENT', 'Department', Colors.brown),
  perkiraanPiutang('PERKIRAAN PIUTANG', 'Perkiraan Piutang', Colors.deepOrange),
  kodeReport('KODE REPORT', 'Kode Report', Colors.green),
  discount('DISCOUNT', 'Discount', Colors.teal),
  taxInvoice('TAX INVOICE', 'Tax Invoice', Colors.pink),
  reportCode('REPORT CODE', 'Report Code', Colors.green),
  status('STATUS', 'Status', Colors.cyan),
  modul('MODUL', 'Modul', Colors.redAccent),
  outMaterial('Out Material', 'Out Material', Colors.deepOrangeAccent),
  adjustmentMaterial(
    'ADJUSTMENT MATERIAL',
    'Adjustment Material',
    Colors.blueAccent,
  ),
  returDistributor(
    'Retur Distributor',
    'Retur Distributor',
    Colors.lightBlueAccent,
  ),
  chartOfAccountReturn(
    'CHART OF ACCOUNT RETURN',
    'Chart of Account Return',
    Colors.grey,
  ),
  chartOfAccountDiscount(
    'CHART OF ACCOUNT DISCOUNT',
    'Chart of Account Discount',
    Colors.deepPurpleAccent,
  ),
  chartOfAccountReceivable(
    'CHART OF ACCOUNT RECEIVABLES',
    'Chart of Account Receivables',
    Colors.limeAccent,
  ),
  chartOfAccountSales(
    'CHART OF ACCOUNT SALES',
    'Chart of Account Sales',
    Colors.indigo,
  );

  const TransactionTypeFlag(this.label, this.id, this.color);

  final String id;

  @override
  final String label;

  @override
  final Color color;

  static List<TransactionTypeFlag> get list => [
        TransactionTypeFlag.chartOfAccountReturn,
        TransactionTypeFlag.chartOfAccountDiscount,
        TransactionTypeFlag.taxInvoice,
        TransactionTypeFlag.reportCode,
        TransactionTypeFlag.chartOfAccountSales,
        TransactionTypeFlag.status,
        TransactionTypeFlag.chartOfAccountReceivable,
        TransactionTypeFlag.department,
        TransactionTypeFlag.discount,
      ];

  static TransactionTypeFlag fromString(String id) {
    if (id == TransactionTypeFlag.perkiraanRetur.id) {
      return TransactionTypeFlag.perkiraanRetur;
    }
    if (id == TransactionTypeFlag.chartOfAccountSales.id) {
      return TransactionTypeFlag.chartOfAccountSales;
    }
    if (id == TransactionTypeFlag.chartOfAccountDiscount.id) {
      return TransactionTypeFlag.chartOfAccountDiscount;
    }
    if (id == TransactionTypeFlag.chartOfAccountReceivable.id) {
      return TransactionTypeFlag.chartOfAccountReceivable;
    }
    if (id == TransactionTypeFlag.chartOfAccountReturn.id) {
      return TransactionTypeFlag.chartOfAccountReturn;
    }
    if (id == TransactionTypeFlag.taxInvoice.id) {
      return TransactionTypeFlag.taxInvoice;
    }
    if (id == TransactionTypeFlag.reportCode.id) {
      return TransactionTypeFlag.reportCode;
    }
    if (id == TransactionTypeFlag.perkiraanDiskon.id) {
      return TransactionTypeFlag.perkiraanDiskon;
    }
    if (id == TransactionTypeFlag.perkiraanJual.id) {
      return TransactionTypeFlag.perkiraanJual;
    }
    if (id == TransactionTypeFlag.perkiraanPiutang.id) {
      return TransactionTypeFlag.perkiraanPiutang;
    }
    if (id == TransactionTypeFlag.status.id) {
      return TransactionTypeFlag.status;
    }
    if (id == TransactionTypeFlag.fpjk.id) {
      return TransactionTypeFlag.fpjk;
    }
    if (id == TransactionTypeFlag.discount.id) {
      return TransactionTypeFlag.discount;
    }
    if (id == TransactionTypeFlag.department.id) {
      return TransactionTypeFlag.department;
    }
    if (id == TransactionTypeFlag.kodeReport.id) {
      return TransactionTypeFlag.kodeReport;
    }
    if (id == TransactionTypeFlag.adjustmentMaterial.id) {
      return TransactionTypeFlag.adjustmentMaterial;
    }
    if (id == TransactionTypeFlag.outMaterial.id) {
      return TransactionTypeFlag.outMaterial;
    }
    if (id == TransactionTypeFlag.returDistributor.id) {
      return TransactionTypeFlag.returDistributor;
    }
    if (id == TransactionTypeFlag.modul.id) {
      return TransactionTypeFlag.modul;
    }
    return TransactionTypeFlag.empty;
  }
}

enum TypeTransaction implements ColorType {
  empty('', '', Colors.transparent),
  pemesanan('PEMESANAN', 'Pemesanan', Colors.blue),
  penjualan('PENJUALAN', 'Penjualan', Colors.grey),
  transaksi('TRANSAKSI', 'Transaksi', Colors.green),
  materialIssue('MATERIAL ISSUE', 'Material Issue', Colors.indigo),
  kodeHuruf('KODE HURUF', 'Kode Huruf', Colors.blueGrey),
  penerimaan('PENERIMAAN', 'Penerimaan', Colors.orange),
  retur('RETUR', 'Retur', Colors.cyan);

  const TypeTransaction(this.label, this.id, this.color);

  final String id;

  @override
  final String label;

  @override
  final Color color;

  static TypeTransaction fromString(String? id) {
    if (id == TypeTransaction.pemesanan.id) {
      return TypeTransaction.pemesanan;
    }
    if (id == TypeTransaction.penjualan.id) {
      return TypeTransaction.penjualan;
    }
    if (id == TypeTransaction.transaksi.id) {
      return TypeTransaction.transaksi;
    }
    if (id == TypeTransaction.materialIssue.id) {
      return TypeTransaction.materialIssue;
    }
    if (id == TypeTransaction.kodeHuruf.id) {
      return TypeTransaction.kodeHuruf;
    }
    if (id == TypeTransaction.penerimaan.id) {
      return TypeTransaction.penerimaan;
    }
    if (id == TypeTransaction.retur.id) {
      return TypeTransaction.retur;
    }
    return TypeTransaction.empty;
  }

  static List<TypeTransaction> get list => [
        TypeTransaction.pemesanan,
        TypeTransaction.penjualan,
        TypeTransaction.transaksi,
        TypeTransaction.materialIssue,
        TypeTransaction.kodeHuruf,
        TypeTransaction.penerimaan,
        TypeTransaction.retur,
      ];
}

@freezed
class TransactionType with _$TransactionType {
  const factory TransactionType({
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    required String id,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'code') required String code,
    @JsonKey(name: 'value') required String? value,
    @JsonKey(name: 'flag', fromJson: TransactionTypeFlag.fromString)
    required TransactionTypeFlag flag,
    @JsonKey(name: 'type', fromJson: TypeTransaction.fromString)
    required TypeTransaction type,
  }) = _TransactionType;
  const TransactionType._();

  factory TransactionType.fromJson(Map<String, dynamic> json) =>
      _$TransactionTypeFromJson(json);

  factory TransactionType.empty() => TransactionType(
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        id: '',
        name: '',
        code: '',
        value: '',
        flag: TransactionTypeFlag.empty,
        type: TypeTransaction.empty,
      );
}
