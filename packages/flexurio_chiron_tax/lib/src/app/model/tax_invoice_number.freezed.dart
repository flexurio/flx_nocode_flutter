// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tax_invoice_number.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TaxInvoiceNumber _$TaxInvoiceNumberFromJson(Map<String, dynamic> json) {
  return _TaxInvoiceNumber.fromJson(json);
}

/// @nodoc
mixin _$TaxInvoiceNumber {
  String get year => throw _privateConstructorUsedError;
  String get prefix => throw _privateConstructorUsedError;
  int get sequence => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_value')
  int get minValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_value')
  int get maxValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active', defaultValue: false)
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this TaxInvoiceNumber to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TaxInvoiceNumber
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TaxInvoiceNumberCopyWith<TaxInvoiceNumber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaxInvoiceNumberCopyWith<$Res> {
  factory $TaxInvoiceNumberCopyWith(
          TaxInvoiceNumber value, $Res Function(TaxInvoiceNumber) then) =
      _$TaxInvoiceNumberCopyWithImpl<$Res, TaxInvoiceNumber>;
  @useResult
  $Res call(
      {String year,
      String prefix,
      int sequence,
      int id,
      @JsonKey(name: 'min_value') int minValue,
      @JsonKey(name: 'max_value') int maxValue,
      @JsonKey(name: 'is_active', defaultValue: false) bool isActive});
}

/// @nodoc
class _$TaxInvoiceNumberCopyWithImpl<$Res, $Val extends TaxInvoiceNumber>
    implements $TaxInvoiceNumberCopyWith<$Res> {
  _$TaxInvoiceNumberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TaxInvoiceNumber
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? prefix = null,
    Object? sequence = null,
    Object? id = null,
    Object? minValue = null,
    Object? maxValue = null,
    Object? isActive = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      prefix: null == prefix
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String,
      sequence: null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      minValue: null == minValue
          ? _value.minValue
          : minValue // ignore: cast_nullable_to_non_nullable
              as int,
      maxValue: null == maxValue
          ? _value.maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
              as int,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaxInvoiceNumberImplCopyWith<$Res>
    implements $TaxInvoiceNumberCopyWith<$Res> {
  factory _$$TaxInvoiceNumberImplCopyWith(_$TaxInvoiceNumberImpl value,
          $Res Function(_$TaxInvoiceNumberImpl) then) =
      __$$TaxInvoiceNumberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String year,
      String prefix,
      int sequence,
      int id,
      @JsonKey(name: 'min_value') int minValue,
      @JsonKey(name: 'max_value') int maxValue,
      @JsonKey(name: 'is_active', defaultValue: false) bool isActive});
}

/// @nodoc
class __$$TaxInvoiceNumberImplCopyWithImpl<$Res>
    extends _$TaxInvoiceNumberCopyWithImpl<$Res, _$TaxInvoiceNumberImpl>
    implements _$$TaxInvoiceNumberImplCopyWith<$Res> {
  __$$TaxInvoiceNumberImplCopyWithImpl(_$TaxInvoiceNumberImpl _value,
      $Res Function(_$TaxInvoiceNumberImpl) _then)
      : super(_value, _then);

  /// Create a copy of TaxInvoiceNumber
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? prefix = null,
    Object? sequence = null,
    Object? id = null,
    Object? minValue = null,
    Object? maxValue = null,
    Object? isActive = null,
  }) {
    return _then(_$TaxInvoiceNumberImpl(
      null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      null == prefix
          ? _value.prefix
          : prefix // ignore: cast_nullable_to_non_nullable
              as String,
      null == sequence
          ? _value.sequence
          : sequence // ignore: cast_nullable_to_non_nullable
              as int,
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == minValue
          ? _value.minValue
          : minValue // ignore: cast_nullable_to_non_nullable
              as int,
      null == maxValue
          ? _value.maxValue
          : maxValue // ignore: cast_nullable_to_non_nullable
              as int,
      null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaxInvoiceNumberImpl extends _TaxInvoiceNumber {
  _$TaxInvoiceNumberImpl(
      this.year,
      this.prefix,
      this.sequence,
      this.id,
      @JsonKey(name: 'min_value') this.minValue,
      @JsonKey(name: 'max_value') this.maxValue,
      @JsonKey(name: 'is_active', defaultValue: false) this.isActive)
      : super._();

  factory _$TaxInvoiceNumberImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaxInvoiceNumberImplFromJson(json);

  @override
  final String year;
  @override
  final String prefix;
  @override
  final int sequence;
  @override
  final int id;
  @override
  @JsonKey(name: 'min_value')
  final int minValue;
  @override
  @JsonKey(name: 'max_value')
  final int maxValue;
  @override
  @JsonKey(name: 'is_active', defaultValue: false)
  final bool isActive;

  @override
  String toString() {
    return 'TaxInvoiceNumber(year: $year, prefix: $prefix, sequence: $sequence, id: $id, minValue: $minValue, maxValue: $maxValue, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaxInvoiceNumberImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.prefix, prefix) || other.prefix == prefix) &&
            (identical(other.sequence, sequence) ||
                other.sequence == sequence) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.minValue, minValue) ||
                other.minValue == minValue) &&
            (identical(other.maxValue, maxValue) ||
                other.maxValue == maxValue) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, year, prefix, sequence, id, minValue, maxValue, isActive);

  /// Create a copy of TaxInvoiceNumber
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TaxInvoiceNumberImplCopyWith<_$TaxInvoiceNumberImpl> get copyWith =>
      __$$TaxInvoiceNumberImplCopyWithImpl<_$TaxInvoiceNumberImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaxInvoiceNumberImplToJson(
      this,
    );
  }
}

abstract class _TaxInvoiceNumber extends TaxInvoiceNumber {
  factory _TaxInvoiceNumber(
      final String year,
      final String prefix,
      final int sequence,
      final int id,
      @JsonKey(name: 'min_value') final int minValue,
      @JsonKey(name: 'max_value') final int maxValue,
      @JsonKey(name: 'is_active', defaultValue: false)
      final bool isActive) = _$TaxInvoiceNumberImpl;
  _TaxInvoiceNumber._() : super._();

  factory _TaxInvoiceNumber.fromJson(Map<String, dynamic> json) =
      _$TaxInvoiceNumberImpl.fromJson;

  @override
  String get year;
  @override
  String get prefix;
  @override
  int get sequence;
  @override
  int get id;
  @override
  @JsonKey(name: 'min_value')
  int get minValue;
  @override
  @JsonKey(name: 'max_value')
  int get maxValue;
  @override
  @JsonKey(name: 'is_active', defaultValue: false)
  bool get isActive;

  /// Create a copy of TaxInvoiceNumber
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TaxInvoiceNumberImplCopyWith<_$TaxInvoiceNumberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
