// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_settlement_return.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentSettlementReturn _$PaymentSettlementReturnFromJson(
    Map<String, dynamic> json) {
  return _PaymentSettlementReturn.fromJson(json);
}

/// @nodoc
mixin _$PaymentSettlementReturn {
  @JsonKey(name: 'invoice_id')
  String get invoiceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no_id')
  String get batchNoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_invoice_no')
  String get taxInvoiceNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity')
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_percent')
  int get discountPercent => throw _privateConstructorUsedError;

  /// Serializes this PaymentSettlementReturn to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentSettlementReturn
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentSettlementReturnCopyWith<PaymentSettlementReturn> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentSettlementReturnCopyWith<$Res> {
  factory $PaymentSettlementReturnCopyWith(PaymentSettlementReturn value,
          $Res Function(PaymentSettlementReturn) then) =
      _$PaymentSettlementReturnCopyWithImpl<$Res, PaymentSettlementReturn>;
  @useResult
  $Res call(
      {@JsonKey(name: 'invoice_id') String invoiceId,
      @JsonKey(name: 'batch_no_id') String batchNoId,
      @JsonKey(name: 'tax_invoice_no') String taxInvoiceNo,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'price') int price,
      @JsonKey(name: 'quantity') int quantity,
      @JsonKey(name: 'discount_percent') int discountPercent});
}

/// @nodoc
class _$PaymentSettlementReturnCopyWithImpl<$Res,
        $Val extends PaymentSettlementReturn>
    implements $PaymentSettlementReturnCopyWith<$Res> {
  _$PaymentSettlementReturnCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentSettlementReturn
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceId = null,
    Object? batchNoId = null,
    Object? taxInvoiceNo = null,
    Object? customerId = null,
    Object? productName = null,
    Object? price = null,
    Object? quantity = null,
    Object? discountPercent = null,
  }) {
    return _then(_value.copyWith(
      invoiceId: null == invoiceId
          ? _value.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as String,
      batchNoId: null == batchNoId
          ? _value.batchNoId
          : batchNoId // ignore: cast_nullable_to_non_nullable
              as String,
      taxInvoiceNo: null == taxInvoiceNo
          ? _value.taxInvoiceNo
          : taxInvoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      discountPercent: null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentSettlementReturnImplCopyWith<$Res>
    implements $PaymentSettlementReturnCopyWith<$Res> {
  factory _$$PaymentSettlementReturnImplCopyWith(
          _$PaymentSettlementReturnImpl value,
          $Res Function(_$PaymentSettlementReturnImpl) then) =
      __$$PaymentSettlementReturnImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'invoice_id') String invoiceId,
      @JsonKey(name: 'batch_no_id') String batchNoId,
      @JsonKey(name: 'tax_invoice_no') String taxInvoiceNo,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'price') int price,
      @JsonKey(name: 'quantity') int quantity,
      @JsonKey(name: 'discount_percent') int discountPercent});
}

/// @nodoc
class __$$PaymentSettlementReturnImplCopyWithImpl<$Res>
    extends _$PaymentSettlementReturnCopyWithImpl<$Res,
        _$PaymentSettlementReturnImpl>
    implements _$$PaymentSettlementReturnImplCopyWith<$Res> {
  __$$PaymentSettlementReturnImplCopyWithImpl(
      _$PaymentSettlementReturnImpl _value,
      $Res Function(_$PaymentSettlementReturnImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentSettlementReturn
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceId = null,
    Object? batchNoId = null,
    Object? taxInvoiceNo = null,
    Object? customerId = null,
    Object? productName = null,
    Object? price = null,
    Object? quantity = null,
    Object? discountPercent = null,
  }) {
    return _then(_$PaymentSettlementReturnImpl(
      invoiceId: null == invoiceId
          ? _value.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as String,
      batchNoId: null == batchNoId
          ? _value.batchNoId
          : batchNoId // ignore: cast_nullable_to_non_nullable
              as String,
      taxInvoiceNo: null == taxInvoiceNo
          ? _value.taxInvoiceNo
          : taxInvoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      discountPercent: null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentSettlementReturnImpl extends _PaymentSettlementReturn {
  const _$PaymentSettlementReturnImpl(
      {@JsonKey(name: 'invoice_id') required this.invoiceId,
      @JsonKey(name: 'batch_no_id') required this.batchNoId,
      @JsonKey(name: 'tax_invoice_no') required this.taxInvoiceNo,
      @JsonKey(name: 'customer_id') required this.customerId,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'price') required this.price,
      @JsonKey(name: 'quantity') required this.quantity,
      @JsonKey(name: 'discount_percent') required this.discountPercent})
      : super._();

  factory _$PaymentSettlementReturnImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentSettlementReturnImplFromJson(json);

  @override
  @JsonKey(name: 'invoice_id')
  final String invoiceId;
  @override
  @JsonKey(name: 'batch_no_id')
  final String batchNoId;
  @override
  @JsonKey(name: 'tax_invoice_no')
  final String taxInvoiceNo;
  @override
  @JsonKey(name: 'customer_id')
  final String customerId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'price')
  final int price;
  @override
  @JsonKey(name: 'quantity')
  final int quantity;
  @override
  @JsonKey(name: 'discount_percent')
  final int discountPercent;

  @override
  String toString() {
    return 'PaymentSettlementReturn(invoiceId: $invoiceId, batchNoId: $batchNoId, taxInvoiceNo: $taxInvoiceNo, customerId: $customerId, productName: $productName, price: $price, quantity: $quantity, discountPercent: $discountPercent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentSettlementReturnImpl &&
            (identical(other.invoiceId, invoiceId) ||
                other.invoiceId == invoiceId) &&
            (identical(other.batchNoId, batchNoId) ||
                other.batchNoId == batchNoId) &&
            (identical(other.taxInvoiceNo, taxInvoiceNo) ||
                other.taxInvoiceNo == taxInvoiceNo) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.discountPercent, discountPercent) ||
                other.discountPercent == discountPercent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, invoiceId, batchNoId,
      taxInvoiceNo, customerId, productName, price, quantity, discountPercent);

  /// Create a copy of PaymentSettlementReturn
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentSettlementReturnImplCopyWith<_$PaymentSettlementReturnImpl>
      get copyWith => __$$PaymentSettlementReturnImplCopyWithImpl<
          _$PaymentSettlementReturnImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentSettlementReturnImplToJson(
      this,
    );
  }
}

abstract class _PaymentSettlementReturn extends PaymentSettlementReturn {
  const factory _PaymentSettlementReturn(
      {@JsonKey(name: 'invoice_id') required final String invoiceId,
      @JsonKey(name: 'batch_no_id') required final String batchNoId,
      @JsonKey(name: 'tax_invoice_no') required final String taxInvoiceNo,
      @JsonKey(name: 'customer_id') required final String customerId,
      @JsonKey(name: 'product_name') required final String productName,
      @JsonKey(name: 'price') required final int price,
      @JsonKey(name: 'quantity') required final int quantity,
      @JsonKey(name: 'discount_percent')
      required final int discountPercent}) = _$PaymentSettlementReturnImpl;
  const _PaymentSettlementReturn._() : super._();

  factory _PaymentSettlementReturn.fromJson(Map<String, dynamic> json) =
      _$PaymentSettlementReturnImpl.fromJson;

  @override
  @JsonKey(name: 'invoice_id')
  String get invoiceId;
  @override
  @JsonKey(name: 'batch_no_id')
  String get batchNoId;
  @override
  @JsonKey(name: 'tax_invoice_no')
  String get taxInvoiceNo;
  @override
  @JsonKey(name: 'customer_id')
  String get customerId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'price')
  int get price;
  @override
  @JsonKey(name: 'quantity')
  int get quantity;
  @override
  @JsonKey(name: 'discount_percent')
  int get discountPercent;

  /// Create a copy of PaymentSettlementReturn
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentSettlementReturnImplCopyWith<_$PaymentSettlementReturnImpl>
      get copyWith => throw _privateConstructorUsedError;
}
