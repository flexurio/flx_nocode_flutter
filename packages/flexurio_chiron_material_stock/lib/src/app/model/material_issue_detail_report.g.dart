// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_issue_detail_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialIssuesDetailReportImpl _$$MaterialIssuesDetailReportImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialIssuesDetailReportImpl(
      id: (json['id'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      updatedById: (json['updated_by_id'] as num).toInt(),
      materialIssue: MaterialIssue.fromJson(
          json['material_issue'] as Map<String, dynamic>),
      material: Material.fromJson(json['material'] as Map<String, Object?>),
      materialUnit:
          MaterialUnit.fromJson(json['material_unit'] as Map<String, Object?>),
      na: json['na'] as String,
      quantityRequired: (json['quantity_required'] as num).toDouble(),
      quantity: (json['quantity'] as num).toDouble(),
      weightedQuantity: (json['weighted_quantity'] as num).toDouble(),
      weightedUnit: json['weighted_unit'] as String,
      price: (json['price'] as num).toInt(),
      totalPrice: (json['total_price'] as num).toDouble(),
      warehouse: json['warehouse'] as String,
      designCode: json['design_code'] as String?,
      expiredDate: dateTimeNullable(json['expired_date'] as String?),
      bestBefore: dateTimeNullable(json['best_before'] as String?),
      shelfLife: dateTimeNullable(json['shelf_life'] as String?),
      retestDate: dateTimeNullable(json['retest_date'] as String?),
      retestDateQc: dateTimeNullable(json['retest_date_qc'] as String?),
      manufacturingDate:
          isoDateToDateTime(json['manufacturing_date'] as String?),
    );

Map<String, dynamic> _$$MaterialIssuesDetailReportImplToJson(
        _$MaterialIssuesDetailReportImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updatedById,
      'material_issue': instance.materialIssue,
      'material': instance.material,
      'material_unit': instance.materialUnit,
      'na': instance.na,
      'quantity_required': instance.quantityRequired,
      'quantity': instance.quantity,
      'weighted_quantity': instance.weightedQuantity,
      'weighted_unit': instance.weightedUnit,
      'price': instance.price,
      'total_price': instance.totalPrice,
      'warehouse': instance.warehouse,
      'design_code': instance.designCode,
      'expired_date': instance.expiredDate?.toIso8601String(),
      'best_before': instance.bestBefore?.toIso8601String(),
      'shelf_life': instance.shelfLife?.toIso8601String(),
      'retest_date': instance.retestDate?.toIso8601String(),
      'retest_date_qc': instance.retestDateQc?.toIso8601String(),
      'manufacturing_date': instance.manufacturingDate.toIso8601String(),
    };
