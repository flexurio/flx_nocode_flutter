// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_order_loan_requests_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalesOrderLoanRequestsSummary _$SalesOrderLoanRequestsSummaryFromJson(
    Map<String, dynamic> json) {
  return _SalesOrderLoanRequestsSummary.fromJson(json);
}

/// @nodoc
mixin _$SalesOrderLoanRequestsSummary {
  @JsonKey(name: 'sales_order_id')
  String get salesOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sales_order_date', fromJson: isoDateToDateTime)
  DateTime get salesOrderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_type')
  String get productType => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order_distributor')
  String get purchaseOrderDistributor => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no_id')
  String get batchNoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  DateTime get expiredDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_delivery_address')
  String get customerDeliveryAddress => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  int get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_delivery')
  int get qtyDelivery => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_id')
  String get unitId => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_discount_percent')
  int get productDiscountPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'additional_discount_percent')
  int get additionalDiscountPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'value_sales_order')
  int get valueSalesOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'value_realization')
  int get valueRealization => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
  DateTime get deliveryOrderDate => throw _privateConstructorUsedError;

  /// Serializes this SalesOrderLoanRequestsSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SalesOrderLoanRequestsSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesOrderLoanRequestsSummaryCopyWith<SalesOrderLoanRequestsSummary>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrderLoanRequestsSummaryCopyWith<$Res> {
  factory $SalesOrderLoanRequestsSummaryCopyWith(
          SalesOrderLoanRequestsSummary value,
          $Res Function(SalesOrderLoanRequestsSummary) then) =
      _$SalesOrderLoanRequestsSummaryCopyWithImpl<$Res,
          SalesOrderLoanRequestsSummary>;
  @useResult
  $Res call(
      {@JsonKey(name: 'sales_order_id') String salesOrderId,
      @JsonKey(name: 'sales_order_date', fromJson: isoDateToDateTime)
      DateTime salesOrderDate,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'product_type') String productType,
      @JsonKey(name: 'purchase_order_distributor')
      String purchaseOrderDistributor,
      @JsonKey(name: 'batch_no_id') String batchNoId,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      DateTime expiredDate,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'customer_delivery_address')
      String customerDeliveryAddress,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      int qty,
      @JsonKey(name: 'qty_delivery') int qtyDelivery,
      @JsonKey(name: 'unit_id') String unitId,
      int price,
      @JsonKey(name: 'product_discount_percent') int productDiscountPercent,
      @JsonKey(name: 'additional_discount_percent')
      int additionalDiscountPercent,
      @JsonKey(name: 'value_sales_order') int valueSalesOrder,
      @JsonKey(name: 'value_realization') int valueRealization,
      @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      DateTime deliveryOrderDate});
}

/// @nodoc
class _$SalesOrderLoanRequestsSummaryCopyWithImpl<$Res,
        $Val extends SalesOrderLoanRequestsSummary>
    implements $SalesOrderLoanRequestsSummaryCopyWith<$Res> {
  _$SalesOrderLoanRequestsSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesOrderLoanRequestsSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrderId = null,
    Object? salesOrderDate = null,
    Object? description = null,
    Object? productType = null,
    Object? purchaseOrderDistributor = null,
    Object? batchNoId = null,
    Object? expiredDate = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? customerDeliveryAddress = null,
    Object? productId = null,
    Object? productName = null,
    Object? qty = null,
    Object? qtyDelivery = null,
    Object? unitId = null,
    Object? price = null,
    Object? productDiscountPercent = null,
    Object? additionalDiscountPercent = null,
    Object? valueSalesOrder = null,
    Object? valueRealization = null,
    Object? deliveryOrderDate = null,
  }) {
    return _then(_value.copyWith(
      salesOrderId: null == salesOrderId
          ? _value.salesOrderId
          : salesOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrderDate: null == salesOrderDate
          ? _value.salesOrderDate
          : salesOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderDistributor: null == purchaseOrderDistributor
          ? _value.purchaseOrderDistributor
          : purchaseOrderDistributor // ignore: cast_nullable_to_non_nullable
              as String,
      batchNoId: null == batchNoId
          ? _value.batchNoId
          : batchNoId // ignore: cast_nullable_to_non_nullable
              as String,
      expiredDate: null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerDeliveryAddress: null == customerDeliveryAddress
          ? _value.customerDeliveryAddress
          : customerDeliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      qtyDelivery: null == qtyDelivery
          ? _value.qtyDelivery
          : qtyDelivery // ignore: cast_nullable_to_non_nullable
              as int,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      productDiscountPercent: null == productDiscountPercent
          ? _value.productDiscountPercent
          : productDiscountPercent // ignore: cast_nullable_to_non_nullable
              as int,
      additionalDiscountPercent: null == additionalDiscountPercent
          ? _value.additionalDiscountPercent
          : additionalDiscountPercent // ignore: cast_nullable_to_non_nullable
              as int,
      valueSalesOrder: null == valueSalesOrder
          ? _value.valueSalesOrder
          : valueSalesOrder // ignore: cast_nullable_to_non_nullable
              as int,
      valueRealization: null == valueRealization
          ? _value.valueRealization
          : valueRealization // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryOrderDate: null == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesOrderLoanRequestsSummaryImplCopyWith<$Res>
    implements $SalesOrderLoanRequestsSummaryCopyWith<$Res> {
  factory _$$SalesOrderLoanRequestsSummaryImplCopyWith(
          _$SalesOrderLoanRequestsSummaryImpl value,
          $Res Function(_$SalesOrderLoanRequestsSummaryImpl) then) =
      __$$SalesOrderLoanRequestsSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'sales_order_id') String salesOrderId,
      @JsonKey(name: 'sales_order_date', fromJson: isoDateToDateTime)
      DateTime salesOrderDate,
      @JsonKey(name: 'description') String description,
      @JsonKey(name: 'product_type') String productType,
      @JsonKey(name: 'purchase_order_distributor')
      String purchaseOrderDistributor,
      @JsonKey(name: 'batch_no_id') String batchNoId,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      DateTime expiredDate,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'customer_delivery_address')
      String customerDeliveryAddress,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      int qty,
      @JsonKey(name: 'qty_delivery') int qtyDelivery,
      @JsonKey(name: 'unit_id') String unitId,
      int price,
      @JsonKey(name: 'product_discount_percent') int productDiscountPercent,
      @JsonKey(name: 'additional_discount_percent')
      int additionalDiscountPercent,
      @JsonKey(name: 'value_sales_order') int valueSalesOrder,
      @JsonKey(name: 'value_realization') int valueRealization,
      @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      DateTime deliveryOrderDate});
}

/// @nodoc
class __$$SalesOrderLoanRequestsSummaryImplCopyWithImpl<$Res>
    extends _$SalesOrderLoanRequestsSummaryCopyWithImpl<$Res,
        _$SalesOrderLoanRequestsSummaryImpl>
    implements _$$SalesOrderLoanRequestsSummaryImplCopyWith<$Res> {
  __$$SalesOrderLoanRequestsSummaryImplCopyWithImpl(
      _$SalesOrderLoanRequestsSummaryImpl _value,
      $Res Function(_$SalesOrderLoanRequestsSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderLoanRequestsSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrderId = null,
    Object? salesOrderDate = null,
    Object? description = null,
    Object? productType = null,
    Object? purchaseOrderDistributor = null,
    Object? batchNoId = null,
    Object? expiredDate = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? customerDeliveryAddress = null,
    Object? productId = null,
    Object? productName = null,
    Object? qty = null,
    Object? qtyDelivery = null,
    Object? unitId = null,
    Object? price = null,
    Object? productDiscountPercent = null,
    Object? additionalDiscountPercent = null,
    Object? valueSalesOrder = null,
    Object? valueRealization = null,
    Object? deliveryOrderDate = null,
  }) {
    return _then(_$SalesOrderLoanRequestsSummaryImpl(
      salesOrderId: null == salesOrderId
          ? _value.salesOrderId
          : salesOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrderDate: null == salesOrderDate
          ? _value.salesOrderDate
          : salesOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderDistributor: null == purchaseOrderDistributor
          ? _value.purchaseOrderDistributor
          : purchaseOrderDistributor // ignore: cast_nullable_to_non_nullable
              as String,
      batchNoId: null == batchNoId
          ? _value.batchNoId
          : batchNoId // ignore: cast_nullable_to_non_nullable
              as String,
      expiredDate: null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerDeliveryAddress: null == customerDeliveryAddress
          ? _value.customerDeliveryAddress
          : customerDeliveryAddress // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      qtyDelivery: null == qtyDelivery
          ? _value.qtyDelivery
          : qtyDelivery // ignore: cast_nullable_to_non_nullable
              as int,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      productDiscountPercent: null == productDiscountPercent
          ? _value.productDiscountPercent
          : productDiscountPercent // ignore: cast_nullable_to_non_nullable
              as int,
      additionalDiscountPercent: null == additionalDiscountPercent
          ? _value.additionalDiscountPercent
          : additionalDiscountPercent // ignore: cast_nullable_to_non_nullable
              as int,
      valueSalesOrder: null == valueSalesOrder
          ? _value.valueSalesOrder
          : valueSalesOrder // ignore: cast_nullable_to_non_nullable
              as int,
      valueRealization: null == valueRealization
          ? _value.valueRealization
          : valueRealization // ignore: cast_nullable_to_non_nullable
              as int,
      deliveryOrderDate: null == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesOrderLoanRequestsSummaryImpl
    extends _SalesOrderLoanRequestsSummary {
  const _$SalesOrderLoanRequestsSummaryImpl(
      {@JsonKey(name: 'sales_order_id') required this.salesOrderId,
      @JsonKey(name: 'sales_order_date', fromJson: isoDateToDateTime)
      required this.salesOrderDate,
      @JsonKey(name: 'description') required this.description,
      @JsonKey(name: 'product_type') required this.productType,
      @JsonKey(name: 'purchase_order_distributor')
      required this.purchaseOrderDistributor,
      @JsonKey(name: 'batch_no_id') required this.batchNoId,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      required this.expiredDate,
      @JsonKey(name: 'customer_id') required this.customerId,
      @JsonKey(name: 'customer_name') required this.customerName,
      @JsonKey(name: 'customer_delivery_address')
      required this.customerDeliveryAddress,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'product_name') required this.productName,
      required this.qty,
      @JsonKey(name: 'qty_delivery') required this.qtyDelivery,
      @JsonKey(name: 'unit_id') required this.unitId,
      required this.price,
      @JsonKey(name: 'product_discount_percent')
      required this.productDiscountPercent,
      @JsonKey(name: 'additional_discount_percent')
      required this.additionalDiscountPercent,
      @JsonKey(name: 'value_sales_order') required this.valueSalesOrder,
      @JsonKey(name: 'value_realization') required this.valueRealization,
      @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      required this.deliveryOrderDate})
      : super._();

  factory _$SalesOrderLoanRequestsSummaryImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SalesOrderLoanRequestsSummaryImplFromJson(json);

  @override
  @JsonKey(name: 'sales_order_id')
  final String salesOrderId;
  @override
  @JsonKey(name: 'sales_order_date', fromJson: isoDateToDateTime)
  final DateTime salesOrderDate;
  @override
  @JsonKey(name: 'description')
  final String description;
  @override
  @JsonKey(name: 'product_type')
  final String productType;
  @override
  @JsonKey(name: 'purchase_order_distributor')
  final String purchaseOrderDistributor;
  @override
  @JsonKey(name: 'batch_no_id')
  final String batchNoId;
  @override
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  final DateTime expiredDate;
  @override
  @JsonKey(name: 'customer_id')
  final String customerId;
  @override
  @JsonKey(name: 'customer_name')
  final String customerName;
  @override
  @JsonKey(name: 'customer_delivery_address')
  final String customerDeliveryAddress;
  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  final int qty;
  @override
  @JsonKey(name: 'qty_delivery')
  final int qtyDelivery;
  @override
  @JsonKey(name: 'unit_id')
  final String unitId;
  @override
  final int price;
  @override
  @JsonKey(name: 'product_discount_percent')
  final int productDiscountPercent;
  @override
  @JsonKey(name: 'additional_discount_percent')
  final int additionalDiscountPercent;
  @override
  @JsonKey(name: 'value_sales_order')
  final int valueSalesOrder;
  @override
  @JsonKey(name: 'value_realization')
  final int valueRealization;
  @override
  @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
  final DateTime deliveryOrderDate;

  @override
  String toString() {
    return 'SalesOrderLoanRequestsSummary(salesOrderId: $salesOrderId, salesOrderDate: $salesOrderDate, description: $description, productType: $productType, purchaseOrderDistributor: $purchaseOrderDistributor, batchNoId: $batchNoId, expiredDate: $expiredDate, customerId: $customerId, customerName: $customerName, customerDeliveryAddress: $customerDeliveryAddress, productId: $productId, productName: $productName, qty: $qty, qtyDelivery: $qtyDelivery, unitId: $unitId, price: $price, productDiscountPercent: $productDiscountPercent, additionalDiscountPercent: $additionalDiscountPercent, valueSalesOrder: $valueSalesOrder, valueRealization: $valueRealization, deliveryOrderDate: $deliveryOrderDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesOrderLoanRequestsSummaryImpl &&
            (identical(other.salesOrderId, salesOrderId) ||
                other.salesOrderId == salesOrderId) &&
            (identical(other.salesOrderDate, salesOrderDate) ||
                other.salesOrderDate == salesOrderDate) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(
                    other.purchaseOrderDistributor, purchaseOrderDistributor) ||
                other.purchaseOrderDistributor == purchaseOrderDistributor) &&
            (identical(other.batchNoId, batchNoId) ||
                other.batchNoId == batchNoId) &&
            (identical(other.expiredDate, expiredDate) ||
                other.expiredDate == expiredDate) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(
                    other.customerDeliveryAddress, customerDeliveryAddress) ||
                other.customerDeliveryAddress == customerDeliveryAddress) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.qtyDelivery, qtyDelivery) ||
                other.qtyDelivery == qtyDelivery) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.productDiscountPercent, productDiscountPercent) ||
                other.productDiscountPercent == productDiscountPercent) &&
            (identical(other.additionalDiscountPercent,
                    additionalDiscountPercent) ||
                other.additionalDiscountPercent == additionalDiscountPercent) &&
            (identical(other.valueSalesOrder, valueSalesOrder) ||
                other.valueSalesOrder == valueSalesOrder) &&
            (identical(other.valueRealization, valueRealization) ||
                other.valueRealization == valueRealization) &&
            (identical(other.deliveryOrderDate, deliveryOrderDate) ||
                other.deliveryOrderDate == deliveryOrderDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        salesOrderId,
        salesOrderDate,
        description,
        productType,
        purchaseOrderDistributor,
        batchNoId,
        expiredDate,
        customerId,
        customerName,
        customerDeliveryAddress,
        productId,
        productName,
        qty,
        qtyDelivery,
        unitId,
        price,
        productDiscountPercent,
        additionalDiscountPercent,
        valueSalesOrder,
        valueRealization,
        deliveryOrderDate
      ]);

  /// Create a copy of SalesOrderLoanRequestsSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesOrderLoanRequestsSummaryImplCopyWith<
          _$SalesOrderLoanRequestsSummaryImpl>
      get copyWith => __$$SalesOrderLoanRequestsSummaryImplCopyWithImpl<
          _$SalesOrderLoanRequestsSummaryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesOrderLoanRequestsSummaryImplToJson(
      this,
    );
  }
}

abstract class _SalesOrderLoanRequestsSummary
    extends SalesOrderLoanRequestsSummary {
  const factory _SalesOrderLoanRequestsSummary(
      {@JsonKey(name: 'sales_order_id') required final String salesOrderId,
      @JsonKey(name: 'sales_order_date', fromJson: isoDateToDateTime)
      required final DateTime salesOrderDate,
      @JsonKey(name: 'description') required final String description,
      @JsonKey(name: 'product_type') required final String productType,
      @JsonKey(name: 'purchase_order_distributor')
      required final String purchaseOrderDistributor,
      @JsonKey(name: 'batch_no_id') required final String batchNoId,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      required final DateTime expiredDate,
      @JsonKey(name: 'customer_id') required final String customerId,
      @JsonKey(name: 'customer_name') required final String customerName,
      @JsonKey(name: 'customer_delivery_address')
      required final String customerDeliveryAddress,
      @JsonKey(name: 'product_id') required final String productId,
      @JsonKey(name: 'product_name') required final String productName,
      required final int qty,
      @JsonKey(name: 'qty_delivery') required final int qtyDelivery,
      @JsonKey(name: 'unit_id') required final String unitId,
      required final int price,
      @JsonKey(name: 'product_discount_percent')
      required final int productDiscountPercent,
      @JsonKey(name: 'additional_discount_percent')
      required final int additionalDiscountPercent,
      @JsonKey(name: 'value_sales_order') required final int valueSalesOrder,
      @JsonKey(name: 'value_realization') required final int valueRealization,
      @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
      required final DateTime
          deliveryOrderDate}) = _$SalesOrderLoanRequestsSummaryImpl;
  const _SalesOrderLoanRequestsSummary._() : super._();

  factory _SalesOrderLoanRequestsSummary.fromJson(Map<String, dynamic> json) =
      _$SalesOrderLoanRequestsSummaryImpl.fromJson;

  @override
  @JsonKey(name: 'sales_order_id')
  String get salesOrderId;
  @override
  @JsonKey(name: 'sales_order_date', fromJson: isoDateToDateTime)
  DateTime get salesOrderDate;
  @override
  @JsonKey(name: 'description')
  String get description;
  @override
  @JsonKey(name: 'product_type')
  String get productType;
  @override
  @JsonKey(name: 'purchase_order_distributor')
  String get purchaseOrderDistributor;
  @override
  @JsonKey(name: 'batch_no_id')
  String get batchNoId;
  @override
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  DateTime get expiredDate;
  @override
  @JsonKey(name: 'customer_id')
  String get customerId;
  @override
  @JsonKey(name: 'customer_name')
  String get customerName;
  @override
  @JsonKey(name: 'customer_delivery_address')
  String get customerDeliveryAddress;
  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  int get qty;
  @override
  @JsonKey(name: 'qty_delivery')
  int get qtyDelivery;
  @override
  @JsonKey(name: 'unit_id')
  String get unitId;
  @override
  int get price;
  @override
  @JsonKey(name: 'product_discount_percent')
  int get productDiscountPercent;
  @override
  @JsonKey(name: 'additional_discount_percent')
  int get additionalDiscountPercent;
  @override
  @JsonKey(name: 'value_sales_order')
  int get valueSalesOrder;
  @override
  @JsonKey(name: 'value_realization')
  int get valueRealization;
  @override
  @JsonKey(name: 'delivery_order_date', fromJson: isoDateToDateTime)
  DateTime get deliveryOrderDate;

  /// Create a copy of SalesOrderLoanRequestsSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesOrderLoanRequestsSummaryImplCopyWith<
          _$SalesOrderLoanRequestsSummaryImpl>
      get copyWith => throw _privateConstructorUsedError;
}
