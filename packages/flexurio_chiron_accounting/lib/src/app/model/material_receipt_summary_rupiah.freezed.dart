// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_receipt_summary_rupiah.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialReceiptSummaryRupiah _$MaterialReceiptSummaryRupiahFromJson(
    Map<String, dynamic> json) {
  return _MaterialReceiptSummaryRupiah.fromJson(json);
}

/// @nodoc
mixin _$MaterialReceiptSummaryRupiah {
  @JsonKey(name: 'transaction_type_id')
  String get transactionTypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_type_name')
  String get transactionTypeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'value')
  int get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'value_summary')
  int get valueSummary => throw _privateConstructorUsedError;

  /// Serializes this MaterialReceiptSummaryRupiah to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaterialReceiptSummaryRupiah
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialReceiptSummaryRupiahCopyWith<MaterialReceiptSummaryRupiah>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialReceiptSummaryRupiahCopyWith<$Res> {
  factory $MaterialReceiptSummaryRupiahCopyWith(
          MaterialReceiptSummaryRupiah value,
          $Res Function(MaterialReceiptSummaryRupiah) then) =
      _$MaterialReceiptSummaryRupiahCopyWithImpl<$Res,
          MaterialReceiptSummaryRupiah>;
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_type_id') String transactionTypeId,
      @JsonKey(name: 'transaction_type_name') String transactionTypeName,
      @JsonKey(name: 'value') int value,
      @JsonKey(name: 'value_summary') int valueSummary});
}

/// @nodoc
class _$MaterialReceiptSummaryRupiahCopyWithImpl<$Res,
        $Val extends MaterialReceiptSummaryRupiah>
    implements $MaterialReceiptSummaryRupiahCopyWith<$Res> {
  _$MaterialReceiptSummaryRupiahCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialReceiptSummaryRupiah
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionTypeId = null,
    Object? transactionTypeName = null,
    Object? value = null,
    Object? valueSummary = null,
  }) {
    return _then(_value.copyWith(
      transactionTypeId: null == transactionTypeId
          ? _value.transactionTypeId
          : transactionTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionTypeName: null == transactionTypeName
          ? _value.transactionTypeName
          : transactionTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      valueSummary: null == valueSummary
          ? _value.valueSummary
          : valueSummary // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MaterialReceiptSummaryRupiahImplCopyWith<$Res>
    implements $MaterialReceiptSummaryRupiahCopyWith<$Res> {
  factory _$$MaterialReceiptSummaryRupiahImplCopyWith(
          _$MaterialReceiptSummaryRupiahImpl value,
          $Res Function(_$MaterialReceiptSummaryRupiahImpl) then) =
      __$$MaterialReceiptSummaryRupiahImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_type_id') String transactionTypeId,
      @JsonKey(name: 'transaction_type_name') String transactionTypeName,
      @JsonKey(name: 'value') int value,
      @JsonKey(name: 'value_summary') int valueSummary});
}

/// @nodoc
class __$$MaterialReceiptSummaryRupiahImplCopyWithImpl<$Res>
    extends _$MaterialReceiptSummaryRupiahCopyWithImpl<$Res,
        _$MaterialReceiptSummaryRupiahImpl>
    implements _$$MaterialReceiptSummaryRupiahImplCopyWith<$Res> {
  __$$MaterialReceiptSummaryRupiahImplCopyWithImpl(
      _$MaterialReceiptSummaryRupiahImpl _value,
      $Res Function(_$MaterialReceiptSummaryRupiahImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialReceiptSummaryRupiah
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionTypeId = null,
    Object? transactionTypeName = null,
    Object? value = null,
    Object? valueSummary = null,
  }) {
    return _then(_$MaterialReceiptSummaryRupiahImpl(
      transactionTypeId: null == transactionTypeId
          ? _value.transactionTypeId
          : transactionTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionTypeName: null == transactionTypeName
          ? _value.transactionTypeName
          : transactionTypeName // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
      valueSummary: null == valueSummary
          ? _value.valueSummary
          : valueSummary // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialReceiptSummaryRupiahImpl extends _MaterialReceiptSummaryRupiah {
  const _$MaterialReceiptSummaryRupiahImpl(
      {@JsonKey(name: 'transaction_type_id') required this.transactionTypeId,
      @JsonKey(name: 'transaction_type_name') required this.transactionTypeName,
      @JsonKey(name: 'value') required this.value,
      @JsonKey(name: 'value_summary') required this.valueSummary})
      : super._();

  factory _$MaterialReceiptSummaryRupiahImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MaterialReceiptSummaryRupiahImplFromJson(json);

  @override
  @JsonKey(name: 'transaction_type_id')
  final String transactionTypeId;
  @override
  @JsonKey(name: 'transaction_type_name')
  final String transactionTypeName;
  @override
  @JsonKey(name: 'value')
  final int value;
  @override
  @JsonKey(name: 'value_summary')
  final int valueSummary;

  @override
  String toString() {
    return 'MaterialReceiptSummaryRupiah(transactionTypeId: $transactionTypeId, transactionTypeName: $transactionTypeName, value: $value, valueSummary: $valueSummary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialReceiptSummaryRupiahImpl &&
            (identical(other.transactionTypeId, transactionTypeId) ||
                other.transactionTypeId == transactionTypeId) &&
            (identical(other.transactionTypeName, transactionTypeName) ||
                other.transactionTypeName == transactionTypeName) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.valueSummary, valueSummary) ||
                other.valueSummary == valueSummary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, transactionTypeId, transactionTypeName, value, valueSummary);

  /// Create a copy of MaterialReceiptSummaryRupiah
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialReceiptSummaryRupiahImplCopyWith<
          _$MaterialReceiptSummaryRupiahImpl>
      get copyWith => __$$MaterialReceiptSummaryRupiahImplCopyWithImpl<
          _$MaterialReceiptSummaryRupiahImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialReceiptSummaryRupiahImplToJson(
      this,
    );
  }
}

abstract class _MaterialReceiptSummaryRupiah
    extends MaterialReceiptSummaryRupiah {
  const factory _MaterialReceiptSummaryRupiah(
          {@JsonKey(name: 'transaction_type_id')
          required final String transactionTypeId,
          @JsonKey(name: 'transaction_type_name')
          required final String transactionTypeName,
          @JsonKey(name: 'value') required final int value,
          @JsonKey(name: 'value_summary') required final int valueSummary}) =
      _$MaterialReceiptSummaryRupiahImpl;
  const _MaterialReceiptSummaryRupiah._() : super._();

  factory _MaterialReceiptSummaryRupiah.fromJson(Map<String, dynamic> json) =
      _$MaterialReceiptSummaryRupiahImpl.fromJson;

  @override
  @JsonKey(name: 'transaction_type_id')
  String get transactionTypeId;
  @override
  @JsonKey(name: 'transaction_type_name')
  String get transactionTypeName;
  @override
  @JsonKey(name: 'value')
  int get value;
  @override
  @JsonKey(name: 'value_summary')
  int get valueSummary;

  /// Create a copy of MaterialReceiptSummaryRupiah
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialReceiptSummaryRupiahImplCopyWith<
          _$MaterialReceiptSummaryRupiahImpl>
      get copyWith => throw _privateConstructorUsedError;
}
