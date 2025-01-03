// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'request_form_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RequestFormDetail _$RequestFormDetailFromJson(Map<String, dynamic> json) {
  return _RequestFormDetail.fromJson(json);
}

/// @nodoc
mixin _$RequestFormDetail {
  int get id => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_request_form_id')
  String? get materialRequestFormId => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_fast_track')
  bool get isFastTrack => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _requestFormDetailStatusFromString)
  RequestFormDetailStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_type', fromJson: MaterialType.fromJsonNullable)
  MaterialType? get materialType => throw _privateConstructorUsedError;
  @JsonKey(name: 'material', fromJson: Material.fromJsonNullable)
  Material? get material => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_request', fromJson: MaterialRequest.fromJsonNullable)
  MaterialRequest? get materialRequest => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJsonNullable)
  MaterialUnit? get unit => throw _privateConstructorUsedError;

  /// Serializes this RequestFormDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RequestFormDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RequestFormDetailCopyWith<RequestFormDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RequestFormDetailCopyWith<$Res> {
  factory $RequestFormDetailCopyWith(
          RequestFormDetail value, $Res Function(RequestFormDetail) then) =
      _$RequestFormDetailCopyWithImpl<$Res, RequestFormDetail>;
  @useResult
  $Res call(
      {int id,
      double quantity,
      @JsonKey(name: 'material_request_form_id') String? materialRequestFormId,
      @JsonKey(name: 'is_fast_track') bool isFastTrack,
      @JsonKey(fromJson: _requestFormDetailStatusFromString)
      RequestFormDetailStatus status,
      @JsonKey(name: 'material_type', fromJson: MaterialType.fromJsonNullable)
      MaterialType? materialType,
      @JsonKey(name: 'material', fromJson: Material.fromJsonNullable)
      Material? material,
      @JsonKey(
          name: 'material_request', fromJson: MaterialRequest.fromJsonNullable)
      MaterialRequest? materialRequest,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJsonNullable)
      MaterialUnit? unit});

  $MaterialTypeCopyWith<$Res>? get materialType;
  $MaterialCopyWith<$Res>? get material;
  $MaterialRequestCopyWith<$Res>? get materialRequest;
  $MaterialUnitCopyWith<$Res>? get unit;
}

/// @nodoc
class _$RequestFormDetailCopyWithImpl<$Res, $Val extends RequestFormDetail>
    implements $RequestFormDetailCopyWith<$Res> {
  _$RequestFormDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RequestFormDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? materialRequestFormId = freezed,
    Object? isFastTrack = null,
    Object? status = null,
    Object? materialType = freezed,
    Object? material = freezed,
    Object? materialRequest = freezed,
    Object? unit = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      materialRequestFormId: freezed == materialRequestFormId
          ? _value.materialRequestFormId
          : materialRequestFormId // ignore: cast_nullable_to_non_nullable
              as String?,
      isFastTrack: null == isFastTrack
          ? _value.isFastTrack
          : isFastTrack // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RequestFormDetailStatus,
      materialType: freezed == materialType
          ? _value.materialType
          : materialType // ignore: cast_nullable_to_non_nullable
              as MaterialType?,
      material: freezed == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material?,
      materialRequest: freezed == materialRequest
          ? _value.materialRequest
          : materialRequest // ignore: cast_nullable_to_non_nullable
              as MaterialRequest?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit?,
    ) as $Val);
  }

  /// Create a copy of RequestFormDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialTypeCopyWith<$Res>? get materialType {
    if (_value.materialType == null) {
      return null;
    }

    return $MaterialTypeCopyWith<$Res>(_value.materialType!, (value) {
      return _then(_value.copyWith(materialType: value) as $Val);
    });
  }

  /// Create a copy of RequestFormDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialCopyWith<$Res>? get material {
    if (_value.material == null) {
      return null;
    }

    return $MaterialCopyWith<$Res>(_value.material!, (value) {
      return _then(_value.copyWith(material: value) as $Val);
    });
  }

  /// Create a copy of RequestFormDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialRequestCopyWith<$Res>? get materialRequest {
    if (_value.materialRequest == null) {
      return null;
    }

    return $MaterialRequestCopyWith<$Res>(_value.materialRequest!, (value) {
      return _then(_value.copyWith(materialRequest: value) as $Val);
    });
  }

  /// Create a copy of RequestFormDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res>? get unit {
    if (_value.unit == null) {
      return null;
    }

    return $MaterialUnitCopyWith<$Res>(_value.unit!, (value) {
      return _then(_value.copyWith(unit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RequestFormDetailImplCopyWith<$Res>
    implements $RequestFormDetailCopyWith<$Res> {
  factory _$$RequestFormDetailImplCopyWith(_$RequestFormDetailImpl value,
          $Res Function(_$RequestFormDetailImpl) then) =
      __$$RequestFormDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      double quantity,
      @JsonKey(name: 'material_request_form_id') String? materialRequestFormId,
      @JsonKey(name: 'is_fast_track') bool isFastTrack,
      @JsonKey(fromJson: _requestFormDetailStatusFromString)
      RequestFormDetailStatus status,
      @JsonKey(name: 'material_type', fromJson: MaterialType.fromJsonNullable)
      MaterialType? materialType,
      @JsonKey(name: 'material', fromJson: Material.fromJsonNullable)
      Material? material,
      @JsonKey(
          name: 'material_request', fromJson: MaterialRequest.fromJsonNullable)
      MaterialRequest? materialRequest,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJsonNullable)
      MaterialUnit? unit});

  @override
  $MaterialTypeCopyWith<$Res>? get materialType;
  @override
  $MaterialCopyWith<$Res>? get material;
  @override
  $MaterialRequestCopyWith<$Res>? get materialRequest;
  @override
  $MaterialUnitCopyWith<$Res>? get unit;
}

/// @nodoc
class __$$RequestFormDetailImplCopyWithImpl<$Res>
    extends _$RequestFormDetailCopyWithImpl<$Res, _$RequestFormDetailImpl>
    implements _$$RequestFormDetailImplCopyWith<$Res> {
  __$$RequestFormDetailImplCopyWithImpl(_$RequestFormDetailImpl _value,
      $Res Function(_$RequestFormDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of RequestFormDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? materialRequestFormId = freezed,
    Object? isFastTrack = null,
    Object? status = null,
    Object? materialType = freezed,
    Object? material = freezed,
    Object? materialRequest = freezed,
    Object? unit = freezed,
  }) {
    return _then(_$RequestFormDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      materialRequestFormId: freezed == materialRequestFormId
          ? _value.materialRequestFormId
          : materialRequestFormId // ignore: cast_nullable_to_non_nullable
              as String?,
      isFastTrack: null == isFastTrack
          ? _value.isFastTrack
          : isFastTrack // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as RequestFormDetailStatus,
      materialType: freezed == materialType
          ? _value.materialType
          : materialType // ignore: cast_nullable_to_non_nullable
              as MaterialType?,
      material: freezed == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material?,
      materialRequest: freezed == materialRequest
          ? _value.materialRequest
          : materialRequest // ignore: cast_nullable_to_non_nullable
              as MaterialRequest?,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RequestFormDetailImpl extends _RequestFormDetail {
  const _$RequestFormDetailImpl(
      {required this.id,
      required this.quantity,
      @JsonKey(name: 'material_request_form_id')
      required this.materialRequestFormId,
      @JsonKey(name: 'is_fast_track') required this.isFastTrack,
      @JsonKey(fromJson: _requestFormDetailStatusFromString)
      required this.status,
      @JsonKey(name: 'material_type', fromJson: MaterialType.fromJsonNullable)
      this.materialType,
      @JsonKey(name: 'material', fromJson: Material.fromJsonNullable)
      this.material,
      @JsonKey(
          name: 'material_request', fromJson: MaterialRequest.fromJsonNullable)
      this.materialRequest,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJsonNullable)
      this.unit})
      : super._();

  factory _$RequestFormDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$RequestFormDetailImplFromJson(json);

  @override
  final int id;
  @override
  final double quantity;
  @override
  @JsonKey(name: 'material_request_form_id')
  final String? materialRequestFormId;
  @override
  @JsonKey(name: 'is_fast_track')
  final bool isFastTrack;
  @override
  @JsonKey(fromJson: _requestFormDetailStatusFromString)
  final RequestFormDetailStatus status;
  @override
  @JsonKey(name: 'material_type', fromJson: MaterialType.fromJsonNullable)
  final MaterialType? materialType;
  @override
  @JsonKey(name: 'material', fromJson: Material.fromJsonNullable)
  final Material? material;
  @override
  @JsonKey(name: 'material_request', fromJson: MaterialRequest.fromJsonNullable)
  final MaterialRequest? materialRequest;
  @override
  @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJsonNullable)
  final MaterialUnit? unit;

  @override
  String toString() {
    return 'RequestFormDetail(id: $id, quantity: $quantity, materialRequestFormId: $materialRequestFormId, isFastTrack: $isFastTrack, status: $status, materialType: $materialType, material: $material, materialRequest: $materialRequest, unit: $unit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RequestFormDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.materialRequestFormId, materialRequestFormId) ||
                other.materialRequestFormId == materialRequestFormId) &&
            (identical(other.isFastTrack, isFastTrack) ||
                other.isFastTrack == isFastTrack) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.materialType, materialType) ||
                other.materialType == materialType) &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.materialRequest, materialRequest) ||
                other.materialRequest == materialRequest) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      quantity,
      materialRequestFormId,
      isFastTrack,
      status,
      materialType,
      material,
      materialRequest,
      unit);

  /// Create a copy of RequestFormDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RequestFormDetailImplCopyWith<_$RequestFormDetailImpl> get copyWith =>
      __$$RequestFormDetailImplCopyWithImpl<_$RequestFormDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RequestFormDetailImplToJson(
      this,
    );
  }
}

abstract class _RequestFormDetail extends RequestFormDetail {
  const factory _RequestFormDetail(
      {required final int id,
      required final double quantity,
      @JsonKey(name: 'material_request_form_id')
      required final String? materialRequestFormId,
      @JsonKey(name: 'is_fast_track') required final bool isFastTrack,
      @JsonKey(fromJson: _requestFormDetailStatusFromString)
      required final RequestFormDetailStatus status,
      @JsonKey(name: 'material_type', fromJson: MaterialType.fromJsonNullable)
      final MaterialType? materialType,
      @JsonKey(name: 'material', fromJson: Material.fromJsonNullable)
      final Material? material,
      @JsonKey(
          name: 'material_request', fromJson: MaterialRequest.fromJsonNullable)
      final MaterialRequest? materialRequest,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJsonNullable)
      final MaterialUnit? unit}) = _$RequestFormDetailImpl;
  const _RequestFormDetail._() : super._();

  factory _RequestFormDetail.fromJson(Map<String, dynamic> json) =
      _$RequestFormDetailImpl.fromJson;

  @override
  int get id;
  @override
  double get quantity;
  @override
  @JsonKey(name: 'material_request_form_id')
  String? get materialRequestFormId;
  @override
  @JsonKey(name: 'is_fast_track')
  bool get isFastTrack;
  @override
  @JsonKey(fromJson: _requestFormDetailStatusFromString)
  RequestFormDetailStatus get status;
  @override
  @JsonKey(name: 'material_type', fromJson: MaterialType.fromJsonNullable)
  MaterialType? get materialType;
  @override
  @JsonKey(name: 'material', fromJson: Material.fromJsonNullable)
  Material? get material;
  @override
  @JsonKey(name: 'material_request', fromJson: MaterialRequest.fromJsonNullable)
  MaterialRequest? get materialRequest;
  @override
  @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJsonNullable)
  MaterialUnit? get unit;

  /// Create a copy of RequestFormDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RequestFormDetailImplCopyWith<_$RequestFormDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
