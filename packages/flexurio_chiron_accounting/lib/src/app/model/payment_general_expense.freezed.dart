// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_general_expense.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentGeneralExpense _$PaymentGeneralExpenseFromJson(
    Map<String, dynamic> json) {
  return _PaymentGeneralExpense.fromJson(json);
}

/// @nodoc
mixin _$PaymentGeneralExpense {
  String get period => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_no')
  String get transactionNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_no', defaultValue: '')
  String get paymentNo => throw _privateConstructorUsedError;
  String get supplier => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_id')
  String get supplierId => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_date', fromJson: dateTimeNullable)
  DateTime? get paymentDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_total')
  double get paymentTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_remaining')
  double get paymentRemaining => throw _privateConstructorUsedError;

  /// Serializes this PaymentGeneralExpense to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentGeneralExpense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentGeneralExpenseCopyWith<PaymentGeneralExpense> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentGeneralExpenseCopyWith<$Res> {
  factory $PaymentGeneralExpenseCopyWith(PaymentGeneralExpense value,
          $Res Function(PaymentGeneralExpense) then) =
      _$PaymentGeneralExpenseCopyWithImpl<$Res, PaymentGeneralExpense>;
  @useResult
  $Res call(
      {String period,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'payment_no', defaultValue: '') String paymentNo,
      String supplier,
      @JsonKey(name: 'supplier_id') String supplierId,
      double total,
      @JsonKey(name: 'payment_date', fromJson: dateTimeNullable)
      DateTime? paymentDate,
      @JsonKey(name: 'payment_total') double paymentTotal,
      @JsonKey(name: 'payment_remaining') double paymentRemaining});
}

/// @nodoc
class _$PaymentGeneralExpenseCopyWithImpl<$Res,
        $Val extends PaymentGeneralExpense>
    implements $PaymentGeneralExpenseCopyWith<$Res> {
  _$PaymentGeneralExpenseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentGeneralExpense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? transactionDate = null,
    Object? transactionNo = null,
    Object? paymentNo = null,
    Object? supplier = null,
    Object? supplierId = null,
    Object? total = null,
    Object? paymentDate = freezed,
    Object? paymentTotal = null,
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
      transactionNo: null == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String,
      paymentNo: null == paymentNo
          ? _value.paymentNo
          : paymentNo // ignore: cast_nullable_to_non_nullable
              as String,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String,
      supplierId: null == supplierId
          ? _value.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      paymentDate: freezed == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paymentTotal: null == paymentTotal
          ? _value.paymentTotal
          : paymentTotal // ignore: cast_nullable_to_non_nullable
              as double,
      paymentRemaining: null == paymentRemaining
          ? _value.paymentRemaining
          : paymentRemaining // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentGeneralExpenseImplCopyWith<$Res>
    implements $PaymentGeneralExpenseCopyWith<$Res> {
  factory _$$PaymentGeneralExpenseImplCopyWith(
          _$PaymentGeneralExpenseImpl value,
          $Res Function(_$PaymentGeneralExpenseImpl) then) =
      __$$PaymentGeneralExpenseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String period,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'payment_no', defaultValue: '') String paymentNo,
      String supplier,
      @JsonKey(name: 'supplier_id') String supplierId,
      double total,
      @JsonKey(name: 'payment_date', fromJson: dateTimeNullable)
      DateTime? paymentDate,
      @JsonKey(name: 'payment_total') double paymentTotal,
      @JsonKey(name: 'payment_remaining') double paymentRemaining});
}

/// @nodoc
class __$$PaymentGeneralExpenseImplCopyWithImpl<$Res>
    extends _$PaymentGeneralExpenseCopyWithImpl<$Res,
        _$PaymentGeneralExpenseImpl>
    implements _$$PaymentGeneralExpenseImplCopyWith<$Res> {
  __$$PaymentGeneralExpenseImplCopyWithImpl(_$PaymentGeneralExpenseImpl _value,
      $Res Function(_$PaymentGeneralExpenseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentGeneralExpense
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? transactionDate = null,
    Object? transactionNo = null,
    Object? paymentNo = null,
    Object? supplier = null,
    Object? supplierId = null,
    Object? total = null,
    Object? paymentDate = freezed,
    Object? paymentTotal = null,
    Object? paymentRemaining = null,
  }) {
    return _then(_$PaymentGeneralExpenseImpl(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionNo: null == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String,
      paymentNo: null == paymentNo
          ? _value.paymentNo
          : paymentNo // ignore: cast_nullable_to_non_nullable
              as String,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String,
      supplierId: null == supplierId
          ? _value.supplierId
          : supplierId // ignore: cast_nullable_to_non_nullable
              as String,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      paymentDate: freezed == paymentDate
          ? _value.paymentDate
          : paymentDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      paymentTotal: null == paymentTotal
          ? _value.paymentTotal
          : paymentTotal // ignore: cast_nullable_to_non_nullable
              as double,
      paymentRemaining: null == paymentRemaining
          ? _value.paymentRemaining
          : paymentRemaining // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentGeneralExpenseImpl extends _PaymentGeneralExpense {
  _$PaymentGeneralExpenseImpl(
      {required this.period,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required this.transactionDate,
      @JsonKey(name: 'transaction_no') required this.transactionNo,
      @JsonKey(name: 'payment_no', defaultValue: '') required this.paymentNo,
      required this.supplier,
      @JsonKey(name: 'supplier_id') required this.supplierId,
      required this.total,
      @JsonKey(name: 'payment_date', fromJson: dateTimeNullable)
      this.paymentDate,
      @JsonKey(name: 'payment_total') required this.paymentTotal,
      @JsonKey(name: 'payment_remaining') required this.paymentRemaining})
      : super._();

  factory _$PaymentGeneralExpenseImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentGeneralExpenseImplFromJson(json);

  @override
  final String period;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  final DateTime transactionDate;
  @override
  @JsonKey(name: 'transaction_no')
  final String transactionNo;
  @override
  @JsonKey(name: 'payment_no', defaultValue: '')
  final String paymentNo;
  @override
  final String supplier;
  @override
  @JsonKey(name: 'supplier_id')
  final String supplierId;
  @override
  final double total;
  @override
  @JsonKey(name: 'payment_date', fromJson: dateTimeNullable)
  final DateTime? paymentDate;
  @override
  @JsonKey(name: 'payment_total')
  final double paymentTotal;
  @override
  @JsonKey(name: 'payment_remaining')
  final double paymentRemaining;

  @override
  String toString() {
    return 'PaymentGeneralExpense(period: $period, transactionDate: $transactionDate, transactionNo: $transactionNo, paymentNo: $paymentNo, supplier: $supplier, supplierId: $supplierId, total: $total, paymentDate: $paymentDate, paymentTotal: $paymentTotal, paymentRemaining: $paymentRemaining)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentGeneralExpenseImpl &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.transactionNo, transactionNo) ||
                other.transactionNo == transactionNo) &&
            (identical(other.paymentNo, paymentNo) ||
                other.paymentNo == paymentNo) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.supplierId, supplierId) ||
                other.supplierId == supplierId) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.paymentDate, paymentDate) ||
                other.paymentDate == paymentDate) &&
            (identical(other.paymentTotal, paymentTotal) ||
                other.paymentTotal == paymentTotal) &&
            (identical(other.paymentRemaining, paymentRemaining) ||
                other.paymentRemaining == paymentRemaining));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      period,
      transactionDate,
      transactionNo,
      paymentNo,
      supplier,
      supplierId,
      total,
      paymentDate,
      paymentTotal,
      paymentRemaining);

  /// Create a copy of PaymentGeneralExpense
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentGeneralExpenseImplCopyWith<_$PaymentGeneralExpenseImpl>
      get copyWith => __$$PaymentGeneralExpenseImplCopyWithImpl<
          _$PaymentGeneralExpenseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentGeneralExpenseImplToJson(
      this,
    );
  }
}

abstract class _PaymentGeneralExpense extends PaymentGeneralExpense {
  factory _PaymentGeneralExpense(
      {required final String period,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required final DateTime transactionDate,
      @JsonKey(name: 'transaction_no') required final String transactionNo,
      @JsonKey(name: 'payment_no', defaultValue: '')
      required final String paymentNo,
      required final String supplier,
      @JsonKey(name: 'supplier_id') required final String supplierId,
      required final double total,
      @JsonKey(name: 'payment_date', fromJson: dateTimeNullable)
      final DateTime? paymentDate,
      @JsonKey(name: 'payment_total') required final double paymentTotal,
      @JsonKey(name: 'payment_remaining')
      required final double paymentRemaining}) = _$PaymentGeneralExpenseImpl;
  _PaymentGeneralExpense._() : super._();

  factory _PaymentGeneralExpense.fromJson(Map<String, dynamic> json) =
      _$PaymentGeneralExpenseImpl.fromJson;

  @override
  String get period;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate;
  @override
  @JsonKey(name: 'transaction_no')
  String get transactionNo;
  @override
  @JsonKey(name: 'payment_no', defaultValue: '')
  String get paymentNo;
  @override
  String get supplier;
  @override
  @JsonKey(name: 'supplier_id')
  String get supplierId;
  @override
  double get total;
  @override
  @JsonKey(name: 'payment_date', fromJson: dateTimeNullable)
  DateTime? get paymentDate;
  @override
  @JsonKey(name: 'payment_total')
  double get paymentTotal;
  @override
  @JsonKey(name: 'payment_remaining')
  double get paymentRemaining;

  /// Create a copy of PaymentGeneralExpense
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentGeneralExpenseImplCopyWith<_$PaymentGeneralExpenseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
