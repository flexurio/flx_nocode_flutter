// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'petty_cash.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PettyCashImpl _$$PettyCashImplFromJson(Map<String, dynamic> json) =>
    _$PettyCashImpl(
      id: json['id'] as String,
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      updateById: (json['updated_by_id'] as num).toInt(),
      purchaseOrder: PurchaseOrder.fromJson(
          json['purchase_order'] as Map<String, dynamic>),
      purchaseOrderDownPayment: PurchaseOrderDownPayment.fromJson(
          json['purchase_order_down_payment'] as Map<String, dynamic>),
      amount: (json['amount'] as num).toDouble(),
      status: PettyCashStatus.fromString(json['status'] as String),
      rejectReason: json['reject_reason'] as String,
      recipient: json['recipient'] as String,
      realizationAmount: (json['realization_amount'] as num).toDouble(),
      returnAmount: (json['return_amount'] as num?)?.toDouble(),
      shippingCost: (json['shipping_cost'] as num).toDouble(),
      discountAmount: (json['discount'] as num).toDouble(),
      pphAmount: (json['pph'] as num).toDouble(),
      ppnAmount: (json['ppn'] as num).toDouble(),
      rounding: (json['rounding'] as num).toDouble(),
      approveFinanceAt:
          isoDateToDateTime(json['approve_finance_at'] as String?),
      type: PettyCashType.fromString(json['type'] as String),
      realizationNo: json['realization_no'] as String?,
      documentReceiveBy: (json['document_receive_by'] as num?)?.toInt(),
      documentReceiveAt: json['document_receive_at'] == null
          ? null
          : DateTime.parse(json['document_receive_at'] as String),
      supplier: Supplier.fromJson(json['supplier'] as Map<String, Object?>),
      description: json['description'] as String?,
      department:
          Department.fromJson(json['department'] as Map<String, dynamic>),
      vehicleRent:
          VehicleRent.fromJson(json['business_trip'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PettyCashImplToJson(_$PettyCashImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updateById,
      'purchase_order': instance.purchaseOrder,
      'purchase_order_down_payment': instance.purchaseOrderDownPayment,
      'amount': instance.amount,
      'status': _$PettyCashStatusEnumMap[instance.status]!,
      'reject_reason': instance.rejectReason,
      'recipient': instance.recipient,
      'realization_amount': instance.realizationAmount,
      'return_amount': instance.returnAmount,
      'shipping_cost': instance.shippingCost,
      'discount': instance.discountAmount,
      'pph': instance.pphAmount,
      'ppn': instance.ppnAmount,
      'rounding': instance.rounding,
      'approve_finance_at': instance.approveFinanceAt.toIso8601String(),
      'type': _$PettyCashTypeEnumMap[instance.type]!,
      'realization_no': instance.realizationNo,
      'document_receive_by': instance.documentReceiveBy,
      'document_receive_at': instance.documentReceiveAt?.toIso8601String(),
      'supplier': instance.supplier,
      'description': instance.description,
      'department': instance.department,
      'business_trip': instance.vehicleRent,
    };

const _$PettyCashStatusEnumMap = {
  PettyCashStatus.empty: 'empty',
  PettyCashStatus.input: 'input',
  PettyCashStatus.approveManager: 'approveManager',
  PettyCashStatus.rejectManager: 'rejectManager',
  PettyCashStatus.approveAccounting: 'approveAccounting',
  PettyCashStatus.rejectAccounting: 'rejectAccounting',
  PettyCashStatus.approveFinance: 'approveFinance',
  PettyCashStatus.rejectFinance: 'rejectFinance',
  PettyCashStatus.close: 'close',
};

const _$PettyCashTypeEnumMap = {
  PettyCashType.generalExpense: 'generalExpense',
  PettyCashType.pettyCash: 'pettyCash',
  PettyCashType.vehicleRent: 'vehicleRent',
};
