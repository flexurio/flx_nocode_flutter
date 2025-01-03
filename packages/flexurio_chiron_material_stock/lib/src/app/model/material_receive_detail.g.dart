// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_receive_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialReceiveDetailImpl _$$MaterialReceiveDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialReceiveDetailImpl(
      id: (json['id'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      na: json['na'] as String,
      materialReceive: json['material_receive'] == null
          ? MaterialReceive.empty()
          : MaterialReceive.fromJson(
              json['material_receive'] as Map<String, dynamic>),
      materialDesign: json['design_code'] == null
          ? MaterialDesign.empty()
          : MaterialDesign.fromJson(
              json['design_code'] as Map<String, dynamic>),
      material: json['material'] == null
          ? Material.empty()
          : Material.fromJson(json['material'] as Map<String, Object?>),
      materialUnit: json['material_unit'] == null
          ? MaterialUnit.empty()
          : MaterialUnit.fromJson(
              json['material_unit'] as Map<String, Object?>),
      transactionDate: isoDateToDateTime(json['transaction_date'] as String?),
      batchNo: json['batch_no'] as String,
      barcodeNo: json['barcode_no'] as String,
      vatNo: (json['vat_no'] as num).toInt(),
      vatTotal: (json['vat_total'] as num).toInt(),
      quantity: (json['quantity'] as num).toDouble(),
      totalQuantity: (json['total_quantity'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      materialStatus: MaterialReceiveDetailStatus.fromString(
          json['material_status_qc'] as String),
      releaseDate: isoDateToDateTime(json['release_date'] as String?),
      expiredDate: dateTimeNullable(json['expired_date'] as String?),
      bestBefore: dateTimeNullable(json['best_before'] as String?),
      manufacturingDate:
          dateTimeNullable(json['manufacturing_date'] as String?),
      retestDate: dateTimeNullable(json['retest_date'] as String?),
      retestDateQualityControl:
          dateTimeNullable(json['retest_date_qc'] as String?),
      shelfLife: dateTimeNullable(json['shelf_life'] as String?),
    );

Map<String, dynamic> _$$MaterialReceiveDetailImplToJson(
        _$MaterialReceiveDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'na': instance.na,
      'material_receive': instance.materialReceive,
      'design_code': instance.materialDesign,
      'material': instance.material,
      'material_unit': instance.materialUnit,
      'transaction_date': instance.transactionDate.toIso8601String(),
      'batch_no': instance.batchNo,
      'barcode_no': instance.barcodeNo,
      'vat_no': instance.vatNo,
      'vat_total': instance.vatTotal,
      'quantity': instance.quantity,
      'total_quantity': instance.totalQuantity,
      'price': instance.price,
      'material_status_qc':
          _$MaterialReceiveDetailStatusEnumMap[instance.materialStatus]!,
      'release_date': instance.releaseDate?.toIso8601String(),
      'expired_date': instance.expiredDate?.toIso8601String(),
      'best_before': instance.bestBefore?.toIso8601String(),
      'manufacturing_date': instance.manufacturingDate?.toIso8601String(),
      'retest_date': instance.retestDate?.toIso8601String(),
      'retest_date_qc': instance.retestDateQualityControl?.toIso8601String(),
      'shelf_life': instance.shelfLife?.toIso8601String(),
    };

const _$MaterialReceiveDetailStatusEnumMap = {
  MaterialReceiveDetailStatus.empty: 'empty',
  MaterialReceiveDetailStatus.release: 'release',
  MaterialReceiveDetailStatus.quarantine: 'quarantine',
  MaterialReceiveDetailStatus.reject: 'reject',
};
