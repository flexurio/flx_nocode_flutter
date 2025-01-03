// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_return.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialReturnImpl _$$MaterialReturnImplFromJson(Map<String, dynamic> json) =>
    _$MaterialReturnImpl(
      id: json['id'] as String,
      isPrint: json['is_print'] as bool,
      remark: json['remarks'] as String,
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updateAt: isoDateToDateTime(json['updated_at'] as String?),
      updatedById: (json['updated_by_id'] as num).toInt(),
      transactionType: TransactionType.fromJson(
          json['return_type_id'] as Map<String, dynamic>),
      product: Product.fromJson(json['product_id'] as Map<String, dynamic>),
      materialGroup: MaterialGroup.fromJson(
          json['material_group_id'] as Map<String, Object?>),
      department:
          Department.fromJson(json['department_id'] as Map<String, dynamic>),
      productionOrder:
          ProductionOrder.fromJson(json['batch_no_id'] as Map<String, dynamic>),
      transactionDate: isoDateToDateTime(json['transaction_date'] as String?),
    );

Map<String, dynamic> _$$MaterialReturnImplToJson(
        _$MaterialReturnImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'is_print': instance.isPrint,
      'remarks': instance.remark,
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updateAt.toIso8601String(),
      'updated_by_id': instance.updatedById,
      'return_type_id': instance.transactionType,
      'product_id': instance.product,
      'material_group_id': instance.materialGroup,
      'department_id': instance.department,
      'batch_no_id': instance.productionOrder,
      'transaction_date': instance.transactionDate.toIso8601String(),
    };
