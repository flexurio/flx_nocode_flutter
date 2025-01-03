// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionTypeImpl _$$TransactionTypeImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionTypeImpl(
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      id: json['id'] as String,
      name: json['name'] as String,
      code: json['code'] as String,
      value: json['value'] as String?,
      flag: TransactionTypeFlag.fromString(json['flag'] as String),
      type: TypeTransaction.fromString(json['type'] as String?),
    );

Map<String, dynamic> _$$TransactionTypeImplToJson(
        _$TransactionTypeImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'value': instance.value,
      'flag': _$TransactionTypeFlagEnumMap[instance.flag]!,
      'type': _$TypeTransactionEnumMap[instance.type]!,
    };

const _$TransactionTypeFlagEnumMap = {
  TransactionTypeFlag.empty: 'empty',
  TransactionTypeFlag.fpjk: 'fpjk',
  TransactionTypeFlag.perkiraanRetur: 'perkiraanRetur',
  TransactionTypeFlag.perkiraanDiskon: 'perkiraanDiskon',
  TransactionTypeFlag.perkiraanJual: 'perkiraanJual',
  TransactionTypeFlag.department: 'department',
  TransactionTypeFlag.perkiraanPiutang: 'perkiraanPiutang',
  TransactionTypeFlag.kodeReport: 'kodeReport',
  TransactionTypeFlag.discount: 'discount',
  TransactionTypeFlag.taxInvoice: 'taxInvoice',
  TransactionTypeFlag.reportCode: 'reportCode',
  TransactionTypeFlag.status: 'status',
  TransactionTypeFlag.modul: 'modul',
  TransactionTypeFlag.outMaterial: 'outMaterial',
  TransactionTypeFlag.adjustmentMaterial: 'adjustmentMaterial',
  TransactionTypeFlag.returDistributor: 'returDistributor',
  TransactionTypeFlag.chartOfAccountReturn: 'chartOfAccountReturn',
  TransactionTypeFlag.chartOfAccountDiscount: 'chartOfAccountDiscount',
  TransactionTypeFlag.chartOfAccountReceivable: 'chartOfAccountReceivable',
  TransactionTypeFlag.chartOfAccountSales: 'chartOfAccountSales',
};

const _$TypeTransactionEnumMap = {
  TypeTransaction.empty: 'empty',
  TypeTransaction.pemesanan: 'pemesanan',
  TypeTransaction.penjualan: 'penjualan',
  TypeTransaction.transaksi: 'transaksi',
  TypeTransaction.materialIssue: 'materialIssue',
  TypeTransaction.kodeHuruf: 'kodeHuruf',
  TypeTransaction.penerimaan: 'penerimaan',
  TypeTransaction.retur: 'retur',
};
