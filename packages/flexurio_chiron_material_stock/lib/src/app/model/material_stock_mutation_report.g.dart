// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_stock_mutation_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialStockMutationReportImpl _$$MaterialStockMutationReportImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialStockMutationReportImpl(
      material: json['material'] as String,
      materialUnit: json['material_unit'] as String,
      quantity: (json['quantity_begin'] as num).toInt(),
      quantityIn: (json['quantity_in'] as num).toInt(),
      quantityOut: (json['quantity_out'] as num).toInt(),
      quantityEnd: (json['quantity_end'] as num).toInt(),
    );

Map<String, dynamic> _$$MaterialStockMutationReportImplToJson(
        _$MaterialStockMutationReportImpl instance) =>
    <String, dynamic>{
      'material': instance.material,
      'material_unit': instance.materialUnit,
      'quantity_begin': instance.quantity,
      'quantity_in': instance.quantityIn,
      'quantity_out': instance.quantityOut,
      'quantity_end': instance.quantityEnd,
    };
