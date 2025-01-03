// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_issue_detail_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialIssuesDetailReport _$MaterialIssuesDetailReportFromJson(
    Map<String, dynamic> json) {
  return _MaterialIssuesDetailReport.fromJson(json);
}

/// @nodoc
mixin _$MaterialIssuesDetailReport {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updatedById => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_issue', fromJson: MaterialIssue.fromJson)
  MaterialIssue get materialIssue => throw _privateConstructorUsedError;
  @JsonKey(name: 'material', fromJson: Material.fromJson)
  Material get material => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get materialUnit => throw _privateConstructorUsedError;
  String get na => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_required')
  double get quantityRequired => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'weighted_quantity')
  double get weightedQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'weighted_unit')
  String get weightedUnit => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_price')
  double get totalPrice => throw _privateConstructorUsedError;
  String get warehouse => throw _privateConstructorUsedError;
  @JsonKey(name: 'design_code')
  String? get designCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
  DateTime? get expiredDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'best_before', fromJson: dateTimeNullable)
  DateTime? get bestBefore => throw _privateConstructorUsedError;
  @JsonKey(name: 'shelf_life', fromJson: dateTimeNullable)
  DateTime? get shelfLife => throw _privateConstructorUsedError;
  @JsonKey(name: 'retest_date', fromJson: dateTimeNullable)
  DateTime? get retestDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'retest_date_qc', fromJson: dateTimeNullable)
  DateTime? get retestDateQc => throw _privateConstructorUsedError;
  @JsonKey(name: 'manufacturing_date', fromJson: isoDateToDateTime)
  DateTime get manufacturingDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialIssuesDetailReportCopyWith<MaterialIssuesDetailReport>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialIssuesDetailReportCopyWith<$Res> {
  factory $MaterialIssuesDetailReportCopyWith(MaterialIssuesDetailReport value,
          $Res Function(MaterialIssuesDetailReport) then) =
      _$MaterialIssuesDetailReportCopyWithImpl<$Res,
          MaterialIssuesDetailReport>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'material_issue', fromJson: MaterialIssue.fromJson)
      MaterialIssue materialIssue,
      @JsonKey(name: 'material', fromJson: Material.fromJson) Material material,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      MaterialUnit materialUnit,
      String na,
      @JsonKey(name: 'quantity_required') double quantityRequired,
      double quantity,
      @JsonKey(name: 'weighted_quantity') double weightedQuantity,
      @JsonKey(name: 'weighted_unit') String weightedUnit,
      int price,
      @JsonKey(name: 'total_price') double totalPrice,
      String warehouse,
      @JsonKey(name: 'design_code') String? designCode,
      @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
      DateTime? expiredDate,
      @JsonKey(name: 'best_before', fromJson: dateTimeNullable)
      DateTime? bestBefore,
      @JsonKey(name: 'shelf_life', fromJson: dateTimeNullable)
      DateTime? shelfLife,
      @JsonKey(name: 'retest_date', fromJson: dateTimeNullable)
      DateTime? retestDate,
      @JsonKey(name: 'retest_date_qc', fromJson: dateTimeNullable)
      DateTime? retestDateQc,
      @JsonKey(name: 'manufacturing_date', fromJson: isoDateToDateTime)
      DateTime manufacturingDate});

  $MaterialIssueCopyWith<$Res> get materialIssue;
  $MaterialCopyWith<$Res> get material;
  $MaterialUnitCopyWith<$Res> get materialUnit;
}

/// @nodoc
class _$MaterialIssuesDetailReportCopyWithImpl<$Res,
        $Val extends MaterialIssuesDetailReport>
    implements $MaterialIssuesDetailReportCopyWith<$Res> {
  _$MaterialIssuesDetailReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updatedById = null,
    Object? materialIssue = null,
    Object? material = null,
    Object? materialUnit = null,
    Object? na = null,
    Object? quantityRequired = null,
    Object? quantity = null,
    Object? weightedQuantity = null,
    Object? weightedUnit = null,
    Object? price = null,
    Object? totalPrice = null,
    Object? warehouse = null,
    Object? designCode = freezed,
    Object? expiredDate = freezed,
    Object? bestBefore = freezed,
    Object? shelfLife = freezed,
    Object? retestDate = freezed,
    Object? retestDateQc = freezed,
    Object? manufacturingDate = null,
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
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      materialIssue: null == materialIssue
          ? _value.materialIssue
          : materialIssue // ignore: cast_nullable_to_non_nullable
              as MaterialIssue,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
      materialUnit: null == materialUnit
          ? _value.materialUnit
          : materialUnit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      quantityRequired: null == quantityRequired
          ? _value.quantityRequired
          : quantityRequired // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      weightedQuantity: null == weightedQuantity
          ? _value.weightedQuantity
          : weightedQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      weightedUnit: null == weightedUnit
          ? _value.weightedUnit
          : weightedUnit // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as String,
      designCode: freezed == designCode
          ? _value.designCode
          : designCode // ignore: cast_nullable_to_non_nullable
              as String?,
      expiredDate: freezed == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bestBefore: freezed == bestBefore
          ? _value.bestBefore
          : bestBefore // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shelfLife: freezed == shelfLife
          ? _value.shelfLife
          : shelfLife // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      retestDate: freezed == retestDate
          ? _value.retestDate
          : retestDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      retestDateQc: freezed == retestDateQc
          ? _value.retestDateQc
          : retestDateQc // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      manufacturingDate: null == manufacturingDate
          ? _value.manufacturingDate
          : manufacturingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialIssueCopyWith<$Res> get materialIssue {
    return $MaterialIssueCopyWith<$Res>(_value.materialIssue, (value) {
      return _then(_value.copyWith(materialIssue: value) as $Val);
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
abstract class _$$MaterialIssuesDetailReportImplCopyWith<$Res>
    implements $MaterialIssuesDetailReportCopyWith<$Res> {
  factory _$$MaterialIssuesDetailReportImplCopyWith(
          _$MaterialIssuesDetailReportImpl value,
          $Res Function(_$MaterialIssuesDetailReportImpl) then) =
      __$$MaterialIssuesDetailReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'material_issue', fromJson: MaterialIssue.fromJson)
      MaterialIssue materialIssue,
      @JsonKey(name: 'material', fromJson: Material.fromJson) Material material,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      MaterialUnit materialUnit,
      String na,
      @JsonKey(name: 'quantity_required') double quantityRequired,
      double quantity,
      @JsonKey(name: 'weighted_quantity') double weightedQuantity,
      @JsonKey(name: 'weighted_unit') String weightedUnit,
      int price,
      @JsonKey(name: 'total_price') double totalPrice,
      String warehouse,
      @JsonKey(name: 'design_code') String? designCode,
      @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
      DateTime? expiredDate,
      @JsonKey(name: 'best_before', fromJson: dateTimeNullable)
      DateTime? bestBefore,
      @JsonKey(name: 'shelf_life', fromJson: dateTimeNullable)
      DateTime? shelfLife,
      @JsonKey(name: 'retest_date', fromJson: dateTimeNullable)
      DateTime? retestDate,
      @JsonKey(name: 'retest_date_qc', fromJson: dateTimeNullable)
      DateTime? retestDateQc,
      @JsonKey(name: 'manufacturing_date', fromJson: isoDateToDateTime)
      DateTime manufacturingDate});

  @override
  $MaterialIssueCopyWith<$Res> get materialIssue;
  @override
  $MaterialCopyWith<$Res> get material;
  @override
  $MaterialUnitCopyWith<$Res> get materialUnit;
}

/// @nodoc
class __$$MaterialIssuesDetailReportImplCopyWithImpl<$Res>
    extends _$MaterialIssuesDetailReportCopyWithImpl<$Res,
        _$MaterialIssuesDetailReportImpl>
    implements _$$MaterialIssuesDetailReportImplCopyWith<$Res> {
  __$$MaterialIssuesDetailReportImplCopyWithImpl(
      _$MaterialIssuesDetailReportImpl _value,
      $Res Function(_$MaterialIssuesDetailReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updatedById = null,
    Object? materialIssue = null,
    Object? material = null,
    Object? materialUnit = null,
    Object? na = null,
    Object? quantityRequired = null,
    Object? quantity = null,
    Object? weightedQuantity = null,
    Object? weightedUnit = null,
    Object? price = null,
    Object? totalPrice = null,
    Object? warehouse = null,
    Object? designCode = freezed,
    Object? expiredDate = freezed,
    Object? bestBefore = freezed,
    Object? shelfLife = freezed,
    Object? retestDate = freezed,
    Object? retestDateQc = freezed,
    Object? manufacturingDate = null,
  }) {
    return _then(_$MaterialIssuesDetailReportImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      materialIssue: null == materialIssue
          ? _value.materialIssue
          : materialIssue // ignore: cast_nullable_to_non_nullable
              as MaterialIssue,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
      materialUnit: null == materialUnit
          ? _value.materialUnit
          : materialUnit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      quantityRequired: null == quantityRequired
          ? _value.quantityRequired
          : quantityRequired // ignore: cast_nullable_to_non_nullable
              as double,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      weightedQuantity: null == weightedQuantity
          ? _value.weightedQuantity
          : weightedQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      weightedUnit: null == weightedUnit
          ? _value.weightedUnit
          : weightedUnit // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double,
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as String,
      designCode: freezed == designCode
          ? _value.designCode
          : designCode // ignore: cast_nullable_to_non_nullable
              as String?,
      expiredDate: freezed == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      bestBefore: freezed == bestBefore
          ? _value.bestBefore
          : bestBefore // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      shelfLife: freezed == shelfLife
          ? _value.shelfLife
          : shelfLife // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      retestDate: freezed == retestDate
          ? _value.retestDate
          : retestDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      retestDateQc: freezed == retestDateQc
          ? _value.retestDateQc
          : retestDateQc // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      manufacturingDate: null == manufacturingDate
          ? _value.manufacturingDate
          : manufacturingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialIssuesDetailReportImpl extends _MaterialIssuesDetailReport {
  _$MaterialIssuesDetailReportImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'updated_by_id') required this.updatedById,
      @JsonKey(name: 'material_issue', fromJson: MaterialIssue.fromJson)
      required this.materialIssue,
      @JsonKey(name: 'material', fromJson: Material.fromJson)
      required this.material,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      required this.materialUnit,
      required this.na,
      @JsonKey(name: 'quantity_required') required this.quantityRequired,
      required this.quantity,
      @JsonKey(name: 'weighted_quantity') required this.weightedQuantity,
      @JsonKey(name: 'weighted_unit') required this.weightedUnit,
      required this.price,
      @JsonKey(name: 'total_price') required this.totalPrice,
      required this.warehouse,
      @JsonKey(name: 'design_code') this.designCode,
      @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
      required this.expiredDate,
      @JsonKey(name: 'best_before', fromJson: dateTimeNullable) this.bestBefore,
      @JsonKey(name: 'shelf_life', fromJson: dateTimeNullable) this.shelfLife,
      @JsonKey(name: 'retest_date', fromJson: dateTimeNullable) this.retestDate,
      @JsonKey(name: 'retest_date_qc', fromJson: dateTimeNullable)
      this.retestDateQc,
      @JsonKey(name: 'manufacturing_date', fromJson: isoDateToDateTime)
      required this.manufacturingDate})
      : super._();

  factory _$MaterialIssuesDetailReportImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MaterialIssuesDetailReportImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'updated_by_id')
  final int updatedById;
  @override
  @JsonKey(name: 'material_issue', fromJson: MaterialIssue.fromJson)
  final MaterialIssue materialIssue;
  @override
  @JsonKey(name: 'material', fromJson: Material.fromJson)
  final Material material;
  @override
  @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
  final MaterialUnit materialUnit;
  @override
  final String na;
  @override
  @JsonKey(name: 'quantity_required')
  final double quantityRequired;
  @override
  final double quantity;
  @override
  @JsonKey(name: 'weighted_quantity')
  final double weightedQuantity;
  @override
  @JsonKey(name: 'weighted_unit')
  final String weightedUnit;
  @override
  final int price;
  @override
  @JsonKey(name: 'total_price')
  final double totalPrice;
  @override
  final String warehouse;
  @override
  @JsonKey(name: 'design_code')
  final String? designCode;
  @override
  @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
  final DateTime? expiredDate;
  @override
  @JsonKey(name: 'best_before', fromJson: dateTimeNullable)
  final DateTime? bestBefore;
  @override
  @JsonKey(name: 'shelf_life', fromJson: dateTimeNullable)
  final DateTime? shelfLife;
  @override
  @JsonKey(name: 'retest_date', fromJson: dateTimeNullable)
  final DateTime? retestDate;
  @override
  @JsonKey(name: 'retest_date_qc', fromJson: dateTimeNullable)
  final DateTime? retestDateQc;
  @override
  @JsonKey(name: 'manufacturing_date', fromJson: isoDateToDateTime)
  final DateTime manufacturingDate;

  @override
  String toString() {
    return 'MaterialIssuesDetailReport(id: $id, createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, updatedById: $updatedById, materialIssue: $materialIssue, material: $material, materialUnit: $materialUnit, na: $na, quantityRequired: $quantityRequired, quantity: $quantity, weightedQuantity: $weightedQuantity, weightedUnit: $weightedUnit, price: $price, totalPrice: $totalPrice, warehouse: $warehouse, designCode: $designCode, expiredDate: $expiredDate, bestBefore: $bestBefore, shelfLife: $shelfLife, retestDate: $retestDate, retestDateQc: $retestDateQc, manufacturingDate: $manufacturingDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialIssuesDetailReportImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.materialIssue, materialIssue) ||
                other.materialIssue == materialIssue) &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.materialUnit, materialUnit) ||
                other.materialUnit == materialUnit) &&
            (identical(other.na, na) || other.na == na) &&
            (identical(other.quantityRequired, quantityRequired) ||
                other.quantityRequired == quantityRequired) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.weightedQuantity, weightedQuantity) ||
                other.weightedQuantity == weightedQuantity) &&
            (identical(other.weightedUnit, weightedUnit) ||
                other.weightedUnit == weightedUnit) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.warehouse, warehouse) ||
                other.warehouse == warehouse) &&
            (identical(other.designCode, designCode) ||
                other.designCode == designCode) &&
            (identical(other.expiredDate, expiredDate) ||
                other.expiredDate == expiredDate) &&
            (identical(other.bestBefore, bestBefore) ||
                other.bestBefore == bestBefore) &&
            (identical(other.shelfLife, shelfLife) ||
                other.shelfLife == shelfLife) &&
            (identical(other.retestDate, retestDate) ||
                other.retestDate == retestDate) &&
            (identical(other.retestDateQc, retestDateQc) ||
                other.retestDateQc == retestDateQc) &&
            (identical(other.manufacturingDate, manufacturingDate) ||
                other.manufacturingDate == manufacturingDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        createdAt,
        createdById,
        updatedAt,
        updatedById,
        materialIssue,
        material,
        materialUnit,
        na,
        quantityRequired,
        quantity,
        weightedQuantity,
        weightedUnit,
        price,
        totalPrice,
        warehouse,
        designCode,
        expiredDate,
        bestBefore,
        shelfLife,
        retestDate,
        retestDateQc,
        manufacturingDate
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialIssuesDetailReportImplCopyWith<_$MaterialIssuesDetailReportImpl>
      get copyWith => __$$MaterialIssuesDetailReportImplCopyWithImpl<
          _$MaterialIssuesDetailReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialIssuesDetailReportImplToJson(
      this,
    );
  }
}

abstract class _MaterialIssuesDetailReport extends MaterialIssuesDetailReport {
  factory _MaterialIssuesDetailReport(
          {required final int id,
          @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
          required final DateTime createdAt,
          @JsonKey(name: 'created_by_id') required final int createdById,
          @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
          required final DateTime updatedAt,
          @JsonKey(name: 'updated_by_id') required final int updatedById,
          @JsonKey(name: 'material_issue', fromJson: MaterialIssue.fromJson)
          required final MaterialIssue materialIssue,
          @JsonKey(name: 'material', fromJson: Material.fromJson)
          required final Material material,
          @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
          required final MaterialUnit materialUnit,
          required final String na,
          @JsonKey(name: 'quantity_required')
          required final double quantityRequired,
          required final double quantity,
          @JsonKey(name: 'weighted_quantity')
          required final double weightedQuantity,
          @JsonKey(name: 'weighted_unit') required final String weightedUnit,
          required final int price,
          @JsonKey(name: 'total_price') required final double totalPrice,
          required final String warehouse,
          @JsonKey(name: 'design_code') final String? designCode,
          @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
          required final DateTime? expiredDate,
          @JsonKey(name: 'best_before', fromJson: dateTimeNullable)
          final DateTime? bestBefore,
          @JsonKey(name: 'shelf_life', fromJson: dateTimeNullable)
          final DateTime? shelfLife,
          @JsonKey(name: 'retest_date', fromJson: dateTimeNullable)
          final DateTime? retestDate,
          @JsonKey(name: 'retest_date_qc', fromJson: dateTimeNullable)
          final DateTime? retestDateQc,
          @JsonKey(name: 'manufacturing_date', fromJson: isoDateToDateTime)
          required final DateTime manufacturingDate}) =
      _$MaterialIssuesDetailReportImpl;
  _MaterialIssuesDetailReport._() : super._();

  factory _MaterialIssuesDetailReport.fromJson(Map<String, dynamic> json) =
      _$MaterialIssuesDetailReportImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'updated_by_id')
  int get updatedById;
  @override
  @JsonKey(name: 'material_issue', fromJson: MaterialIssue.fromJson)
  MaterialIssue get materialIssue;
  @override
  @JsonKey(name: 'material', fromJson: Material.fromJson)
  Material get material;
  @override
  @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get materialUnit;
  @override
  String get na;
  @override
  @JsonKey(name: 'quantity_required')
  double get quantityRequired;
  @override
  double get quantity;
  @override
  @JsonKey(name: 'weighted_quantity')
  double get weightedQuantity;
  @override
  @JsonKey(name: 'weighted_unit')
  String get weightedUnit;
  @override
  int get price;
  @override
  @JsonKey(name: 'total_price')
  double get totalPrice;
  @override
  String get warehouse;
  @override
  @JsonKey(name: 'design_code')
  String? get designCode;
  @override
  @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
  DateTime? get expiredDate;
  @override
  @JsonKey(name: 'best_before', fromJson: dateTimeNullable)
  DateTime? get bestBefore;
  @override
  @JsonKey(name: 'shelf_life', fromJson: dateTimeNullable)
  DateTime? get shelfLife;
  @override
  @JsonKey(name: 'retest_date', fromJson: dateTimeNullable)
  DateTime? get retestDate;
  @override
  @JsonKey(name: 'retest_date_qc', fromJson: dateTimeNullable)
  DateTime? get retestDateQc;
  @override
  @JsonKey(name: 'manufacturing_date', fromJson: isoDateToDateTime)
  DateTime get manufacturingDate;
  @override
  @JsonKey(ignore: true)
  _$$MaterialIssuesDetailReportImplCopyWith<_$MaterialIssuesDetailReportImpl>
      get copyWith => throw _privateConstructorUsedError;
}
