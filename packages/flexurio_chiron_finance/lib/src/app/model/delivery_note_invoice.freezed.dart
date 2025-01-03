// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delivery_note_invoice.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeliveryNoteInvoice _$DeliveryNoteInvoiceFromJson(Map<String, dynamic> json) {
  return _DeliveryNoteInvoice.fromJson(json);
}

/// @nodoc
mixin _$DeliveryNoteInvoice {
  @JsonKey(name: 'year')
  int get year => throw _privateConstructorUsedError;
  @JsonKey(name: 'period')
  String get period => throw _privateConstructorUsedError;
  @JsonKey(name: 'code_invoice')
  String get codeInvoice => throw _privateConstructorUsedError;
  @JsonKey(name: 'code_sales_invoice')
  String get codeSalesInvoice => throw _privateConstructorUsedError;
  @JsonKey(name: 'sales_invoice_id')
  String get salesInvoiceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_sales_order', fromJson: isoDateToDateTime)
  DateTime get dateSalesOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_id')
  String get deliveryOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_id')
  String get invoiceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_transaction', fromJson: isoDateToDateTime)
  DateTime get dateTransaction => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_invoice_no')
  String get taxInvoiceNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no_id')
  String get batchNoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty')
  int get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_percent')
  double get discountPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtotal_after_discount')
  int get subTotalAfterDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'ppn_value')
  int get ppnValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  int get price => throw _privateConstructorUsedError;

  /// Serializes this DeliveryNoteInvoice to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DeliveryNoteInvoice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DeliveryNoteInvoiceCopyWith<DeliveryNoteInvoice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeliveryNoteInvoiceCopyWith<$Res> {
  factory $DeliveryNoteInvoiceCopyWith(
          DeliveryNoteInvoice value, $Res Function(DeliveryNoteInvoice) then) =
      _$DeliveryNoteInvoiceCopyWithImpl<$Res, DeliveryNoteInvoice>;
  @useResult
  $Res call(
      {@JsonKey(name: 'year') int year,
      @JsonKey(name: 'period') String period,
      @JsonKey(name: 'code_invoice') String codeInvoice,
      @JsonKey(name: 'code_sales_invoice') String codeSalesInvoice,
      @JsonKey(name: 'sales_invoice_id') String salesInvoiceId,
      @JsonKey(name: 'date_sales_order', fromJson: isoDateToDateTime)
      DateTime dateSalesOrder,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'invoice_id') String invoiceId,
      @JsonKey(name: 'date_transaction', fromJson: isoDateToDateTime)
      DateTime dateTransaction,
      @JsonKey(name: 'tax_invoice_no') String taxInvoiceNo,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'batch_no_id') String batchNoId,
      @JsonKey(name: 'qty') int qty,
      @JsonKey(name: 'discount_percent') double discountPercent,
      @JsonKey(name: 'subtotal_after_discount') int subTotalAfterDiscount,
      @JsonKey(name: 'ppn_value') int ppnValue,
      @JsonKey(name: 'price') int price});
}

/// @nodoc
class _$DeliveryNoteInvoiceCopyWithImpl<$Res, $Val extends DeliveryNoteInvoice>
    implements $DeliveryNoteInvoiceCopyWith<$Res> {
  _$DeliveryNoteInvoiceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DeliveryNoteInvoice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? period = null,
    Object? codeInvoice = null,
    Object? codeSalesInvoice = null,
    Object? salesInvoiceId = null,
    Object? dateSalesOrder = null,
    Object? deliveryOrderId = null,
    Object? invoiceId = null,
    Object? dateTransaction = null,
    Object? taxInvoiceNo = null,
    Object? customerId = null,
    Object? productId = null,
    Object? productName = null,
    Object? batchNoId = null,
    Object? qty = null,
    Object? discountPercent = null,
    Object? subTotalAfterDiscount = null,
    Object? ppnValue = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      codeInvoice: null == codeInvoice
          ? _value.codeInvoice
          : codeInvoice // ignore: cast_nullable_to_non_nullable
              as String,
      codeSalesInvoice: null == codeSalesInvoice
          ? _value.codeSalesInvoice
          : codeSalesInvoice // ignore: cast_nullable_to_non_nullable
              as String,
      salesInvoiceId: null == salesInvoiceId
          ? _value.salesInvoiceId
          : salesInvoiceId // ignore: cast_nullable_to_non_nullable
              as String,
      dateSalesOrder: null == dateSalesOrder
          ? _value.dateSalesOrder
          : dateSalesOrder // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceId: null == invoiceId
          ? _value.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as String,
      dateTransaction: null == dateTransaction
          ? _value.dateTransaction
          : dateTransaction // ignore: cast_nullable_to_non_nullable
              as DateTime,
      taxInvoiceNo: null == taxInvoiceNo
          ? _value.taxInvoiceNo
          : taxInvoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      batchNoId: null == batchNoId
          ? _value.batchNoId
          : batchNoId // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      discountPercent: null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double,
      subTotalAfterDiscount: null == subTotalAfterDiscount
          ? _value.subTotalAfterDiscount
          : subTotalAfterDiscount // ignore: cast_nullable_to_non_nullable
              as int,
      ppnValue: null == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeliveryNoteInvoiceImplCopyWith<$Res>
    implements $DeliveryNoteInvoiceCopyWith<$Res> {
  factory _$$DeliveryNoteInvoiceImplCopyWith(_$DeliveryNoteInvoiceImpl value,
          $Res Function(_$DeliveryNoteInvoiceImpl) then) =
      __$$DeliveryNoteInvoiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'year') int year,
      @JsonKey(name: 'period') String period,
      @JsonKey(name: 'code_invoice') String codeInvoice,
      @JsonKey(name: 'code_sales_invoice') String codeSalesInvoice,
      @JsonKey(name: 'sales_invoice_id') String salesInvoiceId,
      @JsonKey(name: 'date_sales_order', fromJson: isoDateToDateTime)
      DateTime dateSalesOrder,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'invoice_id') String invoiceId,
      @JsonKey(name: 'date_transaction', fromJson: isoDateToDateTime)
      DateTime dateTransaction,
      @JsonKey(name: 'tax_invoice_no') String taxInvoiceNo,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'batch_no_id') String batchNoId,
      @JsonKey(name: 'qty') int qty,
      @JsonKey(name: 'discount_percent') double discountPercent,
      @JsonKey(name: 'subtotal_after_discount') int subTotalAfterDiscount,
      @JsonKey(name: 'ppn_value') int ppnValue,
      @JsonKey(name: 'price') int price});
}

/// @nodoc
class __$$DeliveryNoteInvoiceImplCopyWithImpl<$Res>
    extends _$DeliveryNoteInvoiceCopyWithImpl<$Res, _$DeliveryNoteInvoiceImpl>
    implements _$$DeliveryNoteInvoiceImplCopyWith<$Res> {
  __$$DeliveryNoteInvoiceImplCopyWithImpl(_$DeliveryNoteInvoiceImpl _value,
      $Res Function(_$DeliveryNoteInvoiceImpl) _then)
      : super(_value, _then);

  /// Create a copy of DeliveryNoteInvoice
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? period = null,
    Object? codeInvoice = null,
    Object? codeSalesInvoice = null,
    Object? salesInvoiceId = null,
    Object? dateSalesOrder = null,
    Object? deliveryOrderId = null,
    Object? invoiceId = null,
    Object? dateTransaction = null,
    Object? taxInvoiceNo = null,
    Object? customerId = null,
    Object? productId = null,
    Object? productName = null,
    Object? batchNoId = null,
    Object? qty = null,
    Object? discountPercent = null,
    Object? subTotalAfterDiscount = null,
    Object? ppnValue = null,
    Object? price = null,
  }) {
    return _then(_$DeliveryNoteInvoiceImpl(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      codeInvoice: null == codeInvoice
          ? _value.codeInvoice
          : codeInvoice // ignore: cast_nullable_to_non_nullable
              as String,
      codeSalesInvoice: null == codeSalesInvoice
          ? _value.codeSalesInvoice
          : codeSalesInvoice // ignore: cast_nullable_to_non_nullable
              as String,
      salesInvoiceId: null == salesInvoiceId
          ? _value.salesInvoiceId
          : salesInvoiceId // ignore: cast_nullable_to_non_nullable
              as String,
      dateSalesOrder: null == dateSalesOrder
          ? _value.dateSalesOrder
          : dateSalesOrder // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceId: null == invoiceId
          ? _value.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as String,
      dateTransaction: null == dateTransaction
          ? _value.dateTransaction
          : dateTransaction // ignore: cast_nullable_to_non_nullable
              as DateTime,
      taxInvoiceNo: null == taxInvoiceNo
          ? _value.taxInvoiceNo
          : taxInvoiceNo // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      batchNoId: null == batchNoId
          ? _value.batchNoId
          : batchNoId // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      discountPercent: null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double,
      subTotalAfterDiscount: null == subTotalAfterDiscount
          ? _value.subTotalAfterDiscount
          : subTotalAfterDiscount // ignore: cast_nullable_to_non_nullable
              as int,
      ppnValue: null == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeliveryNoteInvoiceImpl extends _DeliveryNoteInvoice {
  _$DeliveryNoteInvoiceImpl(
      {@JsonKey(name: 'year') required this.year,
      @JsonKey(name: 'period') required this.period,
      @JsonKey(name: 'code_invoice') required this.codeInvoice,
      @JsonKey(name: 'code_sales_invoice') required this.codeSalesInvoice,
      @JsonKey(name: 'sales_invoice_id') required this.salesInvoiceId,
      @JsonKey(name: 'date_sales_order', fromJson: isoDateToDateTime)
      required this.dateSalesOrder,
      @JsonKey(name: 'delivery_order_id') required this.deliveryOrderId,
      @JsonKey(name: 'invoice_id') required this.invoiceId,
      @JsonKey(name: 'date_transaction', fromJson: isoDateToDateTime)
      required this.dateTransaction,
      @JsonKey(name: 'tax_invoice_no') required this.taxInvoiceNo,
      @JsonKey(name: 'customer_id') required this.customerId,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'batch_no_id') required this.batchNoId,
      @JsonKey(name: 'qty') required this.qty,
      @JsonKey(name: 'discount_percent') required this.discountPercent,
      @JsonKey(name: 'subtotal_after_discount')
      required this.subTotalAfterDiscount,
      @JsonKey(name: 'ppn_value') required this.ppnValue,
      @JsonKey(name: 'price') required this.price})
      : super._();

  factory _$DeliveryNoteInvoiceImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeliveryNoteInvoiceImplFromJson(json);

  @override
  @JsonKey(name: 'year')
  final int year;
  @override
  @JsonKey(name: 'period')
  final String period;
  @override
  @JsonKey(name: 'code_invoice')
  final String codeInvoice;
  @override
  @JsonKey(name: 'code_sales_invoice')
  final String codeSalesInvoice;
  @override
  @JsonKey(name: 'sales_invoice_id')
  final String salesInvoiceId;
  @override
  @JsonKey(name: 'date_sales_order', fromJson: isoDateToDateTime)
  final DateTime dateSalesOrder;
  @override
  @JsonKey(name: 'delivery_order_id')
  final String deliveryOrderId;
  @override
  @JsonKey(name: 'invoice_id')
  final String invoiceId;
  @override
  @JsonKey(name: 'date_transaction', fromJson: isoDateToDateTime)
  final DateTime dateTransaction;
  @override
  @JsonKey(name: 'tax_invoice_no')
  final String taxInvoiceNo;
  @override
  @JsonKey(name: 'customer_id')
  final String customerId;
  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'batch_no_id')
  final String batchNoId;
  @override
  @JsonKey(name: 'qty')
  final int qty;
  @override
  @JsonKey(name: 'discount_percent')
  final double discountPercent;
  @override
  @JsonKey(name: 'subtotal_after_discount')
  final int subTotalAfterDiscount;
  @override
  @JsonKey(name: 'ppn_value')
  final int ppnValue;
  @override
  @JsonKey(name: 'price')
  final int price;

  @override
  String toString() {
    return 'DeliveryNoteInvoice(year: $year, period: $period, codeInvoice: $codeInvoice, codeSalesInvoice: $codeSalesInvoice, salesInvoiceId: $salesInvoiceId, dateSalesOrder: $dateSalesOrder, deliveryOrderId: $deliveryOrderId, invoiceId: $invoiceId, dateTransaction: $dateTransaction, taxInvoiceNo: $taxInvoiceNo, customerId: $customerId, productId: $productId, productName: $productName, batchNoId: $batchNoId, qty: $qty, discountPercent: $discountPercent, subTotalAfterDiscount: $subTotalAfterDiscount, ppnValue: $ppnValue, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryNoteInvoiceImpl &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.codeInvoice, codeInvoice) ||
                other.codeInvoice == codeInvoice) &&
            (identical(other.codeSalesInvoice, codeSalesInvoice) ||
                other.codeSalesInvoice == codeSalesInvoice) &&
            (identical(other.salesInvoiceId, salesInvoiceId) ||
                other.salesInvoiceId == salesInvoiceId) &&
            (identical(other.dateSalesOrder, dateSalesOrder) ||
                other.dateSalesOrder == dateSalesOrder) &&
            (identical(other.deliveryOrderId, deliveryOrderId) ||
                other.deliveryOrderId == deliveryOrderId) &&
            (identical(other.invoiceId, invoiceId) ||
                other.invoiceId == invoiceId) &&
            (identical(other.dateTransaction, dateTransaction) ||
                other.dateTransaction == dateTransaction) &&
            (identical(other.taxInvoiceNo, taxInvoiceNo) ||
                other.taxInvoiceNo == taxInvoiceNo) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.batchNoId, batchNoId) ||
                other.batchNoId == batchNoId) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.discountPercent, discountPercent) ||
                other.discountPercent == discountPercent) &&
            (identical(other.subTotalAfterDiscount, subTotalAfterDiscount) ||
                other.subTotalAfterDiscount == subTotalAfterDiscount) &&
            (identical(other.ppnValue, ppnValue) ||
                other.ppnValue == ppnValue) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        year,
        period,
        codeInvoice,
        codeSalesInvoice,
        salesInvoiceId,
        dateSalesOrder,
        deliveryOrderId,
        invoiceId,
        dateTransaction,
        taxInvoiceNo,
        customerId,
        productId,
        productName,
        batchNoId,
        qty,
        discountPercent,
        subTotalAfterDiscount,
        ppnValue,
        price
      ]);

  /// Create a copy of DeliveryNoteInvoice
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryNoteInvoiceImplCopyWith<_$DeliveryNoteInvoiceImpl> get copyWith =>
      __$$DeliveryNoteInvoiceImplCopyWithImpl<_$DeliveryNoteInvoiceImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeliveryNoteInvoiceImplToJson(
      this,
    );
  }
}

abstract class _DeliveryNoteInvoice extends DeliveryNoteInvoice {
  factory _DeliveryNoteInvoice(
      {@JsonKey(name: 'year') required final int year,
      @JsonKey(name: 'period') required final String period,
      @JsonKey(name: 'code_invoice') required final String codeInvoice,
      @JsonKey(name: 'code_sales_invoice')
      required final String codeSalesInvoice,
      @JsonKey(name: 'sales_invoice_id') required final String salesInvoiceId,
      @JsonKey(name: 'date_sales_order', fromJson: isoDateToDateTime)
      required final DateTime dateSalesOrder,
      @JsonKey(name: 'delivery_order_id') required final String deliveryOrderId,
      @JsonKey(name: 'invoice_id') required final String invoiceId,
      @JsonKey(name: 'date_transaction', fromJson: isoDateToDateTime)
      required final DateTime dateTransaction,
      @JsonKey(name: 'tax_invoice_no') required final String taxInvoiceNo,
      @JsonKey(name: 'customer_id') required final String customerId,
      @JsonKey(name: 'product_id') required final String productId,
      @JsonKey(name: 'product_name') required final String productName,
      @JsonKey(name: 'batch_no_id') required final String batchNoId,
      @JsonKey(name: 'qty') required final int qty,
      @JsonKey(name: 'discount_percent') required final double discountPercent,
      @JsonKey(name: 'subtotal_after_discount')
      required final int subTotalAfterDiscount,
      @JsonKey(name: 'ppn_value') required final int ppnValue,
      @JsonKey(name: 'price')
      required final int price}) = _$DeliveryNoteInvoiceImpl;
  _DeliveryNoteInvoice._() : super._();

  factory _DeliveryNoteInvoice.fromJson(Map<String, dynamic> json) =
      _$DeliveryNoteInvoiceImpl.fromJson;

  @override
  @JsonKey(name: 'year')
  int get year;
  @override
  @JsonKey(name: 'period')
  String get period;
  @override
  @JsonKey(name: 'code_invoice')
  String get codeInvoice;
  @override
  @JsonKey(name: 'code_sales_invoice')
  String get codeSalesInvoice;
  @override
  @JsonKey(name: 'sales_invoice_id')
  String get salesInvoiceId;
  @override
  @JsonKey(name: 'date_sales_order', fromJson: isoDateToDateTime)
  DateTime get dateSalesOrder;
  @override
  @JsonKey(name: 'delivery_order_id')
  String get deliveryOrderId;
  @override
  @JsonKey(name: 'invoice_id')
  String get invoiceId;
  @override
  @JsonKey(name: 'date_transaction', fromJson: isoDateToDateTime)
  DateTime get dateTransaction;
  @override
  @JsonKey(name: 'tax_invoice_no')
  String get taxInvoiceNo;
  @override
  @JsonKey(name: 'customer_id')
  String get customerId;
  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'batch_no_id')
  String get batchNoId;
  @override
  @JsonKey(name: 'qty')
  int get qty;
  @override
  @JsonKey(name: 'discount_percent')
  double get discountPercent;
  @override
  @JsonKey(name: 'subtotal_after_discount')
  int get subTotalAfterDiscount;
  @override
  @JsonKey(name: 'ppn_value')
  int get ppnValue;
  @override
  @JsonKey(name: 'price')
  int get price;

  /// Create a copy of DeliveryNoteInvoice
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryNoteInvoiceImplCopyWith<_$DeliveryNoteInvoiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
