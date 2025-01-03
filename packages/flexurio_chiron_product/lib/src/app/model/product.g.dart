// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      id: json['id'] as String,
      company: json['company'] as String? ?? '',
      productType: _productTypeFromString(json['type'] as String),
      createAt: isoDateToDateTime(json['created_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      nieExpiredDate: isoDateToDateTime(json['nie_expired_date'] as String?),
      updateById: (json['updated_by_id'] as num).toInt(),
      name: json['name'] as String,
      productNo: json['product_no'] as String,
      quantityPack: (json['quantity_pack'] as num).toInt(),
      quantityBatch: (json['quantity_batch'] as num).toInt(),
      quantityStrip: (json['quantity_strip'] as num).toInt(),
      quantityTablet: (json['quantity_tablet'] as num).toInt(),
      division: _divisionTypeFromString(json['division'] as String),
      expiryPeriod: (json['expiry_period'] as num).toInt(),
      unitPacking:
          MaterialUnit.fromJson(json['unit_packing'] as Map<String, Object?>),
      unitOrder:
          MaterialUnit.fromJson(json['unit_order'] as Map<String, Object?>),
      productGroup:
          ProductGroup.fromJson(json['product_group'] as Map<String, dynamic>),
      unitSmallest:
          MaterialUnit.fromJson(json['unit_smallest'] as Map<String, Object?>),
      unitSecondary:
          MaterialUnit.fromJson(json['unit_secondary'] as Map<String, Object?>),
      isActive: json['is_active'] as bool,
      isPhasedOut: json['is_phased_out'] as bool? ?? false,
      tollOut: json['is_toll_out'] as bool? ?? false,
      nie: json['nie'] as String?,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company': instance.company,
      'type': _$ProductTypeEnumMap[instance.productType]!,
      'created_at': instance.createAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'nie_expired_date': instance.nieExpiredDate.toIso8601String(),
      'updated_by_id': instance.updateById,
      'name': instance.name,
      'product_no': instance.productNo,
      'quantity_pack': instance.quantityPack,
      'quantity_batch': instance.quantityBatch,
      'quantity_strip': instance.quantityStrip,
      'quantity_tablet': instance.quantityTablet,
      'division': _$DivisionTypeEnumMap[instance.division]!,
      'expiry_period': instance.expiryPeriod,
      'unit_packing': instance.unitPacking,
      'unit_order': instance.unitOrder,
      'product_group': instance.productGroup,
      'unit_smallest': instance.unitSmallest,
      'unit_secondary': instance.unitSecondary,
      'is_active': instance.isActive,
      'is_phased_out': instance.isPhasedOut,
      'is_toll_out': instance.tollOut,
      'nie': instance.nie,
    };

const _$ProductTypeEnumMap = {
  ProductType.empty: 'empty',
  ProductType.antibiotic: 'antibiotic',
  ProductType.botol: 'botol',
  ProductType.box: 'box',
  ProductType.coating: 'coating',
  ProductType.drySyrup: 'drySyrup',
  ProductType.gel: 'gel',
  ProductType.injeksi: 'injeksi',
  ProductType.kaplet: 'kaplet',
  ProductType.kapsul: 'kapsul',
  ProductType.krim: 'krim',
  ProductType.larutan: 'larutan',
  ProductType.liquid: 'liquid',
  ProductType.pcs: 'pcs',
  ProductType.powder: 'powder',
  ProductType.syrup: 'syrup',
  ProductType.solid: 'solid',
  ProductType.solution: 'solution',
  ProductType.tablet: 'tablet',
  ProductType.tehCelup: 'tehCelup',
};

const _$DivisionTypeEnumMap = {
  DivisionType.ethical: 'ethical',
  DivisionType.otc: 'otc',
  DivisionType.alkes: 'alkes',
  DivisionType.dvd: 'dvd',
  DivisionType.distributor: 'distributor',
  DivisionType.empty: 'empty',
};
