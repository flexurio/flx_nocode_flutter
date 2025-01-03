// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'debt_card_report_per_supplier_invoice_date.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DebtCardReportPerSupplierInvoiceDate
    _$DebtCardReportPerSupplierInvoiceDateFromJson(Map<String, dynamic> json) {
  return _DebtCardReportPerSupplierInvoiceDate.fromJson(json);
}

/// @nodoc
mixin _$DebtCardReportPerSupplierInvoiceDate {
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'value_payment')
  int get valuePayment => throw _privateConstructorUsedError;
  @JsonKey(name: 'remaining_amount_paid')
  int get remainingAmountPaid => throw _privateConstructorUsedError;
  @JsonKey(name: 'remaining_amount')
  int get remainingAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'beginning_balance')
  double get beginningBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'ending_balance')
  double get endingBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'debit_balance')
  int get debitBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'credit_balance')
  int get creditBalance => throw _privateConstructorUsedError;
  dynamic get ance => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_no')
  String? get paymentNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_no')
  String? get transactionNo => throw _privateConstructorUsedError;

  /// Serializes this DebtCardReportPerSupplierInvoiceDate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DebtCardReportPerSupplierInvoiceDate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DebtCardReportPerSupplierInvoiceDateCopyWith<
          DebtCardReportPerSupplierInvoiceDate>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DebtCardReportPerSupplierInvoiceDateCopyWith<$Res> {
  factory $DebtCardReportPerSupplierInvoiceDateCopyWith(
          DebtCardReportPerSupplierInvoiceDate value,
          $Res Function(DebtCardReportPerSupplierInvoiceDate) then) =
      _$DebtCardReportPerSupplierInvoiceDateCopyWithImpl<$Res,
          DebtCardReportPerSupplierInvoiceDate>;
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      double value,
      @JsonKey(name: 'value_payment') int valuePayment,
      @JsonKey(name: 'remaining_amount_paid') int remainingAmountPaid,
      @JsonKey(name: 'remaining_amount') int remainingAmount,
      @JsonKey(name: 'beginning_balance') double beginningBalance,
      @JsonKey(name: 'ending_balance') double endingBalance,
      @JsonKey(name: 'debit_balance') int debitBalance,
      @JsonKey(name: 'credit_balance') int creditBalance,
      dynamic ance,
      String? description,
      @JsonKey(name: 'payment_no') String? paymentNo,
      @JsonKey(name: 'transaction_no') String? transactionNo});
}

/// @nodoc
class _$DebtCardReportPerSupplierInvoiceDateCopyWithImpl<$Res,
        $Val extends DebtCardReportPerSupplierInvoiceDate>
    implements $DebtCardReportPerSupplierInvoiceDateCopyWith<$Res> {
  _$DebtCardReportPerSupplierInvoiceDateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DebtCardReportPerSupplierInvoiceDate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionDate = null,
    Object? value = null,
    Object? valuePayment = null,
    Object? remainingAmountPaid = null,
    Object? remainingAmount = null,
    Object? beginningBalance = null,
    Object? endingBalance = null,
    Object? debitBalance = null,
    Object? creditBalance = null,
    Object? ance = freezed,
    Object? description = freezed,
    Object? paymentNo = freezed,
    Object? transactionNo = freezed,
  }) {
    return _then(_value.copyWith(
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      valuePayment: null == valuePayment
          ? _value.valuePayment
          : valuePayment // ignore: cast_nullable_to_non_nullable
              as int,
      remainingAmountPaid: null == remainingAmountPaid
          ? _value.remainingAmountPaid
          : remainingAmountPaid // ignore: cast_nullable_to_non_nullable
              as int,
      remainingAmount: null == remainingAmount
          ? _value.remainingAmount
          : remainingAmount // ignore: cast_nullable_to_non_nullable
              as int,
      beginningBalance: null == beginningBalance
          ? _value.beginningBalance
          : beginningBalance // ignore: cast_nullable_to_non_nullable
              as double,
      endingBalance: null == endingBalance
          ? _value.endingBalance
          : endingBalance // ignore: cast_nullable_to_non_nullable
              as double,
      debitBalance: null == debitBalance
          ? _value.debitBalance
          : debitBalance // ignore: cast_nullable_to_non_nullable
              as int,
      creditBalance: null == creditBalance
          ? _value.creditBalance
          : creditBalance // ignore: cast_nullable_to_non_nullable
              as int,
      ance: freezed == ance
          ? _value.ance
          : ance // ignore: cast_nullable_to_non_nullable
              as dynamic,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentNo: freezed == paymentNo
          ? _value.paymentNo
          : paymentNo // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionNo: freezed == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DebtCardReportPerSupplierInvoiceDateImplCopyWith<$Res>
    implements $DebtCardReportPerSupplierInvoiceDateCopyWith<$Res> {
  factory _$$DebtCardReportPerSupplierInvoiceDateImplCopyWith(
          _$DebtCardReportPerSupplierInvoiceDateImpl value,
          $Res Function(_$DebtCardReportPerSupplierInvoiceDateImpl) then) =
      __$$DebtCardReportPerSupplierInvoiceDateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      double value,
      @JsonKey(name: 'value_payment') int valuePayment,
      @JsonKey(name: 'remaining_amount_paid') int remainingAmountPaid,
      @JsonKey(name: 'remaining_amount') int remainingAmount,
      @JsonKey(name: 'beginning_balance') double beginningBalance,
      @JsonKey(name: 'ending_balance') double endingBalance,
      @JsonKey(name: 'debit_balance') int debitBalance,
      @JsonKey(name: 'credit_balance') int creditBalance,
      dynamic ance,
      String? description,
      @JsonKey(name: 'payment_no') String? paymentNo,
      @JsonKey(name: 'transaction_no') String? transactionNo});
}

/// @nodoc
class __$$DebtCardReportPerSupplierInvoiceDateImplCopyWithImpl<$Res>
    extends _$DebtCardReportPerSupplierInvoiceDateCopyWithImpl<$Res,
        _$DebtCardReportPerSupplierInvoiceDateImpl>
    implements _$$DebtCardReportPerSupplierInvoiceDateImplCopyWith<$Res> {
  __$$DebtCardReportPerSupplierInvoiceDateImplCopyWithImpl(
      _$DebtCardReportPerSupplierInvoiceDateImpl _value,
      $Res Function(_$DebtCardReportPerSupplierInvoiceDateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DebtCardReportPerSupplierInvoiceDate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionDate = null,
    Object? value = null,
    Object? valuePayment = null,
    Object? remainingAmountPaid = null,
    Object? remainingAmount = null,
    Object? beginningBalance = null,
    Object? endingBalance = null,
    Object? debitBalance = null,
    Object? creditBalance = null,
    Object? ance = freezed,
    Object? description = freezed,
    Object? paymentNo = freezed,
    Object? transactionNo = freezed,
  }) {
    return _then(_$DebtCardReportPerSupplierInvoiceDateImpl(
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      valuePayment: null == valuePayment
          ? _value.valuePayment
          : valuePayment // ignore: cast_nullable_to_non_nullable
              as int,
      remainingAmountPaid: null == remainingAmountPaid
          ? _value.remainingAmountPaid
          : remainingAmountPaid // ignore: cast_nullable_to_non_nullable
              as int,
      remainingAmount: null == remainingAmount
          ? _value.remainingAmount
          : remainingAmount // ignore: cast_nullable_to_non_nullable
              as int,
      beginningBalance: null == beginningBalance
          ? _value.beginningBalance
          : beginningBalance // ignore: cast_nullable_to_non_nullable
              as double,
      endingBalance: null == endingBalance
          ? _value.endingBalance
          : endingBalance // ignore: cast_nullable_to_non_nullable
              as double,
      debitBalance: null == debitBalance
          ? _value.debitBalance
          : debitBalance // ignore: cast_nullable_to_non_nullable
              as int,
      creditBalance: null == creditBalance
          ? _value.creditBalance
          : creditBalance // ignore: cast_nullable_to_non_nullable
              as int,
      ance: freezed == ance ? _value.ance! : ance,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentNo: freezed == paymentNo
          ? _value.paymentNo
          : paymentNo // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionNo: freezed == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DebtCardReportPerSupplierInvoiceDateImpl
    extends _DebtCardReportPerSupplierInvoiceDate {
  const _$DebtCardReportPerSupplierInvoiceDateImpl(
      {@JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required this.transactionDate,
      required this.value,
      @JsonKey(name: 'value_payment') required this.valuePayment,
      @JsonKey(name: 'remaining_amount_paid') required this.remainingAmountPaid,
      @JsonKey(name: 'remaining_amount') required this.remainingAmount,
      @JsonKey(name: 'beginning_balance') required this.beginningBalance,
      @JsonKey(name: 'ending_balance') required this.endingBalance,
      @JsonKey(name: 'debit_balance') required this.debitBalance,
      @JsonKey(name: 'credit_balance') required this.creditBalance,
      this.ance,
      this.description,
      @JsonKey(name: 'payment_no') this.paymentNo,
      @JsonKey(name: 'transaction_no') this.transactionNo})
      : super._();

  factory _$DebtCardReportPerSupplierInvoiceDateImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DebtCardReportPerSupplierInvoiceDateImplFromJson(json);

  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  final DateTime transactionDate;
  @override
  final double value;
  @override
  @JsonKey(name: 'value_payment')
  final int valuePayment;
  @override
  @JsonKey(name: 'remaining_amount_paid')
  final int remainingAmountPaid;
  @override
  @JsonKey(name: 'remaining_amount')
  final int remainingAmount;
  @override
  @JsonKey(name: 'beginning_balance')
  final double beginningBalance;
  @override
  @JsonKey(name: 'ending_balance')
  final double endingBalance;
  @override
  @JsonKey(name: 'debit_balance')
  final int debitBalance;
  @override
  @JsonKey(name: 'credit_balance')
  final int creditBalance;
  @override
  final dynamic ance;
  @override
  final String? description;
  @override
  @JsonKey(name: 'payment_no')
  final String? paymentNo;
  @override
  @JsonKey(name: 'transaction_no')
  final String? transactionNo;

  @override
  String toString() {
    return 'DebtCardReportPerSupplierInvoiceDate(transactionDate: $transactionDate, value: $value, valuePayment: $valuePayment, remainingAmountPaid: $remainingAmountPaid, remainingAmount: $remainingAmount, beginningBalance: $beginningBalance, endingBalance: $endingBalance, debitBalance: $debitBalance, creditBalance: $creditBalance, ance: $ance, description: $description, paymentNo: $paymentNo, transactionNo: $transactionNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DebtCardReportPerSupplierInvoiceDateImpl &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.valuePayment, valuePayment) ||
                other.valuePayment == valuePayment) &&
            (identical(other.remainingAmountPaid, remainingAmountPaid) ||
                other.remainingAmountPaid == remainingAmountPaid) &&
            (identical(other.remainingAmount, remainingAmount) ||
                other.remainingAmount == remainingAmount) &&
            (identical(other.beginningBalance, beginningBalance) ||
                other.beginningBalance == beginningBalance) &&
            (identical(other.endingBalance, endingBalance) ||
                other.endingBalance == endingBalance) &&
            (identical(other.debitBalance, debitBalance) ||
                other.debitBalance == debitBalance) &&
            (identical(other.creditBalance, creditBalance) ||
                other.creditBalance == creditBalance) &&
            const DeepCollectionEquality().equals(other.ance, ance) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.paymentNo, paymentNo) ||
                other.paymentNo == paymentNo) &&
            (identical(other.transactionNo, transactionNo) ||
                other.transactionNo == transactionNo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      transactionDate,
      value,
      valuePayment,
      remainingAmountPaid,
      remainingAmount,
      beginningBalance,
      endingBalance,
      debitBalance,
      creditBalance,
      const DeepCollectionEquality().hash(ance),
      description,
      paymentNo,
      transactionNo);

  /// Create a copy of DebtCardReportPerSupplierInvoiceDate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DebtCardReportPerSupplierInvoiceDateImplCopyWith<
          _$DebtCardReportPerSupplierInvoiceDateImpl>
      get copyWith => __$$DebtCardReportPerSupplierInvoiceDateImplCopyWithImpl<
          _$DebtCardReportPerSupplierInvoiceDateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DebtCardReportPerSupplierInvoiceDateImplToJson(
      this,
    );
  }
}

abstract class _DebtCardReportPerSupplierInvoiceDate
    extends DebtCardReportPerSupplierInvoiceDate {
  const factory _DebtCardReportPerSupplierInvoiceDate(
          {@JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
          required final DateTime transactionDate,
          required final double value,
          @JsonKey(name: 'value_payment') required final int valuePayment,
          @JsonKey(name: 'remaining_amount_paid')
          required final int remainingAmountPaid,
          @JsonKey(name: 'remaining_amount') required final int remainingAmount,
          @JsonKey(name: 'beginning_balance')
          required final double beginningBalance,
          @JsonKey(name: 'ending_balance') required final double endingBalance,
          @JsonKey(name: 'debit_balance') required final int debitBalance,
          @JsonKey(name: 'credit_balance') required final int creditBalance,
          final dynamic ance,
          final String? description,
          @JsonKey(name: 'payment_no') final String? paymentNo,
          @JsonKey(name: 'transaction_no') final String? transactionNo}) =
      _$DebtCardReportPerSupplierInvoiceDateImpl;
  const _DebtCardReportPerSupplierInvoiceDate._() : super._();

  factory _DebtCardReportPerSupplierInvoiceDate.fromJson(
          Map<String, dynamic> json) =
      _$DebtCardReportPerSupplierInvoiceDateImpl.fromJson;

  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate;
  @override
  double get value;
  @override
  @JsonKey(name: 'value_payment')
  int get valuePayment;
  @override
  @JsonKey(name: 'remaining_amount_paid')
  int get remainingAmountPaid;
  @override
  @JsonKey(name: 'remaining_amount')
  int get remainingAmount;
  @override
  @JsonKey(name: 'beginning_balance')
  double get beginningBalance;
  @override
  @JsonKey(name: 'ending_balance')
  double get endingBalance;
  @override
  @JsonKey(name: 'debit_balance')
  int get debitBalance;
  @override
  @JsonKey(name: 'credit_balance')
  int get creditBalance;
  @override
  dynamic get ance;
  @override
  String? get description;
  @override
  @JsonKey(name: 'payment_no')
  String? get paymentNo;
  @override
  @JsonKey(name: 'transaction_no')
  String? get transactionNo;

  /// Create a copy of DebtCardReportPerSupplierInvoiceDate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DebtCardReportPerSupplierInvoiceDateImplCopyWith<
          _$DebtCardReportPerSupplierInvoiceDateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
