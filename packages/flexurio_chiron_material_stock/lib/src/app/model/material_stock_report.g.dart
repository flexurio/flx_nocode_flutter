// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_stock_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialStockReportImpl _$$MaterialStockReportImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialStockReportImpl(
      materialId: json['material_id'] as String,
      materialName: json['material_name'] as String,
      materialUnitId: json['material_unit_id'] as String,
      quantity: (json['qty'] as num).toInt(),
      na: json['na'] as String,
      expiredDate: isoDateToDateTime(json['expired_date'] as String?),
    );

Map<String, dynamic> _$$MaterialStockReportImplToJson(
        _$MaterialStockReportImpl instance) =>
    <String, dynamic>{
      'material_id': instance.materialId,
      'material_name': instance.materialName,
      'material_unit_id': instance.materialUnitId,
      'qty': instance.quantity,
      'na': instance.na,
      'expired_date': instance.expiredDate.toIso8601String(),
    };
