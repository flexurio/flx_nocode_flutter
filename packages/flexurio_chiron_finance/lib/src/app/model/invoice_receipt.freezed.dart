// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_receipt.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InvoiceReceipt _$InvoiceReceiptFromJson(Map<String, dynamic> json) {
  return _InvoiceReceipt.fromJson(json);
}

/// @nodoc
mixin _$InvoiceReceipt {
  @JsonKey(name: 'tax_invoice_number')
  String get taxInvoiceNumber => throw _privateConstructorUsedError;
  @JsonKey(fromJson: isoDateToDateTime)
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'order_id')
  String get orderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_no')
  String get transactionNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_address')
  String? get deliveryAddress => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_invoice')
  String? get taxInvoice => throw _privateConstructorUsedError;
  @JsonKey(name: 'division')
  String? get division => throw _privateConstructorUsedError;

  /// Serializes this InvoiceReceipt to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvoiceReceipt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceReceiptCopyWith<InvoiceReceipt> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceReceiptCopyWith<$Res> {
  factory $InvoiceReceiptCopyWith(
          InvoiceReceipt value, $Res Function(InvoiceReceipt) then) =
      _$InvoiceReceiptCopyWithImpl<$Res, InvoiceReceipt>;
  @useResult
  $Res call(
      {@JsonKey(name: 'tax_invoice_number') String taxInvoiceNumber,
      @JsonKey(fromJson: isoDateToDateTime) DateTime date,
      @JsonKey(name: 'order_id') String orderId,
      @JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'delivery_address') String? deliveryAddress,
      double total,
      @JsonKey(name: 'tax_invoice') String? taxInvoice,
      @JsonKey(name: 'division') String? division});
}

/// @nodoc
class _$InvoiceReceiptCopyWithImpl<$Res, $Val extends InvoiceReceipt>
    implements $InvoiceReceiptCopyWith<$Res> {
  _$InvoiceReceiptCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceReceipt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taxInvoiceNumber = null,
    Object? date = null,
    Object? orderId = null,
    Object? transactionNo = null,
    Object? deliveryAddress = freezed,
    Object? total = null,
    Object? taxInvoice = freezed,
    Object? division = freezed,
  }) {
    return _then(_value.copyWith(
      taxInvoiceNumber: null == taxInvoiceNumber
          ? _value.taxInvoiceNumber
          : taxInvoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionNo: null == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddress: freezed == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      taxInvoice: freezed == taxInvoice
          ? _value.taxInvoice
          : taxInvoice // ignore: cast_nullable_to_non_nullable
              as String?,
      division: freezed == division
          ? _value.division
          : division // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceReceiptImplCopyWith<$Res>
    implements $InvoiceReceiptCopyWith<$Res> {
  factory _$$InvoiceReceiptImplCopyWith(_$InvoiceReceiptImpl value,
          $Res Function(_$InvoiceReceiptImpl) then) =
      __$$InvoiceReceiptImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'tax_invoice_number') String taxInvoiceNumber,
      @JsonKey(fromJson: isoDateToDateTime) DateTime date,
      @JsonKey(name: 'order_id') String orderId,
      @JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'delivery_address') String? deliveryAddress,
      double total,
      @JsonKey(name: 'tax_invoice') String? taxInvoice,
      @JsonKey(name: 'division') String? division});
}

/// @nodoc
class __$$InvoiceReceiptImplCopyWithImpl<$Res>
    extends _$InvoiceReceiptCopyWithImpl<$Res, _$InvoiceReceiptImpl>
    implements _$$InvoiceReceiptImplCopyWith<$Res> {
  __$$InvoiceReceiptImplCopyWithImpl(
      _$InvoiceReceiptImpl _value, $Res Function(_$InvoiceReceiptImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceReceipt
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taxInvoiceNumber = null,
    Object? date = null,
    Object? orderId = null,
    Object? transactionNo = null,
    Object? deliveryAddress = freezed,
    Object? total = null,
    Object? taxInvoice = freezed,
    Object? division = freezed,
  }) {
    return _then(_$InvoiceReceiptImpl(
      taxInvoiceNumber: null == taxInvoiceNumber
          ? _value.taxInvoiceNumber
          : taxInvoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      transactionNo: null == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryAddress: freezed == deliveryAddress
          ? _value.deliveryAddress
          : deliveryAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
      taxInvoice: freezed == taxInvoice
          ? _value.taxInvoice
          : taxInvoice // ignore: cast_nullable_to_non_nullable
              as String?,
      division: freezed == division
          ? _value.division
          : division // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceReceiptImpl extends _InvoiceReceipt {
  const _$InvoiceReceiptImpl(
      {@JsonKey(name: 'tax_invoice_number') required this.taxInvoiceNumber,
      @JsonKey(fromJson: isoDateToDateTime) required this.date,
      @JsonKey(name: 'order_id') required this.orderId,
      @JsonKey(name: 'transaction_no') required this.transactionNo,
      @JsonKey(name: 'delivery_address') required this.deliveryAddress,
      required this.total,
      @JsonKey(name: 'tax_invoice') required this.taxInvoice,
      @JsonKey(name: 'division') required this.division})
      : super._();

  factory _$InvoiceReceiptImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceReceiptImplFromJson(json);

  @override
  @JsonKey(name: 'tax_invoice_number')
  final String taxInvoiceNumber;
  @override
  @JsonKey(fromJson: isoDateToDateTime)
  final DateTime date;
  @override
  @JsonKey(name: 'order_id')
  final String orderId;
  @override
  @JsonKey(name: 'transaction_no')
  final String transactionNo;
  @override
  @JsonKey(name: 'delivery_address')
  final String? deliveryAddress;
  @override
  final double total;
  @override
  @JsonKey(name: 'tax_invoice')
  final String? taxInvoice;
  @override
  @JsonKey(name: 'division')
  final String? division;

  @override
  String toString() {
    return 'InvoiceReceipt(taxInvoiceNumber: $taxInvoiceNumber, date: $date, orderId: $orderId, transactionNo: $transactionNo, deliveryAddress: $deliveryAddress, total: $total, taxInvoice: $taxInvoice, division: $division)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceReceiptImpl &&
            (identical(other.taxInvoiceNumber, taxInvoiceNumber) ||
                other.taxInvoiceNumber == taxInvoiceNumber) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.transactionNo, transactionNo) ||
                other.transactionNo == transactionNo) &&
            (identical(other.deliveryAddress, deliveryAddress) ||
                other.deliveryAddress == deliveryAddress) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.taxInvoice, taxInvoice) ||
                other.taxInvoice == taxInvoice) &&
            (identical(other.division, division) ||
                other.division == division));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, taxInvoiceNumber, date, orderId,
      transactionNo, deliveryAddress, total, taxInvoice, division);

  /// Create a copy of InvoiceReceipt
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceReceiptImplCopyWith<_$InvoiceReceiptImpl> get copyWith =>
      __$$InvoiceReceiptImplCopyWithImpl<_$InvoiceReceiptImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceReceiptImplToJson(
      this,
    );
  }
}

abstract class _InvoiceReceipt extends InvoiceReceipt {
  const factory _InvoiceReceipt(
      {@JsonKey(name: 'tax_invoice_number')
      required final String taxInvoiceNumber,
      @JsonKey(fromJson: isoDateToDateTime) required final DateTime date,
      @JsonKey(name: 'order_id') required final String orderId,
      @JsonKey(name: 'transaction_no') required final String transactionNo,
      @JsonKey(name: 'delivery_address') required final String? deliveryAddress,
      required final double total,
      @JsonKey(name: 'tax_invoice') required final String? taxInvoice,
      @JsonKey(name: 'division')
      required final String? division}) = _$InvoiceReceiptImpl;
  const _InvoiceReceipt._() : super._();

  factory _InvoiceReceipt.fromJson(Map<String, dynamic> json) =
      _$InvoiceReceiptImpl.fromJson;

  @override
  @JsonKey(name: 'tax_invoice_number')
  String get taxInvoiceNumber;
  @override
  @JsonKey(fromJson: isoDateToDateTime)
  DateTime get date;
  @override
  @JsonKey(name: 'order_id')
  String get orderId;
  @override
  @JsonKey(name: 'transaction_no')
  String get transactionNo;
  @override
  @JsonKey(name: 'delivery_address')
  String? get deliveryAddress;
  @override
  double get total;
  @override
  @JsonKey(name: 'tax_invoice')
  String? get taxInvoice;
  @override
  @JsonKey(name: 'division')
  String? get division;

  /// Create a copy of InvoiceReceipt
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceReceiptImplCopyWith<_$InvoiceReceiptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
