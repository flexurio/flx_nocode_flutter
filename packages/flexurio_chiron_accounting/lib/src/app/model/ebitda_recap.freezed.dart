// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ebitda_recap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EbitdaRecap _$EbitdaRecapFromJson(Map<String, dynamic> json) {
  return _EbitdaRecap.fromJson(json);
}

/// @nodoc
mixin _$EbitdaRecap {
  String get area => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount_ytd')
  double get amountYTD => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount_percent')
  double get amountPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount_percent_ytd')
  double get amountPercentYTD => throw _privateConstructorUsedError;

  /// Serializes this EbitdaRecap to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EbitdaRecap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EbitdaRecapCopyWith<EbitdaRecap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EbitdaRecapCopyWith<$Res> {
  factory $EbitdaRecapCopyWith(
          EbitdaRecap value, $Res Function(EbitdaRecap) then) =
      _$EbitdaRecapCopyWithImpl<$Res, EbitdaRecap>;
  @useResult
  $Res call(
      {String area,
      double amount,
      @JsonKey(name: 'amount_ytd') double amountYTD,
      @JsonKey(name: 'amount_percent') double amountPercent,
      @JsonKey(name: 'amount_percent_ytd') double amountPercentYTD});
}

/// @nodoc
class _$EbitdaRecapCopyWithImpl<$Res, $Val extends EbitdaRecap>
    implements $EbitdaRecapCopyWith<$Res> {
  _$EbitdaRecapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EbitdaRecap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? area = null,
    Object? amount = null,
    Object? amountYTD = null,
    Object? amountPercent = null,
    Object? amountPercentYTD = null,
  }) {
    return _then(_value.copyWith(
      area: null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      amountYTD: null == amountYTD
          ? _value.amountYTD
          : amountYTD // ignore: cast_nullable_to_non_nullable
              as double,
      amountPercent: null == amountPercent
          ? _value.amountPercent
          : amountPercent // ignore: cast_nullable_to_non_nullable
              as double,
      amountPercentYTD: null == amountPercentYTD
          ? _value.amountPercentYTD
          : amountPercentYTD // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EbitdaRecapImplCopyWith<$Res>
    implements $EbitdaRecapCopyWith<$Res> {
  factory _$$EbitdaRecapImplCopyWith(
          _$EbitdaRecapImpl value, $Res Function(_$EbitdaRecapImpl) then) =
      __$$EbitdaRecapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String area,
      double amount,
      @JsonKey(name: 'amount_ytd') double amountYTD,
      @JsonKey(name: 'amount_percent') double amountPercent,
      @JsonKey(name: 'amount_percent_ytd') double amountPercentYTD});
}

/// @nodoc
class __$$EbitdaRecapImplCopyWithImpl<$Res>
    extends _$EbitdaRecapCopyWithImpl<$Res, _$EbitdaRecapImpl>
    implements _$$EbitdaRecapImplCopyWith<$Res> {
  __$$EbitdaRecapImplCopyWithImpl(
      _$EbitdaRecapImpl _value, $Res Function(_$EbitdaRecapImpl) _then)
      : super(_value, _then);

  /// Create a copy of EbitdaRecap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? area = null,
    Object? amount = null,
    Object? amountYTD = null,
    Object? amountPercent = null,
    Object? amountPercentYTD = null,
  }) {
    return _then(_$EbitdaRecapImpl(
      null == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String,
      null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      null == amountYTD
          ? _value.amountYTD
          : amountYTD // ignore: cast_nullable_to_non_nullable
              as double,
      null == amountPercent
          ? _value.amountPercent
          : amountPercent // ignore: cast_nullable_to_non_nullable
              as double,
      null == amountPercentYTD
          ? _value.amountPercentYTD
          : amountPercentYTD // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EbitdaRecapImpl extends _EbitdaRecap {
  const _$EbitdaRecapImpl(
      this.area,
      this.amount,
      @JsonKey(name: 'amount_ytd') this.amountYTD,
      @JsonKey(name: 'amount_percent') this.amountPercent,
      @JsonKey(name: 'amount_percent_ytd') this.amountPercentYTD)
      : super._();

  factory _$EbitdaRecapImpl.fromJson(Map<String, dynamic> json) =>
      _$$EbitdaRecapImplFromJson(json);

  @override
  final String area;
  @override
  final double amount;
  @override
  @JsonKey(name: 'amount_ytd')
  final double amountYTD;
  @override
  @JsonKey(name: 'amount_percent')
  final double amountPercent;
  @override
  @JsonKey(name: 'amount_percent_ytd')
  final double amountPercentYTD;

  @override
  String toString() {
    return 'EbitdaRecap(area: $area, amount: $amount, amountYTD: $amountYTD, amountPercent: $amountPercent, amountPercentYTD: $amountPercentYTD)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EbitdaRecapImpl &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.amountYTD, amountYTD) ||
                other.amountYTD == amountYTD) &&
            (identical(other.amountPercent, amountPercent) ||
                other.amountPercent == amountPercent) &&
            (identical(other.amountPercentYTD, amountPercentYTD) ||
                other.amountPercentYTD == amountPercentYTD));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, area, amount, amountYTD, amountPercent, amountPercentYTD);

  /// Create a copy of EbitdaRecap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EbitdaRecapImplCopyWith<_$EbitdaRecapImpl> get copyWith =>
      __$$EbitdaRecapImplCopyWithImpl<_$EbitdaRecapImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EbitdaRecapImplToJson(
      this,
    );
  }
}

abstract class _EbitdaRecap extends EbitdaRecap {
  const factory _EbitdaRecap(
          final String area,
          final double amount,
          @JsonKey(name: 'amount_ytd') final double amountYTD,
          @JsonKey(name: 'amount_percent') final double amountPercent,
          @JsonKey(name: 'amount_percent_ytd') final double amountPercentYTD) =
      _$EbitdaRecapImpl;
  const _EbitdaRecap._() : super._();

  factory _EbitdaRecap.fromJson(Map<String, dynamic> json) =
      _$EbitdaRecapImpl.fromJson;

  @override
  String get area;
  @override
  double get amount;
  @override
  @JsonKey(name: 'amount_ytd')
  double get amountYTD;
  @override
  @JsonKey(name: 'amount_percent')
  double get amountPercent;
  @override
  @JsonKey(name: 'amount_percent_ytd')
  double get amountPercentYTD;

  /// Create a copy of EbitdaRecap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EbitdaRecapImplCopyWith<_$EbitdaRecapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
