// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_summary_global.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PurchaseSummaryGlobal _$PurchaseSummaryGlobalFromJson(
    Map<String, dynamic> json) {
  return _PurchaseSummaryGlobal.fromJson(json);
}

/// @nodoc
mixin _$PurchaseSummaryGlobal {
  String get supplier => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_id')
  String get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency_id')
  String get currencyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate => throw _privateConstructorUsedError;
  int get subtotal => throw _privateConstructorUsedError;
  int get rate => throw _privateConstructorUsedError;
  @JsonKey(name: 'sub_after_ppn')
  int get subAfterPpn => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn_value')
  int get ppnValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  int get total => throw _privateConstructorUsedError;

  /// Serializes this PurchaseSummaryGlobal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseSummaryGlobal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseSummaryGlobalCopyWith<PurchaseSummaryGlobal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseSummaryGlobalCopyWith<$Res> {
  factory $PurchaseSummaryGlobalCopyWith(PurchaseSummaryGlobal value,
          $Res Function(PurchaseSummaryGlobal) then) =
      _$PurchaseSummaryGlobalCopyWithImpl<$Res, PurchaseSummaryGlobal>;
  @useResult
  $Res call(
      {String supplier,
      @JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'currency_id') String currencyId,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      int subtotal,
      int rate,
      @JsonKey(name: 'sub_after_ppn') int subAfterPpn,
      @JsonKey(name: 'ppn_value') int ppnValue,
      @JsonKey(name: 'total') int total});
}

/// @nodoc
class _$PurchaseSummaryGlobalCopyWithImpl<$Res,
        $Val extends PurchaseSummaryGlobal>
    implements $PurchaseSummaryGlobalCopyWith<$Res> {
  _$PurchaseSummaryGlobalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseSummaryGlobal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supplier = null,
    Object? transactionId = null,
    Object? currencyId = null,
    Object? transactionDate = null,
    Object? subtotal = null,
    Object? rate = null,
    Object? subAfterPpn = null,
    Object? ppnValue = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      currencyId: null == currencyId
          ? _value.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
      subAfterPpn: null == subAfterPpn
          ? _value.subAfterPpn
          : subAfterPpn // ignore: cast_nullable_to_non_nullable
              as int,
      ppnValue: null == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchaseSummaryGlobalImplCopyWith<$Res>
    implements $PurchaseSummaryGlobalCopyWith<$Res> {
  factory _$$PurchaseSummaryGlobalImplCopyWith(
          _$PurchaseSummaryGlobalImpl value,
          $Res Function(_$PurchaseSummaryGlobalImpl) then) =
      __$$PurchaseSummaryGlobalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String supplier,
      @JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'currency_id') String currencyId,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      int subtotal,
      int rate,
      @JsonKey(name: 'sub_after_ppn') int subAfterPpn,
      @JsonKey(name: 'ppn_value') int ppnValue,
      @JsonKey(name: 'total') int total});
}

/// @nodoc
class __$$PurchaseSummaryGlobalImplCopyWithImpl<$Res>
    extends _$PurchaseSummaryGlobalCopyWithImpl<$Res,
        _$PurchaseSummaryGlobalImpl>
    implements _$$PurchaseSummaryGlobalImplCopyWith<$Res> {
  __$$PurchaseSummaryGlobalImplCopyWithImpl(_$PurchaseSummaryGlobalImpl _value,
      $Res Function(_$PurchaseSummaryGlobalImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseSummaryGlobal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supplier = null,
    Object? transactionId = null,
    Object? currencyId = null,
    Object? transactionDate = null,
    Object? subtotal = null,
    Object? rate = null,
    Object? subAfterPpn = null,
    Object? ppnValue = null,
    Object? total = null,
  }) {
    return _then(_$PurchaseSummaryGlobalImpl(
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      currencyId: null == currencyId
          ? _value.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as int,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
      subAfterPpn: null == subAfterPpn
          ? _value.subAfterPpn
          : subAfterPpn // ignore: cast_nullable_to_non_nullable
              as int,
      ppnValue: null == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseSummaryGlobalImpl extends _PurchaseSummaryGlobal {
  const _$PurchaseSummaryGlobalImpl(
      {required this.supplier,
      @JsonKey(name: 'transaction_id') required this.transactionId,
      @JsonKey(name: 'currency_id') required this.currencyId,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required this.transactionDate,
      required this.subtotal,
      required this.rate,
      @JsonKey(name: 'sub_after_ppn') required this.subAfterPpn,
      @JsonKey(name: 'ppn_value') required this.ppnValue,
      @JsonKey(name: 'total') required this.total})
      : super._();

  factory _$PurchaseSummaryGlobalImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseSummaryGlobalImplFromJson(json);

  @override
  final String supplier;
  @override
  @JsonKey(name: 'transaction_id')
  final String transactionId;
  @override
  @JsonKey(name: 'currency_id')
  final String currencyId;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  final DateTime transactionDate;
  @override
  final int subtotal;
  @override
  final int rate;
  @override
  @JsonKey(name: 'sub_after_ppn')
  final int subAfterPpn;
  @override
  @JsonKey(name: 'ppn_value')
  final int ppnValue;
  @override
  @JsonKey(name: 'total')
  final int total;

  @override
  String toString() {
    return 'PurchaseSummaryGlobal(supplier: $supplier, transactionId: $transactionId, currencyId: $currencyId, transactionDate: $transactionDate, subtotal: $subtotal, rate: $rate, subAfterPpn: $subAfterPpn, ppnValue: $ppnValue, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseSummaryGlobalImpl &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.currencyId, currencyId) ||
                other.currencyId == currencyId) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.subAfterPpn, subAfterPpn) ||
                other.subAfterPpn == subAfterPpn) &&
            (identical(other.ppnValue, ppnValue) ||
                other.ppnValue == ppnValue) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      supplier,
      transactionId,
      currencyId,
      transactionDate,
      subtotal,
      rate,
      subAfterPpn,
      ppnValue,
      total);

  /// Create a copy of PurchaseSummaryGlobal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseSummaryGlobalImplCopyWith<_$PurchaseSummaryGlobalImpl>
      get copyWith => __$$PurchaseSummaryGlobalImplCopyWithImpl<
          _$PurchaseSummaryGlobalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseSummaryGlobalImplToJson(
      this,
    );
  }
}

abstract class _PurchaseSummaryGlobal extends PurchaseSummaryGlobal {
  const factory _PurchaseSummaryGlobal(
          {required final String supplier,
          @JsonKey(name: 'transaction_id') required final String transactionId,
          @JsonKey(name: 'currency_id') required final String currencyId,
          @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
          required final DateTime transactionDate,
          required final int subtotal,
          required final int rate,
          @JsonKey(name: 'sub_after_ppn') required final int subAfterPpn,
          @JsonKey(name: 'ppn_value') required final int ppnValue,
          @JsonKey(name: 'total') required final int total}) =
      _$PurchaseSummaryGlobalImpl;
  const _PurchaseSummaryGlobal._() : super._();

  factory _PurchaseSummaryGlobal.fromJson(Map<String, dynamic> json) =
      _$PurchaseSummaryGlobalImpl.fromJson;

  @override
  String get supplier;
  @override
  @JsonKey(name: 'transaction_id')
  String get transactionId;
  @override
  @JsonKey(name: 'currency_id')
  String get currencyId;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate;
  @override
  int get subtotal;
  @override
  int get rate;
  @override
  @JsonKey(name: 'sub_after_ppn')
  int get subAfterPpn;
  @override
  @JsonKey(name: 'ppn_value')
  int get ppnValue;
  @override
  @JsonKey(name: 'total')
  int get total;

  /// Create a copy of PurchaseSummaryGlobal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseSummaryGlobalImplCopyWith<_$PurchaseSummaryGlobalImpl>
      get copyWith => throw _privateConstructorUsedError;
}
