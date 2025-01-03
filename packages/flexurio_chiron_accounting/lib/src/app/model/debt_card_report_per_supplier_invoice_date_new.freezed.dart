// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'debt_card_report_per_supplier_invoice_date_new.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DebtCardReportPerSupplierInvoiceDateNew
    _$DebtCardReportPerSupplierInvoiceDateNewFromJson(
        Map<String, dynamic> json) {
  return _DebtCardReportPerSupplierInvoiceDateNew.fromJson(json);
}

/// @nodoc
mixin _$DebtCardReportPerSupplierInvoiceDateNew {
  @JsonKey(name: 'invoice_no')
  String get invoiceNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_id')
  String get paymentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  String get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_id')
  String get deliveryOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_id')
  String get transactionId => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_remaining')
  int get paymentRemaining => throw _privateConstructorUsedError;
  @JsonKey(name: 'payment_amount')
  int get paymentAmount => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
  DateTime get invoiceDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_receive_date', fromJson: isoDateToDateTime)
  DateTime get invoiceReceiveDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
  DateTime get dueDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_name')
  String get supplierName => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_address')
  String get supplierAddress => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'receive_date', fromJson: dateTimeNullableFromJson)
  DateTime? get receiveDate => throw _privateConstructorUsedError;

  /// Serializes this DebtCardReportPerSupplierInvoiceDateNew to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DebtCardReportPerSupplierInvoiceDateNew
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DebtCardReportPerSupplierInvoiceDateNewCopyWith<
          DebtCardReportPerSupplierInvoiceDateNew>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DebtCardReportPerSupplierInvoiceDateNewCopyWith<$Res> {
  factory $DebtCardReportPerSupplierInvoiceDateNewCopyWith(
          DebtCardReportPerSupplierInvoiceDateNew value,
          $Res Function(DebtCardReportPerSupplierInvoiceDateNew) then) =
      _$DebtCardReportPerSupplierInvoiceDateNewCopyWithImpl<$Res,
          DebtCardReportPerSupplierInvoiceDateNew>;
  @useResult
  $Res call(
      {@JsonKey(name: 'invoice_no') String invoiceNo,
      @JsonKey(name: 'payment_id') String paymentId,
      @JsonKey(name: 'order_id') String orderId,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'payment_remaining') int paymentRemaining,
      @JsonKey(name: 'payment_amount') int paymentAmount,
      @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
      DateTime invoiceDate,
      @JsonKey(name: 'invoice_receive_date', fromJson: isoDateToDateTime)
      DateTime invoiceReceiveDate,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime) DateTime dueDate,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'supplier_name') String supplierName,
      @JsonKey(name: 'supplier_address') String supplierAddress,
      String? description,
      @JsonKey(name: 'receive_date', fromJson: dateTimeNullableFromJson)
      DateTime? receiveDate});
}

/// @nodoc
class _$DebtCardReportPerSupplierInvoiceDateNewCopyWithImpl<$Res,
        $Val extends DebtCardReportPerSupplierInvoiceDateNew>
    implements $DebtCardReportPerSupplierInvoiceDateNewCopyWith<$Res> {
  _$DebtCardReportPerSupplierInvoiceDateNewCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DebtCardReportPerSupplierInvoiceDateNew
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNo = null,
    Object? paymentId = null,
    Object? orderId = null,
    Object? deliveryOrderId = null,
    Object? transactionId = null,
    Object? paymentRemaining = null,
    Object? paymentAmount = null,
    Object? invoiceDate = null,
    Object? invoiceReceiveDate = null,
    Object? dueDate = null,
    Object? transactionDate = null,
    Object? supplierName = null,
    Object? supplierAddress = null,
    Object? description = freezed,
    Object? receiveDate = freezed,
  }) {
    return _then(_value.copyWith(
      invoiceNo: null == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      paymentId: null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentRemaining: null == paymentRemaining
          ? _value.paymentRemaining
          : paymentRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      paymentAmount: null == paymentAmount
          ? _value.paymentAmount
          : paymentAmount // ignore: cast_nullable_to_non_nullable
              as int,
      invoiceDate: null == invoiceDate
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      invoiceReceiveDate: null == invoiceReceiveDate
          ? _value.invoiceReceiveDate
          : invoiceReceiveDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      supplierName: null == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      supplierAddress: null == supplierAddress
          ? _value.supplierAddress
          : supplierAddress // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      receiveDate: freezed == receiveDate
          ? _value.receiveDate
          : receiveDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DebtCardReportPerSupplierInvoiceDateNewImplCopyWith<$Res>
    implements $DebtCardReportPerSupplierInvoiceDateNewCopyWith<$Res> {
  factory _$$DebtCardReportPerSupplierInvoiceDateNewImplCopyWith(
          _$DebtCardReportPerSupplierInvoiceDateNewImpl value,
          $Res Function(_$DebtCardReportPerSupplierInvoiceDateNewImpl) then) =
      __$$DebtCardReportPerSupplierInvoiceDateNewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'invoice_no') String invoiceNo,
      @JsonKey(name: 'payment_id') String paymentId,
      @JsonKey(name: 'order_id') String orderId,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'transaction_id') String transactionId,
      @JsonKey(name: 'payment_remaining') int paymentRemaining,
      @JsonKey(name: 'payment_amount') int paymentAmount,
      @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
      DateTime invoiceDate,
      @JsonKey(name: 'invoice_receive_date', fromJson: isoDateToDateTime)
      DateTime invoiceReceiveDate,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime) DateTime dueDate,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      DateTime transactionDate,
      @JsonKey(name: 'supplier_name') String supplierName,
      @JsonKey(name: 'supplier_address') String supplierAddress,
      String? description,
      @JsonKey(name: 'receive_date', fromJson: dateTimeNullableFromJson)
      DateTime? receiveDate});
}

/// @nodoc
class __$$DebtCardReportPerSupplierInvoiceDateNewImplCopyWithImpl<$Res>
    extends _$DebtCardReportPerSupplierInvoiceDateNewCopyWithImpl<$Res,
        _$DebtCardReportPerSupplierInvoiceDateNewImpl>
    implements _$$DebtCardReportPerSupplierInvoiceDateNewImplCopyWith<$Res> {
  __$$DebtCardReportPerSupplierInvoiceDateNewImplCopyWithImpl(
      _$DebtCardReportPerSupplierInvoiceDateNewImpl _value,
      $Res Function(_$DebtCardReportPerSupplierInvoiceDateNewImpl) _then)
      : super(_value, _then);

  /// Create a copy of DebtCardReportPerSupplierInvoiceDateNew
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceNo = null,
    Object? paymentId = null,
    Object? orderId = null,
    Object? deliveryOrderId = null,
    Object? transactionId = null,
    Object? paymentRemaining = null,
    Object? paymentAmount = null,
    Object? invoiceDate = null,
    Object? invoiceReceiveDate = null,
    Object? dueDate = null,
    Object? transactionDate = null,
    Object? supplierName = null,
    Object? supplierAddress = null,
    Object? description = freezed,
    Object? receiveDate = freezed,
  }) {
    return _then(_$DebtCardReportPerSupplierInvoiceDateNewImpl(
      invoiceNo: null == invoiceNo
          ? _value.invoiceNo
          : invoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      paymentId: null == paymentId
          ? _value.paymentId
          : paymentId // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionId: null == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
      paymentRemaining: null == paymentRemaining
          ? _value.paymentRemaining
          : paymentRemaining // ignore: cast_nullable_to_non_nullable
              as int,
      paymentAmount: null == paymentAmount
          ? _value.paymentAmount
          : paymentAmount // ignore: cast_nullable_to_non_nullable
              as int,
      invoiceDate: null == invoiceDate
          ? _value.invoiceDate
          : invoiceDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      invoiceReceiveDate: null == invoiceReceiveDate
          ? _value.invoiceReceiveDate
          : invoiceReceiveDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      supplierName: null == supplierName
          ? _value.supplierName
          : supplierName // ignore: cast_nullable_to_non_nullable
              as String,
      supplierAddress: null == supplierAddress
          ? _value.supplierAddress
          : supplierAddress // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      receiveDate: freezed == receiveDate
          ? _value.receiveDate
          : receiveDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DebtCardReportPerSupplierInvoiceDateNewImpl
    extends _DebtCardReportPerSupplierInvoiceDateNew {
  const _$DebtCardReportPerSupplierInvoiceDateNewImpl(
      {@JsonKey(name: 'invoice_no') required this.invoiceNo,
      @JsonKey(name: 'payment_id') required this.paymentId,
      @JsonKey(name: 'order_id') required this.orderId,
      @JsonKey(name: 'delivery_order_id') required this.deliveryOrderId,
      @JsonKey(name: 'transaction_id') required this.transactionId,
      @JsonKey(name: 'payment_remaining') required this.paymentRemaining,
      @JsonKey(name: 'payment_amount') required this.paymentAmount,
      @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
      required this.invoiceDate,
      @JsonKey(name: 'invoice_receive_date', fromJson: isoDateToDateTime)
      required this.invoiceReceiveDate,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
      required this.dueDate,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required this.transactionDate,
      @JsonKey(name: 'supplier_name') required this.supplierName,
      @JsonKey(name: 'supplier_address') required this.supplierAddress,
      this.description,
      @JsonKey(name: 'receive_date', fromJson: dateTimeNullableFromJson)
      this.receiveDate})
      : super._();

  factory _$DebtCardReportPerSupplierInvoiceDateNewImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$DebtCardReportPerSupplierInvoiceDateNewImplFromJson(json);

  @override
  @JsonKey(name: 'invoice_no')
  final String invoiceNo;
  @override
  @JsonKey(name: 'payment_id')
  final String paymentId;
  @override
  @JsonKey(name: 'order_id')
  final String orderId;
  @override
  @JsonKey(name: 'delivery_order_id')
  final String deliveryOrderId;
  @override
  @JsonKey(name: 'transaction_id')
  final String transactionId;
  @override
  @JsonKey(name: 'payment_remaining')
  final int paymentRemaining;
  @override
  @JsonKey(name: 'payment_amount')
  final int paymentAmount;
  @override
  @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
  final DateTime invoiceDate;
  @override
  @JsonKey(name: 'invoice_receive_date', fromJson: isoDateToDateTime)
  final DateTime invoiceReceiveDate;
  @override
  @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
  final DateTime dueDate;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  final DateTime transactionDate;
  @override
  @JsonKey(name: 'supplier_name')
  final String supplierName;
  @override
  @JsonKey(name: 'supplier_address')
  final String supplierAddress;
  @override
  final String? description;
  @override
  @JsonKey(name: 'receive_date', fromJson: dateTimeNullableFromJson)
  final DateTime? receiveDate;

  @override
  String toString() {
    return 'DebtCardReportPerSupplierInvoiceDateNew(invoiceNo: $invoiceNo, paymentId: $paymentId, orderId: $orderId, deliveryOrderId: $deliveryOrderId, transactionId: $transactionId, paymentRemaining: $paymentRemaining, paymentAmount: $paymentAmount, invoiceDate: $invoiceDate, invoiceReceiveDate: $invoiceReceiveDate, dueDate: $dueDate, transactionDate: $transactionDate, supplierName: $supplierName, supplierAddress: $supplierAddress, description: $description, receiveDate: $receiveDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DebtCardReportPerSupplierInvoiceDateNewImpl &&
            (identical(other.invoiceNo, invoiceNo) ||
                other.invoiceNo == invoiceNo) &&
            (identical(other.paymentId, paymentId) ||
                other.paymentId == paymentId) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.deliveryOrderId, deliveryOrderId) ||
                other.deliveryOrderId == deliveryOrderId) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId) &&
            (identical(other.paymentRemaining, paymentRemaining) ||
                other.paymentRemaining == paymentRemaining) &&
            (identical(other.paymentAmount, paymentAmount) ||
                other.paymentAmount == paymentAmount) &&
            (identical(other.invoiceDate, invoiceDate) ||
                other.invoiceDate == invoiceDate) &&
            (identical(other.invoiceReceiveDate, invoiceReceiveDate) ||
                other.invoiceReceiveDate == invoiceReceiveDate) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.supplierName, supplierName) ||
                other.supplierName == supplierName) &&
            (identical(other.supplierAddress, supplierAddress) ||
                other.supplierAddress == supplierAddress) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.receiveDate, receiveDate) ||
                other.receiveDate == receiveDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      invoiceNo,
      paymentId,
      orderId,
      deliveryOrderId,
      transactionId,
      paymentRemaining,
      paymentAmount,
      invoiceDate,
      invoiceReceiveDate,
      dueDate,
      transactionDate,
      supplierName,
      supplierAddress,
      description,
      receiveDate);

  /// Create a copy of DebtCardReportPerSupplierInvoiceDateNew
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DebtCardReportPerSupplierInvoiceDateNewImplCopyWith<
          _$DebtCardReportPerSupplierInvoiceDateNewImpl>
      get copyWith =>
          __$$DebtCardReportPerSupplierInvoiceDateNewImplCopyWithImpl<
              _$DebtCardReportPerSupplierInvoiceDateNewImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DebtCardReportPerSupplierInvoiceDateNewImplToJson(
      this,
    );
  }
}

abstract class _DebtCardReportPerSupplierInvoiceDateNew
    extends DebtCardReportPerSupplierInvoiceDateNew {
  const factory _DebtCardReportPerSupplierInvoiceDateNew(
      {@JsonKey(name: 'invoice_no') required final String invoiceNo,
      @JsonKey(name: 'payment_id') required final String paymentId,
      @JsonKey(name: 'order_id') required final String orderId,
      @JsonKey(name: 'delivery_order_id') required final String deliveryOrderId,
      @JsonKey(name: 'transaction_id') required final String transactionId,
      @JsonKey(name: 'payment_remaining') required final int paymentRemaining,
      @JsonKey(name: 'payment_amount') required final int paymentAmount,
      @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
      required final DateTime invoiceDate,
      @JsonKey(name: 'invoice_receive_date', fromJson: isoDateToDateTime)
      required final DateTime invoiceReceiveDate,
      @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
      required final DateTime dueDate,
      @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
      required final DateTime transactionDate,
      @JsonKey(name: 'supplier_name') required final String supplierName,
      @JsonKey(name: 'supplier_address') required final String supplierAddress,
      final String? description,
      @JsonKey(name: 'receive_date', fromJson: dateTimeNullableFromJson)
      final DateTime?
          receiveDate}) = _$DebtCardReportPerSupplierInvoiceDateNewImpl;
  const _DebtCardReportPerSupplierInvoiceDateNew._() : super._();

  factory _DebtCardReportPerSupplierInvoiceDateNew.fromJson(
          Map<String, dynamic> json) =
      _$DebtCardReportPerSupplierInvoiceDateNewImpl.fromJson;

  @override
  @JsonKey(name: 'invoice_no')
  String get invoiceNo;
  @override
  @JsonKey(name: 'payment_id')
  String get paymentId;
  @override
  @JsonKey(name: 'order_id')
  String get orderId;
  @override
  @JsonKey(name: 'delivery_order_id')
  String get deliveryOrderId;
  @override
  @JsonKey(name: 'transaction_id')
  String get transactionId;
  @override
  @JsonKey(name: 'payment_remaining')
  int get paymentRemaining;
  @override
  @JsonKey(name: 'payment_amount')
  int get paymentAmount;
  @override
  @JsonKey(name: 'invoice_date', fromJson: isoDateToDateTime)
  DateTime get invoiceDate;
  @override
  @JsonKey(name: 'invoice_receive_date', fromJson: isoDateToDateTime)
  DateTime get invoiceReceiveDate;
  @override
  @JsonKey(name: 'due_date', fromJson: isoDateToDateTime)
  DateTime get dueDate;
  @override
  @JsonKey(name: 'transaction_date', fromJson: isoDateToDateTime)
  DateTime get transactionDate;
  @override
  @JsonKey(name: 'supplier_name')
  String get supplierName;
  @override
  @JsonKey(name: 'supplier_address')
  String get supplierAddress;
  @override
  String? get description;
  @override
  @JsonKey(name: 'receive_date', fromJson: dateTimeNullableFromJson)
  DateTime? get receiveDate;

  /// Create a copy of DebtCardReportPerSupplierInvoiceDateNew
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DebtCardReportPerSupplierInvoiceDateNewImplCopyWith<
          _$DebtCardReportPerSupplierInvoiceDateNewImpl>
      get copyWith => throw _privateConstructorUsedError;
}
