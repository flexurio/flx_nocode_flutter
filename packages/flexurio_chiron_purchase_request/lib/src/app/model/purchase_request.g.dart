// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialRequestImpl _$$MaterialRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialRequestImpl(
      id: json['id'] as String,
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      updateById: (json['updated_by_id'] as num).toInt(),
      dateOfNeed: isoDateToDateTime(json['date_of_need'] as String?),
      deliveryDate: isoDateToDateTime(json['delivery_date'] as String?),
      description: json['description'] as String,
      materialGroup: MaterialGroup.fromJson(
          json['material_group'] as Map<String, Object?>),
      vendor: Vendor.fromJsonNullable(json['vendor']),
      department:
          Department.fromJson(json['department'] as Map<String, dynamic>),
      departmentBudgeting: json['department_budgeting'] == null
          ? Department.empty()
          : Department.fromJson(
              json['department_budgeting'] as Map<String, dynamic>),
      status: _materialRequestStatusFromString(json['status'] as String),
      isPrintById: (json['is_printed_by_id'] as num?)?.toInt(),
      isPrintAt: isoDateToDateTime(json['is_printed_at'] as String?),
    );

Map<String, dynamic> _$$MaterialRequestImplToJson(
        _$MaterialRequestImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updateById,
      'date_of_need': instance.dateOfNeed.toIso8601String(),
      'delivery_date': instance.deliveryDate.toIso8601String(),
      'description': instance.description,
      'material_group': instance.materialGroup,
      'vendor': instance.vendor,
      'department': instance.department,
      'department_budgeting': instance.departmentBudgeting,
      'status': _$PurchaseRequestStatusEnumMap[instance.status]!,
      'is_printed_by_id': instance.isPrintById,
      'is_printed_at': instance.isPrintAt?.toIso8601String(),
    };

const _$PurchaseRequestStatusEnumMap = {
  PurchaseRequestStatus.empty: 'empty',
  PurchaseRequestStatus.input: 'input',
  PurchaseRequestStatus.inProgress: 'inProgress',
  PurchaseRequestStatus.rejectProcurement: 'rejectProcurement',
  PurchaseRequestStatus.rejectManager: 'rejectManager',
  PurchaseRequestStatus.confirm: 'confirm',
  PurchaseRequestStatus.close: 'close',
};
