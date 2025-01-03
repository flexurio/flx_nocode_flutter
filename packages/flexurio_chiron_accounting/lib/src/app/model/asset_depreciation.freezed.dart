// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'asset_depreciation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AssetDepreciation _$AssetDepreciationFromJson(Map<String, dynamic> json) {
  return _AssetDepreciation.fromJson(json);
}

/// @nodoc
mixin _$AssetDepreciation {
  String get remark => throw _privateConstructorUsedError;
  @JsonKey(name: 'asset_code')
  String get assetCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity')
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'acquisition_date', fromJson: isoDateToDateTime)
  DateTime get acquisitionDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'acquisition_value_plus')
  double get acquisitionValuePlus => throw _privateConstructorUsedError;
  @JsonKey(name: 'acquisition_value_min')
  double get acquisitionValueMin => throw _privateConstructorUsedError;
  @JsonKey(name: 'acquisition_value')
  double get acquisitionValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'formula')
  double get formula => throw _privateConstructorUsedError;
  @JsonKey(name: 'depreciation_value')
  double get depreciationValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_formula')
  double get totalFormula => throw _privateConstructorUsedError;
  @JsonKey(name: 'final_value')
  double get finalValue => throw _privateConstructorUsedError;

  /// Serializes this AssetDepreciation to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AssetDepreciation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssetDepreciationCopyWith<AssetDepreciation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetDepreciationCopyWith<$Res> {
  factory $AssetDepreciationCopyWith(
          AssetDepreciation value, $Res Function(AssetDepreciation) then) =
      _$AssetDepreciationCopyWithImpl<$Res, AssetDepreciation>;
  @useResult
  $Res call(
      {String remark,
      @JsonKey(name: 'asset_code') String assetCode,
      @JsonKey(name: 'quantity') int quantity,
      @JsonKey(name: 'acquisition_date', fromJson: isoDateToDateTime)
      DateTime acquisitionDate,
      @JsonKey(name: 'acquisition_value_plus') double acquisitionValuePlus,
      @JsonKey(name: 'acquisition_value_min') double acquisitionValueMin,
      @JsonKey(name: 'acquisition_value') double acquisitionValue,
      @JsonKey(name: 'formula') double formula,
      @JsonKey(name: 'depreciation_value') double depreciationValue,
      @JsonKey(name: 'total_formula') double totalFormula,
      @JsonKey(name: 'final_value') double finalValue});
}

/// @nodoc
class _$AssetDepreciationCopyWithImpl<$Res, $Val extends AssetDepreciation>
    implements $AssetDepreciationCopyWith<$Res> {
  _$AssetDepreciationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AssetDepreciation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remark = null,
    Object? assetCode = null,
    Object? quantity = null,
    Object? acquisitionDate = null,
    Object? acquisitionValuePlus = null,
    Object? acquisitionValueMin = null,
    Object? acquisitionValue = null,
    Object? formula = null,
    Object? depreciationValue = null,
    Object? totalFormula = null,
    Object? finalValue = null,
  }) {
    return _then(_value.copyWith(
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      assetCode: null == assetCode
          ? _value.assetCode
          : assetCode // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      acquisitionDate: null == acquisitionDate
          ? _value.acquisitionDate
          : acquisitionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      acquisitionValuePlus: null == acquisitionValuePlus
          ? _value.acquisitionValuePlus
          : acquisitionValuePlus // ignore: cast_nullable_to_non_nullable
              as double,
      acquisitionValueMin: null == acquisitionValueMin
          ? _value.acquisitionValueMin
          : acquisitionValueMin // ignore: cast_nullable_to_non_nullable
              as double,
      acquisitionValue: null == acquisitionValue
          ? _value.acquisitionValue
          : acquisitionValue // ignore: cast_nullable_to_non_nullable
              as double,
      formula: null == formula
          ? _value.formula
          : formula // ignore: cast_nullable_to_non_nullable
              as double,
      depreciationValue: null == depreciationValue
          ? _value.depreciationValue
          : depreciationValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalFormula: null == totalFormula
          ? _value.totalFormula
          : totalFormula // ignore: cast_nullable_to_non_nullable
              as double,
      finalValue: null == finalValue
          ? _value.finalValue
          : finalValue // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssetDepreciationImplCopyWith<$Res>
    implements $AssetDepreciationCopyWith<$Res> {
  factory _$$AssetDepreciationImplCopyWith(_$AssetDepreciationImpl value,
          $Res Function(_$AssetDepreciationImpl) then) =
      __$$AssetDepreciationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String remark,
      @JsonKey(name: 'asset_code') String assetCode,
      @JsonKey(name: 'quantity') int quantity,
      @JsonKey(name: 'acquisition_date', fromJson: isoDateToDateTime)
      DateTime acquisitionDate,
      @JsonKey(name: 'acquisition_value_plus') double acquisitionValuePlus,
      @JsonKey(name: 'acquisition_value_min') double acquisitionValueMin,
      @JsonKey(name: 'acquisition_value') double acquisitionValue,
      @JsonKey(name: 'formula') double formula,
      @JsonKey(name: 'depreciation_value') double depreciationValue,
      @JsonKey(name: 'total_formula') double totalFormula,
      @JsonKey(name: 'final_value') double finalValue});
}

/// @nodoc
class __$$AssetDepreciationImplCopyWithImpl<$Res>
    extends _$AssetDepreciationCopyWithImpl<$Res, _$AssetDepreciationImpl>
    implements _$$AssetDepreciationImplCopyWith<$Res> {
  __$$AssetDepreciationImplCopyWithImpl(_$AssetDepreciationImpl _value,
      $Res Function(_$AssetDepreciationImpl) _then)
      : super(_value, _then);

  /// Create a copy of AssetDepreciation
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? remark = null,
    Object? assetCode = null,
    Object? quantity = null,
    Object? acquisitionDate = null,
    Object? acquisitionValuePlus = null,
    Object? acquisitionValueMin = null,
    Object? acquisitionValue = null,
    Object? formula = null,
    Object? depreciationValue = null,
    Object? totalFormula = null,
    Object? finalValue = null,
  }) {
    return _then(_$AssetDepreciationImpl(
      remark: null == remark
          ? _value.remark
          : remark // ignore: cast_nullable_to_non_nullable
              as String,
      assetCode: null == assetCode
          ? _value.assetCode
          : assetCode // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      acquisitionDate: null == acquisitionDate
          ? _value.acquisitionDate
          : acquisitionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      acquisitionValuePlus: null == acquisitionValuePlus
          ? _value.acquisitionValuePlus
          : acquisitionValuePlus // ignore: cast_nullable_to_non_nullable
              as double,
      acquisitionValueMin: null == acquisitionValueMin
          ? _value.acquisitionValueMin
          : acquisitionValueMin // ignore: cast_nullable_to_non_nullable
              as double,
      acquisitionValue: null == acquisitionValue
          ? _value.acquisitionValue
          : acquisitionValue // ignore: cast_nullable_to_non_nullable
              as double,
      formula: null == formula
          ? _value.formula
          : formula // ignore: cast_nullable_to_non_nullable
              as double,
      depreciationValue: null == depreciationValue
          ? _value.depreciationValue
          : depreciationValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalFormula: null == totalFormula
          ? _value.totalFormula
          : totalFormula // ignore: cast_nullable_to_non_nullable
              as double,
      finalValue: null == finalValue
          ? _value.finalValue
          : finalValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetDepreciationImpl extends _AssetDepreciation {
  const _$AssetDepreciationImpl(
      {required this.remark,
      @JsonKey(name: 'asset_code') required this.assetCode,
      @JsonKey(name: 'quantity') required this.quantity,
      @JsonKey(name: 'acquisition_date', fromJson: isoDateToDateTime)
      required this.acquisitionDate,
      @JsonKey(name: 'acquisition_value_plus')
      required this.acquisitionValuePlus,
      @JsonKey(name: 'acquisition_value_min') required this.acquisitionValueMin,
      @JsonKey(name: 'acquisition_value') required this.acquisitionValue,
      @JsonKey(name: 'formula') required this.formula,
      @JsonKey(name: 'depreciation_value') required this.depreciationValue,
      @JsonKey(name: 'total_formula') required this.totalFormula,
      @JsonKey(name: 'final_value') required this.finalValue})
      : super._();

  factory _$AssetDepreciationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetDepreciationImplFromJson(json);

  @override
  final String remark;
  @override
  @JsonKey(name: 'asset_code')
  final String assetCode;
  @override
  @JsonKey(name: 'quantity')
  final int quantity;
  @override
  @JsonKey(name: 'acquisition_date', fromJson: isoDateToDateTime)
  final DateTime acquisitionDate;
  @override
  @JsonKey(name: 'acquisition_value_plus')
  final double acquisitionValuePlus;
  @override
  @JsonKey(name: 'acquisition_value_min')
  final double acquisitionValueMin;
  @override
  @JsonKey(name: 'acquisition_value')
  final double acquisitionValue;
  @override
  @JsonKey(name: 'formula')
  final double formula;
  @override
  @JsonKey(name: 'depreciation_value')
  final double depreciationValue;
  @override
  @JsonKey(name: 'total_formula')
  final double totalFormula;
  @override
  @JsonKey(name: 'final_value')
  final double finalValue;

  @override
  String toString() {
    return 'AssetDepreciation(remark: $remark, assetCode: $assetCode, quantity: $quantity, acquisitionDate: $acquisitionDate, acquisitionValuePlus: $acquisitionValuePlus, acquisitionValueMin: $acquisitionValueMin, acquisitionValue: $acquisitionValue, formula: $formula, depreciationValue: $depreciationValue, totalFormula: $totalFormula, finalValue: $finalValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetDepreciationImpl &&
            (identical(other.remark, remark) || other.remark == remark) &&
            (identical(other.assetCode, assetCode) ||
                other.assetCode == assetCode) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.acquisitionDate, acquisitionDate) ||
                other.acquisitionDate == acquisitionDate) &&
            (identical(other.acquisitionValuePlus, acquisitionValuePlus) ||
                other.acquisitionValuePlus == acquisitionValuePlus) &&
            (identical(other.acquisitionValueMin, acquisitionValueMin) ||
                other.acquisitionValueMin == acquisitionValueMin) &&
            (identical(other.acquisitionValue, acquisitionValue) ||
                other.acquisitionValue == acquisitionValue) &&
            (identical(other.formula, formula) || other.formula == formula) &&
            (identical(other.depreciationValue, depreciationValue) ||
                other.depreciationValue == depreciationValue) &&
            (identical(other.totalFormula, totalFormula) ||
                other.totalFormula == totalFormula) &&
            (identical(other.finalValue, finalValue) ||
                other.finalValue == finalValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      remark,
      assetCode,
      quantity,
      acquisitionDate,
      acquisitionValuePlus,
      acquisitionValueMin,
      acquisitionValue,
      formula,
      depreciationValue,
      totalFormula,
      finalValue);

  /// Create a copy of AssetDepreciation
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetDepreciationImplCopyWith<_$AssetDepreciationImpl> get copyWith =>
      __$$AssetDepreciationImplCopyWithImpl<_$AssetDepreciationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetDepreciationImplToJson(
      this,
    );
  }
}

abstract class _AssetDepreciation extends AssetDepreciation {
  const factory _AssetDepreciation(
          {required final String remark,
          @JsonKey(name: 'asset_code') required final String assetCode,
          @JsonKey(name: 'quantity') required final int quantity,
          @JsonKey(name: 'acquisition_date', fromJson: isoDateToDateTime)
          required final DateTime acquisitionDate,
          @JsonKey(name: 'acquisition_value_plus')
          required final double acquisitionValuePlus,
          @JsonKey(name: 'acquisition_value_min')
          required final double acquisitionValueMin,
          @JsonKey(name: 'acquisition_value')
          required final double acquisitionValue,
          @JsonKey(name: 'formula') required final double formula,
          @JsonKey(name: 'depreciation_value')
          required final double depreciationValue,
          @JsonKey(name: 'total_formula') required final double totalFormula,
          @JsonKey(name: 'final_value') required final double finalValue}) =
      _$AssetDepreciationImpl;
  const _AssetDepreciation._() : super._();

  factory _AssetDepreciation.fromJson(Map<String, dynamic> json) =
      _$AssetDepreciationImpl.fromJson;

  @override
  String get remark;
  @override
  @JsonKey(name: 'asset_code')
  String get assetCode;
  @override
  @JsonKey(name: 'quantity')
  int get quantity;
  @override
  @JsonKey(name: 'acquisition_date', fromJson: isoDateToDateTime)
  DateTime get acquisitionDate;
  @override
  @JsonKey(name: 'acquisition_value_plus')
  double get acquisitionValuePlus;
  @override
  @JsonKey(name: 'acquisition_value_min')
  double get acquisitionValueMin;
  @override
  @JsonKey(name: 'acquisition_value')
  double get acquisitionValue;
  @override
  @JsonKey(name: 'formula')
  double get formula;
  @override
  @JsonKey(name: 'depreciation_value')
  double get depreciationValue;
  @override
  @JsonKey(name: 'total_formula')
  double get totalFormula;
  @override
  @JsonKey(name: 'final_value')
  double get finalValue;

  /// Create a copy of AssetDepreciation
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssetDepreciationImplCopyWith<_$AssetDepreciationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
