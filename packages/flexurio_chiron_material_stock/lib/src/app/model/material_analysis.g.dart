// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'material_analysis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MaterialAnalysisImpl _$$MaterialAnalysisImplFromJson(
        Map<String, dynamic> json) =>
    _$MaterialAnalysisImpl(
      id: (json['id'] as num).toInt(),
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      materialReceiveId: json['material_receive_id'] as String,
      supplierId: json['supplier_id'] as String,
      materialGroupId: json['material_group_id'] as String,
      materialId: json['material_id'] as String,
      materialUnitId: json['material_unit_id'] as String,
      vatNo: (json['vat_no'] as num).toInt(),
      vatTotal: (json['vat_total'] as num).toInt(),
      batchNo: json['batch_no'] as String,
      qty: (json['qty'] as num).toInt(),
      qtySample: (json['qty_sample'] as num).toDouble(),
      samplingDate: isoDateToDateTime(json['sampling_date'] as String?),
      samplingBy: (json['sampling_by'] as num).toInt(),
      qtyRetainSample: (json['qty_retain_sample'] as num).toDouble(),
      retainSamplingDate:
          isoDateToDateTime(json['retain_sampling_date'] as String?),
      retainSamplingBy: (json['retain_sampling_by'] as num).toInt(),
      qtyPackOpened: (json['qty_pack_opened'] as num).toInt(),
      qtyPackTotal: (json['qty_pack_total'] as num).toInt(),
      na: json['na'] as String,
      barcodeNo: json['barcode_no'] as String,
      assay: (json['assay'] as num?)?.toDouble() ?? 0,
      warehouse:
          WarehouseMaterialReceive.fromString(json['warehouse'] as String),
      isActive: json['is_active'] as bool,
      microbiologyReleaseDate:
          dateTimeNullable(json['microbiology_release_date'] as String?),
      microbiologyReleaseBy:
          (json['microbiology_release_by'] as num?)?.toInt() ?? 0,
      coaAvailability: json['coa_availability'] as bool,
      materialReceiptDate:
          isoDateToDateTime(json['material_receipt_date'] as String?),
      density: (json['density'] as num).toDouble(),
    );

Map<String, dynamic> _$$MaterialAnalysisImplToJson(
        _$MaterialAnalysisImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'material_receive_id': instance.materialReceiveId,
      'supplier_id': instance.supplierId,
      'material_group_id': instance.materialGroupId,
      'material_id': instance.materialId,
      'material_unit_id': instance.materialUnitId,
      'vat_no': instance.vatNo,
      'vat_total': instance.vatTotal,
      'batch_no': instance.batchNo,
      'qty': instance.qty,
      'qty_sample': instance.qtySample,
      'sampling_date': instance.samplingDate.toIso8601String(),
      'sampling_by': instance.samplingBy,
      'qty_retain_sample': instance.qtyRetainSample,
      'retain_sampling_date': instance.retainSamplingDate.toIso8601String(),
      'retain_sampling_by': instance.retainSamplingBy,
      'qty_pack_opened': instance.qtyPackOpened,
      'qty_pack_total': instance.qtyPackTotal,
      'na': instance.na,
      'barcode_no': instance.barcodeNo,
      'assay': instance.assay,
      'warehouse': _$WarehouseMaterialReceiveEnumMap[instance.warehouse]!,
      'is_active': instance.isActive,
      'microbiology_release_date':
          instance.microbiologyReleaseDate?.toIso8601String(),
      'microbiology_release_by': instance.microbiologyReleaseBy,
      'coa_availability': instance.coaAvailability,
      'material_receipt_date': instance.materialReceiptDate.toIso8601String(),
      'density': instance.density,
    };

const _$WarehouseMaterialReceiveEnumMap = {
  WarehouseMaterialReceive.empty: 'empty',
  WarehouseMaterialReceive.ppic: 'ppic',
  WarehouseMaterialReceive.alkes: 'alkes',
  WarehouseMaterialReceive.engineering: 'engineering',
  WarehouseMaterialReceive.cs: 'cs',
  WarehouseMaterialReceive.rnd: 'rnd',
};
