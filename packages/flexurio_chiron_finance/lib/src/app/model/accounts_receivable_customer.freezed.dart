// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accounts_receivable_customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AccountsReceivableCustomer _$AccountsReceivableCustomerFromJson(
    Map<String, dynamic> json) {
  return _AccountsReceivableCustomer.fromJson(json);
}

/// @nodoc
mixin _$AccountsReceivableCustomer {
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_no')
  String get paymentNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_no')
  String get transactionNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'value')
  int get value => throw _privateConstructorUsedError;
  @JsonKey(name: 'value_payment')
  int get valuePayment => throw _privateConstructorUsedError;
  @JsonKey(name: 'remaining_amount_paid')
  int get remainingAmountPaid => throw _privateConstructorUsedError;
  @JsonKey(name: 'remaining_amount')
  int get remainingAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'beginning_balance')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'ending_balance')
  int get endingBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'debit_balance')
  int get debitBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'credit_balance')
  int get creditBalance => throw _privateConstructorUsedError;

  /// Serializes this AccountsReceivableCustomer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AccountsReceivableCustomer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountsReceivableCustomerCopyWith<AccountsReceivableCustomer>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsReceivableCustomerCopyWith<$Res> {
  factory $AccountsReceivableCustomerCopyWith(AccountsReceivableCustomer value,
          $Res Function(AccountsReceivableCustomer) then) =
      _$AccountsReceivableCustomerCopyWithImpl<$Res,
          AccountsReceivableCustomer>;
  @useResult
  $Res call(
      {@JsonKey(name: 'description') String description,
      @JsonKey(name: 'payment_no') String paymentNo,
      @JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'value') int value,
      @JsonKey(name: 'value_payment') int valuePayment,
      @JsonKey(name: 'remaining_amount_paid') int remainingAmountPaid,
      @JsonKey(name: 'remaining_amount') int remainingAmount,
      @JsonKey(name: 'beginning_balance') int id,
      @JsonKey(name: 'ending_balance') int endingBalance,
      @JsonKey(name: 'debit_balance') int debitBalance,
      @JsonKey(name: 'credit_balance') int creditBalance});
}

/// @nodoc
class _$AccountsReceivableCustomerCopyWithImpl<$Res,
        $Val extends AccountsReceivableCustomer>
    implements $AccountsReceivableCustomerCopyWith<$Res> {
  _$AccountsReceivableCustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountsReceivableCustomer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? paymentNo = null,
    Object? transactionNo = null,
    Object? transactionDate = null,
    Object? value = null,
    Object? valuePayment = null,
    Object? remainingAmountPaid = null,
    Object? remainingAmount = null,
    Object? id = null,
    Object? endingBalance = null,
    Object? debitBalance = null,
    Object? creditBalance = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      paymentNo: null == paymentNo
          ? _value.paymentNo
          : paymentNo // ignore: cast_nullable_to_non_nullable
              as String,
      transactionNo: null == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
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
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      endingBalance: null == endingBalance
          ? _value.endingBalance
          : endingBalance // ignore: cast_nullable_to_non_nullable
              as int,
      debitBalance: null == debitBalance
          ? _value.debitBalance
          : debitBalance // ignore: cast_nullable_to_non_nullable
              as int,
      creditBalance: null == creditBalance
          ? _value.creditBalance
          : creditBalance // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccountsReceivableCustomerImplCopyWith<$Res>
    implements $AccountsReceivableCustomerCopyWith<$Res> {
  factory _$$AccountsReceivableCustomerImplCopyWith(
          _$AccountsReceivableCustomerImpl value,
          $Res Function(_$AccountsReceivableCustomerImpl) then) =
      __$$AccountsReceivableCustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'description') String description,
      @JsonKey(name: 'payment_no') String paymentNo,
      @JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'value') int value,
      @JsonKey(name: 'value_payment') int valuePayment,
      @JsonKey(name: 'remaining_amount_paid') int remainingAmountPaid,
      @JsonKey(name: 'remaining_amount') int remainingAmount,
      @JsonKey(name: 'beginning_balance') int id,
      @JsonKey(name: 'ending_balance') int endingBalance,
      @JsonKey(name: 'debit_balance') int debitBalance,
      @JsonKey(name: 'credit_balance') int creditBalance});
}

/// @nodoc
class __$$AccountsReceivableCustomerImplCopyWithImpl<$Res>
    extends _$AccountsReceivableCustomerCopyWithImpl<$Res,
        _$AccountsReceivableCustomerImpl>
    implements _$$AccountsReceivableCustomerImplCopyWith<$Res> {
  __$$AccountsReceivableCustomerImplCopyWithImpl(
      _$AccountsReceivableCustomerImpl _value,
      $Res Function(_$AccountsReceivableCustomerImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountsReceivableCustomer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? paymentNo = null,
    Object? transactionNo = null,
    Object? transactionDate = null,
    Object? value = null,
    Object? valuePayment = null,
    Object? remainingAmountPaid = null,
    Object? remainingAmount = null,
    Object? id = null,
    Object? endingBalance = null,
    Object? debitBalance = null,
    Object? creditBalance = null,
  }) {
    return _then(_$AccountsReceivableCustomerImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      paymentNo: null == paymentNo
          ? _value.paymentNo
          : paymentNo // ignore: cast_nullable_to_non_nullable
              as String,
      transactionNo: null == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
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
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      endingBalance: null == endingBalance
          ? _value.endingBalance
          : endingBalance // ignore: cast_nullable_to_non_nullable
              as int,
      debitBalance: null == debitBalance
          ? _value.debitBalance
          : debitBalance // ignore: cast_nullable_to_non_nullable
              as int,
      creditBalance: null == creditBalance
          ? _value.creditBalance
          : creditBalance // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AccountsReceivableCustomerImpl extends _AccountsReceivableCustomer {
  _$AccountsReceivableCustomerImpl(
      {@JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'payment_no') required this.paymentNo,
      @JsonKey(name: 'transaction_no') required this.transactionNo,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required this.transactionDate,
      @JsonKey(name: 'value') required this.value,
      @JsonKey(name: 'value_payment') required this.valuePayment,
      @JsonKey(name: 'remaining_amount_paid') required this.remainingAmountPaid,
      @JsonKey(name: 'remaining_amount') required this.remainingAmount,
      @JsonKey(name: 'beginning_balance') required this.id,
      @JsonKey(name: 'ending_balance') required this.endingBalance,
      @JsonKey(name: 'debit_balance') required this.debitBalance,
      @JsonKey(name: 'credit_balance') required this.creditBalance})
      : super._();

  factory _$AccountsReceivableCustomerImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$AccountsReceivableCustomerImplFromJson(json);

  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'payment_no')
  final String paymentNo;
  @override
  @JsonKey(name: 'transaction_no')
  final String transactionNo;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  final DateTime transactionDate;
  @override
  @JsonKey(name: 'value')
  final int value;
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
  final int id;
  @override
  @JsonKey(name: 'ending_balance')
  final int endingBalance;
  @override
  @JsonKey(name: 'debit_balance')
  final int debitBalance;
  @override
  @JsonKey(name: 'credit_balance')
  final int creditBalance;

  @override
  String toString() {
    return 'AccountsReceivableCustomer(description: $description, paymentNo: $paymentNo, transactionNo: $transactionNo, transactionDate: $transactionDate, value: $value, valuePayment: $valuePayment, remainingAmountPaid: $remainingAmountPaid, remainingAmount: $remainingAmount, id: $id, endingBalance: $endingBalance, debitBalance: $debitBalance, creditBalance: $creditBalance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountsReceivableCustomerImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.paymentNo, paymentNo) ||
                other.paymentNo == paymentNo) &&
            (identical(other.transactionNo, transactionNo) ||
                other.transactionNo == transactionNo) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.valuePayment, valuePayment) ||
                other.valuePayment == valuePayment) &&
            (identical(other.remainingAmountPaid, remainingAmountPaid) ||
                other.remainingAmountPaid == remainingAmountPaid) &&
            (identical(other.remainingAmount, remainingAmount) ||
                other.remainingAmount == remainingAmount) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.endingBalance, endingBalance) ||
                other.endingBalance == endingBalance) &&
            (identical(other.debitBalance, debitBalance) ||
                other.debitBalance == debitBalance) &&
            (identical(other.creditBalance, creditBalance) ||
                other.creditBalance == creditBalance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      description,
      paymentNo,
      transactionNo,
      transactionDate,
      value,
      valuePayment,
      remainingAmountPaid,
      remainingAmount,
      id,
      endingBalance,
      debitBalance,
      creditBalance);

  /// Create a copy of AccountsReceivableCustomer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountsReceivableCustomerImplCopyWith<_$AccountsReceivableCustomerImpl>
      get copyWith => __$$AccountsReceivableCustomerImplCopyWithImpl<
          _$AccountsReceivableCustomerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AccountsReceivableCustomerImplToJson(
      this,
    );
  }
}

abstract class _AccountsReceivableCustomer extends AccountsReceivableCustomer {
  factory _AccountsReceivableCustomer(
          {@JsonKey(name: 'description') required final String description,
          @JsonKey(name: 'payment_no') required final String paymentNo,
          @JsonKey(name: 'transaction_no') required final String transactionNo,
          @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
          required final DateTime transactionDate,
          @JsonKey(name: 'value') required final int value,
          @JsonKey(name: 'value_payment') required final int valuePayment,
          @JsonKey(name: 'remaining_amount_paid')
          required final int remainingAmountPaid,
          @JsonKey(name: 'remaining_amount') required final int remainingAmount,
          @JsonKey(name: 'beginning_balance') required final int id,
          @JsonKey(name: 'ending_balance') required final int endingBalance,
          @JsonKey(name: 'debit_balance') required final int debitBalance,
          @JsonKey(name: 'credit_balance') required final int creditBalance}) =
      _$AccountsReceivableCustomerImpl;
  _AccountsReceivableCustomer._() : super._();

  factory _AccountsReceivableCustomer.fromJson(Map<String, dynamic> json) =
      _$AccountsReceivableCustomerImpl.fromJson;

  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'payment_no')
  String get paymentNo;
  @override
  @JsonKey(name: 'transaction_no')
  String get transactionNo;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate;
  @override
  @JsonKey(name: 'value')
  int get value;
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
  int get id;
  @override
  @JsonKey(name: 'ending_balance')
  int get endingBalance;
  @override
  @JsonKey(name: 'debit_balance')
  int get debitBalance;
  @override
  @JsonKey(name: 'credit_balance')
  int get creditBalance;

  /// Create a copy of AccountsReceivableCustomer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountsReceivableCustomerImplCopyWith<_$AccountsReceivableCustomerImpl>
      get copyWith => throw _privateConstructorUsedError;
}
