// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_return_outstanding_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductReturnOutstandingReport _$ProductReturnOutstandingReportFromJson(
    Map<String, dynamic> json) {
  return _ProductReturnOutstandingReport.fromJson(json);
}

/// @nodoc
mixin _$ProductReturnOutstandingReport {
  @JsonKey(name: 'transaction_no')
  String get transactionNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_id')
  String get deliveryOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'reference_no')
  String get referenceNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty')
  String get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_check')
  int get quantityCheck => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_id')
  int get unitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'price')
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtotal')
  int get subtotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no_id')
  String get batchNoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
  DateTime get expirationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'quality_assurance_check_date', fromJson: isoDateToDateTime)
  DateTime get qualityAssuranceCheckDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'tax_invoice_no')
  String? get taxInvoiceNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullableFromJson)
  DateTime? get deliveryOrderDate => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'product_return_delivery_order_date',
      fromJson: dateTimeNullableFromJson)
  DateTime? get productReturnDeliveryOrderDate =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'product_return_delivery_order_id')
  String? get productReturnDeliveryOrderId =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirm_ppic_at', fromJson: isoDateToDateTime)
  DateTime get confirmPpicAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'confirm_marketing_at', fromJson: isoDateToDateTime)
  DateTime get confirmMarketingAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'transaction_type_id')
  String get transactionTypeId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductReturnOutstandingReportCopyWith<ProductReturnOutstandingReport>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReturnOutstandingReportCopyWith<$Res> {
  factory $ProductReturnOutstandingReportCopyWith(
          ProductReturnOutstandingReport value,
          $Res Function(ProductReturnOutstandingReport) then) =
      _$ProductReturnOutstandingReportCopyWithImpl<$Res,
          ProductReturnOutstandingReport>;
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'reference_no') String referenceNo,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'qty') String qty,
      @JsonKey(name: 'quantity_check') int quantityCheck,
      @JsonKey(name: 'unit_id') int unitId,
      @JsonKey(name: 'price') int price,
      @JsonKey(name: 'subtotal') int subtotal,
      @JsonKey(name: 'batch_no_id') String batchNoId,
      @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
      DateTime expirationDate,
      @JsonKey(name: 'status') String status,
      @JsonKey(
          name: 'quality_assurance_check_date', fromJson: isoDateToDateTime)
      DateTime qualityAssuranceCheckDate,
      @JsonKey(name: 'tax_invoice_no') String? taxInvoiceNo,
      @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullableFromJson)
      DateTime? deliveryOrderDate,
      @JsonKey(
          name: 'product_return_delivery_order_date',
          fromJson: dateTimeNullableFromJson)
      DateTime? productReturnDeliveryOrderDate,
      @JsonKey(name: 'product_return_delivery_order_id')
      String? productReturnDeliveryOrderId,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'confirm_ppic_at', fromJson: isoDateToDateTime)
      DateTime confirmPpicAt,
      @JsonKey(name: 'confirm_marketing_at', fromJson: isoDateToDateTime)
      DateTime confirmMarketingAt,
      @JsonKey(name: 'transaction_type_id') String transactionTypeId});
}

/// @nodoc
class _$ProductReturnOutstandingReportCopyWithImpl<$Res,
        $Val extends ProductReturnOutstandingReport>
    implements $ProductReturnOutstandingReportCopyWith<$Res> {
  _$ProductReturnOutstandingReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionNo = null,
    Object? deliveryOrderId = null,
    Object? customerName = null,
    Object? referenceNo = null,
    Object? description = null,
    Object? productName = null,
    Object? productId = null,
    Object? qty = null,
    Object? quantityCheck = null,
    Object? unitId = null,
    Object? price = null,
    Object? subtotal = null,
    Object? batchNoId = null,
    Object? expirationDate = null,
    Object? status = null,
    Object? qualityAssuranceCheckDate = null,
    Object? taxInvoiceNo = freezed,
    Object? deliveryOrderDate = freezed,
    Object? productReturnDeliveryOrderDate = freezed,
    Object? productReturnDeliveryOrderId = freezed,
    Object? createdAt = null,
    Object? confirmPpicAt = null,
    Object? confirmMarketingAt = null,
    Object? transactionTypeId = null,
  }) {
    return _then(_value.copyWith(
      transactionNo: null == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      referenceNo: null == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as String,
      quantityCheck: null == quantityCheck
          ? _value.quantityCheck
          : quantityCheck // ignore: cast_nullable_to_non_nullable
              as int,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as int,
      batchNoId: null == batchNoId
          ? _value.batchNoId
          : batchNoId // ignore: cast_nullable_to_non_nullable
              as String,
      expirationDate: null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      qualityAssuranceCheckDate: null == qualityAssuranceCheckDate
          ? _value.qualityAssuranceCheckDate
          : qualityAssuranceCheckDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      taxInvoiceNo: freezed == taxInvoiceNo
          ? _value.taxInvoiceNo
          : taxInvoiceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryOrderDate: freezed == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      productReturnDeliveryOrderDate: freezed == productReturnDeliveryOrderDate
          ? _value.productReturnDeliveryOrderDate
          : productReturnDeliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      productReturnDeliveryOrderId: freezed == productReturnDeliveryOrderId
          ? _value.productReturnDeliveryOrderId
          : productReturnDeliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      confirmPpicAt: null == confirmPpicAt
          ? _value.confirmPpicAt
          : confirmPpicAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      confirmMarketingAt: null == confirmMarketingAt
          ? _value.confirmMarketingAt
          : confirmMarketingAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionTypeId: null == transactionTypeId
          ? _value.transactionTypeId
          : transactionTypeId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductReturnOutstandingReportImplCopyWith<$Res>
    implements $ProductReturnOutstandingReportCopyWith<$Res> {
  factory _$$ProductReturnOutstandingReportImplCopyWith(
          _$ProductReturnOutstandingReportImpl value,
          $Res Function(_$ProductReturnOutstandingReportImpl) then) =
      __$$ProductReturnOutstandingReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'transaction_no') String transactionNo,
      @JsonKey(name: 'delivery_order_id') String deliveryOrderId,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'reference_no') String referenceNo,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'qty') String qty,
      @JsonKey(name: 'quantity_check') int quantityCheck,
      @JsonKey(name: 'unit_id') int unitId,
      @JsonKey(name: 'price') int price,
      @JsonKey(name: 'subtotal') int subtotal,
      @JsonKey(name: 'batch_no_id') String batchNoId,
      @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
      DateTime expirationDate,
      @JsonKey(name: 'status') String status,
      @JsonKey(
          name: 'quality_assurance_check_date', fromJson: isoDateToDateTime)
      DateTime qualityAssuranceCheckDate,
      @JsonKey(name: 'tax_invoice_no') String? taxInvoiceNo,
      @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullableFromJson)
      DateTime? deliveryOrderDate,
      @JsonKey(
          name: 'product_return_delivery_order_date',
          fromJson: dateTimeNullableFromJson)
      DateTime? productReturnDeliveryOrderDate,
      @JsonKey(name: 'product_return_delivery_order_id')
      String? productReturnDeliveryOrderId,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'confirm_ppic_at', fromJson: isoDateToDateTime)
      DateTime confirmPpicAt,
      @JsonKey(name: 'confirm_marketing_at', fromJson: isoDateToDateTime)
      DateTime confirmMarketingAt,
      @JsonKey(name: 'transaction_type_id') String transactionTypeId});
}

/// @nodoc
class __$$ProductReturnOutstandingReportImplCopyWithImpl<$Res>
    extends _$ProductReturnOutstandingReportCopyWithImpl<$Res,
        _$ProductReturnOutstandingReportImpl>
    implements _$$ProductReturnOutstandingReportImplCopyWith<$Res> {
  __$$ProductReturnOutstandingReportImplCopyWithImpl(
      _$ProductReturnOutstandingReportImpl _value,
      $Res Function(_$ProductReturnOutstandingReportImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionNo = null,
    Object? deliveryOrderId = null,
    Object? customerName = null,
    Object? referenceNo = null,
    Object? description = null,
    Object? productName = null,
    Object? productId = null,
    Object? qty = null,
    Object? quantityCheck = null,
    Object? unitId = null,
    Object? price = null,
    Object? subtotal = null,
    Object? batchNoId = null,
    Object? expirationDate = null,
    Object? status = null,
    Object? qualityAssuranceCheckDate = null,
    Object? taxInvoiceNo = freezed,
    Object? deliveryOrderDate = freezed,
    Object? productReturnDeliveryOrderDate = freezed,
    Object? productReturnDeliveryOrderId = freezed,
    Object? createdAt = null,
    Object? confirmPpicAt = null,
    Object? confirmMarketingAt = null,
    Object? transactionTypeId = null,
  }) {
    return _then(_$ProductReturnOutstandingReportImpl(
      transactionNo: null == transactionNo
          ? _value.transactionNo
          : transactionNo // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrderId: null == deliveryOrderId
          ? _value.deliveryOrderId
          : deliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      referenceNo: null == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as String,
      quantityCheck: null == quantityCheck
          ? _value.quantityCheck
          : quantityCheck // ignore: cast_nullable_to_non_nullable
              as int,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as int,
      batchNoId: null == batchNoId
          ? _value.batchNoId
          : batchNoId // ignore: cast_nullable_to_non_nullable
              as String,
      expirationDate: null == expirationDate
          ? _value.expirationDate
          : expirationDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      qualityAssuranceCheckDate: null == qualityAssuranceCheckDate
          ? _value.qualityAssuranceCheckDate
          : qualityAssuranceCheckDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      taxInvoiceNo: freezed == taxInvoiceNo
          ? _value.taxInvoiceNo
          : taxInvoiceNo // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryOrderDate: freezed == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      productReturnDeliveryOrderDate: freezed == productReturnDeliveryOrderDate
          ? _value.productReturnDeliveryOrderDate
          : productReturnDeliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      productReturnDeliveryOrderId: freezed == productReturnDeliveryOrderId
          ? _value.productReturnDeliveryOrderId
          : productReturnDeliveryOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      confirmPpicAt: null == confirmPpicAt
          ? _value.confirmPpicAt
          : confirmPpicAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      confirmMarketingAt: null == confirmMarketingAt
          ? _value.confirmMarketingAt
          : confirmMarketingAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionTypeId: null == transactionTypeId
          ? _value.transactionTypeId
          : transactionTypeId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductReturnOutstandingReportImpl
    extends _ProductReturnOutstandingReport {
  _$ProductReturnOutstandingReportImpl(
      {@JsonKey(name: 'transaction_no') required this.transactionNo,
      @JsonKey(name: 'delivery_order_id') required this.deliveryOrderId,
      @JsonKey(name: 'customer_name') required this.customerName,
      @JsonKey(name: 'reference_no') required this.referenceNo,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'qty') required this.qty,
      @JsonKey(name: 'quantity_check') required this.quantityCheck,
      @JsonKey(name: 'unit_id') required this.unitId,
      @JsonKey(name: 'price') required this.price,
      @JsonKey(name: 'subtotal') required this.subtotal,
      @JsonKey(name: 'batch_no_id') required this.batchNoId,
      @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
      required this.expirationDate,
      @JsonKey(name: 'status') required this.status,
      @JsonKey(
          name: 'quality_assurance_check_date', fromJson: isoDateToDateTime)
      required this.qualityAssuranceCheckDate,
      @JsonKey(name: 'tax_invoice_no') this.taxInvoiceNo,
      @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullableFromJson)
      this.deliveryOrderDate,
      @JsonKey(
          name: 'product_return_delivery_order_date',
          fromJson: dateTimeNullableFromJson)
      this.productReturnDeliveryOrderDate,
      @JsonKey(name: 'product_return_delivery_order_id')
      this.productReturnDeliveryOrderId,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'confirm_ppic_at', fromJson: isoDateToDateTime)
      required this.confirmPpicAt,
      @JsonKey(name: 'confirm_marketing_at', fromJson: isoDateToDateTime)
      required this.confirmMarketingAt,
      @JsonKey(name: 'transaction_type_id') required this.transactionTypeId})
      : super._();

  factory _$ProductReturnOutstandingReportImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProductReturnOutstandingReportImplFromJson(json);

  @override
  @JsonKey(name: 'transaction_no')
  final String transactionNo;
  @override
  @JsonKey(name: 'delivery_order_id')
  final String deliveryOrderId;
  @override
  @JsonKey(name: 'customer_name')
  final String customerName;
  @override
  @JsonKey(name: 'reference_no')
  final String referenceNo;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'qty')
  final String qty;
  @override
  @JsonKey(name: 'quantity_check')
  final int quantityCheck;
  @override
  @JsonKey(name: 'unit_id')
  final int unitId;
  @override
  @JsonKey(name: 'price')
  final int price;
  @override
  @JsonKey(name: 'subtotal')
  final int subtotal;
  @override
  @JsonKey(name: 'batch_no_id')
  final String batchNoId;
  @override
  @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
  final DateTime expirationDate;
  @override
  @JsonKey(name: 'status')
  final String status;
  @override
  @JsonKey(name: 'quality_assurance_check_date', fromJson: isoDateToDateTime)
  final DateTime qualityAssuranceCheckDate;
  @override
  @JsonKey(name: 'tax_invoice_no')
  final String? taxInvoiceNo;
  @override
  @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullableFromJson)
  final DateTime? deliveryOrderDate;
  @override
  @JsonKey(
      name: 'product_return_delivery_order_date',
      fromJson: dateTimeNullableFromJson)
  final DateTime? productReturnDeliveryOrderDate;
  @override
  @JsonKey(name: 'product_return_delivery_order_id')
  final String? productReturnDeliveryOrderId;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'confirm_ppic_at', fromJson: isoDateToDateTime)
  final DateTime confirmPpicAt;
  @override
  @JsonKey(name: 'confirm_marketing_at', fromJson: isoDateToDateTime)
  final DateTime confirmMarketingAt;
  @override
  @JsonKey(name: 'transaction_type_id')
  final String transactionTypeId;

  @override
  String toString() {
    return 'ProductReturnOutstandingReport(transactionNo: $transactionNo, deliveryOrderId: $deliveryOrderId, customerName: $customerName, referenceNo: $referenceNo, description: $description, productName: $productName, productId: $productId, qty: $qty, quantityCheck: $quantityCheck, unitId: $unitId, price: $price, subtotal: $subtotal, batchNoId: $batchNoId, expirationDate: $expirationDate, status: $status, qualityAssuranceCheckDate: $qualityAssuranceCheckDate, taxInvoiceNo: $taxInvoiceNo, deliveryOrderDate: $deliveryOrderDate, productReturnDeliveryOrderDate: $productReturnDeliveryOrderDate, productReturnDeliveryOrderId: $productReturnDeliveryOrderId, createdAt: $createdAt, confirmPpicAt: $confirmPpicAt, confirmMarketingAt: $confirmMarketingAt, transactionTypeId: $transactionTypeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductReturnOutstandingReportImpl &&
            (identical(other.transactionNo, transactionNo) ||
                other.transactionNo == transactionNo) &&
            (identical(other.deliveryOrderId, deliveryOrderId) ||
                other.deliveryOrderId == deliveryOrderId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.referenceNo, referenceNo) ||
                other.referenceNo == referenceNo) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.quantityCheck, quantityCheck) ||
                other.quantityCheck == quantityCheck) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.batchNoId, batchNoId) ||
                other.batchNoId == batchNoId) &&
            (identical(other.expirationDate, expirationDate) ||
                other.expirationDate == expirationDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.qualityAssuranceCheckDate,
                    qualityAssuranceCheckDate) ||
                other.qualityAssuranceCheckDate == qualityAssuranceCheckDate) &&
            (identical(other.taxInvoiceNo, taxInvoiceNo) ||
                other.taxInvoiceNo == taxInvoiceNo) &&
            (identical(other.deliveryOrderDate, deliveryOrderDate) ||
                other.deliveryOrderDate == deliveryOrderDate) &&
            (identical(other.productReturnDeliveryOrderDate,
                    productReturnDeliveryOrderDate) ||
                other.productReturnDeliveryOrderDate ==
                    productReturnDeliveryOrderDate) &&
            (identical(other.productReturnDeliveryOrderId,
                    productReturnDeliveryOrderId) ||
                other.productReturnDeliveryOrderId ==
                    productReturnDeliveryOrderId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.confirmPpicAt, confirmPpicAt) ||
                other.confirmPpicAt == confirmPpicAt) &&
            (identical(other.confirmMarketingAt, confirmMarketingAt) ||
                other.confirmMarketingAt == confirmMarketingAt) &&
            (identical(other.transactionTypeId, transactionTypeId) ||
                other.transactionTypeId == transactionTypeId));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        transactionNo,
        deliveryOrderId,
        customerName,
        referenceNo,
        description,
        productName,
        productId,
        qty,
        quantityCheck,
        unitId,
        price,
        subtotal,
        batchNoId,
        expirationDate,
        status,
        qualityAssuranceCheckDate,
        taxInvoiceNo,
        deliveryOrderDate,
        productReturnDeliveryOrderDate,
        productReturnDeliveryOrderId,
        createdAt,
        confirmPpicAt,
        confirmMarketingAt,
        transactionTypeId
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductReturnOutstandingReportImplCopyWith<
          _$ProductReturnOutstandingReportImpl>
      get copyWith => __$$ProductReturnOutstandingReportImplCopyWithImpl<
          _$ProductReturnOutstandingReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductReturnOutstandingReportImplToJson(
      this,
    );
  }
}

abstract class _ProductReturnOutstandingReport
    extends ProductReturnOutstandingReport {
  factory _ProductReturnOutstandingReport(
      {@JsonKey(name: 'transaction_no') required final String transactionNo,
      @JsonKey(name: 'delivery_order_id') required final String deliveryOrderId,
      @JsonKey(name: 'customer_name') required final String customerName,
      @JsonKey(name: 'reference_no') required final String referenceNo,
      @JsonKey(name: 'description') required final String description,
      @JsonKey(name: 'product_name') required final String productName,
      @JsonKey(name: 'product_id') required final String productId,
      @JsonKey(name: 'qty') required final String qty,
      @JsonKey(name: 'quantity_check') required final int quantityCheck,
      @JsonKey(name: 'unit_id') required final int unitId,
      @JsonKey(name: 'price') required final int price,
      @JsonKey(name: 'subtotal') required final int subtotal,
      @JsonKey(name: 'batch_no_id') required final String batchNoId,
      @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
      required final DateTime expirationDate,
      @JsonKey(name: 'status') required final String status,
      @JsonKey(
          name: 'quality_assurance_check_date', fromJson: isoDateToDateTime)
      required final DateTime qualityAssuranceCheckDate,
      @JsonKey(name: 'tax_invoice_no') final String? taxInvoiceNo,
      @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullableFromJson)
      final DateTime? deliveryOrderDate,
      @JsonKey(
          name: 'product_return_delivery_order_date',
          fromJson: dateTimeNullableFromJson)
      final DateTime? productReturnDeliveryOrderDate,
      @JsonKey(name: 'product_return_delivery_order_id')
      final String? productReturnDeliveryOrderId,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'confirm_ppic_at', fromJson: isoDateToDateTime)
      required final DateTime confirmPpicAt,
      @JsonKey(name: 'confirm_marketing_at', fromJson: isoDateToDateTime)
      required final DateTime confirmMarketingAt,
      @JsonKey(name: 'transaction_type_id')
      required final String
          transactionTypeId}) = _$ProductReturnOutstandingReportImpl;
  _ProductReturnOutstandingReport._() : super._();

  factory _ProductReturnOutstandingReport.fromJson(Map<String, dynamic> json) =
      _$ProductReturnOutstandingReportImpl.fromJson;

  @override
  @JsonKey(name: 'transaction_no')
  String get transactionNo;
  @override
  @JsonKey(name: 'delivery_order_id')
  String get deliveryOrderId;
  @override
  @JsonKey(name: 'customer_name')
  String get customerName;
  @override
  @JsonKey(name: 'reference_no')
  String get referenceNo;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'qty')
  String get qty;
  @override
  @JsonKey(name: 'quantity_check')
  int get quantityCheck;
  @override
  @JsonKey(name: 'unit_id')
  int get unitId;
  @override
  @JsonKey(name: 'price')
  int get price;
  @override
  @JsonKey(name: 'subtotal')
  int get subtotal;
  @override
  @JsonKey(name: 'batch_no_id')
  String get batchNoId;
  @override
  @JsonKey(name: 'expiration_date', fromJson: isoDateToDateTime)
  DateTime get expirationDate;
  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'quality_assurance_check_date', fromJson: isoDateToDateTime)
  DateTime get qualityAssuranceCheckDate;
  @override
  @JsonKey(name: 'tax_invoice_no')
  String? get taxInvoiceNo;
  @override
  @JsonKey(name: 'delivery_order_date', fromJson: dateTimeNullableFromJson)
  DateTime? get deliveryOrderDate;
  @override
  @JsonKey(
      name: 'product_return_delivery_order_date',
      fromJson: dateTimeNullableFromJson)
  DateTime? get productReturnDeliveryOrderDate;
  @override
  @JsonKey(name: 'product_return_delivery_order_id')
  String? get productReturnDeliveryOrderId;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'confirm_ppic_at', fromJson: isoDateToDateTime)
  DateTime get confirmPpicAt;
  @override
  @JsonKey(name: 'confirm_marketing_at', fromJson: isoDateToDateTime)
  DateTime get confirmMarketingAt;
  @override
  @JsonKey(name: 'transaction_type_id')
  String get transactionTypeId;
  @override
  @JsonKey(ignore: true)
  _$$ProductReturnOutstandingReportImplCopyWith<
          _$ProductReturnOutstandingReportImpl>
      get copyWith => throw _privateConstructorUsedError;
}
