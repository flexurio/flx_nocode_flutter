// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ebitda.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Ebitda _$EbitdaFromJson(Map<String, dynamic> json) {
  return _Ebitda.fromJson(json);
}

/// @nodoc
mixin _$Ebitda {
  String get period => throw _privateConstructorUsedError;
  @JsonKey(name: 'marketing_area_code')
  String get marketingAreaCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'coa_no')
  String get coaNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'coa_name')
  String get coaName => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  double get percent => throw _privateConstructorUsedError;
  @JsonKey(name: 'value_ytd')
  double get valueYTD => throw _privateConstructorUsedError;
  @JsonKey(name: 'percent_ytd')
  double get percentYTD => throw _privateConstructorUsedError;
  @JsonKey(name: 'percent_result')
  double get percentResult => throw _privateConstructorUsedError;
  @JsonKey(name: 'percent_result_ytd')
  double get percentResultYTD => throw _privateConstructorUsedError;
  @JsonKey(name: 'coa_group')
  String get coaGroup => throw _privateConstructorUsedError;

  /// Serializes this Ebitda to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Ebitda
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EbitdaCopyWith<Ebitda> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EbitdaCopyWith<$Res> {
  factory $EbitdaCopyWith(Ebitda value, $Res Function(Ebitda) then) =
      _$EbitdaCopyWithImpl<$Res, Ebitda>;
  @useResult
  $Res call(
      {String period,
      @JsonKey(name: 'marketing_area_code') String marketingAreaCode,
      @JsonKey(name: 'coa_no') String coaNo,
      @JsonKey(name: 'coa_name') String coaName,
      double value,
      double percent,
      @JsonKey(name: 'value_ytd') double valueYTD,
      @JsonKey(name: 'percent_ytd') double percentYTD,
      @JsonKey(name: 'percent_result') double percentResult,
      @JsonKey(name: 'percent_result_ytd') double percentResultYTD,
      @JsonKey(name: 'coa_group') String coaGroup});
}

/// @nodoc
class _$EbitdaCopyWithImpl<$Res, $Val extends Ebitda>
    implements $EbitdaCopyWith<$Res> {
  _$EbitdaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Ebitda
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? marketingAreaCode = null,
    Object? coaNo = null,
    Object? coaName = null,
    Object? value = null,
    Object? percent = null,
    Object? valueYTD = null,
    Object? percentYTD = null,
    Object? percentResult = null,
    Object? percentResultYTD = null,
    Object? coaGroup = null,
  }) {
    return _then(_value.copyWith(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      marketingAreaCode: null == marketingAreaCode
          ? _value.marketingAreaCode
          : marketingAreaCode // ignore: cast_nullable_to_non_nullable
              as String,
      coaNo: null == coaNo
          ? _value.coaNo
          : coaNo // ignore: cast_nullable_to_non_nullable
              as String,
      coaName: null == coaName
          ? _value.coaName
          : coaName // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      percent: null == percent
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as double,
      valueYTD: null == valueYTD
          ? _value.valueYTD
          : valueYTD // ignore: cast_nullable_to_non_nullable
              as double,
      percentYTD: null == percentYTD
          ? _value.percentYTD
          : percentYTD // ignore: cast_nullable_to_non_nullable
              as double,
      percentResult: null == percentResult
          ? _value.percentResult
          : percentResult // ignore: cast_nullable_to_non_nullable
              as double,
      percentResultYTD: null == percentResultYTD
          ? _value.percentResultYTD
          : percentResultYTD // ignore: cast_nullable_to_non_nullable
              as double,
      coaGroup: null == coaGroup
          ? _value.coaGroup
          : coaGroup // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EbitdaImplCopyWith<$Res> implements $EbitdaCopyWith<$Res> {
  factory _$$EbitdaImplCopyWith(
          _$EbitdaImpl value, $Res Function(_$EbitdaImpl) then) =
      __$$EbitdaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String period,
      @JsonKey(name: 'marketing_area_code') String marketingAreaCode,
      @JsonKey(name: 'coa_no') String coaNo,
      @JsonKey(name: 'coa_name') String coaName,
      double value,
      double percent,
      @JsonKey(name: 'value_ytd') double valueYTD,
      @JsonKey(name: 'percent_ytd') double percentYTD,
      @JsonKey(name: 'percent_result') double percentResult,
      @JsonKey(name: 'percent_result_ytd') double percentResultYTD,
      @JsonKey(name: 'coa_group') String coaGroup});
}

/// @nodoc
class __$$EbitdaImplCopyWithImpl<$Res>
    extends _$EbitdaCopyWithImpl<$Res, _$EbitdaImpl>
    implements _$$EbitdaImplCopyWith<$Res> {
  __$$EbitdaImplCopyWithImpl(
      _$EbitdaImpl _value, $Res Function(_$EbitdaImpl) _then)
      : super(_value, _then);

  /// Create a copy of Ebitda
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? marketingAreaCode = null,
    Object? coaNo = null,
    Object? coaName = null,
    Object? value = null,
    Object? percent = null,
    Object? valueYTD = null,
    Object? percentYTD = null,
    Object? percentResult = null,
    Object? percentResultYTD = null,
    Object? coaGroup = null,
  }) {
    return _then(_$EbitdaImpl(
      null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      null == marketingAreaCode
          ? _value.marketingAreaCode
          : marketingAreaCode // ignore: cast_nullable_to_non_nullable
              as String,
      null == coaNo
          ? _value.coaNo
          : coaNo // ignore: cast_nullable_to_non_nullable
              as String,
      null == coaName
          ? _value.coaName
          : coaName // ignore: cast_nullable_to_non_nullable
              as String,
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      null == percent
          ? _value.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as double,
      null == valueYTD
          ? _value.valueYTD
          : valueYTD // ignore: cast_nullable_to_non_nullable
              as double,
      null == percentYTD
          ? _value.percentYTD
          : percentYTD // ignore: cast_nullable_to_non_nullable
              as double,
      null == percentResult
          ? _value.percentResult
          : percentResult // ignore: cast_nullable_to_non_nullable
              as double,
      null == percentResultYTD
          ? _value.percentResultYTD
          : percentResultYTD // ignore: cast_nullable_to_non_nullable
              as double,
      null == coaGroup
          ? _value.coaGroup
          : coaGroup // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EbitdaImpl extends _Ebitda {
  const _$EbitdaImpl(
      this.period,
      @JsonKey(name: 'marketing_area_code') this.marketingAreaCode,
      @JsonKey(name: 'coa_no') this.coaNo,
      @JsonKey(name: 'coa_name') this.coaName,
      this.value,
      this.percent,
      @JsonKey(name: 'value_ytd') this.valueYTD,
      @JsonKey(name: 'percent_ytd') this.percentYTD,
      @JsonKey(name: 'percent_result') this.percentResult,
      @JsonKey(name: 'percent_result_ytd') this.percentResultYTD,
      @JsonKey(name: 'coa_group') this.coaGroup)
      : super._();

  factory _$EbitdaImpl.fromJson(Map<String, dynamic> json) =>
      _$$EbitdaImplFromJson(json);

  @override
  final String period;
  @override
  @JsonKey(name: 'marketing_area_code')
  final String marketingAreaCode;
  @override
  @JsonKey(name: 'coa_no')
  final String coaNo;
  @override
  @JsonKey(name: 'coa_name')
  final String coaName;
  @override
  final double value;
  @override
  final double percent;
  @override
  @JsonKey(name: 'value_ytd')
  final double valueYTD;
  @override
  @JsonKey(name: 'percent_ytd')
  final double percentYTD;
  @override
  @JsonKey(name: 'percent_result')
  final double percentResult;
  @override
  @JsonKey(name: 'percent_result_ytd')
  final double percentResultYTD;
  @override
  @JsonKey(name: 'coa_group')
  final String coaGroup;

  @override
  String toString() {
    return 'Ebitda(period: $period, marketingAreaCode: $marketingAreaCode, coaNo: $coaNo, coaName: $coaName, value: $value, percent: $percent, valueYTD: $valueYTD, percentYTD: $percentYTD, percentResult: $percentResult, percentResultYTD: $percentResultYTD, coaGroup: $coaGroup)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EbitdaImpl &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.marketingAreaCode, marketingAreaCode) ||
                other.marketingAreaCode == marketingAreaCode) &&
            (identical(other.coaNo, coaNo) || other.coaNo == coaNo) &&
            (identical(other.coaName, coaName) || other.coaName == coaName) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.percent, percent) || other.percent == percent) &&
            (identical(other.valueYTD, valueYTD) ||
                other.valueYTD == valueYTD) &&
            (identical(other.percentYTD, percentYTD) ||
                other.percentYTD == percentYTD) &&
            (identical(other.percentResult, percentResult) ||
                other.percentResult == percentResult) &&
            (identical(other.percentResultYTD, percentResultYTD) ||
                other.percentResultYTD == percentResultYTD) &&
            (identical(other.coaGroup, coaGroup) ||
                other.coaGroup == coaGroup));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      period,
      marketingAreaCode,
      coaNo,
      coaName,
      value,
      percent,
      valueYTD,
      percentYTD,
      percentResult,
      percentResultYTD,
      coaGroup);

  /// Create a copy of Ebitda
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EbitdaImplCopyWith<_$EbitdaImpl> get copyWith =>
      __$$EbitdaImplCopyWithImpl<_$EbitdaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EbitdaImplToJson(
      this,
    );
  }
}

abstract class _Ebitda extends Ebitda {
  const factory _Ebitda(
      final String period,
      @JsonKey(name: 'marketing_area_code') final String marketingAreaCode,
      @JsonKey(name: 'coa_no') final String coaNo,
      @JsonKey(name: 'coa_name') final String coaName,
      final double value,
      final double percent,
      @JsonKey(name: 'value_ytd') final double valueYTD,
      @JsonKey(name: 'percent_ytd') final double percentYTD,
      @JsonKey(name: 'percent_result') final double percentResult,
      @JsonKey(name: 'percent_result_ytd') final double percentResultYTD,
      @JsonKey(name: 'coa_group') final String coaGroup) = _$EbitdaImpl;
  const _Ebitda._() : super._();

  factory _Ebitda.fromJson(Map<String, dynamic> json) = _$EbitdaImpl.fromJson;

  @override
  String get period;
  @override
  @JsonKey(name: 'marketing_area_code')
  String get marketingAreaCode;
  @override
  @JsonKey(name: 'coa_no')
  String get coaNo;
  @override
  @JsonKey(name: 'coa_name')
  String get coaName;
  @override
  double get value;
  @override
  double get percent;
  @override
  @JsonKey(name: 'value_ytd')
  double get valueYTD;
  @override
  @JsonKey(name: 'percent_ytd')
  double get percentYTD;
  @override
  @JsonKey(name: 'percent_result')
  double get percentResult;
  @override
  @JsonKey(name: 'percent_result_ytd')
  double get percentResultYTD;
  @override
  @JsonKey(name: 'coa_group')
  String get coaGroup;

  /// Create a copy of Ebitda
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EbitdaImplCopyWith<_$EbitdaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
