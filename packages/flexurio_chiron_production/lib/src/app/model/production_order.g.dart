// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductionOrderImpl _$$ProductionOrderImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductionOrderImpl(
      Product.fromJson(json['product'] as Map<String, dynamic>),
      isoDateToDateTime(json['created_at'] as String?),
      (json['created_by_id'] as num).toInt(),
      isoDateToDateTime(json['updated_at'] as String?),
      (json['updated_by_id'] as num).toInt(),
      json['is_process'] as bool? ?? true,
      (json['batch_size'] as num?)?.toInt() ?? 0,
      json['is_cancel'] as bool? ?? false,
      json['is_confirm'] as bool? ?? false,
      json['description'] as String? ?? '',
      json['is_rework'] as bool? ?? true,
      json['is_toll_in'] as bool? ?? false,
      json['is_bulk'] as bool? ?? true,
      json['product_status'] == null
          ? ProductionProductStatus.empty
          : ProductionProductStatus.fromString(
              json['product_status'] as String),
      json['scale'] == null
          ? ProductionProductScale.empty
          : ProductionProductScale.fromString(json['scale'] as String),
      isoDateToDateTime(json['expiration_date'] as String?),
      json['id'] as String,
      dateTimeNullableFromJson(json['cancel_rework_at'] as String?),
      json['nie'] as String?,
    );

Map<String, dynamic> _$$ProductionOrderImplToJson(
        _$ProductionOrderImpl instance) =>
    <String, dynamic>{
      'product': instance.product,
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updatedById,
      'is_process': instance.isProcess,
      'batch_size': instance.batchSize,
      'is_cancel': instance.isCancel,
      'is_confirm': instance.isConfirm,
      'description': instance.description,
      'is_rework': instance.isRework,
      'is_toll_in': instance.isTollIn,
      'is_bulk': instance.isRuahan,
      'product_status':
          _$ProductionProductStatusEnumMap[instance.productStatus]!,
      'scale': _$ProductionProductScaleEnumMap[instance.scale]!,
      'expiration_date': instance.expirationDate.toIso8601String(),
      'id': instance.id,
      'cancel_rework_at': instance.cancelReworkAt?.toIso8601String(),
      'nie': instance.nie,
    };

const _$ProductionProductStatusEnumMap = {
  ProductionProductStatus.empty: 'empty',
  ProductionProductStatus.processValidation: 'processValidation',
  ProductionProductStatus.regular: 'regular',
  ProductionProductStatus.pilotScale: 'pilotScale',
  ProductionProductStatus.pilotValidationProcessScale:
      'pilotValidationProcessScale',
  ProductionProductStatus.observation: 'observation',
};

const _$ProductionProductScaleEnumMap = {
  ProductionProductScale.empty: 'empty',
  ProductionProductScale.production: 'production',
  ProductionProductScale.tollOut: 'tollOut',
  ProductionProductScale.pilot: 'pilot',
  ProductionProductScale.reguler: 'reguler',
  ProductionProductScale.pilotTollOut: 'pilotTollOut',
};
