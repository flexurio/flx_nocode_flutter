// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_receive_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialReceiveDetail _$MaterialReceiveDetailFromJson(
    Map<String, dynamic> json) {
  return _MaterialReceiveDetail.fromJson(json);
}

/// @nodoc
mixin _$MaterialReceiveDetail {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String get na => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'material_receive',
      fromJson: MaterialReceive.fromJson,
      defaultValue: MaterialReceive.empty)
  MaterialReceive get materialReceive => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'design_code',
      fromJson: MaterialDesign.fromJson,
      defaultValue: MaterialDesign.empty)
  MaterialDesign? get materialDesign => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'material',
      fromJson: Material.fromJson,
      defaultValue: Material.empty)
  Material get material => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'material_unit',
      fromJson: MaterialUnit.fromJson,
      defaultValue: MaterialUnit.empty)
  MaterialUnit get materialUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no')
  String get batchNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'barcode_no')
  String get barcodeNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'vat_no')
  int get vatNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'vat_total')
  int get vatTotal => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_quantity')
  double get totalQuantity => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'material_status_qc',
      fromJson: MaterialReceiveDetailStatus.fromString)
  MaterialReceiveDetailStatus get materialStatus =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'release_date', fromJson: isoDateToDateTime)
  DateTime? get releaseDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
  DateTime? get expiredDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'best_before', fromJson: dateTimeNullable)
  DateTime? get bestBefore => throw _privateConstructorUsedError;
  @JsonKey(name: 'manufacturing_date', fromJson: dateTimeNullable)
  DateTime? get manufacturingDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'retest_date', fromJson: dateTimeNullable)
  DateTime? get retestDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'retest_date_qc', fromJson: dateTimeNullable)
  DateTime? get retestDateQualityControl => throw _privateConstructorUsedError;
  @JsonKey(name: 'shelf_life', fromJson: dateTimeNullable)
  DateTime? get shelfLife => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialReceiveDetailCopyWith<MaterialReceiveDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialReceiveDetailCopyWith<$Res> {
  factory $MaterialReceiveDetailCopyWith(MaterialReceiveDetail value,
          $Res Function(MaterialReceiveDetail) then) =
      _$MaterialReceiveDetailCopyWithImpl<$Res, MaterialReceiveDetail>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      String na,
      @JsonKey(
          name: 'material_receive',
          fromJson: MaterialReceive.fromJson,
          defaultValue: MaterialReceive.empty)
      MaterialReceive materialReceive,
      @JsonKey(
          name: 'design_code',
          fromJson: MaterialDesign.fromJson,
          defaultValue: MaterialDesign.empty)
      MaterialDesign? materialDesign,
      @JsonKey(
          name: 'material',
          fromJson: Material.fromJson,
          defaultValue: Material.empty)
      Material material,
      @JsonKey(
          name: 'material_unit',
          fromJson: MaterialUnit.fromJson,
          defaultValue: MaterialUnit.empty)
      MaterialUnit materialUnit,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'batch_no') String batchNo,
      @JsonKey(name: 'barcode_no') String barcodeNo,
      @JsonKey(name: 'vat_no') int vatNo,
      @JsonKey(name: 'vat_total') int vatTotal,
      double quantity,
      @JsonKey(name: 'total_quantity') double totalQuantity,
      double price,
      @JsonKey(
          name: 'material_status_qc',
          fromJson: MaterialReceiveDetailStatus.fromString)
      MaterialReceiveDetailStatus materialStatus,
      @JsonKey(name: 'release_date', fromJson: isoDateToDateTime)
      DateTime? releaseDate,
      @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
      DateTime? expiredDate,
      @JsonKey(name: 'best_before', fromJson: dateTimeNullable)
      DateTime? bestBefore,
      @JsonKey(name: 'manufacturing_date', fromJson: dateTimeNullable)
      DateTime? manufacturingDate,
      @JsonKey(name: 'retest_date', fromJson: dateTimeNullable)
      DateTime? retestDate,
      @JsonKey(name: 'retest_date_qc', fromJson: dateTimeNullable)
      DateTime? retestDateQualityControl,
      @JsonKey(name: 'shelf_life', fromJson: dateTimeNullable)
      DateTime? shelfLife});

  $MaterialReceiveCopyWith<$Res> get materialReceive;
  $MaterialDesignCopyWith<$Res>? get materialDesign;
  $MaterialCopyWith<$Res> get material;
  $MaterialUnitCopyWith<$Res> get materialUnit;
}

/// @nodoc
class _$MaterialReceiveDetailCopyWithImpl<$Res,
        $Val extends MaterialReceiveDetail>
    implements $MaterialReceiveDetailCopyWith<$Res> {
  _$MaterialReceiveDetailCopyWithImpl(this._value, this._then);

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
    Object? na = null,
    Object? materialReceive = null,
    Object? materialDesign = freezed,
    Object? material = null,
    Object? materialUnit = null,
    Object? transactionDate = null,
    Object? batchNo = null,
    Object? barcodeNo = null,
    Object? vatNo = null,
    Object? vatTotal = null,
    Object? quantity = null,
    Object? totalQuantity = null,
    Object? price = null,
    Object? materialStatus = null,
    Object? releaseDate = freezed,
    Object? expiredDate = freezed,
    Object? bestBefore = freezed,
    Object? manufacturingDate = freezed,
    Object? retestDate = freezed,
    Object? retestDateQualityControl = freezed,
    Object? shelfLife = freezed,
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
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      materialReceive: null == materialReceive
          ? _value.materialReceive
          : materialReceive // ignore: cast_nullable_to_non_nullable
              as MaterialReceive,
      materialDesign: freezed == materialDesign
          ? _value.materialDesign
          : materialDesign // ignore: cast_nullable_to_non_nullable
              as MaterialDesign?,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
      materialUnit: null == materialUnit
          ? _value.materialUnit
          : materialUnit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String,
      barcodeNo: null == barcodeNo
          ? _value.barcodeNo
          : barcodeNo // ignore: cast_nullable_to_non_nullable
              as String,
      vatNo: null == vatNo
          ? _value.vatNo
          : vatNo // ignore: cast_nullable_to_non_nullable
              as int,
      vatTotal: null == vatTotal
          ? _value.vatTotal
          : vatTotal // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      materialStatus: null == materialStatus
          ? _value.materialStatus
          : materialStatus // ignore: cast_nullable_to_non_nullable
              as MaterialReceiveDetailStatus,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiredDate: freezed == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bestBefore: freezed == bestBefore
          ? _value.bestBefore
          : bestBefore // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      manufacturingDate: freezed == manufacturingDate
          ? _value.manufacturingDate
          : manufacturingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      retestDate: freezed == retestDate
          ? _value.retestDate
          : retestDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      retestDateQualityControl: freezed == retestDateQualityControl
          ? _value.retestDateQualityControl
          : retestDateQualityControl // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shelfLife: freezed == shelfLife
          ? _value.shelfLife
          : shelfLife // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialReceiveCopyWith<$Res> get materialReceive {
    return $MaterialReceiveCopyWith<$Res>(_value.materialReceive, (value) {
      return _then(_value.copyWith(materialReceive: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialDesignCopyWith<$Res>? get materialDesign {
    if (_value.materialDesign == null) {
      return null;
    }

    return $MaterialDesignCopyWith<$Res>(_value.materialDesign!, (value) {
      return _then(_value.copyWith(materialDesign: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialCopyWith<$Res> get material {
    return $MaterialCopyWith<$Res>(_value.material, (value) {
      return _then(_value.copyWith(material: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get materialUnit {
    return $MaterialUnitCopyWith<$Res>(_value.materialUnit, (value) {
      return _then(_value.copyWith(materialUnit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MaterialReceiveDetailImplCopyWith<$Res>
    implements $MaterialReceiveDetailCopyWith<$Res> {
  factory _$$MaterialReceiveDetailImplCopyWith(
          _$MaterialReceiveDetailImpl value,
          $Res Function(_$MaterialReceiveDetailImpl) then) =
      __$$MaterialReceiveDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      String na,
      @JsonKey(
          name: 'material_receive',
          fromJson: MaterialReceive.fromJson,
          defaultValue: MaterialReceive.empty)
      MaterialReceive materialReceive,
      @JsonKey(
          name: 'design_code',
          fromJson: MaterialDesign.fromJson,
          defaultValue: MaterialDesign.empty)
      MaterialDesign? materialDesign,
      @JsonKey(
          name: 'material',
          fromJson: Material.fromJson,
          defaultValue: Material.empty)
      Material material,
      @JsonKey(
          name: 'material_unit',
          fromJson: MaterialUnit.fromJson,
          defaultValue: MaterialUnit.empty)
      MaterialUnit materialUnit,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'batch_no') String batchNo,
      @JsonKey(name: 'barcode_no') String barcodeNo,
      @JsonKey(name: 'vat_no') int vatNo,
      @JsonKey(name: 'vat_total') int vatTotal,
      double quantity,
      @JsonKey(name: 'total_quantity') double totalQuantity,
      double price,
      @JsonKey(
          name: 'material_status_qc',
          fromJson: MaterialReceiveDetailStatus.fromString)
      MaterialReceiveDetailStatus materialStatus,
      @JsonKey(name: 'release_date', fromJson: isoDateToDateTime)
      DateTime? releaseDate,
      @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
      DateTime? expiredDate,
      @JsonKey(name: 'best_before', fromJson: dateTimeNullable)
      DateTime? bestBefore,
      @JsonKey(name: 'manufacturing_date', fromJson: dateTimeNullable)
      DateTime? manufacturingDate,
      @JsonKey(name: 'retest_date', fromJson: dateTimeNullable)
      DateTime? retestDate,
      @JsonKey(name: 'retest_date_qc', fromJson: dateTimeNullable)
      DateTime? retestDateQualityControl,
      @JsonKey(name: 'shelf_life', fromJson: dateTimeNullable)
      DateTime? shelfLife});

  @override
  $MaterialReceiveCopyWith<$Res> get materialReceive;
  @override
  $MaterialDesignCopyWith<$Res>? get materialDesign;
  @override
  $MaterialCopyWith<$Res> get material;
  @override
  $MaterialUnitCopyWith<$Res> get materialUnit;
}

/// @nodoc
class __$$MaterialReceiveDetailImplCopyWithImpl<$Res>
    extends _$MaterialReceiveDetailCopyWithImpl<$Res,
        _$MaterialReceiveDetailImpl>
    implements _$$MaterialReceiveDetailImplCopyWith<$Res> {
  __$$MaterialReceiveDetailImplCopyWithImpl(_$MaterialReceiveDetailImpl _value,
      $Res Function(_$MaterialReceiveDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? na = null,
    Object? materialReceive = null,
    Object? materialDesign = freezed,
    Object? material = null,
    Object? materialUnit = null,
    Object? transactionDate = null,
    Object? batchNo = null,
    Object? barcodeNo = null,
    Object? vatNo = null,
    Object? vatTotal = null,
    Object? quantity = null,
    Object? totalQuantity = null,
    Object? price = null,
    Object? materialStatus = null,
    Object? releaseDate = freezed,
    Object? expiredDate = freezed,
    Object? bestBefore = freezed,
    Object? manufacturingDate = freezed,
    Object? retestDate = freezed,
    Object? retestDateQualityControl = freezed,
    Object? shelfLife = freezed,
  }) {
    return _then(_$MaterialReceiveDetailImpl(
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
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      materialReceive: null == materialReceive
          ? _value.materialReceive
          : materialReceive // ignore: cast_nullable_to_non_nullable
              as MaterialReceive,
      materialDesign: freezed == materialDesign
          ? _value.materialDesign
          : materialDesign // ignore: cast_nullable_to_non_nullable
              as MaterialDesign?,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
      materialUnit: null == materialUnit
          ? _value.materialUnit
          : materialUnit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String,
      barcodeNo: null == barcodeNo
          ? _value.barcodeNo
          : barcodeNo // ignore: cast_nullable_to_non_nullable
              as String,
      vatNo: null == vatNo
          ? _value.vatNo
          : vatNo // ignore: cast_nullable_to_non_nullable
              as int,
      vatTotal: null == vatTotal
          ? _value.vatTotal
          : vatTotal // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      materialStatus: null == materialStatus
          ? _value.materialStatus
          : materialStatus // ignore: cast_nullable_to_non_nullable
              as MaterialReceiveDetailStatus,
      releaseDate: freezed == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      expiredDate: freezed == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bestBefore: freezed == bestBefore
          ? _value.bestBefore
          : bestBefore // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      manufacturingDate: freezed == manufacturingDate
          ? _value.manufacturingDate
          : manufacturingDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      retestDate: freezed == retestDate
          ? _value.retestDate
          : retestDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      retestDateQualityControl: freezed == retestDateQualityControl
          ? _value.retestDateQualityControl
          : retestDateQualityControl // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shelfLife: freezed == shelfLife
          ? _value.shelfLife
          : shelfLife // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialReceiveDetailImpl extends _MaterialReceiveDetail {
  _$MaterialReceiveDetailImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      required this.na,
      @JsonKey(
          name: 'material_receive',
          fromJson: MaterialReceive.fromJson,
          defaultValue: MaterialReceive.empty)
      required this.materialReceive,
      @JsonKey(
          name: 'design_code',
          fromJson: MaterialDesign.fromJson,
          defaultValue: MaterialDesign.empty)
      required this.materialDesign,
      @JsonKey(
          name: 'material',
          fromJson: Material.fromJson,
          defaultValue: Material.empty)
      required this.material,
      @JsonKey(
          name: 'material_unit',
          fromJson: MaterialUnit.fromJson,
          defaultValue: MaterialUnit.empty)
      required this.materialUnit,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required this.transactionDate,
      @JsonKey(name: 'batch_no') required this.batchNo,
      @JsonKey(name: 'barcode_no') required this.barcodeNo,
      @JsonKey(name: 'vat_no') required this.vatNo,
      @JsonKey(name: 'vat_total') required this.vatTotal,
      required this.quantity,
      @JsonKey(name: 'total_quantity') required this.totalQuantity,
      required this.price,
      @JsonKey(
          name: 'material_status_qc',
          fromJson: MaterialReceiveDetailStatus.fromString)
      required this.materialStatus,
      @JsonKey(name: 'release_date', fromJson: isoDateToDateTime)
      this.releaseDate,
      @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
      this.expiredDate,
      @JsonKey(name: 'best_before', fromJson: dateTimeNullable) this.bestBefore,
      @JsonKey(name: 'manufacturing_date', fromJson: dateTimeNullable)
      this.manufacturingDate,
      @JsonKey(name: 'retest_date', fromJson: dateTimeNullable) this.retestDate,
      @JsonKey(name: 'retest_date_qc', fromJson: dateTimeNullable)
      this.retestDateQualityControl,
      @JsonKey(name: 'shelf_life', fromJson: dateTimeNullable) this.shelfLife})
      : super._();

  factory _$MaterialReceiveDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialReceiveDetailImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  final String na;
  @override
  @JsonKey(
      name: 'material_receive',
      fromJson: MaterialReceive.fromJson,
      defaultValue: MaterialReceive.empty)
  final MaterialReceive materialReceive;
  @override
  @JsonKey(
      name: 'design_code',
      fromJson: MaterialDesign.fromJson,
      defaultValue: MaterialDesign.empty)
  final MaterialDesign? materialDesign;
  @override
  @JsonKey(
      name: 'material',
      fromJson: Material.fromJson,
      defaultValue: Material.empty)
  final Material material;
  @override
  @JsonKey(
      name: 'material_unit',
      fromJson: MaterialUnit.fromJson,
      defaultValue: MaterialUnit.empty)
  final MaterialUnit materialUnit;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  final DateTime transactionDate;
  @override
  @JsonKey(name: 'batch_no')
  final String batchNo;
  @override
  @JsonKey(name: 'barcode_no')
  final String barcodeNo;
  @override
  @JsonKey(name: 'vat_no')
  final int vatNo;
  @override
  @JsonKey(name: 'vat_total')
  final int vatTotal;
  @override
  final double quantity;
  @override
  @JsonKey(name: 'total_quantity')
  final double totalQuantity;
  @override
  final double price;
  @override
  @JsonKey(
      name: 'material_status_qc',
      fromJson: MaterialReceiveDetailStatus.fromString)
  final MaterialReceiveDetailStatus materialStatus;
  @override
  @JsonKey(name: 'release_date', fromJson: isoDateToDateTime)
  final DateTime? releaseDate;
  @override
  @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
  final DateTime? expiredDate;
  @override
  @JsonKey(name: 'best_before', fromJson: dateTimeNullable)
  final DateTime? bestBefore;
  @override
  @JsonKey(name: 'manufacturing_date', fromJson: dateTimeNullable)
  final DateTime? manufacturingDate;
  @override
  @JsonKey(name: 'retest_date', fromJson: dateTimeNullable)
  final DateTime? retestDate;
  @override
  @JsonKey(name: 'retest_date_qc', fromJson: dateTimeNullable)
  final DateTime? retestDateQualityControl;
  @override
  @JsonKey(name: 'shelf_life', fromJson: dateTimeNullable)
  final DateTime? shelfLife;

  @override
  String toString() {
    return 'MaterialReceiveDetail(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, na: $na, materialReceive: $materialReceive, materialDesign: $materialDesign, material: $material, materialUnit: $materialUnit, transactionDate: $transactionDate, batchNo: $batchNo, barcodeNo: $barcodeNo, vatNo: $vatNo, vatTotal: $vatTotal, quantity: $quantity, totalQuantity: $totalQuantity, price: $price, materialStatus: $materialStatus, releaseDate: $releaseDate, expiredDate: $expiredDate, bestBefore: $bestBefore, manufacturingDate: $manufacturingDate, retestDate: $retestDate, retestDateQualityControl: $retestDateQualityControl, shelfLife: $shelfLife)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialReceiveDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.na, na) || other.na == na) &&
            (identical(other.materialReceive, materialReceive) ||
                other.materialReceive == materialReceive) &&
            (identical(other.materialDesign, materialDesign) ||
                other.materialDesign == materialDesign) &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.materialUnit, materialUnit) ||
                other.materialUnit == materialUnit) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.batchNo, batchNo) || other.batchNo == batchNo) &&
            (identical(other.barcodeNo, barcodeNo) ||
                other.barcodeNo == barcodeNo) &&
            (identical(other.vatNo, vatNo) || other.vatNo == vatNo) &&
            (identical(other.vatTotal, vatTotal) ||
                other.vatTotal == vatTotal) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.materialStatus, materialStatus) ||
                other.materialStatus == materialStatus) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.expiredDate, expiredDate) ||
                other.expiredDate == expiredDate) &&
            (identical(other.bestBefore, bestBefore) ||
                other.bestBefore == bestBefore) &&
            (identical(other.manufacturingDate, manufacturingDate) ||
                other.manufacturingDate == manufacturingDate) &&
            (identical(other.retestDate, retestDate) ||
                other.retestDate == retestDate) &&
            (identical(
                    other.retestDateQualityControl, retestDateQualityControl) ||
                other.retestDateQualityControl == retestDateQualityControl) &&
            (identical(other.shelfLife, shelfLife) ||
                other.shelfLife == shelfLife));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        createdAt,
        updatedAt,
        na,
        materialReceive,
        materialDesign,
        material,
        materialUnit,
        transactionDate,
        batchNo,
        barcodeNo,
        vatNo,
        vatTotal,
        quantity,
        totalQuantity,
        price,
        materialStatus,
        releaseDate,
        expiredDate,
        bestBefore,
        manufacturingDate,
        retestDate,
        retestDateQualityControl,
        shelfLife
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialReceiveDetailImplCopyWith<_$MaterialReceiveDetailImpl>
      get copyWith => __$$MaterialReceiveDetailImplCopyWithImpl<
          _$MaterialReceiveDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialReceiveDetailImplToJson(
      this,
    );
  }
}

abstract class _MaterialReceiveDetail extends MaterialReceiveDetail {
  factory _MaterialReceiveDetail(
      {required final int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      required final String na,
      @JsonKey(
          name: 'material_receive',
          fromJson: MaterialReceive.fromJson,
          defaultValue: MaterialReceive.empty)
      required final MaterialReceive materialReceive,
      @JsonKey(
          name: 'design_code',
          fromJson: MaterialDesign.fromJson,
          defaultValue: MaterialDesign.empty)
      required final MaterialDesign? materialDesign,
      @JsonKey(
          name: 'material',
          fromJson: Material.fromJson,
          defaultValue: Material.empty)
      required final Material material,
      @JsonKey(
          name: 'material_unit',
          fromJson: MaterialUnit.fromJson,
          defaultValue: MaterialUnit.empty)
      required final MaterialUnit materialUnit,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required final DateTime transactionDate,
      @JsonKey(name: 'batch_no') required final String batchNo,
      @JsonKey(name: 'barcode_no') required final String barcodeNo,
      @JsonKey(name: 'vat_no') required final int vatNo,
      @JsonKey(name: 'vat_total') required final int vatTotal,
      required final double quantity,
      @JsonKey(name: 'total_quantity') required final double totalQuantity,
      required final double price,
      @JsonKey(
          name: 'material_status_qc',
          fromJson: MaterialReceiveDetailStatus.fromString)
      required final MaterialReceiveDetailStatus materialStatus,
      @JsonKey(name: 'release_date', fromJson: isoDateToDateTime)
      final DateTime? releaseDate,
      @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
      final DateTime? expiredDate,
      @JsonKey(name: 'best_before', fromJson: dateTimeNullable)
      final DateTime? bestBefore,
      @JsonKey(name: 'manufacturing_date', fromJson: dateTimeNullable)
      final DateTime? manufacturingDate,
      @JsonKey(name: 'retest_date', fromJson: dateTimeNullable)
      final DateTime? retestDate,
      @JsonKey(name: 'retest_date_qc', fromJson: dateTimeNullable)
      final DateTime? retestDateQualityControl,
      @JsonKey(name: 'shelf_life', fromJson: dateTimeNullable)
      final DateTime? shelfLife}) = _$MaterialReceiveDetailImpl;
  _MaterialReceiveDetail._() : super._();

  factory _MaterialReceiveDetail.fromJson(Map<String, dynamic> json) =
      _$MaterialReceiveDetailImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  String get na;
  @override
  @JsonKey(
      name: 'material_receive',
      fromJson: MaterialReceive.fromJson,
      defaultValue: MaterialReceive.empty)
  MaterialReceive get materialReceive;
  @override
  @JsonKey(
      name: 'design_code',
      fromJson: MaterialDesign.fromJson,
      defaultValue: MaterialDesign.empty)
  MaterialDesign? get materialDesign;
  @override
  @JsonKey(
      name: 'material',
      fromJson: Material.fromJson,
      defaultValue: Material.empty)
  Material get material;
  @override
  @JsonKey(
      name: 'material_unit',
      fromJson: MaterialUnit.fromJson,
      defaultValue: MaterialUnit.empty)
  MaterialUnit get materialUnit;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate;
  @override
  @JsonKey(name: 'batch_no')
  String get batchNo;
  @override
  @JsonKey(name: 'barcode_no')
  String get barcodeNo;
  @override
  @JsonKey(name: 'vat_no')
  int get vatNo;
  @override
  @JsonKey(name: 'vat_total')
  int get vatTotal;
  @override
  double get quantity;
  @override
  @JsonKey(name: 'total_quantity')
  double get totalQuantity;
  @override
  double get price;
  @override
  @JsonKey(
      name: 'material_status_qc',
      fromJson: MaterialReceiveDetailStatus.fromString)
  MaterialReceiveDetailStatus get materialStatus;
  @override
  @JsonKey(name: 'release_date', fromJson: isoDateToDateTime)
  DateTime? get releaseDate;
  @override
  @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
  DateTime? get expiredDate;
  @override
  @JsonKey(name: 'best_before', fromJson: dateTimeNullable)
  DateTime? get bestBefore;
  @override
  @JsonKey(name: 'manufacturing_date', fromJson: dateTimeNullable)
  DateTime? get manufacturingDate;
  @override
  @JsonKey(name: 'retest_date', fromJson: dateTimeNullable)
  DateTime? get retestDate;
  @override
  @JsonKey(name: 'retest_date_qc', fromJson: dateTimeNullable)
  DateTime? get retestDateQualityControl;
  @override
  @JsonKey(name: 'shelf_life', fromJson: dateTimeNullable)
  DateTime? get shelfLife;
  @override
  @JsonKey(ignore: true)
  _$$MaterialReceiveDetailImplCopyWith<_$MaterialReceiveDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}
