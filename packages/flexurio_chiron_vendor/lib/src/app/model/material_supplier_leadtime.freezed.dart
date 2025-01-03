// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_supplier_leadtime.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialSupplierLeadTime _$MaterialSupplierLeadTimeFromJson(
    Map<String, dynamic> json) {
  return _MaterialSupplierLeadTime.fromJson(json);
}

/// @nodoc
mixin _$MaterialSupplierLeadTime {
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'lead_time')
  int get leadTime => throw _privateConstructorUsedError;
  Vendor get vendor => throw _privateConstructorUsedError;
  Material get material => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this MaterialSupplierLeadTime to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaterialSupplierLeadTime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialSupplierLeadTimeCopyWith<MaterialSupplierLeadTime> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialSupplierLeadTimeCopyWith<$Res> {
  factory $MaterialSupplierLeadTimeCopyWith(MaterialSupplierLeadTime value,
          $Res Function(MaterialSupplierLeadTime) then) =
      _$MaterialSupplierLeadTimeCopyWithImpl<$Res, MaterialSupplierLeadTime>;
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'lead_time') int leadTime,
      Vendor vendor,
      Material material,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt});

  $VendorCopyWith<$Res> get vendor;
  $MaterialCopyWith<$Res> get material;
}

/// @nodoc
class _$MaterialSupplierLeadTimeCopyWithImpl<$Res,
        $Val extends MaterialSupplierLeadTime>
    implements $MaterialSupplierLeadTimeCopyWith<$Res> {
  _$MaterialSupplierLeadTimeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialSupplierLeadTime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? leadTime = null,
    Object? vendor = null,
    Object? material = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      leadTime: null == leadTime
          ? _value.leadTime
          : leadTime // ignore: cast_nullable_to_non_nullable
              as int,
      vendor: null == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as Vendor,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of MaterialSupplierLeadTime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VendorCopyWith<$Res> get vendor {
    return $VendorCopyWith<$Res>(_value.vendor, (value) {
      return _then(_value.copyWith(vendor: value) as $Val);
    });
  }

  /// Create a copy of MaterialSupplierLeadTime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialCopyWith<$Res> get material {
    return $MaterialCopyWith<$Res>(_value.material, (value) {
      return _then(_value.copyWith(material: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MaterialSupplierLeadTimeImplCopyWith<$Res>
    implements $MaterialSupplierLeadTimeCopyWith<$Res> {
  factory _$$MaterialSupplierLeadTimeImplCopyWith(
          _$MaterialSupplierLeadTimeImpl value,
          $Res Function(_$MaterialSupplierLeadTimeImpl) then) =
      __$$MaterialSupplierLeadTimeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      @JsonKey(name: 'lead_time') int leadTime,
      Vendor vendor,
      Material material,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt});

  @override
  $VendorCopyWith<$Res> get vendor;
  @override
  $MaterialCopyWith<$Res> get material;
}

/// @nodoc
class __$$MaterialSupplierLeadTimeImplCopyWithImpl<$Res>
    extends _$MaterialSupplierLeadTimeCopyWithImpl<$Res,
        _$MaterialSupplierLeadTimeImpl>
    implements _$$MaterialSupplierLeadTimeImplCopyWith<$Res> {
  __$$MaterialSupplierLeadTimeImplCopyWithImpl(
      _$MaterialSupplierLeadTimeImpl _value,
      $Res Function(_$MaterialSupplierLeadTimeImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialSupplierLeadTime
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? leadTime = null,
    Object? vendor = null,
    Object? material = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$MaterialSupplierLeadTimeImpl(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      null == leadTime
          ? _value.leadTime
          : leadTime // ignore: cast_nullable_to_non_nullable
              as int,
      null == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as Vendor,
      null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
      null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialSupplierLeadTimeImpl extends _MaterialSupplierLeadTime {
  const _$MaterialSupplierLeadTimeImpl(
      this.id,
      @JsonKey(name: 'lead_time') this.leadTime,
      this.vendor,
      this.material,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) this.updatedAt)
      : super._();

  factory _$MaterialSupplierLeadTimeImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialSupplierLeadTimeImplFromJson(json);

  @override
  final int? id;
  @override
  @JsonKey(name: 'lead_time')
  final int leadTime;
  @override
  final Vendor vendor;
  @override
  final Material material;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;

  @override
  String toString() {
    return 'MaterialSupplierLeadTime(id: $id, leadTime: $leadTime, vendor: $vendor, material: $material, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialSupplierLeadTimeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.leadTime, leadTime) ||
                other.leadTime == leadTime) &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, leadTime, vendor, material, createdAt, updatedAt);

  /// Create a copy of MaterialSupplierLeadTime
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialSupplierLeadTimeImplCopyWith<_$MaterialSupplierLeadTimeImpl>
      get copyWith => __$$MaterialSupplierLeadTimeImplCopyWithImpl<
          _$MaterialSupplierLeadTimeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialSupplierLeadTimeImplToJson(
      this,
    );
  }
}

abstract class _MaterialSupplierLeadTime extends MaterialSupplierLeadTime {
  const factory _MaterialSupplierLeadTime(
      final int? id,
      @JsonKey(name: 'lead_time') final int leadTime,
      final Vendor vendor,
      final Material material,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      final DateTime updatedAt) = _$MaterialSupplierLeadTimeImpl;
  const _MaterialSupplierLeadTime._() : super._();

  factory _MaterialSupplierLeadTime.fromJson(Map<String, dynamic> json) =
      _$MaterialSupplierLeadTimeImpl.fromJson;

  @override
  int? get id;
  @override
  @JsonKey(name: 'lead_time')
  int get leadTime;
  @override
  Vendor get vendor;
  @override
  Material get material;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;

  /// Create a copy of MaterialSupplierLeadTime
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialSupplierLeadTimeImplCopyWith<_$MaterialSupplierLeadTimeImpl>
      get copyWith => throw _privateConstructorUsedError;
}
