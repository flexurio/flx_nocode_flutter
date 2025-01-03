// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leadtime_material.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LeadtimeMaterial _$LeadtimeMaterialFromJson(Map<String, dynamic> json) {
  return _LeadtimeMaterial.fromJson(json);
}

/// @nodoc
mixin _$LeadtimeMaterial {
  @JsonKey(name: 'material_group_id')
  String get materialGroupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_id')
  String get materialId => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_name')
  String get materialName => throw _privateConstructorUsedError;
  @JsonKey(name: 'vendor_id')
  String get vendorId => throw _privateConstructorUsedError;
  @JsonKey(name: 'vendor_name')
  String get vendorName => throw _privateConstructorUsedError;
  @JsonKey(name: 'lead_time')
  int get leadTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'pack_size')
  int get packSize => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_unit_id')
  String get materialUnitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'stock_unit_id')
  String get stockUnitId => throw _privateConstructorUsedError;

  /// Serializes this LeadtimeMaterial to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeadtimeMaterial
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeadtimeMaterialCopyWith<LeadtimeMaterial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeadtimeMaterialCopyWith<$Res> {
  factory $LeadtimeMaterialCopyWith(
          LeadtimeMaterial value, $Res Function(LeadtimeMaterial) then) =
      _$LeadtimeMaterialCopyWithImpl<$Res, LeadtimeMaterial>;
  @useResult
  $Res call(
      {@JsonKey(name: 'material_group_id') String materialGroupId,
      @JsonKey(name: 'material_id') String materialId,
      @JsonKey(name: 'material_name') String materialName,
      @JsonKey(name: 'vendor_id') String vendorId,
      @JsonKey(name: 'vendor_name') String vendorName,
      @JsonKey(name: 'lead_time') int leadTime,
      @JsonKey(name: 'pack_size') int packSize,
      @JsonKey(name: 'material_unit_id') String materialUnitId,
      @JsonKey(name: 'stock_unit_id') String stockUnitId});
}

/// @nodoc
class _$LeadtimeMaterialCopyWithImpl<$Res, $Val extends LeadtimeMaterial>
    implements $LeadtimeMaterialCopyWith<$Res> {
  _$LeadtimeMaterialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeadtimeMaterial
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialGroupId = null,
    Object? materialId = null,
    Object? materialName = null,
    Object? vendorId = null,
    Object? vendorName = null,
    Object? leadTime = null,
    Object? packSize = null,
    Object? materialUnitId = null,
    Object? stockUnitId = null,
  }) {
    return _then(_value.copyWith(
      materialGroupId: null == materialGroupId
          ? _value.materialGroupId
          : materialGroupId // ignore: cast_nullable_to_non_nullable
              as String,
      materialId: null == materialId
          ? _value.materialId
          : materialId // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      vendorId: null == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String,
      vendorName: null == vendorName
          ? _value.vendorName
          : vendorName // ignore: cast_nullable_to_non_nullable
              as String,
      leadTime: null == leadTime
          ? _value.leadTime
          : leadTime // ignore: cast_nullable_to_non_nullable
              as int,
      packSize: null == packSize
          ? _value.packSize
          : packSize // ignore: cast_nullable_to_non_nullable
              as int,
      materialUnitId: null == materialUnitId
          ? _value.materialUnitId
          : materialUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      stockUnitId: null == stockUnitId
          ? _value.stockUnitId
          : stockUnitId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LeadtimeMaterialImplCopyWith<$Res>
    implements $LeadtimeMaterialCopyWith<$Res> {
  factory _$$LeadtimeMaterialImplCopyWith(_$LeadtimeMaterialImpl value,
          $Res Function(_$LeadtimeMaterialImpl) then) =
      __$$LeadtimeMaterialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'material_group_id') String materialGroupId,
      @JsonKey(name: 'material_id') String materialId,
      @JsonKey(name: 'material_name') String materialName,
      @JsonKey(name: 'vendor_id') String vendorId,
      @JsonKey(name: 'vendor_name') String vendorName,
      @JsonKey(name: 'lead_time') int leadTime,
      @JsonKey(name: 'pack_size') int packSize,
      @JsonKey(name: 'material_unit_id') String materialUnitId,
      @JsonKey(name: 'stock_unit_id') String stockUnitId});
}

/// @nodoc
class __$$LeadtimeMaterialImplCopyWithImpl<$Res>
    extends _$LeadtimeMaterialCopyWithImpl<$Res, _$LeadtimeMaterialImpl>
    implements _$$LeadtimeMaterialImplCopyWith<$Res> {
  __$$LeadtimeMaterialImplCopyWithImpl(_$LeadtimeMaterialImpl _value,
      $Res Function(_$LeadtimeMaterialImpl) _then)
      : super(_value, _then);

  /// Create a copy of LeadtimeMaterial
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialGroupId = null,
    Object? materialId = null,
    Object? materialName = null,
    Object? vendorId = null,
    Object? vendorName = null,
    Object? leadTime = null,
    Object? packSize = null,
    Object? materialUnitId = null,
    Object? stockUnitId = null,
  }) {
    return _then(_$LeadtimeMaterialImpl(
      materialGroupId: null == materialGroupId
          ? _value.materialGroupId
          : materialGroupId // ignore: cast_nullable_to_non_nullable
              as String,
      materialId: null == materialId
          ? _value.materialId
          : materialId // ignore: cast_nullable_to_non_nullable
              as String,
      materialName: null == materialName
          ? _value.materialName
          : materialName // ignore: cast_nullable_to_non_nullable
              as String,
      vendorId: null == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String,
      vendorName: null == vendorName
          ? _value.vendorName
          : vendorName // ignore: cast_nullable_to_non_nullable
              as String,
      leadTime: null == leadTime
          ? _value.leadTime
          : leadTime // ignore: cast_nullable_to_non_nullable
              as int,
      packSize: null == packSize
          ? _value.packSize
          : packSize // ignore: cast_nullable_to_non_nullable
              as int,
      materialUnitId: null == materialUnitId
          ? _value.materialUnitId
          : materialUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      stockUnitId: null == stockUnitId
          ? _value.stockUnitId
          : stockUnitId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeadtimeMaterialImpl extends _LeadtimeMaterial {
  const _$LeadtimeMaterialImpl(
      {@JsonKey(name: 'material_group_id') required this.materialGroupId,
      @JsonKey(name: 'material_id') required this.materialId,
      @JsonKey(name: 'material_name') required this.materialName,
      @JsonKey(name: 'vendor_id') required this.vendorId,
      @JsonKey(name: 'vendor_name') required this.vendorName,
      @JsonKey(name: 'lead_time') required this.leadTime,
      @JsonKey(name: 'pack_size') required this.packSize,
      @JsonKey(name: 'material_unit_id') required this.materialUnitId,
      @JsonKey(name: 'stock_unit_id') required this.stockUnitId})
      : super._();

  factory _$LeadtimeMaterialImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeadtimeMaterialImplFromJson(json);

  @override
  @JsonKey(name: 'material_group_id')
  final String materialGroupId;
  @override
  @JsonKey(name: 'material_id')
  final String materialId;
  @override
  @JsonKey(name: 'material_name')
  final String materialName;
  @override
  @JsonKey(name: 'vendor_id')
  final String vendorId;
  @override
  @JsonKey(name: 'vendor_name')
  final String vendorName;
  @override
  @JsonKey(name: 'lead_time')
  final int leadTime;
  @override
  @JsonKey(name: 'pack_size')
  final int packSize;
  @override
  @JsonKey(name: 'material_unit_id')
  final String materialUnitId;
  @override
  @JsonKey(name: 'stock_unit_id')
  final String stockUnitId;

  @override
  String toString() {
    return 'LeadtimeMaterial(materialGroupId: $materialGroupId, materialId: $materialId, materialName: $materialName, vendorId: $vendorId, vendorName: $vendorName, leadTime: $leadTime, packSize: $packSize, materialUnitId: $materialUnitId, stockUnitId: $stockUnitId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeadtimeMaterialImpl &&
            (identical(other.materialGroupId, materialGroupId) ||
                other.materialGroupId == materialGroupId) &&
            (identical(other.materialId, materialId) ||
                other.materialId == materialId) &&
            (identical(other.materialName, materialName) ||
                other.materialName == materialName) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId) &&
            (identical(other.vendorName, vendorName) ||
                other.vendorName == vendorName) &&
            (identical(other.leadTime, leadTime) ||
                other.leadTime == leadTime) &&
            (identical(other.packSize, packSize) ||
                other.packSize == packSize) &&
            (identical(other.materialUnitId, materialUnitId) ||
                other.materialUnitId == materialUnitId) &&
            (identical(other.stockUnitId, stockUnitId) ||
                other.stockUnitId == stockUnitId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      materialGroupId,
      materialId,
      materialName,
      vendorId,
      vendorName,
      leadTime,
      packSize,
      materialUnitId,
      stockUnitId);

  /// Create a copy of LeadtimeMaterial
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeadtimeMaterialImplCopyWith<_$LeadtimeMaterialImpl> get copyWith =>
      __$$LeadtimeMaterialImplCopyWithImpl<_$LeadtimeMaterialImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeadtimeMaterialImplToJson(
      this,
    );
  }
}

abstract class _LeadtimeMaterial extends LeadtimeMaterial {
  const factory _LeadtimeMaterial(
      {@JsonKey(name: 'material_group_id')
      required final String materialGroupId,
      @JsonKey(name: 'material_id') required final String materialId,
      @JsonKey(name: 'material_name') required final String materialName,
      @JsonKey(name: 'vendor_id') required final String vendorId,
      @JsonKey(name: 'vendor_name') required final String vendorName,
      @JsonKey(name: 'lead_time') required final int leadTime,
      @JsonKey(name: 'pack_size') required final int packSize,
      @JsonKey(name: 'material_unit_id') required final String materialUnitId,
      @JsonKey(name: 'stock_unit_id')
      required final String stockUnitId}) = _$LeadtimeMaterialImpl;
  const _LeadtimeMaterial._() : super._();

  factory _LeadtimeMaterial.fromJson(Map<String, dynamic> json) =
      _$LeadtimeMaterialImpl.fromJson;

  @override
  @JsonKey(name: 'material_group_id')
  String get materialGroupId;
  @override
  @JsonKey(name: 'material_id')
  String get materialId;
  @override
  @JsonKey(name: 'material_name')
  String get materialName;
  @override
  @JsonKey(name: 'vendor_id')
  String get vendorId;
  @override
  @JsonKey(name: 'vendor_name')
  String get vendorName;
  @override
  @JsonKey(name: 'lead_time')
  int get leadTime;
  @override
  @JsonKey(name: 'pack_size')
  int get packSize;
  @override
  @JsonKey(name: 'material_unit_id')
  String get materialUnitId;
  @override
  @JsonKey(name: 'stock_unit_id')
  String get stockUnitId;

  /// Create a copy of LeadtimeMaterial
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeadtimeMaterialImplCopyWith<_$LeadtimeMaterialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
