// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_retest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialRetestsImpl _$$MaterialRetestsImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialRetestsImpl(
      id: (json['id'] as num).toInt(),
      createdById: (json['created_by_id'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updateById: (json['updated_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      material: Material.fromJson(json['material'] as Map<String, dynamic>),
      materialGroup: MaterialGroup.fromJson(
          json['material_group'] as Map<String, dynamic>),
      retestDate: isoDateToDateTime(json['retest_date'] as String?),
      na: json['na'] as String,
      status: MaterialRetestStatus.fromString(json['status'] as String),
      quantityRetest: (json['quantity_retest'] as num).toInt(),
      expiredDate: isoDateToDateTime(json['expired_date'] as String?),
    );

Map<String, dynamic> _$$MaterialRetestsImplToJson(
        _$MaterialRetestsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_by_id': instance.createdById,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_by_id': instance.updateById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'material': instance.material,
      'material_group': instance.materialGroup,
      'retest_date': instance.retestDate.toIso8601String(),
      'na': instance.na,
      'status': _$MaterialRetestStatusEnumMap[instance.status]!,
      'quantity_retest': instance.quantityRetest,
      'expired_date': instance.expiredDate.toIso8601String(),
    };

const _$MaterialRetestStatusEnumMap = {
  MaterialRetestStatus.empty: 'empty',
  MaterialRetestStatus.release: 'release',
  MaterialRetestStatus.retest: 'retest',
  MaterialRetestStatus.reject: 'reject',
};
