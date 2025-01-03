// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AssetType _$AssetTypeFromJson(Map<String, dynamic> json) {
  return _AssetType.fromJson(json);
}

/// @nodoc
mixin _$AssetType {
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updateById => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount_of_depreciation', defaultValue: 0)
  int? get amountOfDepreciation => throw _privateConstructorUsedError;
  @JsonKey(name: 'coa_invoice', fromJson: ChartOfAccountNumber.fromJson)
  ChartOfAccountNumber get coaInvoice => throw _privateConstructorUsedError;
  @JsonKey(name: 'coa', fromJson: ChartOfAccountNumber.fromJson)
  ChartOfAccountNumber get coa => throw _privateConstructorUsedError;
  @JsonKey(name: 'coa_accumulation', fromJson: ChartOfAccountNumber.fromJson)
  ChartOfAccountNumber get coaAccumulation =>
      throw _privateConstructorUsedError;

  /// Serializes this AssetType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssetType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssetTypeCopyWith<AssetType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetTypeCopyWith<$Res> {
  factory $AssetTypeCopyWith(AssetType value, $Res Function(AssetType) then) =
      _$AssetTypeCopyWithImpl<$Res, AssetType>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      String id,
      String name,
      @JsonKey(name: 'amount_of_depreciation', defaultValue: 0)
      int? amountOfDepreciation,
      @JsonKey(name: 'coa_invoice', fromJson: ChartOfAccountNumber.fromJson)
      ChartOfAccountNumber coaInvoice,
      @JsonKey(name: 'coa', fromJson: ChartOfAccountNumber.fromJson)
      ChartOfAccountNumber coa,
      @JsonKey(
          name: 'coa_accumulation', fromJson: ChartOfAccountNumber.fromJson)
      ChartOfAccountNumber coaAccumulation});

  $ChartOfAccountNumberCopyWith<$Res> get coaInvoice;
  $ChartOfAccountNumberCopyWith<$Res> get coa;
  $ChartOfAccountNumberCopyWith<$Res> get coaAccumulation;
}

/// @nodoc
class _$AssetTypeCopyWithImpl<$Res, $Val extends AssetType>
    implements $AssetTypeCopyWith<$Res> {
  _$AssetTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssetType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
    Object? id = null,
    Object? name = null,
    Object? amountOfDepreciation = freezed,
    Object? coaInvoice = null,
    Object? coa = null,
    Object? coaAccumulation = null,
  }) {
    return _then(_value.copyWith(
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
      updateById: null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      amountOfDepreciation: freezed == amountOfDepreciation
          ? _value.amountOfDepreciation
          : amountOfDepreciation // ignore: cast_nullable_to_non_nullable
              as int?,
      coaInvoice: null == coaInvoice
          ? _value.coaInvoice
          : coaInvoice // ignore: cast_nullable_to_non_nullable
              as ChartOfAccountNumber,
      coa: null == coa
          ? _value.coa
          : coa // ignore: cast_nullable_to_non_nullable
              as ChartOfAccountNumber,
      coaAccumulation: null == coaAccumulation
          ? _value.coaAccumulation
          : coaAccumulation // ignore: cast_nullable_to_non_nullable
              as ChartOfAccountNumber,
    ) as $Val);
  }

  /// Create a copy of AssetType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChartOfAccountNumberCopyWith<$Res> get coaInvoice {
    return $ChartOfAccountNumberCopyWith<$Res>(_value.coaInvoice, (value) {
      return _then(_value.copyWith(coaInvoice: value) as $Val);
    });
  }

  /// Create a copy of AssetType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChartOfAccountNumberCopyWith<$Res> get coa {
    return $ChartOfAccountNumberCopyWith<$Res>(_value.coa, (value) {
      return _then(_value.copyWith(coa: value) as $Val);
    });
  }

  /// Create a copy of AssetType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChartOfAccountNumberCopyWith<$Res> get coaAccumulation {
    return $ChartOfAccountNumberCopyWith<$Res>(_value.coaAccumulation, (value) {
      return _then(_value.copyWith(coaAccumulation: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AssetTypeImplCopyWith<$Res>
    implements $AssetTypeCopyWith<$Res> {
  factory _$$AssetTypeImplCopyWith(
          _$AssetTypeImpl value, $Res Function(_$AssetTypeImpl) then) =
      __$$AssetTypeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      String id,
      String name,
      @JsonKey(name: 'amount_of_depreciation', defaultValue: 0)
      int? amountOfDepreciation,
      @JsonKey(name: 'coa_invoice', fromJson: ChartOfAccountNumber.fromJson)
      ChartOfAccountNumber coaInvoice,
      @JsonKey(name: 'coa', fromJson: ChartOfAccountNumber.fromJson)
      ChartOfAccountNumber coa,
      @JsonKey(
          name: 'coa_accumulation', fromJson: ChartOfAccountNumber.fromJson)
      ChartOfAccountNumber coaAccumulation});

  @override
  $ChartOfAccountNumberCopyWith<$Res> get coaInvoice;
  @override
  $ChartOfAccountNumberCopyWith<$Res> get coa;
  @override
  $ChartOfAccountNumberCopyWith<$Res> get coaAccumulation;
}

/// @nodoc
class __$$AssetTypeImplCopyWithImpl<$Res>
    extends _$AssetTypeCopyWithImpl<$Res, _$AssetTypeImpl>
    implements _$$AssetTypeImplCopyWith<$Res> {
  __$$AssetTypeImplCopyWithImpl(
      _$AssetTypeImpl _value, $Res Function(_$AssetTypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssetType
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
    Object? id = null,
    Object? name = null,
    Object? amountOfDepreciation = freezed,
    Object? coaInvoice = null,
    Object? coa = null,
    Object? coaAccumulation = null,
  }) {
    return _then(_$AssetTypeImpl(
      null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == amountOfDepreciation
          ? _value.amountOfDepreciation
          : amountOfDepreciation // ignore: cast_nullable_to_non_nullable
              as int?,
      null == coaInvoice
          ? _value.coaInvoice
          : coaInvoice // ignore: cast_nullable_to_non_nullable
              as ChartOfAccountNumber,
      null == coa
          ? _value.coa
          : coa // ignore: cast_nullable_to_non_nullable
              as ChartOfAccountNumber,
      null == coaAccumulation
          ? _value.coaAccumulation
          : coaAccumulation // ignore: cast_nullable_to_non_nullable
              as ChartOfAccountNumber,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetTypeImpl extends _AssetType {
  _$AssetTypeImpl(
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) this.createdAt,
      @JsonKey(name: 'created_by_id') this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) this.updatedAt,
      @JsonKey(name: 'updated_by_id') this.updateById,
      this.id,
      this.name,
      @JsonKey(name: 'amount_of_depreciation', defaultValue: 0)
      this.amountOfDepreciation,
      @JsonKey(name: 'coa_invoice', fromJson: ChartOfAccountNumber.fromJson)
      this.coaInvoice,
      @JsonKey(name: 'coa', fromJson: ChartOfAccountNumber.fromJson) this.coa,
      @JsonKey(
          name: 'coa_accumulation', fromJson: ChartOfAccountNumber.fromJson)
      this.coaAccumulation)
      : super._();

  factory _$AssetTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetTypeImplFromJson(json);

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
  final int updateById;
  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: 'amount_of_depreciation', defaultValue: 0)
  final int? amountOfDepreciation;
  @override
  @JsonKey(name: 'coa_invoice', fromJson: ChartOfAccountNumber.fromJson)
  final ChartOfAccountNumber coaInvoice;
  @override
  @JsonKey(name: 'coa', fromJson: ChartOfAccountNumber.fromJson)
  final ChartOfAccountNumber coa;
  @override
  @JsonKey(name: 'coa_accumulation', fromJson: ChartOfAccountNumber.fromJson)
  final ChartOfAccountNumber coaAccumulation;

  @override
  String toString() {
    return 'AssetType(createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, updateById: $updateById, id: $id, name: $name, amountOfDepreciation: $amountOfDepreciation, coaInvoice: $coaInvoice, coa: $coa, coaAccumulation: $coaAccumulation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetTypeImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updateById, updateById) ||
                other.updateById == updateById) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amountOfDepreciation, amountOfDepreciation) ||
                other.amountOfDepreciation == amountOfDepreciation) &&
            (identical(other.coaInvoice, coaInvoice) ||
                other.coaInvoice == coaInvoice) &&
            (identical(other.coa, coa) || other.coa == coa) &&
            (identical(other.coaAccumulation, coaAccumulation) ||
                other.coaAccumulation == coaAccumulation));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      createdById,
      updatedAt,
      updateById,
      id,
      name,
      amountOfDepreciation,
      coaInvoice,
      coa,
      coaAccumulation);

  /// Create a copy of AssetType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetTypeImplCopyWith<_$AssetTypeImpl> get copyWith =>
      __$$AssetTypeImplCopyWithImpl<_$AssetTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetTypeImplToJson(
      this,
    );
  }
}

abstract class _AssetType extends AssetType {
  factory _AssetType(
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      final DateTime createdAt,
      @JsonKey(name: 'created_by_id') final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      final DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') final int updateById,
      final String id,
      final String name,
      @JsonKey(name: 'amount_of_depreciation', defaultValue: 0)
      final int? amountOfDepreciation,
      @JsonKey(name: 'coa_invoice', fromJson: ChartOfAccountNumber.fromJson)
      final ChartOfAccountNumber coaInvoice,
      @JsonKey(name: 'coa', fromJson: ChartOfAccountNumber.fromJson)
      final ChartOfAccountNumber coa,
      @JsonKey(
          name: 'coa_accumulation', fromJson: ChartOfAccountNumber.fromJson)
      final ChartOfAccountNumber coaAccumulation) = _$AssetTypeImpl;
  _AssetType._() : super._();

  factory _AssetType.fromJson(Map<String, dynamic> json) =
      _$AssetTypeImpl.fromJson;

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
  int get updateById;
  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'amount_of_depreciation', defaultValue: 0)
  int? get amountOfDepreciation;
  @override
  @JsonKey(name: 'coa_invoice', fromJson: ChartOfAccountNumber.fromJson)
  ChartOfAccountNumber get coaInvoice;
  @override
  @JsonKey(name: 'coa', fromJson: ChartOfAccountNumber.fromJson)
  ChartOfAccountNumber get coa;
  @override
  @JsonKey(name: 'coa_accumulation', fromJson: ChartOfAccountNumber.fromJson)
  ChartOfAccountNumber get coaAccumulation;

  /// Create a copy of AssetType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssetTypeImplCopyWith<_$AssetTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
