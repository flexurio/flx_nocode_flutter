// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_order_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SalesOrderDetail _$SalesOrderDetailFromJson(Map<String, dynamic> json) {
  return _SalesOrderDetail.fromJson(json);
}

/// @nodoc
mixin _$SalesOrderDetail {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty')
  int get quantity => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  double? get subtotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_value')
  double get discountValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_percent')
  double get discountPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_delivery')
  int get qtyDelivery => throw _privateConstructorUsedError;
  String get warehouse => throw _privateConstructorUsedError;
  @JsonKey(name: 'sales_order_id')
  String get salesOrderId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no_id')
  String get batchNoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_id')
  String get unitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
  ProductionOrder get batchNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_history', defaultValue: '')
  String? get isHistory => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Product.fromJson)
  Product? get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_after_discount', defaultValue: 0)
  double get priceAfterDiscount => throw _privateConstructorUsedError;

  /// Serializes this SalesOrderDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SalesOrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesOrderDetailCopyWith<SalesOrderDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrderDetailCopyWith<$Res> {
  factory $SalesOrderDetailCopyWith(
          SalesOrderDetail value, $Res Function(SalesOrderDetail) then) =
      _$SalesOrderDetailCopyWithImpl<$Res, SalesOrderDetail>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'qty') int quantity,
      double? price,
      double? subtotal,
      @JsonKey(name: 'discount_value') double discountValue,
      @JsonKey(name: 'discount_percent') double discountPercent,
      @JsonKey(name: 'qty_delivery') int qtyDelivery,
      String warehouse,
      @JsonKey(name: 'sales_order_id') String salesOrderId,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'batch_no_id') String batchNoId,
      @JsonKey(name: 'unit_id') String unitId,
      @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
      ProductionOrder batchNo,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson) MaterialUnit unit,
      @JsonKey(name: 'is_history', defaultValue: '') String? isHistory,
      @JsonKey(fromJson: Product.fromJson) Product? product,
      @JsonKey(name: 'price_after_discount', defaultValue: 0)
      double priceAfterDiscount});

  $ProductionOrderCopyWith<$Res> get batchNo;
  $MaterialUnitCopyWith<$Res> get unit;
  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class _$SalesOrderDetailCopyWithImpl<$Res, $Val extends SalesOrderDetail>
    implements $SalesOrderDetailCopyWith<$Res> {
  _$SalesOrderDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesOrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? price = freezed,
    Object? subtotal = freezed,
    Object? discountValue = null,
    Object? discountPercent = null,
    Object? qtyDelivery = null,
    Object? warehouse = null,
    Object? salesOrderId = null,
    Object? productId = null,
    Object? batchNoId = null,
    Object? unitId = null,
    Object? batchNo = null,
    Object? unit = null,
    Object? isHistory = freezed,
    Object? product = freezed,
    Object? priceAfterDiscount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      subtotal: freezed == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      discountPercent: null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double,
      qtyDelivery: null == qtyDelivery
          ? _value.qtyDelivery
          : qtyDelivery // ignore: cast_nullable_to_non_nullable
              as int,
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrderId: null == salesOrderId
          ? _value.salesOrderId
          : salesOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      batchNoId: null == batchNoId
          ? _value.batchNoId
          : batchNoId // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as ProductionOrder,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      isHistory: freezed == isHistory
          ? _value.isHistory
          : isHistory // ignore: cast_nullable_to_non_nullable
              as String?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      priceAfterDiscount: null == priceAfterDiscount
          ? _value.priceAfterDiscount
          : priceAfterDiscount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }

  /// Create a copy of SalesOrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductionOrderCopyWith<$Res> get batchNo {
    return $ProductionOrderCopyWith<$Res>(_value.batchNo, (value) {
      return _then(_value.copyWith(batchNo: value) as $Val);
    });
  }

  /// Create a copy of SalesOrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get unit {
    return $MaterialUnitCopyWith<$Res>(_value.unit, (value) {
      return _then(_value.copyWith(unit: value) as $Val);
    });
  }

  /// Create a copy of SalesOrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SalesOrderDetailImplCopyWith<$Res>
    implements $SalesOrderDetailCopyWith<$Res> {
  factory _$$SalesOrderDetailImplCopyWith(_$SalesOrderDetailImpl value,
          $Res Function(_$SalesOrderDetailImpl) then) =
      __$$SalesOrderDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'qty') int quantity,
      double? price,
      double? subtotal,
      @JsonKey(name: 'discount_value') double discountValue,
      @JsonKey(name: 'discount_percent') double discountPercent,
      @JsonKey(name: 'qty_delivery') int qtyDelivery,
      String warehouse,
      @JsonKey(name: 'sales_order_id') String salesOrderId,
      @JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'batch_no_id') String batchNoId,
      @JsonKey(name: 'unit_id') String unitId,
      @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
      ProductionOrder batchNo,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson) MaterialUnit unit,
      @JsonKey(name: 'is_history', defaultValue: '') String? isHistory,
      @JsonKey(fromJson: Product.fromJson) Product? product,
      @JsonKey(name: 'price_after_discount', defaultValue: 0)
      double priceAfterDiscount});

  @override
  $ProductionOrderCopyWith<$Res> get batchNo;
  @override
  $MaterialUnitCopyWith<$Res> get unit;
  @override
  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class __$$SalesOrderDetailImplCopyWithImpl<$Res>
    extends _$SalesOrderDetailCopyWithImpl<$Res, _$SalesOrderDetailImpl>
    implements _$$SalesOrderDetailImplCopyWith<$Res> {
  __$$SalesOrderDetailImplCopyWithImpl(_$SalesOrderDetailImpl _value,
      $Res Function(_$SalesOrderDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? quantity = null,
    Object? price = freezed,
    Object? subtotal = freezed,
    Object? discountValue = null,
    Object? discountPercent = null,
    Object? qtyDelivery = null,
    Object? warehouse = null,
    Object? salesOrderId = null,
    Object? productId = null,
    Object? batchNoId = null,
    Object? unitId = null,
    Object? batchNo = null,
    Object? unit = null,
    Object? isHistory = freezed,
    Object? product = freezed,
    Object? priceAfterDiscount = null,
  }) {
    return _then(_$SalesOrderDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      subtotal: freezed == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      discountPercent: null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double,
      qtyDelivery: null == qtyDelivery
          ? _value.qtyDelivery
          : qtyDelivery // ignore: cast_nullable_to_non_nullable
              as int,
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as String,
      salesOrderId: null == salesOrderId
          ? _value.salesOrderId
          : salesOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      batchNoId: null == batchNoId
          ? _value.batchNoId
          : batchNoId // ignore: cast_nullable_to_non_nullable
              as String,
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as ProductionOrder,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      isHistory: freezed == isHistory
          ? _value.isHistory
          : isHistory // ignore: cast_nullable_to_non_nullable
              as String?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      priceAfterDiscount: null == priceAfterDiscount
          ? _value.priceAfterDiscount
          : priceAfterDiscount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SalesOrderDetailImpl extends _SalesOrderDetail {
  const _$SalesOrderDetailImpl(
      {required this.id,
      @JsonKey(name: 'qty') required this.quantity,
      required this.price,
      required this.subtotal,
      @JsonKey(name: 'discount_value') required this.discountValue,
      @JsonKey(name: 'discount_percent') required this.discountPercent,
      @JsonKey(name: 'qty_delivery') required this.qtyDelivery,
      required this.warehouse,
      @JsonKey(name: 'sales_order_id') required this.salesOrderId,
      @JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'batch_no_id') required this.batchNoId,
      @JsonKey(name: 'unit_id') required this.unitId,
      @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
      required this.batchNo,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
      required this.unit,
      @JsonKey(name: 'is_history', defaultValue: '') this.isHistory,
      @JsonKey(fromJson: Product.fromJson) this.product,
      @JsonKey(name: 'price_after_discount', defaultValue: 0)
      required this.priceAfterDiscount})
      : super._();

  factory _$SalesOrderDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$SalesOrderDetailImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'qty')
  final int quantity;
  @override
  final double? price;
  @override
  final double? subtotal;
  @override
  @JsonKey(name: 'discount_value')
  final double discountValue;
  @override
  @JsonKey(name: 'discount_percent')
  final double discountPercent;
  @override
  @JsonKey(name: 'qty_delivery')
  final int qtyDelivery;
  @override
  final String warehouse;
  @override
  @JsonKey(name: 'sales_order_id')
  final String salesOrderId;
  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'batch_no_id')
  final String batchNoId;
  @override
  @JsonKey(name: 'unit_id')
  final String unitId;
  @override
  @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
  final ProductionOrder batchNo;
  @override
  @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
  final MaterialUnit unit;
  @override
  @JsonKey(name: 'is_history', defaultValue: '')
  final String? isHistory;
  @override
  @JsonKey(fromJson: Product.fromJson)
  final Product? product;
  @override
  @JsonKey(name: 'price_after_discount', defaultValue: 0)
  final double priceAfterDiscount;

  @override
  String toString() {
    return 'SalesOrderDetail(id: $id, quantity: $quantity, price: $price, subtotal: $subtotal, discountValue: $discountValue, discountPercent: $discountPercent, qtyDelivery: $qtyDelivery, warehouse: $warehouse, salesOrderId: $salesOrderId, productId: $productId, batchNoId: $batchNoId, unitId: $unitId, batchNo: $batchNo, unit: $unit, isHistory: $isHistory, product: $product, priceAfterDiscount: $priceAfterDiscount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SalesOrderDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.discountPercent, discountPercent) ||
                other.discountPercent == discountPercent) &&
            (identical(other.qtyDelivery, qtyDelivery) ||
                other.qtyDelivery == qtyDelivery) &&
            (identical(other.warehouse, warehouse) ||
                other.warehouse == warehouse) &&
            (identical(other.salesOrderId, salesOrderId) ||
                other.salesOrderId == salesOrderId) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.batchNoId, batchNoId) ||
                other.batchNoId == batchNoId) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.batchNo, batchNo) || other.batchNo == batchNo) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.isHistory, isHistory) ||
                other.isHistory == isHistory) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.priceAfterDiscount, priceAfterDiscount) ||
                other.priceAfterDiscount == priceAfterDiscount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      quantity,
      price,
      subtotal,
      discountValue,
      discountPercent,
      qtyDelivery,
      warehouse,
      salesOrderId,
      productId,
      batchNoId,
      unitId,
      batchNo,
      unit,
      isHistory,
      product,
      priceAfterDiscount);

  /// Create a copy of SalesOrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SalesOrderDetailImplCopyWith<_$SalesOrderDetailImpl> get copyWith =>
      __$$SalesOrderDetailImplCopyWithImpl<_$SalesOrderDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SalesOrderDetailImplToJson(
      this,
    );
  }
}

abstract class _SalesOrderDetail extends SalesOrderDetail {
  const factory _SalesOrderDetail(
      {required final int id,
      @JsonKey(name: 'qty') required final int quantity,
      required final double? price,
      required final double? subtotal,
      @JsonKey(name: 'discount_value') required final double discountValue,
      @JsonKey(name: 'discount_percent') required final double discountPercent,
      @JsonKey(name: 'qty_delivery') required final int qtyDelivery,
      required final String warehouse,
      @JsonKey(name: 'sales_order_id') required final String salesOrderId,
      @JsonKey(name: 'product_id') required final String productId,
      @JsonKey(name: 'batch_no_id') required final String batchNoId,
      @JsonKey(name: 'unit_id') required final String unitId,
      @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
      required final ProductionOrder batchNo,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
      required final MaterialUnit unit,
      @JsonKey(name: 'is_history', defaultValue: '') final String? isHistory,
      @JsonKey(fromJson: Product.fromJson) final Product? product,
      @JsonKey(name: 'price_after_discount', defaultValue: 0)
      required final double priceAfterDiscount}) = _$SalesOrderDetailImpl;
  const _SalesOrderDetail._() : super._();

  factory _SalesOrderDetail.fromJson(Map<String, dynamic> json) =
      _$SalesOrderDetailImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'qty')
  int get quantity;
  @override
  double? get price;
  @override
  double? get subtotal;
  @override
  @JsonKey(name: 'discount_value')
  double get discountValue;
  @override
  @JsonKey(name: 'discount_percent')
  double get discountPercent;
  @override
  @JsonKey(name: 'qty_delivery')
  int get qtyDelivery;
  @override
  String get warehouse;
  @override
  @JsonKey(name: 'sales_order_id')
  String get salesOrderId;
  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'batch_no_id')
  String get batchNoId;
  @override
  @JsonKey(name: 'unit_id')
  String get unitId;
  @override
  @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
  ProductionOrder get batchNo;
  @override
  @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unit;
  @override
  @JsonKey(name: 'is_history', defaultValue: '')
  String? get isHistory;
  @override
  @JsonKey(fromJson: Product.fromJson)
  Product? get product;
  @override
  @JsonKey(name: 'price_after_discount', defaultValue: 0)
  double get priceAfterDiscount;

  /// Create a copy of SalesOrderDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SalesOrderDetailImplCopyWith<_$SalesOrderDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
