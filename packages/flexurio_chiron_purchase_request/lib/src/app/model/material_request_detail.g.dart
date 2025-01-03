// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_request_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseRequestDetailImpl _$$PurchaseRequestDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseRequestDetailImpl(
      id: (json['id'] as num).toInt(),
      status: _purchaseRequestDetailStatusFromString(json['status'] as String),
      unit: MaterialUnit.fromJson(json['unit'] as Map<String, dynamic>),
      dueDate: isoDateToDateTime(json['due_date'] as String?),
      materialRequestFormId: json['material_request_form_id'] as String? ?? '',
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      confirmAt: isoDateToDateTime(json['confirm_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      quantity: (json['quantity'] as num?)?.toDouble() ?? 0,
      isFastTrack: json['is_fast_track'] as bool? ?? false,
      batchNo: json['batch_no'] as String?,
      productCreate: json['productCreate'] as String?,
      material: Material.fromJsonNullable(json['material']),
      materialRequest: MaterialRequest.fromJson(
          json['material_request'] as Map<String, Object?>),
      product: Product.fromJsonNullable(json['product']),
      materialDesign: MaterialDesign.fromJsonNullable(json['design_code']),
      rejectAt: dateTimeNullable(json['reject_at'] as String?),
      confirmMaterialRequestFormAt:
          dateTimeNullable(json['confirm_material_request_form_at'] as String?),
      closeRequestFormAt:
          dateTimeNullable(json['close_request_form_at'] as String?),
      rejectById: (json['reject_by_id'] as num?)?.toInt(),
      updatedById: (json['updated_by_id'] as num?)?.toInt(),
      confirmById: (json['confirm_by_id'] as num?)?.toInt(),
      closeRequestFormById: (json['close_request_form_by_id'] as num?)?.toInt(),
      confirmMaterialRequestFormById:
          (json['confirm_material_request_form_by_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PurchaseRequestDetailImplToJson(
        _$PurchaseRequestDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$PurchaseRequestDetailStatusEnumMap[instance.status]!,
      'unit': instance.unit,
      'due_date': instance.dueDate.toIso8601String(),
      'material_request_form_id': instance.materialRequestFormId,
      'created_at': instance.createdAt.toIso8601String(),
      'confirm_at': instance.confirmAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'quantity': instance.quantity,
      'is_fast_track': instance.isFastTrack,
      'batch_no': instance.batchNo,
      'productCreate': instance.productCreate,
      'material': instance.material,
      'material_request': instance.materialRequest,
      'product': instance.product,
      'design_code': instance.materialDesign,
      'reject_at': instance.rejectAt?.toIso8601String(),
      'confirm_material_request_form_at':
          instance.confirmMaterialRequestFormAt?.toIso8601String(),
      'close_request_form_at': instance.closeRequestFormAt?.toIso8601String(),
      'reject_by_id': instance.rejectById,
      'updated_by_id': instance.updatedById,
      'confirm_by_id': instance.confirmById,
      'close_request_form_by_id': instance.closeRequestFormById,
      'confirm_material_request_form_by_id':
          instance.confirmMaterialRequestFormById,
    };

const _$PurchaseRequestDetailStatusEnumMap = {
  PurchaseRequestDetailStatus.empty: 'empty',
  PurchaseRequestDetailStatus.temporary: 'temporary',
  PurchaseRequestDetailStatus.input: 'input',
  PurchaseRequestDetailStatus.confirm: 'confirm',
  PurchaseRequestDetailStatus.po: 'po',
  PurchaseRequestDetailStatus.close: 'close',
  PurchaseRequestDetailStatus.reject: 'reject',
  PurchaseRequestDetailStatus.rejectProcurement: 'rejectProcurement',
};
