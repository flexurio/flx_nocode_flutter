// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance_return_note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FinanceReturnNoteImpl _$$FinanceReturnNoteImplFromJson(
        Map<String, dynamic> json) =>
    _$FinanceReturnNoteImpl(
      json['no_cnj'] as String,
      json['no_srp'] as String,
      json['nota_return'] as String,
      json['no_sj'] as String,
      dateTimeFromJson(json['tgl_no_sj'] as String),
      json['no_faktur_pajak'] as String,
      json['nama_customer'] as String,
      json['no_ref'] as String,
      json['divisi_name'] as String,
      json['product_name'] as String,
      (json['qty'] as num).toInt(),
      json['unit'] as String,
      (json['harsat'] as num).toDouble(),
      (json['harga'] as num).toDouble(),
      (json['persen_disc'] as num).toDouble(),
      (json['dpp'] as num).toDouble(),
      (json['ppn'] as num).toDouble(),
      (json['total'] as num).toDouble(),
      dateTimeFromJson(json['ex_date'] as String),
      json['no_batch'] as String,
    );

Map<String, dynamic> _$$FinanceReturnNoteImplToJson(
        _$FinanceReturnNoteImpl instance) =>
    <String, dynamic>{
      'no_cnj': instance.cnjNo,
      'no_srp': instance.srpNo,
      'nota_return': instance.returnNote,
      'no_sj': instance.deliveryNo,
      'tgl_no_sj': instance.deliveryDate.toIso8601String(),
      'no_faktur_pajak': instance.taxInvoiceNo,
      'nama_customer': instance.customer,
      'no_ref': instance.referenceNo,
      'divisi_name': instance.division,
      'product_name': instance.product,
      'qty': instance.quantity,
      'unit': instance.unit,
      'harsat': instance.unitPrice,
      'harga': instance.price,
      'persen_disc': instance.discountPercent,
      'dpp': instance.dpp,
      'ppn': instance.ppn,
      'total': instance.total,
      'ex_date': instance.expiredDate.toIso8601String(),
      'no_batch': instance.batch,
    };
