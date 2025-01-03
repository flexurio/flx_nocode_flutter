// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Material _$MaterialFromJson(Map<String, dynamic> json) {
  return _Material.fromJson(json);
}

/// @nodoc
mixin _$Material {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(defaultValue: '')
  String get company => throw _privateConstructorUsedError;
  @JsonKey(name: 'halal_certificate_id')
  String? get halalCertificateId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_asset', defaultValue: false)
  bool get isAsset => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active', defaultValue: false)
  bool get isActive => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_order', defaultValue: false)
  bool get isOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_stock', defaultValue: false)
  bool get isStock => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get materialUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'stock_unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get stockUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
  MaterialGroup get materialGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_type', fromJson: MaterialType.fromJson)
  MaterialType get materialType => throw _privateConstructorUsedError;
  @JsonKey(name: 'pack_size', defaultValue: 0)
  double get packSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_lock_qty_mi', defaultValue: true)
  bool get isLockQuantityMaterialIssue => throw _privateConstructorUsedError;

  /// Serializes this Material to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Material
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialCopyWith<Material> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialCopyWith<$Res> {
  factory $MaterialCopyWith(Material value, $Res Function(Material) then) =
      _$MaterialCopyWithImpl<$Res, Material>;
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(defaultValue: '') String company,
      @JsonKey(name: 'halal_certificate_id') String? halalCertificateId,
      @JsonKey(name: 'is_asset', defaultValue: false) bool isAsset,
      @JsonKey(name: 'is_active', defaultValue: false) bool isActive,
      @JsonKey(name: 'is_order', defaultValue: false) bool isOrder,
      @JsonKey(name: 'is_stock', defaultValue: false) bool isStock,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      MaterialUnit materialUnit,
      @JsonKey(name: 'stock_unit', fromJson: MaterialUnit.fromJson)
      MaterialUnit stockUnit,
      @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
      MaterialGroup materialGroup,
      @JsonKey(name: 'material_type', fromJson: MaterialType.fromJson)
      MaterialType materialType,
      @JsonKey(name: 'pack_size', defaultValue: 0) double packSize,
      @JsonKey(name: 'is_lock_qty_mi', defaultValue: true)
      bool isLockQuantityMaterialIssue});

  $MaterialUnitCopyWith<$Res> get materialUnit;
  $MaterialUnitCopyWith<$Res> get stockUnit;
  $MaterialGroupCopyWith<$Res> get materialGroup;
  $MaterialTypeCopyWith<$Res> get materialType;
}

/// @nodoc
class _$MaterialCopyWithImpl<$Res, $Val extends Material>
    implements $MaterialCopyWith<$Res> {
  _$MaterialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Material
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? company = null,
    Object? halalCertificateId = freezed,
    Object? isAsset = null,
    Object? isActive = null,
    Object? isOrder = null,
    Object? isStock = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? materialUnit = null,
    Object? stockUnit = null,
    Object? materialGroup = null,
    Object? materialType = null,
    Object? packSize = null,
    Object? isLockQuantityMaterialIssue = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      halalCertificateId: freezed == halalCertificateId
          ? _value.halalCertificateId
          : halalCertificateId // ignore: cast_nullable_to_non_nullable
              as String?,
      isAsset: null == isAsset
          ? _value.isAsset
          : isAsset // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isOrder: null == isOrder
          ? _value.isOrder
          : isOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      isStock: null == isStock
          ? _value.isStock
          : isStock // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      materialUnit: null == materialUnit
          ? _value.materialUnit
          : materialUnit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      stockUnit: null == stockUnit
          ? _value.stockUnit
          : stockUnit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      materialGroup: null == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      materialType: null == materialType
          ? _value.materialType
          : materialType // ignore: cast_nullable_to_non_nullable
              as MaterialType,
      packSize: null == packSize
          ? _value.packSize
          : packSize // ignore: cast_nullable_to_non_nullable
              as double,
      isLockQuantityMaterialIssue: null == isLockQuantityMaterialIssue
          ? _value.isLockQuantityMaterialIssue
          : isLockQuantityMaterialIssue // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of Material
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get materialUnit {
    return $MaterialUnitCopyWith<$Res>(_value.materialUnit, (value) {
      return _then(_value.copyWith(materialUnit: value) as $Val);
    });
  }

  /// Create a copy of Material
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get stockUnit {
    return $MaterialUnitCopyWith<$Res>(_value.stockUnit, (value) {
      return _then(_value.copyWith(stockUnit: value) as $Val);
    });
  }

  /// Create a copy of Material
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialGroupCopyWith<$Res> get materialGroup {
    return $MaterialGroupCopyWith<$Res>(_value.materialGroup, (value) {
      return _then(_value.copyWith(materialGroup: value) as $Val);
    });
  }

  /// Create a copy of Material
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialTypeCopyWith<$Res> get materialType {
    return $MaterialTypeCopyWith<$Res>(_value.materialType, (value) {
      return _then(_value.copyWith(materialType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MaterialImplCopyWith<$Res>
    implements $MaterialCopyWith<$Res> {
  factory _$$MaterialImplCopyWith(
          _$MaterialImpl value, $Res Function(_$MaterialImpl) then) =
      __$$MaterialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(defaultValue: '') String company,
      @JsonKey(name: 'halal_certificate_id') String? halalCertificateId,
      @JsonKey(name: 'is_asset', defaultValue: false) bool isAsset,
      @JsonKey(name: 'is_active', defaultValue: false) bool isActive,
      @JsonKey(name: 'is_order', defaultValue: false) bool isOrder,
      @JsonKey(name: 'is_stock', defaultValue: false) bool isStock,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      MaterialUnit materialUnit,
      @JsonKey(name: 'stock_unit', fromJson: MaterialUnit.fromJson)
      MaterialUnit stockUnit,
      @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
      MaterialGroup materialGroup,
      @JsonKey(name: 'material_type', fromJson: MaterialType.fromJson)
      MaterialType materialType,
      @JsonKey(name: 'pack_size', defaultValue: 0) double packSize,
      @JsonKey(name: 'is_lock_qty_mi', defaultValue: true)
      bool isLockQuantityMaterialIssue});

  @override
  $MaterialUnitCopyWith<$Res> get materialUnit;
  @override
  $MaterialUnitCopyWith<$Res> get stockUnit;
  @override
  $MaterialGroupCopyWith<$Res> get materialGroup;
  @override
  $MaterialTypeCopyWith<$Res> get materialType;
}

/// @nodoc
class __$$MaterialImplCopyWithImpl<$Res>
    extends _$MaterialCopyWithImpl<$Res, _$MaterialImpl>
    implements _$$MaterialImplCopyWith<$Res> {
  __$$MaterialImplCopyWithImpl(
      _$MaterialImpl _value, $Res Function(_$MaterialImpl) _then)
      : super(_value, _then);

  /// Create a copy of Material
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? company = null,
    Object? halalCertificateId = freezed,
    Object? isAsset = null,
    Object? isActive = null,
    Object? isOrder = null,
    Object? isStock = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? materialUnit = null,
    Object? stockUnit = null,
    Object? materialGroup = null,
    Object? materialType = null,
    Object? packSize = null,
    Object? isLockQuantityMaterialIssue = null,
  }) {
    return _then(_$MaterialImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String,
      halalCertificateId: freezed == halalCertificateId
          ? _value.halalCertificateId
          : halalCertificateId // ignore: cast_nullable_to_non_nullable
              as String?,
      isAsset: null == isAsset
          ? _value.isAsset
          : isAsset // ignore: cast_nullable_to_non_nullable
              as bool,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isOrder: null == isOrder
          ? _value.isOrder
          : isOrder // ignore: cast_nullable_to_non_nullable
              as bool,
      isStock: null == isStock
          ? _value.isStock
          : isStock // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      materialUnit: null == materialUnit
          ? _value.materialUnit
          : materialUnit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      stockUnit: null == stockUnit
          ? _value.stockUnit
          : stockUnit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      materialGroup: null == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      materialType: null == materialType
          ? _value.materialType
          : materialType // ignore: cast_nullable_to_non_nullable
              as MaterialType,
      packSize: null == packSize
          ? _value.packSize
          : packSize // ignore: cast_nullable_to_non_nullable
              as double,
      isLockQuantityMaterialIssue: null == isLockQuantityMaterialIssue
          ? _value.isLockQuantityMaterialIssue
          : isLockQuantityMaterialIssue // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialImpl extends _Material {
  const _$MaterialImpl(
      {required this.id,
      required this.name,
      @JsonKey(defaultValue: '') required this.company,
      @JsonKey(name: 'halal_certificate_id') required this.halalCertificateId,
      @JsonKey(name: 'is_asset', defaultValue: false) required this.isAsset,
      @JsonKey(name: 'is_active', defaultValue: false) required this.isActive,
      @JsonKey(name: 'is_order', defaultValue: false) required this.isOrder,
      @JsonKey(name: 'is_stock', defaultValue: false) required this.isStock,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      required this.materialUnit,
      @JsonKey(name: 'stock_unit', fromJson: MaterialUnit.fromJson)
      required this.stockUnit,
      @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
      required this.materialGroup,
      @JsonKey(name: 'material_type', fromJson: MaterialType.fromJson)
      required this.materialType,
      @JsonKey(name: 'pack_size', defaultValue: 0) required this.packSize,
      @JsonKey(name: 'is_lock_qty_mi', defaultValue: true)
      required this.isLockQuantityMaterialIssue})
      : super._();

  factory _$MaterialImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(defaultValue: '')
  final String company;
  @override
  @JsonKey(name: 'halal_certificate_id')
  final String? halalCertificateId;
  @override
  @JsonKey(name: 'is_asset', defaultValue: false)
  final bool isAsset;
  @override
  @JsonKey(name: 'is_active', defaultValue: false)
  final bool isActive;
  @override
  @JsonKey(name: 'is_order', defaultValue: false)
  final bool isOrder;
  @override
  @JsonKey(name: 'is_stock', defaultValue: false)
  final bool isStock;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
  final MaterialUnit materialUnit;
  @override
  @JsonKey(name: 'stock_unit', fromJson: MaterialUnit.fromJson)
  final MaterialUnit stockUnit;
  @override
  @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
  final MaterialGroup materialGroup;
  @override
  @JsonKey(name: 'material_type', fromJson: MaterialType.fromJson)
  final MaterialType materialType;
  @override
  @JsonKey(name: 'pack_size', defaultValue: 0)
  final double packSize;
  @override
  @JsonKey(name: 'is_lock_qty_mi', defaultValue: true)
  final bool isLockQuantityMaterialIssue;

  /// Create a copy of Material
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialImplCopyWith<_$MaterialImpl> get copyWith =>
      __$$MaterialImplCopyWithImpl<_$MaterialImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialImplToJson(
      this,
    );
  }
}

abstract class _Material extends Material {
  const factory _Material(
      {required final String id,
      required final String name,
      @JsonKey(defaultValue: '') required final String company,
      @JsonKey(name: 'halal_certificate_id')
      required final String? halalCertificateId,
      @JsonKey(name: 'is_asset', defaultValue: false)
      required final bool isAsset,
      @JsonKey(name: 'is_active', defaultValue: false)
      required final bool isActive,
      @JsonKey(name: 'is_order', defaultValue: false)
      required final bool isOrder,
      @JsonKey(name: 'is_stock', defaultValue: false)
      required final bool isStock,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      required final MaterialUnit materialUnit,
      @JsonKey(name: 'stock_unit', fromJson: MaterialUnit.fromJson)
      required final MaterialUnit stockUnit,
      @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
      required final MaterialGroup materialGroup,
      @JsonKey(name: 'material_type', fromJson: MaterialType.fromJson)
      required final MaterialType materialType,
      @JsonKey(name: 'pack_size', defaultValue: 0)
      required final double packSize,
      @JsonKey(name: 'is_lock_qty_mi', defaultValue: true)
      required final bool isLockQuantityMaterialIssue}) = _$MaterialImpl;
  const _Material._() : super._();

  factory _Material.fromJson(Map<String, dynamic> json) =
      _$MaterialImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(defaultValue: '')
  String get company;
  @override
  @JsonKey(name: 'halal_certificate_id')
  String? get halalCertificateId;
  @override
  @JsonKey(name: 'is_asset', defaultValue: false)
  bool get isAsset;
  @override
  @JsonKey(name: 'is_active', defaultValue: false)
  bool get isActive;
  @override
  @JsonKey(name: 'is_order', defaultValue: false)
  bool get isOrder;
  @override
  @JsonKey(name: 'is_stock', defaultValue: false)
  bool get isStock;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get materialUnit;
  @override
  @JsonKey(name: 'stock_unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get stockUnit;
  @override
  @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
  MaterialGroup get materialGroup;
  @override
  @JsonKey(name: 'material_type', fromJson: MaterialType.fromJson)
  MaterialType get materialType;
  @override
  @JsonKey(name: 'pack_size', defaultValue: 0)
  double get packSize;
  @override
  @JsonKey(name: 'is_lock_qty_mi', defaultValue: true)
  bool get isLockQuantityMaterialIssue;

  /// Create a copy of Material
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialImplCopyWith<_$MaterialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
