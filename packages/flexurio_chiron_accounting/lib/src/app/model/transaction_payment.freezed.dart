// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_payment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionPayment _$TransactionPaymentFromJson(Map<String, dynamic> json) {
  return _TransactionPayment.fromJson(json);
}

/// @nodoc
mixin _$TransactionPayment {
  String get period => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  String get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_no')
  String get transactionNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_no')
  String? get invoiceNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier')
  String get supplierName => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_id')
  String get supplierId => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_id')
  String? get paymentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_date', fromJson: dateTimeNullable)
  DateTime? get paymentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_total')
  double get paymentTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_type_transaction')
  int get isTypeTransaction => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_remaining')
  double get paymentRemaining => throw _privateConstructorUsedError;

  /// Serializes this TransactionPayment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TransactionPayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionPaymentCopyWith<TransactionPayment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionPaymentCopyWith<$Res> {
  factory $TransactionPaymentCopyWith(
          TransactionPayment value, $Res Function(TransactionPayment) then) =
      _$TransactionPaymentCopyWithImpl<$Res, TransactionPayment>;
  @useResult
  $Res call(
      {String period,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'order_id') String orderId,
      @JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'invoice_no') String? invoiceNo,
      @JsonKey(name: 'supplier') String supplierName,
      @JsonKey(name: 'supplier_id') String supplierId,
      double total,
      @JsonKey(name: 'payment_id') String? paymentId,
      @JsonKey(name: 'payment_date', fromJson: dateTimeNullable)
      DateTime? paymentDate,
      @JsonKey(name: 'payment_total') double paymentTotal,
      @JsonKey(name: 'is_type_transaction') int isTypeTransaction,
      @JsonKey(name: 'payment_remaining') double paymentRemaining});
}

/// @nodoc
class _$TransactionPaymentCopyWithImpl<$Res, $Val extends TransactionPayment>
    implements $TransactionPaymentCopyWith<$Res> {
  _$TransactionPaymentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionPayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? transactionDate = null,
    Object? orderId = null,
    Object? transactionNo = null,
    Object? invoiceNo = freezed,
    Object? supplierName = null,
    Object? supplierId = null,
    Object? total = null,
    Object? paymentId = freezed,
    Object? paymentDate = freezed,
    Object? paymentTotal = null,
    Object? isTypeTransaction = null,
    Object? paymentRemaining = null,
  }) {
    return _then(_value.copyWith(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionNo: null == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceNo: freezed == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierName: null == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      supplierId: null == supplierId
          ? _value.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentDate: freezed == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paymentTotal: null == paymentTotal
          ? _value.paymentTotal
          : paymentTotal // ignore: cast_nullable_to_non_nullable
              as double,
      isTypeTransaction: null == isTypeTransaction
          ? _value.isTypeTransaction
          : isTypeTransaction // ignore: cast_nullable_to_non_nullable
              as int,
      paymentRemaining: null == paymentRemaining
          ? _value.paymentRemaining
          : paymentRemaining // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionPaymentImplCopyWith<$Res>
    implements $TransactionPaymentCopyWith<$Res> {
  factory _$$TransactionPaymentImplCopyWith(_$TransactionPaymentImpl value,
          $Res Function(_$TransactionPaymentImpl) then) =
      __$$TransactionPaymentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String period,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'order_id') String orderId,
      @JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'invoice_no') String? invoiceNo,
      @JsonKey(name: 'supplier') String supplierName,
      @JsonKey(name: 'supplier_id') String supplierId,
      double total,
      @JsonKey(name: 'payment_id') String? paymentId,
      @JsonKey(name: 'payment_date', fromJson: dateTimeNullable)
      DateTime? paymentDate,
      @JsonKey(name: 'payment_total') double paymentTotal,
      @JsonKey(name: 'is_type_transaction') int isTypeTransaction,
      @JsonKey(name: 'payment_remaining') double paymentRemaining});
}

/// @nodoc
class __$$TransactionPaymentImplCopyWithImpl<$Res>
    extends _$TransactionPaymentCopyWithImpl<$Res, _$TransactionPaymentImpl>
    implements _$$TransactionPaymentImplCopyWith<$Res> {
  __$$TransactionPaymentImplCopyWithImpl(_$TransactionPaymentImpl _value,
      $Res Function(_$TransactionPaymentImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionPayment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? transactionDate = null,
    Object? orderId = null,
    Object? transactionNo = null,
    Object? invoiceNo = freezed,
    Object? supplierName = null,
    Object? supplierId = null,
    Object? total = null,
    Object? paymentId = freezed,
    Object? paymentDate = freezed,
    Object? paymentTotal = null,
    Object? isTypeTransaction = null,
    Object? paymentRemaining = null,
  }) {
    return _then(_$TransactionPaymentImpl(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionNo: null == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceNo: freezed == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierName: null == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      supplierId: null == supplierId
          ? _value.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      paymentId: freezed == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentDate: freezed == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paymentTotal: null == paymentTotal
          ? _value.paymentTotal
          : paymentTotal // ignore: cast_nullable_to_non_nullable
              as double,
      isTypeTransaction: null == isTypeTransaction
          ? _value.isTypeTransaction
          : isTypeTransaction // ignore: cast_nullable_to_non_nullable
              as int,
      paymentRemaining: null == paymentRemaining
          ? _value.paymentRemaining
          : paymentRemaining // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionPaymentImpl extends _TransactionPayment {
  _$TransactionPaymentImpl(
      {required this.period,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required this.transactionDate,
      @JsonKey(name: 'order_id') required this.orderId,
      @JsonKey(name: 'transaction_no') required this.transactionNo,
      @JsonKey(name: 'invoice_no') this.invoiceNo,
      @JsonKey(name: 'supplier') required this.supplierName,
      @JsonKey(name: 'supplier_id') required this.supplierId,
      required this.total,
      @JsonKey(name: 'payment_id') this.paymentId,
      @JsonKey(name: 'payment_date', fromJson: dateTimeNullable)
      this.paymentDate,
      @JsonKey(name: 'payment_total') required this.paymentTotal,
      @JsonKey(name: 'is_type_transaction') required this.isTypeTransaction,
      @JsonKey(name: 'payment_remaining') required this.paymentRemaining})
      : super._();

  factory _$TransactionPaymentImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionPaymentImplFromJson(json);

  @override
  final String period;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  final DateTime transactionDate;
  @override
  @JsonKey(name: 'order_id')
  final String orderId;
  @override
  @JsonKey(name: 'transaction_no')
  final String transactionNo;
  @override
  @JsonKey(name: 'invoice_no')
  final String? invoiceNo;
  @override
  @JsonKey(name: 'supplier')
  final String supplierName;
  @override
  @JsonKey(name: 'supplier_id')
  final String supplierId;
  @override
  final double total;
  @override
  @JsonKey(name: 'payment_id')
  final String? paymentId;
  @override
  @JsonKey(name: 'payment_date', fromJson: dateTimeNullable)
  final DateTime? paymentDate;
  @override
  @JsonKey(name: 'payment_total')
  final double paymentTotal;
  @override
  @JsonKey(name: 'is_type_transaction')
  final int isTypeTransaction;
  @override
  @JsonKey(name: 'payment_remaining')
  final double paymentRemaining;

  @override
  String toString() {
    return 'TransactionPayment(period: $period, transactionDate: $transactionDate, orderId: $orderId, transactionNo: $transactionNo, invoiceNo: $invoiceNo, supplierName: $supplierName, supplierId: $supplierId, total: $total, paymentId: $paymentId, paymentDate: $paymentDate, paymentTotal: $paymentTotal, isTypeTransaction: $isTypeTransaction, paymentRemaining: $paymentRemaining)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionPaymentImpl &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.transactionNo, transactionNo) ||
                other.transactionNo == transactionNo) &&
            (identical(other.invoiceNo, invoiceNo) ||
                other.invoiceNo == invoiceNo) &&
            (identical(other.supplierName, supplierName) ||
                other.supplierName == supplierName) &&
            (identical(other.supplierId, supplierId) ||
                other.supplierId == supplierId) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.paymentDate, paymentDate) ||
                other.paymentDate == paymentDate) &&
            (identical(other.paymentTotal, paymentTotal) ||
                other.paymentTotal == paymentTotal) &&
            (identical(other.isTypeTransaction, isTypeTransaction) ||
                other.isTypeTransaction == isTypeTransaction) &&
            (identical(other.paymentRemaining, paymentRemaining) ||
                other.paymentRemaining == paymentRemaining));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      period,
      transactionDate,
      orderId,
      transactionNo,
      invoiceNo,
      supplierName,
      supplierId,
      total,
      paymentId,
      paymentDate,
      paymentTotal,
      isTypeTransaction,
      paymentRemaining);

  /// Create a copy of TransactionPayment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionPaymentImplCopyWith<_$TransactionPaymentImpl> get copyWith =>
      __$$TransactionPaymentImplCopyWithImpl<_$TransactionPaymentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionPaymentImplToJson(
      this,
    );
  }
}

abstract class _TransactionPayment extends TransactionPayment {
  factory _TransactionPayment(
      {required final String period,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required final DateTime transactionDate,
      @JsonKey(name: 'order_id') required final String orderId,
      @JsonKey(name: 'transaction_no') required final String transactionNo,
      @JsonKey(name: 'invoice_no') final String? invoiceNo,
      @JsonKey(name: 'supplier') required final String supplierName,
      @JsonKey(name: 'supplier_id') required final String supplierId,
      required final double total,
      @JsonKey(name: 'payment_id') final String? paymentId,
      @JsonKey(name: 'payment_date', fromJson: dateTimeNullable)
      final DateTime? paymentDate,
      @JsonKey(name: 'payment_total') required final double paymentTotal,
      @JsonKey(name: 'is_type_transaction')
      required final int isTypeTransaction,
      @JsonKey(name: 'payment_remaining')
      required final double paymentRemaining}) = _$TransactionPaymentImpl;
  _TransactionPayment._() : super._();

  factory _TransactionPayment.fromJson(Map<String, dynamic> json) =
      _$TransactionPaymentImpl.fromJson;

  @override
  String get period;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate;
  @override
  @JsonKey(name: 'order_id')
  String get orderId;
  @override
  @JsonKey(name: 'transaction_no')
  String get transactionNo;
  @override
  @JsonKey(name: 'invoice_no')
  String? get invoiceNo;
  @override
  @JsonKey(name: 'supplier')
  String get supplierName;
  @override
  @JsonKey(name: 'supplier_id')
  String get supplierId;
  @override
  double get total;
  @override
  @JsonKey(name: 'payment_id')
  String? get paymentId;
  @override
  @JsonKey(name: 'payment_date', fromJson: dateTimeNullable)
  DateTime? get paymentDate;
  @override
  @JsonKey(name: 'payment_total')
  double get paymentTotal;
  @override
  @JsonKey(name: 'is_type_transaction')
  int get isTypeTransaction;
  @override
  @JsonKey(name: 'payment_remaining')
  double get paymentRemaining;

  /// Create a copy of TransactionPayment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TransactionPaymentImplCopyWith<_$TransactionPaymentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
