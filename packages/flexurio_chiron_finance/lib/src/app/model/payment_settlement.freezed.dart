// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_settlement.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentSettlement _$PaymentSettlementFromJson(Map<String, dynamic> json) {
  return _PaymentSettlement.fromJson(json);
}

/// @nodoc
mixin _$PaymentSettlement {
  @JsonKey(name: 'payment_no')
  String get paymentNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_no')
  String get transactionNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'value_transaction_type')
  int get valueTransactionType => throw _privateConstructorUsedError;

  /// Serializes this PaymentSettlement to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentSettlement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentSettlementCopyWith<PaymentSettlement> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentSettlementCopyWith<$Res> {
  factory $PaymentSettlementCopyWith(
          PaymentSettlement value, $Res Function(PaymentSettlement) then) =
      _$PaymentSettlementCopyWithImpl<$Res, PaymentSettlement>;
  @useResult
  $Res call(
      {@JsonKey(name: 'payment_no') String paymentNo,
      @JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'value_transaction_type') int valueTransactionType});
}

/// @nodoc
class _$PaymentSettlementCopyWithImpl<$Res, $Val extends PaymentSettlement>
    implements $PaymentSettlementCopyWith<$Res> {
  _$PaymentSettlementCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentSettlement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentNo = null,
    Object? transactionNo = null,
    Object? transactionDate = null,
    Object? customerName = null,
    Object? customerId = null,
    Object? valueTransactionType = null,
  }) {
    return _then(_value.copyWith(
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
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      valueTransactionType: null == valueTransactionType
          ? _value.valueTransactionType
          : valueTransactionType // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentSettlementImplCopyWith<$Res>
    implements $PaymentSettlementCopyWith<$Res> {
  factory _$$PaymentSettlementImplCopyWith(_$PaymentSettlementImpl value,
          $Res Function(_$PaymentSettlementImpl) then) =
      __$$PaymentSettlementImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'payment_no') String paymentNo,
      @JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'value_transaction_type') int valueTransactionType});
}

/// @nodoc
class __$$PaymentSettlementImplCopyWithImpl<$Res>
    extends _$PaymentSettlementCopyWithImpl<$Res, _$PaymentSettlementImpl>
    implements _$$PaymentSettlementImplCopyWith<$Res> {
  __$$PaymentSettlementImplCopyWithImpl(_$PaymentSettlementImpl _value,
      $Res Function(_$PaymentSettlementImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentSettlement
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentNo = null,
    Object? transactionNo = null,
    Object? transactionDate = null,
    Object? customerName = null,
    Object? customerId = null,
    Object? valueTransactionType = null,
  }) {
    return _then(_$PaymentSettlementImpl(
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
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      valueTransactionType: null == valueTransactionType
          ? _value.valueTransactionType
          : valueTransactionType // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentSettlementImpl extends _PaymentSettlement {
  const _$PaymentSettlementImpl(
      {@JsonKey(name: 'payment_no') required this.paymentNo,
      @JsonKey(name: 'transaction_no') required this.transactionNo,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required this.transactionDate,
      @JsonKey(name: 'customer_name') required this.customerName,
      @JsonKey(name: 'customer_id') required this.customerId,
      @JsonKey(name: 'value_transaction_type')
      required this.valueTransactionType})
      : super._();

  factory _$PaymentSettlementImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentSettlementImplFromJson(json);

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
  @JsonKey(name: 'customer_name')
  final String customerName;
  @override
  @JsonKey(name: 'customer_id')
  final String customerId;
  @override
  @JsonKey(name: 'value_transaction_type')
  final int valueTransactionType;

  @override
  String toString() {
    return 'PaymentSettlement(paymentNo: $paymentNo, transactionNo: $transactionNo, transactionDate: $transactionDate, customerName: $customerName, customerId: $customerId, valueTransactionType: $valueTransactionType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentSettlementImpl &&
            (identical(other.paymentNo, paymentNo) ||
                other.paymentNo == paymentNo) &&
            (identical(other.transactionNo, transactionNo) ||
                other.transactionNo == transactionNo) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.valueTransactionType, valueTransactionType) ||
                other.valueTransactionType == valueTransactionType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, paymentNo, transactionNo,
      transactionDate, customerName, customerId, valueTransactionType);

  /// Create a copy of PaymentSettlement
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentSettlementImplCopyWith<_$PaymentSettlementImpl> get copyWith =>
      __$$PaymentSettlementImplCopyWithImpl<_$PaymentSettlementImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentSettlementImplToJson(
      this,
    );
  }
}

abstract class _PaymentSettlement extends PaymentSettlement {
  const factory _PaymentSettlement(
      {@JsonKey(name: 'payment_no') required final String paymentNo,
      @JsonKey(name: 'transaction_no') required final String transactionNo,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required final DateTime transactionDate,
      @JsonKey(name: 'customer_name') required final String customerName,
      @JsonKey(name: 'customer_id') required final String customerId,
      @JsonKey(name: 'value_transaction_type')
      required final int valueTransactionType}) = _$PaymentSettlementImpl;
  const _PaymentSettlement._() : super._();

  factory _PaymentSettlement.fromJson(Map<String, dynamic> json) =
      _$PaymentSettlementImpl.fromJson;

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
  @JsonKey(name: 'customer_name')
  String get customerName;
  @override
  @JsonKey(name: 'customer_id')
  String get customerId;
  @override
  @JsonKey(name: 'value_transaction_type')
  int get valueTransactionType;

  /// Create a copy of PaymentSettlement
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentSettlementImplCopyWith<_$PaymentSettlementImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
