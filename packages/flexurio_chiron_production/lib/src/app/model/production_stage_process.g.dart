// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_stage_process.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductionStageProcessImpl _$$ProductionStageProcessImplFromJson(
        Map<String, dynamic> json) =>
    _$ProductionStageProcessImpl(
      id: (json['id'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      ordinal: (json['ordinal'] as num).toInt(),
      leadTime: (json['lead_time'] as num).toDouble(),
      type: ProductionStageProcessType.fromString(
          json['production_type'] as String),
      product: Product.fromJson(json['product'] as Map<String, dynamic>),
      productionMachine:
          ProductionMachine.fromJson(json['machine'] as Map<String, Object?>),
      productionLine:
          ProductionLine.fromJson(json['line'] as Map<String, Object?>),
      productionSubStage: ProductionSubStage.fromJson(
          json['production_substage'] as Map<String, Object?>),
    );

Map<String, dynamic> _$$ProductionStageProcessImplToJson(
        _$ProductionStageProcessImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'ordinal': instance.ordinal,
      'lead_time': instance.leadTime,
      'production_type': _$ProductionStageProcessTypeEnumMap[instance.type]!,
      'product': instance.product,
      'machine': instance.productionMachine,
      'line': instance.productionLine,
      'production_substage': instance.productionSubStage,
    };

const _$ProductionStageProcessTypeEnumMap = {
  ProductionStageProcessType.empty: 'empty',
  ProductionStageProcessType.regular: 'regular',
  ProductionStageProcessType.ruahan: 'ruahan',
};
