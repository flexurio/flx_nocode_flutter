// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_completed_petty_cash.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReportCompletedPettyCashImpl _$$ReportCompletedPettyCashImplFromJson(
        Map<String, dynamic> json) =>
    _$ReportCompletedPettyCashImpl(
      id: json['id'] as String,
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      departmentId: json['department_id'] as String?,
      supplierId: json['supplier_id'] as String?,
      realizationNo: json['realization_no'] as String? ?? '',
      purchaseOrderId: json['purchase_order_id'] as String,
      description: json['description'] as String,
      status: json['status'] as String,
      amount: (json['amount'] as num).toInt(),
      price: (json['price'] as num).toInt(),
      ppn: (json['ppn'] as num).toInt(),
      pph: (json['pph'] as num).toInt(),
    );

Map<String, dynamic> _$$ReportCompletedPettyCashImplToJson(
        _$ReportCompletedPettyCashImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'department_id': instance.departmentId,
      'supplier_id': instance.supplierId,
      'realization_no': instance.realizationNo,
      'purchase_order_id': instance.purchaseOrderId,
      'description': instance.description,
      'status': instance.status,
      'amount': instance.amount,
      'price': instance.price,
      'ppn': instance.ppn,
      'pph': instance.pph,
    };
