// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_halal_certificate.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialHalalCertificate _$MaterialHalalCertificateFromJson(
    Map<String, dynamic> json) {
  return _MaterialHalalCertificate.fromJson(json);
}

/// @nodoc
mixin _$MaterialHalalCertificate {
  @JsonKey(name: 'material_group_id')
  String get materialGroupId => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_id')
  String get materialId => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_name')
  String get materialName => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_unit_id')
  String get materialUnitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'halal_certificate_expired', fromJson: dateTimeNullable)
  DateTime? get halalCertificateExpired => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active', defaultValue: false)
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this MaterialHalalCertificate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaterialHalalCertificate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialHalalCertificateCopyWith<MaterialHalalCertificate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialHalalCertificateCopyWith<$Res> {
  factory $MaterialHalalCertificateCopyWith(MaterialHalalCertificate value,
          $Res Function(MaterialHalalCertificate) then) =
      _$MaterialHalalCertificateCopyWithImpl<$Res, MaterialHalalCertificate>;
  @useResult
  $Res call(
      {@JsonKey(name: 'material_group_id') String materialGroupId,
      @JsonKey(name: 'material_id') String materialId,
      @JsonKey(name: 'material_name') String materialName,
      @JsonKey(name: 'material_unit_id') String materialUnitId,
      @JsonKey(name: 'halal_certificate_expired', fromJson: dateTimeNullable)
      DateTime? halalCertificateExpired,
      @JsonKey(name: 'is_active', defaultValue: false) bool isActive});
}

/// @nodoc
class _$MaterialHalalCertificateCopyWithImpl<$Res,
        $Val extends MaterialHalalCertificate>
    implements $MaterialHalalCertificateCopyWith<$Res> {
  _$MaterialHalalCertificateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialHalalCertificate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialGroupId = null,
    Object? materialId = null,
    Object? materialName = null,
    Object? materialUnitId = null,
    Object? halalCertificateExpired = freezed,
    Object? isActive = null,
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
      materialUnitId: null == materialUnitId
          ? _value.materialUnitId
          : materialUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      halalCertificateExpired: freezed == halalCertificateExpired
          ? _value.halalCertificateExpired
          : halalCertificateExpired // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialHalalCertificateImplCopyWith<$Res>
    implements $MaterialHalalCertificateCopyWith<$Res> {
  factory _$$MaterialHalalCertificateImplCopyWith(
          _$MaterialHalalCertificateImpl value,
          $Res Function(_$MaterialHalalCertificateImpl) then) =
      __$$MaterialHalalCertificateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'material_group_id') String materialGroupId,
      @JsonKey(name: 'material_id') String materialId,
      @JsonKey(name: 'material_name') String materialName,
      @JsonKey(name: 'material_unit_id') String materialUnitId,
      @JsonKey(name: 'halal_certificate_expired', fromJson: dateTimeNullable)
      DateTime? halalCertificateExpired,
      @JsonKey(name: 'is_active', defaultValue: false) bool isActive});
}

/// @nodoc
class __$$MaterialHalalCertificateImplCopyWithImpl<$Res>
    extends _$MaterialHalalCertificateCopyWithImpl<$Res,
        _$MaterialHalalCertificateImpl>
    implements _$$MaterialHalalCertificateImplCopyWith<$Res> {
  __$$MaterialHalalCertificateImplCopyWithImpl(
      _$MaterialHalalCertificateImpl _value,
      $Res Function(_$MaterialHalalCertificateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialHalalCertificate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialGroupId = null,
    Object? materialId = null,
    Object? materialName = null,
    Object? materialUnitId = null,
    Object? halalCertificateExpired = freezed,
    Object? isActive = null,
  }) {
    return _then(_$MaterialHalalCertificateImpl(
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
      materialUnitId: null == materialUnitId
          ? _value.materialUnitId
          : materialUnitId // ignore: cast_nullable_to_non_nullable
              as String,
      halalCertificateExpired: freezed == halalCertificateExpired
          ? _value.halalCertificateExpired
          : halalCertificateExpired // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialHalalCertificateImpl extends _MaterialHalalCertificate {
  const _$MaterialHalalCertificateImpl(
      {@JsonKey(name: 'material_group_id') required this.materialGroupId,
      @JsonKey(name: 'material_id') required this.materialId,
      @JsonKey(name: 'material_name') required this.materialName,
      @JsonKey(name: 'material_unit_id') required this.materialUnitId,
      @JsonKey(name: 'halal_certificate_expired', fromJson: dateTimeNullable)
      required this.halalCertificateExpired,
      @JsonKey(name: 'is_active', defaultValue: false) required this.isActive})
      : super._();

  factory _$MaterialHalalCertificateImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialHalalCertificateImplFromJson(json);

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
  @JsonKey(name: 'material_unit_id')
  final String materialUnitId;
  @override
  @JsonKey(name: 'halal_certificate_expired', fromJson: dateTimeNullable)
  final DateTime? halalCertificateExpired;
  @override
  @JsonKey(name: 'is_active', defaultValue: false)
  final bool isActive;

  @override
  String toString() {
    return 'MaterialHalalCertificate(materialGroupId: $materialGroupId, materialId: $materialId, materialName: $materialName, materialUnitId: $materialUnitId, halalCertificateExpired: $halalCertificateExpired, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialHalalCertificateImpl &&
            (identical(other.materialGroupId, materialGroupId) ||
                other.materialGroupId == materialGroupId) &&
            (identical(other.materialId, materialId) ||
                other.materialId == materialId) &&
            (identical(other.materialName, materialName) ||
                other.materialName == materialName) &&
            (identical(other.materialUnitId, materialUnitId) ||
                other.materialUnitId == materialUnitId) &&
            (identical(
                    other.halalCertificateExpired, halalCertificateExpired) ||
                other.halalCertificateExpired == halalCertificateExpired) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, materialGroupId, materialId,
      materialName, materialUnitId, halalCertificateExpired, isActive);

  /// Create a copy of MaterialHalalCertificate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialHalalCertificateImplCopyWith<_$MaterialHalalCertificateImpl>
      get copyWith => __$$MaterialHalalCertificateImplCopyWithImpl<
          _$MaterialHalalCertificateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialHalalCertificateImplToJson(
      this,
    );
  }
}

abstract class _MaterialHalalCertificate extends MaterialHalalCertificate {
  const factory _MaterialHalalCertificate(
      {@JsonKey(name: 'material_group_id')
      required final String materialGroupId,
      @JsonKey(name: 'material_id') required final String materialId,
      @JsonKey(name: 'material_name') required final String materialName,
      @JsonKey(name: 'material_unit_id') required final String materialUnitId,
      @JsonKey(name: 'halal_certificate_expired', fromJson: dateTimeNullable)
      required final DateTime? halalCertificateExpired,
      @JsonKey(name: 'is_active', defaultValue: false)
      required final bool isActive}) = _$MaterialHalalCertificateImpl;
  const _MaterialHalalCertificate._() : super._();

  factory _MaterialHalalCertificate.fromJson(Map<String, dynamic> json) =
      _$MaterialHalalCertificateImpl.fromJson;

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
  @JsonKey(name: 'material_unit_id')
  String get materialUnitId;
  @override
  @JsonKey(name: 'halal_certificate_expired', fromJson: dateTimeNullable)
  DateTime? get halalCertificateExpired;
  @override
  @JsonKey(name: 'is_active', defaultValue: false)
  bool get isActive;

  /// Create a copy of MaterialHalalCertificate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialHalalCertificateImplCopyWith<_$MaterialHalalCertificateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
