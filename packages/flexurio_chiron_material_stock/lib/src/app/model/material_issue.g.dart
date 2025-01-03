// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_issue.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialIssueImpl _$$MaterialIssueImplFromJson(Map<String, dynamic> json) =>
    _$MaterialIssueImpl(
      id: json['id'] as String,
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      miType: TransactionType.fromJson(json['mi_type'] as Map<String, dynamic>),
      department:
          Department.fromJson(json['department'] as Map<String, dynamic>),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      batch: ProductionOrder.fromJson(json['batch'] as Map<String, dynamic>),
      productionExpiredDate:
          isoDateToDateTime(json['product_expired_date'] as String?),
      materialGroup: MaterialGroup.fromJson(
          json['material_group'] as Map<String, Object?>),
      miDate: isoDateToDateTime(json['mi_date'] as String?),
      remarks: json['remarks'] as String,
    );

Map<String, dynamic> _$$MaterialIssueImplToJson(_$MaterialIssueImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'mi_type': instance.miType,
      'department': instance.department,
      'product': instance.product,
      'batch': instance.batch,
      'product_expired_date': instance.productionExpiredDate?.toIso8601String(),
      'material_group': instance.materialGroup,
      'mi_date': instance.miDate.toIso8601String(),
      'remarks': instance.remarks,
    };
