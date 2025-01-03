// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'medical_treatment_expense_department.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MedicalTreatmentExpenseDepartmentImpl
    _$$MedicalTreatmentExpenseDepartmentImplFromJson(
            Map<String, dynamic> json) =>
        _$MedicalTreatmentExpenseDepartmentImpl(
          department: json['department'] as String,
          productId: json['product_id'] as String,
          productName: json['product_name'] as String,
          deliveryOrderId: json['delivery_order_id'] as String,
          deliveryOrderDate:
              isoDateToDateTime(json['delivery_order_date'] as String?),
          expiredDate: isoDateToDateTime(json['ex_date'] as String?),
          batchNo: json['batch_no'] as String,
          unitId: json['unit_id'] as String,
          quantity: (json['qty'] as num).toInt(),
          productPrice: (json['product_price'] as num).toDouble(),
          amount: (json['amount'] as num).toDouble(),
        );

Map<String, dynamic> _$$MedicalTreatmentExpenseDepartmentImplToJson(
        _$MedicalTreatmentExpenseDepartmentImpl instance) =>
    <String, dynamic>{
      'department': instance.department,
      'product_id': instance.productId,
      'product_name': instance.productName,
      'delivery_order_id': instance.deliveryOrderId,
      'delivery_order_date': instance.deliveryOrderDate.toIso8601String(),
      'ex_date': instance.expiredDate.toIso8601String(),
      'batch_no': instance.batchNo,
      'unit_id': instance.unitId,
      'qty': instance.quantity,
      'product_price': instance.productPrice,
      'amount': instance.amount,
    };
