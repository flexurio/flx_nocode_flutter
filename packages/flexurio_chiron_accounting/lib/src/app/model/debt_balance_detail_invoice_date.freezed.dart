// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'debt_balance_detail_invoice_date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DebtBalanceDetailInvoiceDate _$DebtBalanceDetailInvoiceDateFromJson(
    Map<String, dynamic> json) {
  return _DebtBalanceDetailInvoiceDate.fromJson(json);
}

/// @nodoc
mixin _$DebtBalanceDetailInvoiceDate {
  @JsonKey(name: 'supplier_name')
  String get supplierName => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_id')
  String get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
  DateTime get dueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency_id')
  String get currencyId => throw _privateConstructorUsedError;
  int get rate => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_value')
  int get accountValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'account_value_summary')
  double get accountValueSummary => throw _privateConstructorUsedError;

  /// Serializes this DebtBalanceDetailInvoiceDate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DebtBalanceDetailInvoiceDate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DebtBalanceDetailInvoiceDateCopyWith<DebtBalanceDetailInvoiceDate>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DebtBalanceDetailInvoiceDateCopyWith<$Res> {
  factory $DebtBalanceDetailInvoiceDateCopyWith(
          DebtBalanceDetailInvoiceDate value,
          $Res Function(DebtBalanceDetailInvoiceDate) then) =
      _$DebtBalanceDetailInvoiceDateCopyWithImpl<$Res,
          DebtBalanceDetailInvoiceDate>;
  @useResult
  $Res call(
      {@JsonKey(name: 'supplier_name') String supplierName,
      @JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime) DateTime dueDate,
      @JsonKey(name: 'currency_id') String currencyId,
      int rate,
      @JsonKey(name: 'account_value') int accountValue,
      @JsonKey(name: 'account_value_summary') double accountValueSummary});
}

/// @nodoc
class _$DebtBalanceDetailInvoiceDateCopyWithImpl<$Res,
        $Val extends DebtBalanceDetailInvoiceDate>
    implements $DebtBalanceDetailInvoiceDateCopyWith<$Res> {
  _$DebtBalanceDetailInvoiceDateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DebtBalanceDetailInvoiceDate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supplierName = null,
    Object? transactionId = null,
    Object? transactionDate = null,
    Object? dueDate = null,
    Object? currencyId = null,
    Object? rate = null,
    Object? accountValue = null,
    Object? accountValueSummary = null,
  }) {
    return _then(_value.copyWith(
      supplierName: null == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currencyId: null == currencyId
          ? _value.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
      accountValue: null == accountValue
          ? _value.accountValue
          : accountValue // ignore: cast_nullable_to_non_nullable
              as int,
      accountValueSummary: null == accountValueSummary
          ? _value.accountValueSummary
          : accountValueSummary // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DebtBalanceDetailInvoiceDateImplCopyWith<$Res>
    implements $DebtBalanceDetailInvoiceDateCopyWith<$Res> {
  factory _$$DebtBalanceDetailInvoiceDateImplCopyWith(
          _$DebtBalanceDetailInvoiceDateImpl value,
          $Res Function(_$DebtBalanceDetailInvoiceDateImpl) then) =
      __$$DebtBalanceDetailInvoiceDateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'supplier_name') String supplierName,
      @JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime) DateTime dueDate,
      @JsonKey(name: 'currency_id') String currencyId,
      int rate,
      @JsonKey(name: 'account_value') int accountValue,
      @JsonKey(name: 'account_value_summary') double accountValueSummary});
}

/// @nodoc
class __$$DebtBalanceDetailInvoiceDateImplCopyWithImpl<$Res>
    extends _$DebtBalanceDetailInvoiceDateCopyWithImpl<$Res,
        _$DebtBalanceDetailInvoiceDateImpl>
    implements _$$DebtBalanceDetailInvoiceDateImplCopyWith<$Res> {
  __$$DebtBalanceDetailInvoiceDateImplCopyWithImpl(
      _$DebtBalanceDetailInvoiceDateImpl _value,
      $Res Function(_$DebtBalanceDetailInvoiceDateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DebtBalanceDetailInvoiceDate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? supplierName = null,
    Object? transactionId = null,
    Object? transactionDate = null,
    Object? dueDate = null,
    Object? currencyId = null,
    Object? rate = null,
    Object? accountValue = null,
    Object? accountValueSummary = null,
  }) {
    return _then(_$DebtBalanceDetailInvoiceDateImpl(
      supplierName: null == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      currencyId: null == currencyId
          ? _value.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as String,
      rate: null == rate
          ? _value.rate
          : rate // ignore: cast_nullable_to_non_nullable
              as int,
      accountValue: null == accountValue
          ? _value.accountValue
          : accountValue // ignore: cast_nullable_to_non_nullable
              as int,
      accountValueSummary: null == accountValueSummary
          ? _value.accountValueSummary
          : accountValueSummary // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DebtBalanceDetailInvoiceDateImpl extends _DebtBalanceDetailInvoiceDate {
  const _$DebtBalanceDetailInvoiceDateImpl(
      {@JsonKey(name: 'supplier_name') required this.supplierName,
      @JsonKey(name: 'transaction_id') required this.transactionId,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required this.transactionDate,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
      required this.dueDate,
      @JsonKey(name: 'currency_id') required this.currencyId,
      required this.rate,
      @JsonKey(name: 'account_value') required this.accountValue,
      @JsonKey(name: 'account_value_summary')
      required this.accountValueSummary})
      : super._();

  factory _$DebtBalanceDetailInvoiceDateImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DebtBalanceDetailInvoiceDateImplFromJson(json);

  @override
  @JsonKey(name: 'supplier_name')
  final String supplierName;
  @override
  @JsonKey(name: 'transaction_id')
  final String transactionId;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  final DateTime transactionDate;
  @override
  @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
  final DateTime dueDate;
  @override
  @JsonKey(name: 'currency_id')
  final String currencyId;
  @override
  final int rate;
  @override
  @JsonKey(name: 'account_value')
  final int accountValue;
  @override
  @JsonKey(name: 'account_value_summary')
  final double accountValueSummary;

  @override
  String toString() {
    return 'DebtBalanceDetailInvoiceDate(supplierName: $supplierName, transactionId: $transactionId, transactionDate: $transactionDate, dueDate: $dueDate, currencyId: $currencyId, rate: $rate, accountValue: $accountValue, accountValueSummary: $accountValueSummary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DebtBalanceDetailInvoiceDateImpl &&
            (identical(other.supplierName, supplierName) ||
                other.supplierName == supplierName) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.currencyId, currencyId) ||
                other.currencyId == currencyId) &&
            (identical(other.rate, rate) || other.rate == rate) &&
            (identical(other.accountValue, accountValue) ||
                other.accountValue == accountValue) &&
            (identical(other.accountValueSummary, accountValueSummary) ||
                other.accountValueSummary == accountValueSummary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      supplierName,
      transactionId,
      transactionDate,
      dueDate,
      currencyId,
      rate,
      accountValue,
      accountValueSummary);

  /// Create a copy of DebtBalanceDetailInvoiceDate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DebtBalanceDetailInvoiceDateImplCopyWith<
          _$DebtBalanceDetailInvoiceDateImpl>
      get copyWith => __$$DebtBalanceDetailInvoiceDateImplCopyWithImpl<
          _$DebtBalanceDetailInvoiceDateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DebtBalanceDetailInvoiceDateImplToJson(
      this,
    );
  }
}

abstract class _DebtBalanceDetailInvoiceDate
    extends DebtBalanceDetailInvoiceDate {
  const factory _DebtBalanceDetailInvoiceDate(
          {@JsonKey(name: 'supplier_name') required final String supplierName,
          @JsonKey(name: 'transaction_id') required final String transactionId,
          @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
          required final DateTime transactionDate,
          @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
          required final DateTime dueDate,
          @JsonKey(name: 'currency_id') required final String currencyId,
          required final int rate,
          @JsonKey(name: 'account_value') required final int accountValue,
          @JsonKey(name: 'account_value_summary')
          required final double accountValueSummary}) =
      _$DebtBalanceDetailInvoiceDateImpl;
  const _DebtBalanceDetailInvoiceDate._() : super._();

  factory _DebtBalanceDetailInvoiceDate.fromJson(Map<String, dynamic> json) =
      _$DebtBalanceDetailInvoiceDateImpl.fromJson;

  @override
  @JsonKey(name: 'supplier_name')
  String get supplierName;
  @override
  @JsonKey(name: 'transaction_id')
  String get transactionId;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate;
  @override
  @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
  DateTime get dueDate;
  @override
  @JsonKey(name: 'currency_id')
  String get currencyId;
  @override
  int get rate;
  @override
  @JsonKey(name: 'account_value')
  int get accountValue;
  @override
  @JsonKey(name: 'account_value_summary')
  double get accountValueSummary;

  /// Create a copy of DebtBalanceDetailInvoiceDate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DebtBalanceDetailInvoiceDateImplCopyWith<
          _$DebtBalanceDetailInvoiceDateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
