// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_order_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalesOrderSummary _$SalesOrderSummaryFromJson(Map<String, dynamic> json) {
  return _SalesOrderSummary.fromJson(json);
}

/// @nodoc
mixin _$SalesOrderSummary {
  @JsonKey(name: 'product_type')
  String get productType => throw _privateConstructorUsedError;
  @JsonKey(name: 'purchase_order_distributor')
  String get purchaseOrderDistributor => throw _privateConstructorUsedError;
  @JsonKey(name: 'sales_order_id')
  String get salesOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'sales_order_date', fromJson: isoDateToDateTime)
  DateTime get salesOrderDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no_id')
  String? get batchNoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
  DateTime? get expiredDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_order_received')
  String? get deliveryOrderReceived => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'sales_order_quantity')
  int get salesOrderQuantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'sales_order_quantity_delivery')
  int get salesOrderQuantityDelivery => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_id')
  String get unitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_price')
  int get productPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'value_sales_order')
  int get valueSalesOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'value_realization')
  int get valueRealization => throw _privateConstructorUsedError;

  /// Serializes this SalesOrderSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SalesOrderSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesOrderSummaryCopyWith<SalesOrderSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrderSummaryCopyWith<$Res> {
  factory $SalesOrderSummaryCopyWith(
          SalesOrderSummary value, $Res Function(SalesOrderSummary) then) =
      _$SalesOrderSummaryCopyWithImpl<$Res, SalesOrderSummary>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_type') String productType,
      @JsonKey(name: 'purchase_order_distributor')
      String purchaseOrderDistributor,
      @JsonKey(name: 'sales_order_id') String salesOrderId,
      @JsonKey(name: 'sales_order_date', fromJson: isoDateToDateTime)
      DateTime salesOrderDate,
      @JsonKey(name: 'batch_no_id') String? batchNoId,
      @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
      DateTime? expiredDate,
      @JsonKey(name: 'delivery_order_received') String? deliveryOrderReceived,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'sales_order_quantity') int salesOrderQuantity,
      @JsonKey(name: 'sales_order_quantity_delivery')
      int salesOrderQuantityDelivery,
      @JsonKey(name: 'unit_id') String unitId,
      @JsonKey(name: 'product_price') int productPrice,
      @JsonKey(name: 'value_sales_order') int valueSalesOrder,
      @JsonKey(name: 'value_realization') int valueRealization});
}

/// @nodoc
class _$SalesOrderSummaryCopyWithImpl<$Res, $Val extends SalesOrderSummary>
    implements $SalesOrderSummaryCopyWith<$Res> {
  _$SalesOrderSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesOrderSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productType = null,
    Object? purchaseOrderDistributor = null,
    Object? salesOrderId = null,
    Object? salesOrderDate = null,
    Object? batchNoId = freezed,
    Object? expiredDate = freezed,
    Object? deliveryOrderReceived = freezed,
    Object? customerId = null,
    Object? customerName = null,
    Object? productId = null,
    Object? productName = null,
    Object? salesOrderQuantity = null,
    Object? salesOrderQuantityDelivery = null,
    Object? unitId = null,
    Object? productPrice = null,
    Object? valueSalesOrder = null,
    Object? valueRealization = null,
  }) {
    return _then(_value.copyWith(
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderDistributor: null == purchaseOrderDistributor
          ? _value.purchaseOrderDistributor
          : purchaseOrderDistributor // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrderId: null == salesOrderId
          ? _value.salesOrderId
          : salesOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrderDate: null == salesOrderDate
          ? _value.salesOrderDate
          : salesOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      batchNoId: freezed == batchNoId
          ? _value.batchNoId
          : batchNoId // ignore: cast_nullable_to_non_nullable
              as String?,
      expiredDate: freezed == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryOrderReceived: freezed == deliveryOrderReceived
          ? _value.deliveryOrderReceived
          : deliveryOrderReceived // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrderQuantity: null == salesOrderQuantity
          ? _value.salesOrderQuantity
          : salesOrderQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      salesOrderQuantityDelivery: null == salesOrderQuantityDelivery
          ? _value.salesOrderQuantityDelivery
          : salesOrderQuantityDelivery // ignore: cast_nullable_to_non_nullable
              as int,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as int,
      valueSalesOrder: null == valueSalesOrder
          ? _value.valueSalesOrder
          : valueSalesOrder // ignore: cast_nullable_to_non_nullable
              as int,
      valueRealization: null == valueRealization
          ? _value.valueRealization
          : valueRealization // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SalesOrderSummaryImplCopyWith<$Res>
    implements $SalesOrderSummaryCopyWith<$Res> {
  factory _$$SalesOrderSummaryImplCopyWith(_$SalesOrderSummaryImpl value,
          $Res Function(_$SalesOrderSummaryImpl) then) =
      __$$SalesOrderSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_type') String productType,
      @JsonKey(name: 'purchase_order_distributor')
      String purchaseOrderDistributor,
      @JsonKey(name: 'sales_order_id') String salesOrderId,
      @JsonKey(name: 'sales_order_date', fromJson: isoDateToDateTime)
      DateTime salesOrderDate,
      @JsonKey(name: 'batch_no_id') String? batchNoId,
      @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
      DateTime? expiredDate,
      @JsonKey(name: 'delivery_order_received') String? deliveryOrderReceived,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'sales_order_quantity') int salesOrderQuantity,
      @JsonKey(name: 'sales_order_quantity_delivery')
      int salesOrderQuantityDelivery,
      @JsonKey(name: 'unit_id') String unitId,
      @JsonKey(name: 'product_price') int productPrice,
      @JsonKey(name: 'value_sales_order') int valueSalesOrder,
      @JsonKey(name: 'value_realization') int valueRealization});
}

/// @nodoc
class __$$SalesOrderSummaryImplCopyWithImpl<$Res>
    extends _$SalesOrderSummaryCopyWithImpl<$Res, _$SalesOrderSummaryImpl>
    implements _$$SalesOrderSummaryImplCopyWith<$Res> {
  __$$SalesOrderSummaryImplCopyWithImpl(_$SalesOrderSummaryImpl _value,
      $Res Function(_$SalesOrderSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productType = null,
    Object? purchaseOrderDistributor = null,
    Object? salesOrderId = null,
    Object? salesOrderDate = null,
    Object? batchNoId = freezed,
    Object? expiredDate = freezed,
    Object? deliveryOrderReceived = freezed,
    Object? customerId = null,
    Object? customerName = null,
    Object? productId = null,
    Object? productName = null,
    Object? salesOrderQuantity = null,
    Object? salesOrderQuantityDelivery = null,
    Object? unitId = null,
    Object? productPrice = null,
    Object? valueSalesOrder = null,
    Object? valueRealization = null,
  }) {
    return _then(_$SalesOrderSummaryImpl(
      productType: null == productType
          ? _value.productType
          : productType // ignore: cast_nullable_to_non_nullable
              as String,
      purchaseOrderDistributor: null == purchaseOrderDistributor
          ? _value.purchaseOrderDistributor
          : purchaseOrderDistributor // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrderId: null == salesOrderId
          ? _value.salesOrderId
          : salesOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrderDate: null == salesOrderDate
          ? _value.salesOrderDate
          : salesOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      batchNoId: freezed == batchNoId
          ? _value.batchNoId
          : batchNoId // ignore: cast_nullable_to_non_nullable
              as String?,
      expiredDate: freezed == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      deliveryOrderReceived: freezed == deliveryOrderReceived
          ? _value.deliveryOrderReceived
          : deliveryOrderReceived // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrderQuantity: null == salesOrderQuantity
          ? _value.salesOrderQuantity
          : salesOrderQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      salesOrderQuantityDelivery: null == salesOrderQuantityDelivery
          ? _value.salesOrderQuantityDelivery
          : salesOrderQuantityDelivery // ignore: cast_nullable_to_non_nullable
              as int,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as int,
      valueSalesOrder: null == valueSalesOrder
          ? _value.valueSalesOrder
          : valueSalesOrder // ignore: cast_nullable_to_non_nullable
              as int,
      valueRealization: null == valueRealization
          ? _value.valueRealization
          : valueRealization // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesOrderSummaryImpl extends _SalesOrderSummary {
  const _$SalesOrderSummaryImpl(
      {@JsonKey(name: 'product_type') required this.productType,
      @JsonKey(name: 'purchase_order_distributor')
      required this.purchaseOrderDistributor,
      @JsonKey(name: 'sales_order_id') required this.salesOrderId,
      @JsonKey(name: 'sales_order_date', fromJson: isoDateToDateTime)
      required this.salesOrderDate,
      @JsonKey(name: 'batch_no_id') this.batchNoId,
      @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
      this.expiredDate,
      @JsonKey(name: 'delivery_order_received') this.deliveryOrderReceived,
      @JsonKey(name: 'customer_id') required this.customerId,
      @JsonKey(name: 'customer_name') required this.customerName,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'sales_order_quantity') required this.salesOrderQuantity,
      @JsonKey(name: 'sales_order_quantity_delivery')
      required this.salesOrderQuantityDelivery,
      @JsonKey(name: 'unit_id') required this.unitId,
      @JsonKey(name: 'product_price') required this.productPrice,
      @JsonKey(name: 'value_sales_order') required this.valueSalesOrder,
      @JsonKey(name: 'value_realization') required this.valueRealization})
      : super._();

  factory _$SalesOrderSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesOrderSummaryImplFromJson(json);

  @override
  @JsonKey(name: 'product_type')
  final String productType;
  @override
  @JsonKey(name: 'purchase_order_distributor')
  final String purchaseOrderDistributor;
  @override
  @JsonKey(name: 'sales_order_id')
  final String salesOrderId;
  @override
  @JsonKey(name: 'sales_order_date', fromJson: isoDateToDateTime)
  final DateTime salesOrderDate;
  @override
  @JsonKey(name: 'batch_no_id')
  final String? batchNoId;
  @override
  @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
  final DateTime? expiredDate;
  @override
  @JsonKey(name: 'delivery_order_received')
  final String? deliveryOrderReceived;
  @override
  @JsonKey(name: 'customer_id')
  final String customerId;
  @override
  @JsonKey(name: 'customer_name')
  final String customerName;
  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'sales_order_quantity')
  final int salesOrderQuantity;
  @override
  @JsonKey(name: 'sales_order_quantity_delivery')
  final int salesOrderQuantityDelivery;
  @override
  @JsonKey(name: 'unit_id')
  final String unitId;
  @override
  @JsonKey(name: 'product_price')
  final int productPrice;
  @override
  @JsonKey(name: 'value_sales_order')
  final int valueSalesOrder;
  @override
  @JsonKey(name: 'value_realization')
  final int valueRealization;

  @override
  String toString() {
    return 'SalesOrderSummary(productType: $productType, purchaseOrderDistributor: $purchaseOrderDistributor, salesOrderId: $salesOrderId, salesOrderDate: $salesOrderDate, batchNoId: $batchNoId, expiredDate: $expiredDate, deliveryOrderReceived: $deliveryOrderReceived, customerId: $customerId, customerName: $customerName, productId: $productId, productName: $productName, salesOrderQuantity: $salesOrderQuantity, salesOrderQuantityDelivery: $salesOrderQuantityDelivery, unitId: $unitId, productPrice: $productPrice, valueSalesOrder: $valueSalesOrder, valueRealization: $valueRealization)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesOrderSummaryImpl &&
            (identical(other.productType, productType) ||
                other.productType == productType) &&
            (identical(
                    other.purchaseOrderDistributor, purchaseOrderDistributor) ||
                other.purchaseOrderDistributor == purchaseOrderDistributor) &&
            (identical(other.salesOrderId, salesOrderId) ||
                other.salesOrderId == salesOrderId) &&
            (identical(other.salesOrderDate, salesOrderDate) ||
                other.salesOrderDate == salesOrderDate) &&
            (identical(other.batchNoId, batchNoId) ||
                other.batchNoId == batchNoId) &&
            (identical(other.expiredDate, expiredDate) ||
                other.expiredDate == expiredDate) &&
            (identical(other.deliveryOrderReceived, deliveryOrderReceived) ||
                other.deliveryOrderReceived == deliveryOrderReceived) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.salesOrderQuantity, salesOrderQuantity) ||
                other.salesOrderQuantity == salesOrderQuantity) &&
            (identical(other.salesOrderQuantityDelivery,
                    salesOrderQuantityDelivery) ||
                other.salesOrderQuantityDelivery ==
                    salesOrderQuantityDelivery) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.productPrice, productPrice) ||
                other.productPrice == productPrice) &&
            (identical(other.valueSalesOrder, valueSalesOrder) ||
                other.valueSalesOrder == valueSalesOrder) &&
            (identical(other.valueRealization, valueRealization) ||
                other.valueRealization == valueRealization));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productType,
      purchaseOrderDistributor,
      salesOrderId,
      salesOrderDate,
      batchNoId,
      expiredDate,
      deliveryOrderReceived,
      customerId,
      customerName,
      productId,
      productName,
      salesOrderQuantity,
      salesOrderQuantityDelivery,
      unitId,
      productPrice,
      valueSalesOrder,
      valueRealization);

  /// Create a copy of SalesOrderSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesOrderSummaryImplCopyWith<_$SalesOrderSummaryImpl> get copyWith =>
      __$$SalesOrderSummaryImplCopyWithImpl<_$SalesOrderSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesOrderSummaryImplToJson(
      this,
    );
  }
}

abstract class _SalesOrderSummary extends SalesOrderSummary {
  const factory _SalesOrderSummary(
      {@JsonKey(name: 'product_type') required final String productType,
      @JsonKey(name: 'purchase_order_distributor')
      required final String purchaseOrderDistributor,
      @JsonKey(name: 'sales_order_id') required final String salesOrderId,
      @JsonKey(name: 'sales_order_date', fromJson: isoDateToDateTime)
      required final DateTime salesOrderDate,
      @JsonKey(name: 'batch_no_id') final String? batchNoId,
      @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
      final DateTime? expiredDate,
      @JsonKey(name: 'delivery_order_received')
      final String? deliveryOrderReceived,
      @JsonKey(name: 'customer_id') required final String customerId,
      @JsonKey(name: 'customer_name') required final String customerName,
      @JsonKey(name: 'product_id') required final String productId,
      @JsonKey(name: 'product_name') required final String productName,
      @JsonKey(name: 'sales_order_quantity')
      required final int salesOrderQuantity,
      @JsonKey(name: 'sales_order_quantity_delivery')
      required final int salesOrderQuantityDelivery,
      @JsonKey(name: 'unit_id') required final String unitId,
      @JsonKey(name: 'product_price') required final int productPrice,
      @JsonKey(name: 'value_sales_order') required final int valueSalesOrder,
      @JsonKey(name: 'value_realization')
      required final int valueRealization}) = _$SalesOrderSummaryImpl;
  const _SalesOrderSummary._() : super._();

  factory _SalesOrderSummary.fromJson(Map<String, dynamic> json) =
      _$SalesOrderSummaryImpl.fromJson;

  @override
  @JsonKey(name: 'product_type')
  String get productType;
  @override
  @JsonKey(name: 'purchase_order_distributor')
  String get purchaseOrderDistributor;
  @override
  @JsonKey(name: 'sales_order_id')
  String get salesOrderId;
  @override
  @JsonKey(name: 'sales_order_date', fromJson: isoDateToDateTime)
  DateTime get salesOrderDate;
  @override
  @JsonKey(name: 'batch_no_id')
  String? get batchNoId;
  @override
  @JsonKey(name: 'expired_date', fromJson: dateTimeNullable)
  DateTime? get expiredDate;
  @override
  @JsonKey(name: 'delivery_order_received')
  String? get deliveryOrderReceived;
  @override
  @JsonKey(name: 'customer_id')
  String get customerId;
  @override
  @JsonKey(name: 'customer_name')
  String get customerName;
  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'sales_order_quantity')
  int get salesOrderQuantity;
  @override
  @JsonKey(name: 'sales_order_quantity_delivery')
  int get salesOrderQuantityDelivery;
  @override
  @JsonKey(name: 'unit_id')
  String get unitId;
  @override
  @JsonKey(name: 'product_price')
  int get productPrice;
  @override
  @JsonKey(name: 'value_sales_order')
  int get valueSalesOrder;
  @override
  @JsonKey(name: 'value_realization')
  int get valueRealization;

  /// Create a copy of SalesOrderSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesOrderSummaryImplCopyWith<_$SalesOrderSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
