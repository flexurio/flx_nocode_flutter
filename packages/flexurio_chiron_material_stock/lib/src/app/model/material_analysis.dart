import 'package:flexurio_chiron_material_stock/src/app/model/material_receive.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_analysis.freezed.dart';
part 'material_analysis.g.dart';

@freezed
class MaterialAnalysis with _$MaterialAnalysis {
  factory MaterialAnalysis({
    required int id,
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'material_receive_id') required String materialReceiveId,
    @JsonKey(name: 'supplier_id') required String supplierId,
    @JsonKey(name: 'material_group_id') required String materialGroupId,
    @JsonKey(name: 'material_id') required String materialId,
    @JsonKey(name: 'material_unit_id') required String materialUnitId,
    @JsonKey(name: 'vat_no') required int vatNo,
    @JsonKey(name: 'vat_total') required int vatTotal,
    @JsonKey(name: 'batch_no') required String batchNo,
    required int qty,
    @JsonKey(name: 'qty_sample') required double qtySample,
    @JsonKey(name: 'sampling_date', fromJson: isoDateToDateTime)
    required DateTime samplingDate,
    @JsonKey(name: 'sampling_by') required int samplingBy,
    @JsonKey(name: 'qty_retain_sample') required double qtyRetainSample,
    @JsonKey(name: 'retain_sampling_date', fromJson: isoDateToDateTime)
    required DateTime retainSamplingDate,
    @JsonKey(name: 'retain_sampling_by') required int retainSamplingBy,
    @JsonKey(name: 'qty_pack_opened') required int qtyPackOpened,
    @JsonKey(name: 'qty_pack_total') required int qtyPackTotal,
    required String na,
    @JsonKey(name: 'barcode_no') required String barcodeNo,
    @JsonKey(name: 'assay', defaultValue: 0) double? assay,
    @JsonKey(name: 'warehouse', fromJson: WarehouseMaterialReceive.fromString)
    required WarehouseMaterialReceive warehouse,
    @JsonKey(name: 'is_active') required bool isActive,
    @JsonKey(name: 'microbiology_release_date', fromJson: dateTimeNullable)
    DateTime? microbiologyReleaseDate,
    @JsonKey(name: 'microbiology_release_by', defaultValue: 0) int? microbiologyReleaseBy,
    @JsonKey(name: 'coa_availability') required bool coaAvailability,
    @JsonKey(name: 'material_receipt_date', fromJson: isoDateToDateTime)
    required DateTime materialReceiptDate,
    required double density,
  }) = _MaterialAnalysis;
  const MaterialAnalysis._();

  factory MaterialAnalysis.empty() {
    return MaterialAnalysis(
      id: 0,
      na: '',
      materialReceiveId: '',
      supplierId: '',
      materialGroupId: '',
      materialId: '',
      materialUnitId: '',
      qtySample: 0,
      samplingDate: DateTime(0),
      samplingBy: 0,
      qtyRetainSample: 0,
      retainSamplingDate: DateTime(0),
      retainSamplingBy: 0,
      qtyPackOpened: 0,
      qtyPackTotal: 0,
      qty: 0,
      warehouse: WarehouseMaterialReceive.empty,
      isActive: false,
      microbiologyReleaseDate: DateTime(0),
      microbiologyReleaseBy: 0,
      coaAvailability: false,
      materialReceiptDate: DateTime(0),
      density: 0,
      batchNo: '',
      barcodeNo: '',
      vatNo: 0,
      vatTotal: 0,
      createdAt: DateTime(0),
      updatedAt: DateTime(0),
    );
  }

  factory MaterialAnalysis.fromJson(Map<String, dynamic> json) =>
      _$MaterialAnalysisFromJson(json);
}
