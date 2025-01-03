// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_issue_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialIssueDetail _$MaterialIssueDetailFromJson(Map<String, dynamic> json) {
  return _MaterialIssueDetail.fromJson(json);
}

/// @nodoc
mixin _$MaterialIssueDetail {
  int get id => throw _privateConstructorUsedError;
  String get na => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
  DateTime get dueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updatedById => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_issue', fromJson: MaterialIssue.fromJson)
  MaterialIssue get materialIssue => throw _privateConstructorUsedError;
  @JsonKey(name: 'material', fromJson: Material.fromJson)
  Material get material => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get materialUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'warehouse', fromJson: Warehouse.fromString)
  Warehouse get warehouse => throw _privateConstructorUsedError;
  @JsonKey(name: 'weighted_quantity')
  double get weightedQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'weighted_unit')
  String get weightedUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'design_code')
  String? get designCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_required')
  double get quantityRequired => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MaterialIssueDetailCopyWith<MaterialIssueDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialIssueDetailCopyWith<$Res> {
  factory $MaterialIssueDetailCopyWith(
          MaterialIssueDetail value, $Res Function(MaterialIssueDetail) then) =
      _$MaterialIssueDetailCopyWithImpl<$Res, MaterialIssueDetail>;
  @useResult
  $Res call(
      {int id,
      String na,
      double quantity,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime) DateTime dueDate,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'material_issue', fromJson: MaterialIssue.fromJson)
      MaterialIssue materialIssue,
      @JsonKey(name: 'material', fromJson: Material.fromJson) Material material,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      MaterialUnit materialUnit,
      @JsonKey(name: 'warehouse', fromJson: Warehouse.fromString)
      Warehouse warehouse,
      @JsonKey(name: 'weighted_quantity') double weightedQuantity,
      @JsonKey(name: 'weighted_unit') String weightedUnit,
      @JsonKey(name: 'design_code') String? designCode,
      @JsonKey(name: 'quantity_required') double quantityRequired});

  $MaterialIssueCopyWith<$Res> get materialIssue;
  $MaterialCopyWith<$Res> get material;
  $MaterialUnitCopyWith<$Res> get materialUnit;
}

/// @nodoc
class _$MaterialIssueDetailCopyWithImpl<$Res, $Val extends MaterialIssueDetail>
    implements $MaterialIssueDetailCopyWith<$Res> {
  _$MaterialIssueDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? na = null,
    Object? quantity = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? dueDate = null,
    Object? updatedById = null,
    Object? materialIssue = null,
    Object? material = null,
    Object? materialUnit = null,
    Object? warehouse = null,
    Object? weightedQuantity = null,
    Object? weightedUnit = null,
    Object? designCode = freezed,
    Object? quantityRequired = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
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
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
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
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as Warehouse,
      weightedQuantity: null == weightedQuantity
          ? _value.weightedQuantity
          : weightedQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      weightedUnit: null == weightedUnit
          ? _value.weightedUnit
          : weightedUnit // ignore: cast_nullable_to_non_nullable
              as String,
      designCode: freezed == designCode
          ? _value.designCode
          : designCode // ignore: cast_nullable_to_non_nullable
              as String?,
      quantityRequired: null == quantityRequired
          ? _value.quantityRequired
          : quantityRequired // ignore: cast_nullable_to_non_nullable
              as double,
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
abstract class _$$MaterialIssueDetailImplCopyWith<$Res>
    implements $MaterialIssueDetailCopyWith<$Res> {
  factory _$$MaterialIssueDetailImplCopyWith(_$MaterialIssueDetailImpl value,
          $Res Function(_$MaterialIssueDetailImpl) then) =
      __$$MaterialIssueDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String na,
      double quantity,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime) DateTime dueDate,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'material_issue', fromJson: MaterialIssue.fromJson)
      MaterialIssue materialIssue,
      @JsonKey(name: 'material', fromJson: Material.fromJson) Material material,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      MaterialUnit materialUnit,
      @JsonKey(name: 'warehouse', fromJson: Warehouse.fromString)
      Warehouse warehouse,
      @JsonKey(name: 'weighted_quantity') double weightedQuantity,
      @JsonKey(name: 'weighted_unit') String weightedUnit,
      @JsonKey(name: 'design_code') String? designCode,
      @JsonKey(name: 'quantity_required') double quantityRequired});

  @override
  $MaterialIssueCopyWith<$Res> get materialIssue;
  @override
  $MaterialCopyWith<$Res> get material;
  @override
  $MaterialUnitCopyWith<$Res> get materialUnit;
}

/// @nodoc
class __$$MaterialIssueDetailImplCopyWithImpl<$Res>
    extends _$MaterialIssueDetailCopyWithImpl<$Res, _$MaterialIssueDetailImpl>
    implements _$$MaterialIssueDetailImplCopyWith<$Res> {
  __$$MaterialIssueDetailImplCopyWithImpl(_$MaterialIssueDetailImpl _value,
      $Res Function(_$MaterialIssueDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? na = null,
    Object? quantity = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? dueDate = null,
    Object? updatedById = null,
    Object? materialIssue = null,
    Object? material = null,
    Object? materialUnit = null,
    Object? warehouse = null,
    Object? weightedQuantity = null,
    Object? weightedUnit = null,
    Object? designCode = freezed,
    Object? quantityRequired = null,
  }) {
    return _then(_$MaterialIssueDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      na: null == na
          ? _value.na
          : na // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
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
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
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
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as Warehouse,
      weightedQuantity: null == weightedQuantity
          ? _value.weightedQuantity
          : weightedQuantity // ignore: cast_nullable_to_non_nullable
              as double,
      weightedUnit: null == weightedUnit
          ? _value.weightedUnit
          : weightedUnit // ignore: cast_nullable_to_non_nullable
              as String,
      designCode: freezed == designCode
          ? _value.designCode
          : designCode // ignore: cast_nullable_to_non_nullable
              as String?,
      quantityRequired: null == quantityRequired
          ? _value.quantityRequired
          : quantityRequired // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialIssueDetailImpl extends _MaterialIssueDetail {
  _$MaterialIssueDetailImpl(
      {required this.id,
      required this.na,
      required this.quantity,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
      required this.dueDate,
      @JsonKey(name: 'updated_by_id') required this.updatedById,
      @JsonKey(name: 'material_issue', fromJson: MaterialIssue.fromJson)
      required this.materialIssue,
      @JsonKey(name: 'material', fromJson: Material.fromJson)
      required this.material,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      required this.materialUnit,
      @JsonKey(name: 'warehouse', fromJson: Warehouse.fromString)
      required this.warehouse,
      @JsonKey(name: 'weighted_quantity') required this.weightedQuantity,
      @JsonKey(name: 'weighted_unit') required this.weightedUnit,
      @JsonKey(name: 'design_code') this.designCode,
      @JsonKey(name: 'quantity_required') required this.quantityRequired})
      : super._();

  factory _$MaterialIssueDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialIssueDetailImplFromJson(json);

  @override
  final int id;
  @override
  final String na;
  @override
  final double quantity;
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
  @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
  final DateTime dueDate;
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
  @JsonKey(name: 'warehouse', fromJson: Warehouse.fromString)
  final Warehouse warehouse;
  @override
  @JsonKey(name: 'weighted_quantity')
  final double weightedQuantity;
  @override
  @JsonKey(name: 'weighted_unit')
  final String weightedUnit;
  @override
  @JsonKey(name: 'design_code')
  final String? designCode;
  @override
  @JsonKey(name: 'quantity_required')
  final double quantityRequired;

  @override
  String toString() {
    return 'MaterialIssueDetail(id: $id, na: $na, quantity: $quantity, createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, dueDate: $dueDate, updatedById: $updatedById, materialIssue: $materialIssue, material: $material, materialUnit: $materialUnit, warehouse: $warehouse, weightedQuantity: $weightedQuantity, weightedUnit: $weightedUnit, designCode: $designCode, quantityRequired: $quantityRequired)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialIssueDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.na, na) || other.na == na) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.materialIssue, materialIssue) ||
                other.materialIssue == materialIssue) &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.materialUnit, materialUnit) ||
                other.materialUnit == materialUnit) &&
            (identical(other.warehouse, warehouse) ||
                other.warehouse == warehouse) &&
            (identical(other.weightedQuantity, weightedQuantity) ||
                other.weightedQuantity == weightedQuantity) &&
            (identical(other.weightedUnit, weightedUnit) ||
                other.weightedUnit == weightedUnit) &&
            (identical(other.designCode, designCode) ||
                other.designCode == designCode) &&
            (identical(other.quantityRequired, quantityRequired) ||
                other.quantityRequired == quantityRequired));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      na,
      quantity,
      createdAt,
      createdById,
      updatedAt,
      dueDate,
      updatedById,
      materialIssue,
      material,
      materialUnit,
      warehouse,
      weightedQuantity,
      weightedUnit,
      designCode,
      quantityRequired);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialIssueDetailImplCopyWith<_$MaterialIssueDetailImpl> get copyWith =>
      __$$MaterialIssueDetailImplCopyWithImpl<_$MaterialIssueDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialIssueDetailImplToJson(
      this,
    );
  }
}

abstract class _MaterialIssueDetail extends MaterialIssueDetail {
  factory _MaterialIssueDetail(
      {required final int id,
      required final String na,
      required final double quantity,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
      required final DateTime dueDate,
      @JsonKey(name: 'updated_by_id') required final int updatedById,
      @JsonKey(name: 'material_issue', fromJson: MaterialIssue.fromJson)
      required final MaterialIssue materialIssue,
      @JsonKey(name: 'material', fromJson: Material.fromJson)
      required final Material material,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      required final MaterialUnit materialUnit,
      @JsonKey(name: 'warehouse', fromJson: Warehouse.fromString)
      required final Warehouse warehouse,
      @JsonKey(name: 'weighted_quantity')
      required final double weightedQuantity,
      @JsonKey(name: 'weighted_unit') required final String weightedUnit,
      @JsonKey(name: 'design_code') final String? designCode,
      @JsonKey(name: 'quantity_required')
      required final double quantityRequired}) = _$MaterialIssueDetailImpl;
  _MaterialIssueDetail._() : super._();

  factory _MaterialIssueDetail.fromJson(Map<String, dynamic> json) =
      _$MaterialIssueDetailImpl.fromJson;

  @override
  int get id;
  @override
  String get na;
  @override
  double get quantity;
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
  @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
  DateTime get dueDate;
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
  @JsonKey(name: 'warehouse', fromJson: Warehouse.fromString)
  Warehouse get warehouse;
  @override
  @JsonKey(name: 'weighted_quantity')
  double get weightedQuantity;
  @override
  @JsonKey(name: 'weighted_unit')
  String get weightedUnit;
  @override
  @JsonKey(name: 'design_code')
  String? get designCode;
  @override
  @JsonKey(name: 'quantity_required')
  double get quantityRequired;
  @override
  @JsonKey(ignore: true)
  _$$MaterialIssueDetailImplCopyWith<_$MaterialIssueDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
