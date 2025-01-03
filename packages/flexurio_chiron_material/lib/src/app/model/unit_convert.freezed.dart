// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unit_convert.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UnitConvert _$UnitConvertFromJson(Map<String, dynamic> json) {
  return _UnitConvert.fromJson(json);
}

/// @nodoc
mixin _$UnitConvert {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'convert_formula')
  String get formula => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get materialUnit => throw _privateConstructorUsedError;
  @JsonKey(name: 'converted_unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get convertUnit => throw _privateConstructorUsedError;

  /// Serializes this UnitConvert to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UnitConvert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UnitConvertCopyWith<UnitConvert> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnitConvertCopyWith<$Res> {
  factory $UnitConvertCopyWith(
          UnitConvert value, $Res Function(UnitConvert) then) =
      _$UnitConvertCopyWithImpl<$Res, UnitConvert>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'convert_formula') String formula,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      MaterialUnit materialUnit,
      @JsonKey(name: 'converted_unit', fromJson: MaterialUnit.fromJson)
      MaterialUnit convertUnit});

  $MaterialUnitCopyWith<$Res> get materialUnit;
  $MaterialUnitCopyWith<$Res> get convertUnit;
}

/// @nodoc
class _$UnitConvertCopyWithImpl<$Res, $Val extends UnitConvert>
    implements $UnitConvertCopyWith<$Res> {
  _$UnitConvertCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UnitConvert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? formula = null,
    Object? materialUnit = null,
    Object? convertUnit = null,
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
      formula: null == formula
          ? _value.formula
          : formula // ignore: cast_nullable_to_non_nullable
              as String,
      materialUnit: null == materialUnit
          ? _value.materialUnit
          : materialUnit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      convertUnit: null == convertUnit
          ? _value.convertUnit
          : convertUnit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
    ) as $Val);
  }

  /// Create a copy of UnitConvert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get materialUnit {
    return $MaterialUnitCopyWith<$Res>(_value.materialUnit, (value) {
      return _then(_value.copyWith(materialUnit: value) as $Val);
    });
  }

  /// Create a copy of UnitConvert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get convertUnit {
    return $MaterialUnitCopyWith<$Res>(_value.convertUnit, (value) {
      return _then(_value.copyWith(convertUnit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UnitConvertImplCopyWith<$Res>
    implements $UnitConvertCopyWith<$Res> {
  factory _$$UnitConvertImplCopyWith(
          _$UnitConvertImpl value, $Res Function(_$UnitConvertImpl) then) =
      __$$UnitConvertImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'convert_formula') String formula,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      MaterialUnit materialUnit,
      @JsonKey(name: 'converted_unit', fromJson: MaterialUnit.fromJson)
      MaterialUnit convertUnit});

  @override
  $MaterialUnitCopyWith<$Res> get materialUnit;
  @override
  $MaterialUnitCopyWith<$Res> get convertUnit;
}

/// @nodoc
class __$$UnitConvertImplCopyWithImpl<$Res>
    extends _$UnitConvertCopyWithImpl<$Res, _$UnitConvertImpl>
    implements _$$UnitConvertImplCopyWith<$Res> {
  __$$UnitConvertImplCopyWithImpl(
      _$UnitConvertImpl _value, $Res Function(_$UnitConvertImpl) _then)
      : super(_value, _then);

  /// Create a copy of UnitConvert
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? formula = null,
    Object? materialUnit = null,
    Object? convertUnit = null,
  }) {
    return _then(_$UnitConvertImpl(
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
      formula: null == formula
          ? _value.formula
          : formula // ignore: cast_nullable_to_non_nullable
              as String,
      materialUnit: null == materialUnit
          ? _value.materialUnit
          : materialUnit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      convertUnit: null == convertUnit
          ? _value.convertUnit
          : convertUnit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UnitConvertImpl extends _UnitConvert {
  const _$UnitConvertImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'convert_formula') required this.formula,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      required this.materialUnit,
      @JsonKey(name: 'converted_unit', fromJson: MaterialUnit.fromJson)
      required this.convertUnit})
      : super._();

  factory _$UnitConvertImpl.fromJson(Map<String, dynamic> json) =>
      _$$UnitConvertImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'convert_formula')
  final String formula;
  @override
  @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
  final MaterialUnit materialUnit;
  @override
  @JsonKey(name: 'converted_unit', fromJson: MaterialUnit.fromJson)
  final MaterialUnit convertUnit;

  /// Create a copy of UnitConvert
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnitConvertImplCopyWith<_$UnitConvertImpl> get copyWith =>
      __$$UnitConvertImplCopyWithImpl<_$UnitConvertImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UnitConvertImplToJson(
      this,
    );
  }
}

abstract class _UnitConvert extends UnitConvert {
  const factory _UnitConvert(
      {required final int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'convert_formula') required final String formula,
      @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
      required final MaterialUnit materialUnit,
      @JsonKey(name: 'converted_unit', fromJson: MaterialUnit.fromJson)
      required final MaterialUnit convertUnit}) = _$UnitConvertImpl;
  const _UnitConvert._() : super._();

  factory _UnitConvert.fromJson(Map<String, dynamic> json) =
      _$UnitConvertImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'convert_formula')
  String get formula;
  @override
  @JsonKey(name: 'material_unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get materialUnit;
  @override
  @JsonKey(name: 'converted_unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get convertUnit;

  /// Create a copy of UnitConvert
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnitConvertImplCopyWith<_$UnitConvertImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
