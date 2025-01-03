// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_analysis.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialAnalysis _$MaterialAnalysisFromJson(Map<String, dynamic> json) {
  return _MaterialAnalysis.fromJson(json);
}

/// @nodoc
mixin _$MaterialAnalysis {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_receive_id')
  String get materialReceiveId => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_id')
  String get supplierId => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_group_id')
  String get materialGroupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_id')
  String get materialId => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_unit_id')
  String get materialUnitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'vat_no')
  int get vatNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'vat_total')
  int get vatTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no')
  String get batchNo => throw _privateConstructorUsedError;
  int get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_sample')
  double get qtySample => throw _privateConstructorUsedError;
  @JsonKey(name: 'sampling_date', fromJson: isoDateToDateTime)
  DateTime get samplingDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'sampling_by')
  int get samplingBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_retain_sample')
  double get qtyRetainSample => throw _privateConstructorUsedError;
  @JsonKey(name: 'retain_sampling_date', fromJson: isoDateToDateTime)
  DateTime get retainSamplingDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'retain_sampling_by')
  int get retainSamplingBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_pack_opened')
  int get qtyPackOpened => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_pack_total')
  int get qtyPackTotal => throw _privateConstructorUsedError;
  String get na => throw _privateConstructorUsedError;
  @JsonKey(name: 'barcode_no')
  String get barcodeNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'assay', defaultValue: 0)
  double? get assay => throw _privateConstructorUsedError;
  @JsonKey(name: 'warehouse', fromJson: WarehouseMaterialReceive.fromString)
  WarehouseMaterialReceive get warehouse => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active')
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'microbiology_release_date', fromJson: dateTimeNullable)
  DateTime? get microbiologyReleaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'microbiology_release_by', defaultValue: 0)
  int? get microbiologyReleaseBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'coa_availability')
  bool get coaAvailability => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_receipt_date', fromJson: isoDateToDateTime)
  DateTime get materialReceiptDate => throw _privateConstructorUsedError;
  double get density => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialAnalysisCopyWith<MaterialAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialAnalysisCopyWith<$Res> {
  factory $MaterialAnalysisCopyWith(
          MaterialAnalysis value, $Res Function(MaterialAnalysis) then) =
      _$MaterialAnalysisCopyWithImpl<$Res, MaterialAnalysis>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'material_receive_id') String materialReceiveId,
      @JsonKey(name: 'supplier_id') String supplierId,
      @JsonKey(name: 'material_group_id') String materialGroupId,
      @JsonKey(name: 'material_id') String materialId,
      @JsonKey(name: 'material_unit_id') String materialUnitId,
      @JsonKey(name: 'vat_no') int vatNo,
      @JsonKey(name: 'vat_total') int vatTotal,
      @JsonKey(name: 'batch_no') String batchNo,
      int qty,
      @JsonKey(name: 'qty_sample') double qtySample,
      @JsonKey(name: 'sampling_date', fromJson: isoDateToDateTime)
      DateTime samplingDate,
      @JsonKey(name: 'sampling_by') int samplingBy,
      @JsonKey(name: 'qty_retain_sample') double qtyRetainSample,
      @JsonKey(name: 'retain_sampling_date', fromJson: isoDateToDateTime)
      DateTime retainSamplingDate,
      @JsonKey(name: 'retain_sampling_by') int retainSamplingBy,
      @JsonKey(name: 'qty_pack_opened') int qtyPackOpened,
      @JsonKey(name: 'qty_pack_total') int qtyPackTotal,
      String na,
      @JsonKey(name: 'barcode_no') String barcodeNo,
      @JsonKey(name: 'assay', defaultValue: 0) double? assay,
      @JsonKey(name: 'warehouse', fromJson: WarehouseMaterialReceive.fromString)
      WarehouseMaterialReceive warehouse,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'microbiology_release_date', fromJson: dateTimeNullable)
      DateTime? microbiologyReleaseDate,
      @JsonKey(name: 'microbiology_release_by', defaultValue: 0)
      int? microbiologyReleaseBy,
      @JsonKey(name: 'coa_availability') bool coaAvailability,
      @JsonKey(name: 'material_receipt_date', fromJson: isoDateToDateTime)
      DateTime materialReceiptDate,
      double density});
}

/// @nodoc
class _$MaterialAnalysisCopyWithImpl<$Res, $Val extends MaterialAnalysis>
    implements $MaterialAnalysisCopyWith<$Res> {
  _$MaterialAnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? materialReceiveId = null,
    Object? supplierId = null,
    Object? materialGroupId = null,
    Object? materialId = null,
    Object? materialUnitId = null,
    Object? vatNo = null,
    Object? vatTotal = null,
    Object? batchNo = null,
    Object? qty = null,
    Object? qtySample = null,
    Object? samplingDate = null,
    Object? samplingBy = null,
    Object? qtyRetainSample = null,
    Object? retainSamplingDate = null,
    Object? retainSamplingBy = null,
    Object? qtyPackOpened = null,
    Object? qtyPackTotal = null,
    Object? na = null,
    Object? barcodeNo = null,
    Object? assay = freezed,
    Object? warehouse = null,
    Object? isActive = null,
    Object? microbiologyReleaseDate = freezed,
    Object? microbiologyReleaseBy = freezed,
    Object? coaAvailability = null,
    Object? materialReceiptDate = null,
    Object? density = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      materialReceiveId: null == materialReceiveId
          ? _value.materialReceiveId
          : materialReceiveId // ignore: cast_nullable_to_non_nullable
              as String,
      supplierId: null == supplierId
          ? _value.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroupId: null == materialGroupId
          ? _value.materialGroupId
          : materialGroupId // ignore: cast_nullable_to_non_nullable
              as String,
      materialId: null == materialId
          ? _value.materialId
          : materialId // ignore: cast_nullable_to_non_nullable
              as String,
      materialUnitId: null == materialUnitId
          ? _value.materialUnitId
          : materialUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      vatNo: null == vatNo
          ? _value.vatNo
          : vatNo // ignore: cast_nullable_to_non_nullable
              as int,
      vatTotal: null == vatTotal
          ? _value.vatTotal
          : vatTotal // ignore: cast_nullable_to_non_nullable
              as int,
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      qtySample: null == qtySample
          ? _value.qtySample
          : qtySample // ignore: cast_nullable_to_non_nullable
              as double,
      samplingDate: null == samplingDate
          ? _value.samplingDate
          : samplingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      samplingBy: null == samplingBy
          ? _value.samplingBy
          : samplingBy // ignore: cast_nullable_to_non_nullable
              as int,
      qtyRetainSample: null == qtyRetainSample
          ? _value.qtyRetainSample
          : qtyRetainSample // ignore: cast_nullable_to_non_nullable
              as double,
      retainSamplingDate: null == retainSamplingDate
          ? _value.retainSamplingDate
          : retainSamplingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      retainSamplingBy: null == retainSamplingBy
          ? _value.retainSamplingBy
          : retainSamplingBy // ignore: cast_nullable_to_non_nullable
              as int,
      qtyPackOpened: null == qtyPackOpened
          ? _value.qtyPackOpened
          : qtyPackOpened // ignore: cast_nullable_to_non_nullable
              as int,
      qtyPackTotal: null == qtyPackTotal
          ? _value.qtyPackTotal
          : qtyPackTotal // ignore: cast_nullable_to_non_nullable
              as int,
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      barcodeNo: null == barcodeNo
          ? _value.barcodeNo
          : barcodeNo // ignore: cast_nullable_to_non_nullable
              as String,
      assay: freezed == assay
          ? _value.assay
          : assay // ignore: cast_nullable_to_non_nullable
              as double?,
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as WarehouseMaterialReceive,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      microbiologyReleaseDate: freezed == microbiologyReleaseDate
          ? _value.microbiologyReleaseDate
          : microbiologyReleaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      microbiologyReleaseBy: freezed == microbiologyReleaseBy
          ? _value.microbiologyReleaseBy
          : microbiologyReleaseBy // ignore: cast_nullable_to_non_nullable
              as int?,
      coaAvailability: null == coaAvailability
          ? _value.coaAvailability
          : coaAvailability // ignore: cast_nullable_to_non_nullable
              as bool,
      materialReceiptDate: null == materialReceiptDate
          ? _value.materialReceiptDate
          : materialReceiptDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      density: null == density
          ? _value.density
          : density // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialAnalysisImplCopyWith<$Res>
    implements $MaterialAnalysisCopyWith<$Res> {
  factory _$$MaterialAnalysisImplCopyWith(_$MaterialAnalysisImpl value,
          $Res Function(_$MaterialAnalysisImpl) then) =
      __$$MaterialAnalysisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'material_receive_id') String materialReceiveId,
      @JsonKey(name: 'supplier_id') String supplierId,
      @JsonKey(name: 'material_group_id') String materialGroupId,
      @JsonKey(name: 'material_id') String materialId,
      @JsonKey(name: 'material_unit_id') String materialUnitId,
      @JsonKey(name: 'vat_no') int vatNo,
      @JsonKey(name: 'vat_total') int vatTotal,
      @JsonKey(name: 'batch_no') String batchNo,
      int qty,
      @JsonKey(name: 'qty_sample') double qtySample,
      @JsonKey(name: 'sampling_date', fromJson: isoDateToDateTime)
      DateTime samplingDate,
      @JsonKey(name: 'sampling_by') int samplingBy,
      @JsonKey(name: 'qty_retain_sample') double qtyRetainSample,
      @JsonKey(name: 'retain_sampling_date', fromJson: isoDateToDateTime)
      DateTime retainSamplingDate,
      @JsonKey(name: 'retain_sampling_by') int retainSamplingBy,
      @JsonKey(name: 'qty_pack_opened') int qtyPackOpened,
      @JsonKey(name: 'qty_pack_total') int qtyPackTotal,
      String na,
      @JsonKey(name: 'barcode_no') String barcodeNo,
      @JsonKey(name: 'assay', defaultValue: 0) double? assay,
      @JsonKey(name: 'warehouse', fromJson: WarehouseMaterialReceive.fromString)
      WarehouseMaterialReceive warehouse,
      @JsonKey(name: 'is_active') bool isActive,
      @JsonKey(name: 'microbiology_release_date', fromJson: dateTimeNullable)
      DateTime? microbiologyReleaseDate,
      @JsonKey(name: 'microbiology_release_by', defaultValue: 0)
      int? microbiologyReleaseBy,
      @JsonKey(name: 'coa_availability') bool coaAvailability,
      @JsonKey(name: 'material_receipt_date', fromJson: isoDateToDateTime)
      DateTime materialReceiptDate,
      double density});
}

/// @nodoc
class __$$MaterialAnalysisImplCopyWithImpl<$Res>
    extends _$MaterialAnalysisCopyWithImpl<$Res, _$MaterialAnalysisImpl>
    implements _$$MaterialAnalysisImplCopyWith<$Res> {
  __$$MaterialAnalysisImplCopyWithImpl(_$MaterialAnalysisImpl _value,
      $Res Function(_$MaterialAnalysisImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? materialReceiveId = null,
    Object? supplierId = null,
    Object? materialGroupId = null,
    Object? materialId = null,
    Object? materialUnitId = null,
    Object? vatNo = null,
    Object? vatTotal = null,
    Object? batchNo = null,
    Object? qty = null,
    Object? qtySample = null,
    Object? samplingDate = null,
    Object? samplingBy = null,
    Object? qtyRetainSample = null,
    Object? retainSamplingDate = null,
    Object? retainSamplingBy = null,
    Object? qtyPackOpened = null,
    Object? qtyPackTotal = null,
    Object? na = null,
    Object? barcodeNo = null,
    Object? assay = freezed,
    Object? warehouse = null,
    Object? isActive = null,
    Object? microbiologyReleaseDate = freezed,
    Object? microbiologyReleaseBy = freezed,
    Object? coaAvailability = null,
    Object? materialReceiptDate = null,
    Object? density = null,
  }) {
    return _then(_$MaterialAnalysisImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      materialReceiveId: null == materialReceiveId
          ? _value.materialReceiveId
          : materialReceiveId // ignore: cast_nullable_to_non_nullable
              as String,
      supplierId: null == supplierId
          ? _value.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroupId: null == materialGroupId
          ? _value.materialGroupId
          : materialGroupId // ignore: cast_nullable_to_non_nullable
              as String,
      materialId: null == materialId
          ? _value.materialId
          : materialId // ignore: cast_nullable_to_non_nullable
              as String,
      materialUnitId: null == materialUnitId
          ? _value.materialUnitId
          : materialUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      vatNo: null == vatNo
          ? _value.vatNo
          : vatNo // ignore: cast_nullable_to_non_nullable
              as int,
      vatTotal: null == vatTotal
          ? _value.vatTotal
          : vatTotal // ignore: cast_nullable_to_non_nullable
              as int,
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      qtySample: null == qtySample
          ? _value.qtySample
          : qtySample // ignore: cast_nullable_to_non_nullable
              as double,
      samplingDate: null == samplingDate
          ? _value.samplingDate
          : samplingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      samplingBy: null == samplingBy
          ? _value.samplingBy
          : samplingBy // ignore: cast_nullable_to_non_nullable
              as int,
      qtyRetainSample: null == qtyRetainSample
          ? _value.qtyRetainSample
          : qtyRetainSample // ignore: cast_nullable_to_non_nullable
              as double,
      retainSamplingDate: null == retainSamplingDate
          ? _value.retainSamplingDate
          : retainSamplingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      retainSamplingBy: null == retainSamplingBy
          ? _value.retainSamplingBy
          : retainSamplingBy // ignore: cast_nullable_to_non_nullable
              as int,
      qtyPackOpened: null == qtyPackOpened
          ? _value.qtyPackOpened
          : qtyPackOpened // ignore: cast_nullable_to_non_nullable
              as int,
      qtyPackTotal: null == qtyPackTotal
          ? _value.qtyPackTotal
          : qtyPackTotal // ignore: cast_nullable_to_non_nullable
              as int,
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      barcodeNo: null == barcodeNo
          ? _value.barcodeNo
          : barcodeNo // ignore: cast_nullable_to_non_nullable
              as String,
      assay: freezed == assay
          ? _value.assay
          : assay // ignore: cast_nullable_to_non_nullable
              as double?,
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as WarehouseMaterialReceive,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      microbiologyReleaseDate: freezed == microbiologyReleaseDate
          ? _value.microbiologyReleaseDate
          : microbiologyReleaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      microbiologyReleaseBy: freezed == microbiologyReleaseBy
          ? _value.microbiologyReleaseBy
          : microbiologyReleaseBy // ignore: cast_nullable_to_non_nullable
              as int?,
      coaAvailability: null == coaAvailability
          ? _value.coaAvailability
          : coaAvailability // ignore: cast_nullable_to_non_nullable
              as bool,
      materialReceiptDate: null == materialReceiptDate
          ? _value.materialReceiptDate
          : materialReceiptDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      density: null == density
          ? _value.density
          : density // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialAnalysisImpl extends _MaterialAnalysis {
  _$MaterialAnalysisImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'material_receive_id') required this.materialReceiveId,
      @JsonKey(name: 'supplier_id') required this.supplierId,
      @JsonKey(name: 'material_group_id') required this.materialGroupId,
      @JsonKey(name: 'material_id') required this.materialId,
      @JsonKey(name: 'material_unit_id') required this.materialUnitId,
      @JsonKey(name: 'vat_no') required this.vatNo,
      @JsonKey(name: 'vat_total') required this.vatTotal,
      @JsonKey(name: 'batch_no') required this.batchNo,
      required this.qty,
      @JsonKey(name: 'qty_sample') required this.qtySample,
      @JsonKey(name: 'sampling_date', fromJson: isoDateToDateTime)
      required this.samplingDate,
      @JsonKey(name: 'sampling_by') required this.samplingBy,
      @JsonKey(name: 'qty_retain_sample') required this.qtyRetainSample,
      @JsonKey(name: 'retain_sampling_date', fromJson: isoDateToDateTime)
      required this.retainSamplingDate,
      @JsonKey(name: 'retain_sampling_by') required this.retainSamplingBy,
      @JsonKey(name: 'qty_pack_opened') required this.qtyPackOpened,
      @JsonKey(name: 'qty_pack_total') required this.qtyPackTotal,
      required this.na,
      @JsonKey(name: 'barcode_no') required this.barcodeNo,
      @JsonKey(name: 'assay', defaultValue: 0) this.assay,
      @JsonKey(name: 'warehouse', fromJson: WarehouseMaterialReceive.fromString)
      required this.warehouse,
      @JsonKey(name: 'is_active') required this.isActive,
      @JsonKey(name: 'microbiology_release_date', fromJson: dateTimeNullable)
      this.microbiologyReleaseDate,
      @JsonKey(name: 'microbiology_release_by', defaultValue: 0)
      this.microbiologyReleaseBy,
      @JsonKey(name: 'coa_availability') required this.coaAvailability,
      @JsonKey(name: 'material_receipt_date', fromJson: isoDateToDateTime)
      required this.materialReceiptDate,
      required this.density})
      : super._();

  factory _$MaterialAnalysisImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialAnalysisImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'material_receive_id')
  final String materialReceiveId;
  @override
  @JsonKey(name: 'supplier_id')
  final String supplierId;
  @override
  @JsonKey(name: 'material_group_id')
  final String materialGroupId;
  @override
  @JsonKey(name: 'material_id')
  final String materialId;
  @override
  @JsonKey(name: 'material_unit_id')
  final String materialUnitId;
  @override
  @JsonKey(name: 'vat_no')
  final int vatNo;
  @override
  @JsonKey(name: 'vat_total')
  final int vatTotal;
  @override
  @JsonKey(name: 'batch_no')
  final String batchNo;
  @override
  final int qty;
  @override
  @JsonKey(name: 'qty_sample')
  final double qtySample;
  @override
  @JsonKey(name: 'sampling_date', fromJson: isoDateToDateTime)
  final DateTime samplingDate;
  @override
  @JsonKey(name: 'sampling_by')
  final int samplingBy;
  @override
  @JsonKey(name: 'qty_retain_sample')
  final double qtyRetainSample;
  @override
  @JsonKey(name: 'retain_sampling_date', fromJson: isoDateToDateTime)
  final DateTime retainSamplingDate;
  @override
  @JsonKey(name: 'retain_sampling_by')
  final int retainSamplingBy;
  @override
  @JsonKey(name: 'qty_pack_opened')
  final int qtyPackOpened;
  @override
  @JsonKey(name: 'qty_pack_total')
  final int qtyPackTotal;
  @override
  final String na;
  @override
  @JsonKey(name: 'barcode_no')
  final String barcodeNo;
  @override
  @JsonKey(name: 'assay', defaultValue: 0)
  final double? assay;
  @override
  @JsonKey(name: 'warehouse', fromJson: WarehouseMaterialReceive.fromString)
  final WarehouseMaterialReceive warehouse;
  @override
  @JsonKey(name: 'is_active')
  final bool isActive;
  @override
  @JsonKey(name: 'microbiology_release_date', fromJson: dateTimeNullable)
  final DateTime? microbiologyReleaseDate;
  @override
  @JsonKey(name: 'microbiology_release_by', defaultValue: 0)
  final int? microbiologyReleaseBy;
  @override
  @JsonKey(name: 'coa_availability')
  final bool coaAvailability;
  @override
  @JsonKey(name: 'material_receipt_date', fromJson: isoDateToDateTime)
  final DateTime materialReceiptDate;
  @override
  final double density;

  @override
  String toString() {
    return 'MaterialAnalysis(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, materialReceiveId: $materialReceiveId, supplierId: $supplierId, materialGroupId: $materialGroupId, materialId: $materialId, materialUnitId: $materialUnitId, vatNo: $vatNo, vatTotal: $vatTotal, batchNo: $batchNo, qty: $qty, qtySample: $qtySample, samplingDate: $samplingDate, samplingBy: $samplingBy, qtyRetainSample: $qtyRetainSample, retainSamplingDate: $retainSamplingDate, retainSamplingBy: $retainSamplingBy, qtyPackOpened: $qtyPackOpened, qtyPackTotal: $qtyPackTotal, na: $na, barcodeNo: $barcodeNo, assay: $assay, warehouse: $warehouse, isActive: $isActive, microbiologyReleaseDate: $microbiologyReleaseDate, microbiologyReleaseBy: $microbiologyReleaseBy, coaAvailability: $coaAvailability, materialReceiptDate: $materialReceiptDate, density: $density)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialAnalysisImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.materialReceiveId, materialReceiveId) ||
                other.materialReceiveId == materialReceiveId) &&
            (identical(other.supplierId, supplierId) ||
                other.supplierId == supplierId) &&
            (identical(other.materialGroupId, materialGroupId) ||
                other.materialGroupId == materialGroupId) &&
            (identical(other.materialId, materialId) ||
                other.materialId == materialId) &&
            (identical(other.materialUnitId, materialUnitId) ||
                other.materialUnitId == materialUnitId) &&
            (identical(other.vatNo, vatNo) || other.vatNo == vatNo) &&
            (identical(other.vatTotal, vatTotal) ||
                other.vatTotal == vatTotal) &&
            (identical(other.batchNo, batchNo) || other.batchNo == batchNo) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.qtySample, qtySample) ||
                other.qtySample == qtySample) &&
            (identical(other.samplingDate, samplingDate) ||
                other.samplingDate == samplingDate) &&
            (identical(other.samplingBy, samplingBy) ||
                other.samplingBy == samplingBy) &&
            (identical(other.qtyRetainSample, qtyRetainSample) ||
                other.qtyRetainSample == qtyRetainSample) &&
            (identical(other.retainSamplingDate, retainSamplingDate) ||
                other.retainSamplingDate == retainSamplingDate) &&
            (identical(other.retainSamplingBy, retainSamplingBy) ||
                other.retainSamplingBy == retainSamplingBy) &&
            (identical(other.qtyPackOpened, qtyPackOpened) ||
                other.qtyPackOpened == qtyPackOpened) &&
            (identical(other.qtyPackTotal, qtyPackTotal) ||
                other.qtyPackTotal == qtyPackTotal) &&
            (identical(other.na, na) || other.na == na) &&
            (identical(other.barcodeNo, barcodeNo) ||
                other.barcodeNo == barcodeNo) &&
            (identical(other.assay, assay) || other.assay == assay) &&
            (identical(other.warehouse, warehouse) ||
                other.warehouse == warehouse) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(
                    other.microbiologyReleaseDate, microbiologyReleaseDate) ||
                other.microbiologyReleaseDate == microbiologyReleaseDate) &&
            (identical(other.microbiologyReleaseBy, microbiologyReleaseBy) ||
                other.microbiologyReleaseBy == microbiologyReleaseBy) &&
            (identical(other.coaAvailability, coaAvailability) ||
                other.coaAvailability == coaAvailability) &&
            (identical(other.materialReceiptDate, materialReceiptDate) ||
                other.materialReceiptDate == materialReceiptDate) &&
            (identical(other.density, density) || other.density == density));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        createdAt,
        updatedAt,
        materialReceiveId,
        supplierId,
        materialGroupId,
        materialId,
        materialUnitId,
        vatNo,
        vatTotal,
        batchNo,
        qty,
        qtySample,
        samplingDate,
        samplingBy,
        qtyRetainSample,
        retainSamplingDate,
        retainSamplingBy,
        qtyPackOpened,
        qtyPackTotal,
        na,
        barcodeNo,
        assay,
        warehouse,
        isActive,
        microbiologyReleaseDate,
        microbiologyReleaseBy,
        coaAvailability,
        materialReceiptDate,
        density
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialAnalysisImplCopyWith<_$MaterialAnalysisImpl> get copyWith =>
      __$$MaterialAnalysisImplCopyWithImpl<_$MaterialAnalysisImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialAnalysisImplToJson(
      this,
    );
  }
}

abstract class _MaterialAnalysis extends MaterialAnalysis {
  factory _MaterialAnalysis(
      {required final int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'material_receive_id')
      required final String materialReceiveId,
      @JsonKey(name: 'supplier_id') required final String supplierId,
      @JsonKey(name: 'material_group_id') required final String materialGroupId,
      @JsonKey(name: 'material_id') required final String materialId,
      @JsonKey(name: 'material_unit_id') required final String materialUnitId,
      @JsonKey(name: 'vat_no') required final int vatNo,
      @JsonKey(name: 'vat_total') required final int vatTotal,
      @JsonKey(name: 'batch_no') required final String batchNo,
      required final int qty,
      @JsonKey(name: 'qty_sample') required final double qtySample,
      @JsonKey(name: 'sampling_date', fromJson: isoDateToDateTime)
      required final DateTime samplingDate,
      @JsonKey(name: 'sampling_by') required final int samplingBy,
      @JsonKey(name: 'qty_retain_sample') required final double qtyRetainSample,
      @JsonKey(name: 'retain_sampling_date', fromJson: isoDateToDateTime)
      required final DateTime retainSamplingDate,
      @JsonKey(name: 'retain_sampling_by') required final int retainSamplingBy,
      @JsonKey(name: 'qty_pack_opened') required final int qtyPackOpened,
      @JsonKey(name: 'qty_pack_total') required final int qtyPackTotal,
      required final String na,
      @JsonKey(name: 'barcode_no') required final String barcodeNo,
      @JsonKey(name: 'assay', defaultValue: 0) final double? assay,
      @JsonKey(name: 'warehouse', fromJson: WarehouseMaterialReceive.fromString)
      required final WarehouseMaterialReceive warehouse,
      @JsonKey(name: 'is_active') required final bool isActive,
      @JsonKey(name: 'microbiology_release_date', fromJson: dateTimeNullable)
      final DateTime? microbiologyReleaseDate,
      @JsonKey(name: 'microbiology_release_by', defaultValue: 0)
      final int? microbiologyReleaseBy,
      @JsonKey(name: 'coa_availability') required final bool coaAvailability,
      @JsonKey(name: 'material_receipt_date', fromJson: isoDateToDateTime)
      required final DateTime materialReceiptDate,
      required final double density}) = _$MaterialAnalysisImpl;
  _MaterialAnalysis._() : super._();

  factory _MaterialAnalysis.fromJson(Map<String, dynamic> json) =
      _$MaterialAnalysisImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'material_receive_id')
  String get materialReceiveId;
  @override
  @JsonKey(name: 'supplier_id')
  String get supplierId;
  @override
  @JsonKey(name: 'material_group_id')
  String get materialGroupId;
  @override
  @JsonKey(name: 'material_id')
  String get materialId;
  @override
  @JsonKey(name: 'material_unit_id')
  String get materialUnitId;
  @override
  @JsonKey(name: 'vat_no')
  int get vatNo;
  @override
  @JsonKey(name: 'vat_total')
  int get vatTotal;
  @override
  @JsonKey(name: 'batch_no')
  String get batchNo;
  @override
  int get qty;
  @override
  @JsonKey(name: 'qty_sample')
  double get qtySample;
  @override
  @JsonKey(name: 'sampling_date', fromJson: isoDateToDateTime)
  DateTime get samplingDate;
  @override
  @JsonKey(name: 'sampling_by')
  int get samplingBy;
  @override
  @JsonKey(name: 'qty_retain_sample')
  double get qtyRetainSample;
  @override
  @JsonKey(name: 'retain_sampling_date', fromJson: isoDateToDateTime)
  DateTime get retainSamplingDate;
  @override
  @JsonKey(name: 'retain_sampling_by')
  int get retainSamplingBy;
  @override
  @JsonKey(name: 'qty_pack_opened')
  int get qtyPackOpened;
  @override
  @JsonKey(name: 'qty_pack_total')
  int get qtyPackTotal;
  @override
  String get na;
  @override
  @JsonKey(name: 'barcode_no')
  String get barcodeNo;
  @override
  @JsonKey(name: 'assay', defaultValue: 0)
  double? get assay;
  @override
  @JsonKey(name: 'warehouse', fromJson: WarehouseMaterialReceive.fromString)
  WarehouseMaterialReceive get warehouse;
  @override
  @JsonKey(name: 'is_active')
  bool get isActive;
  @override
  @JsonKey(name: 'microbiology_release_date', fromJson: dateTimeNullable)
  DateTime? get microbiologyReleaseDate;
  @override
  @JsonKey(name: 'microbiology_release_by', defaultValue: 0)
  int? get microbiologyReleaseBy;
  @override
  @JsonKey(name: 'coa_availability')
  bool get coaAvailability;
  @override
  @JsonKey(name: 'material_receipt_date', fromJson: isoDateToDateTime)
  DateTime get materialReceiptDate;
  @override
  double get density;
  @override
  @JsonKey(ignore: true)
  _$$MaterialAnalysisImplCopyWith<_$MaterialAnalysisImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
