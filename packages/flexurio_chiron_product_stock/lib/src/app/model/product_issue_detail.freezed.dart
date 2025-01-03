// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_issue_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductIssueDetail _$ProductIssueDetailFromJson(Map<String, dynamic> json) {
  return _ProductIssueDetail.fromJson(json);
}

/// @nodoc
mixin _$ProductIssueDetail {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  int get qty => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtotal')
  int get subTotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_price')
  int get productPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_product_price')
  int get totalProductPrice => throw _privateConstructorUsedError;
  String get warehouse => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
  ProductionOrder get productionOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  Product get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_issued', fromJson: ProductIssue.fromJson)
  ProductIssue get productIssue => throw _privateConstructorUsedError;

  /// Serializes this ProductIssueDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductIssueDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductIssueDetailCopyWith<ProductIssueDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductIssueDetailCopyWith<$Res> {
  factory $ProductIssueDetailCopyWith(
          ProductIssueDetail value, $Res Function(ProductIssueDetail) then) =
      _$ProductIssueDetailCopyWithImpl<$Res, ProductIssueDetail>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      int qty,
      int price,
      @JsonKey(name: 'subtotal') int subTotal,
      @JsonKey(name: 'product_price') int productPrice,
      @JsonKey(name: 'total_product_price') int totalProductPrice,
      String warehouse,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson) MaterialUnit unit,
      @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
      ProductionOrder productionOrder,
      @JsonKey(name: 'product', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'product_issued', fromJson: ProductIssue.fromJson)
      ProductIssue productIssue});

  $MaterialUnitCopyWith<$Res> get unit;
  $ProductionOrderCopyWith<$Res> get productionOrder;
  $ProductCopyWith<$Res> get product;
  $ProductIssueCopyWith<$Res> get productIssue;
}

/// @nodoc
class _$ProductIssueDetailCopyWithImpl<$Res, $Val extends ProductIssueDetail>
    implements $ProductIssueDetailCopyWith<$Res> {
  _$ProductIssueDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductIssueDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? qty = null,
    Object? price = null,
    Object? subTotal = null,
    Object? productPrice = null,
    Object? totalProductPrice = null,
    Object? warehouse = null,
    Object? unit = null,
    Object? productionOrder = null,
    Object? product = null,
    Object? productIssue = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      subTotal: null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as int,
      productPrice: null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as int,
      totalProductPrice: null == totalProductPrice
          ? _value.totalProductPrice
          : totalProductPrice // ignore: cast_nullable_to_non_nullable
              as int,
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      productionOrder: null == productionOrder
          ? _value.productionOrder
          : productionOrder // ignore: cast_nullable_to_non_nullable
              as ProductionOrder,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      productIssue: null == productIssue
          ? _value.productIssue
          : productIssue // ignore: cast_nullable_to_non_nullable
              as ProductIssue,
    ) as $Val);
  }

  /// Create a copy of ProductIssueDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get unit {
    return $MaterialUnitCopyWith<$Res>(_value.unit, (value) {
      return _then(_value.copyWith(unit: value) as $Val);
    });
  }

  /// Create a copy of ProductIssueDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductionOrderCopyWith<$Res> get productionOrder {
    return $ProductionOrderCopyWith<$Res>(_value.productionOrder, (value) {
      return _then(_value.copyWith(productionOrder: value) as $Val);
    });
  }

  /// Create a copy of ProductIssueDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }

  /// Create a copy of ProductIssueDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductIssueCopyWith<$Res> get productIssue {
    return $ProductIssueCopyWith<$Res>(_value.productIssue, (value) {
      return _then(_value.copyWith(productIssue: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductIssueDetailImplCopyWith<$Res>
    implements $ProductIssueDetailCopyWith<$Res> {
  factory _$$ProductIssueDetailImplCopyWith(_$ProductIssueDetailImpl value,
          $Res Function(_$ProductIssueDetailImpl) then) =
      __$$ProductIssueDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      int qty,
      int price,
      @JsonKey(name: 'subtotal') int subTotal,
      @JsonKey(name: 'product_price') int productPrice,
      @JsonKey(name: 'total_product_price') int totalProductPrice,
      String warehouse,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson) MaterialUnit unit,
      @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
      ProductionOrder productionOrder,
      @JsonKey(name: 'product', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'product_issued', fromJson: ProductIssue.fromJson)
      ProductIssue productIssue});

  @override
  $MaterialUnitCopyWith<$Res> get unit;
  @override
  $ProductionOrderCopyWith<$Res> get productionOrder;
  @override
  $ProductCopyWith<$Res> get product;
  @override
  $ProductIssueCopyWith<$Res> get productIssue;
}

/// @nodoc
class __$$ProductIssueDetailImplCopyWithImpl<$Res>
    extends _$ProductIssueDetailCopyWithImpl<$Res, _$ProductIssueDetailImpl>
    implements _$$ProductIssueDetailImplCopyWith<$Res> {
  __$$ProductIssueDetailImplCopyWithImpl(_$ProductIssueDetailImpl _value,
      $Res Function(_$ProductIssueDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductIssueDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? qty = null,
    Object? price = null,
    Object? subTotal = null,
    Object? productPrice = null,
    Object? totalProductPrice = null,
    Object? warehouse = null,
    Object? unit = null,
    Object? productionOrder = null,
    Object? product = null,
    Object? productIssue = null,
  }) {
    return _then(_$ProductIssueDetailImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as int,
      null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      null == subTotal
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as int,
      null == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as int,
      null == totalProductPrice
          ? _value.totalProductPrice
          : totalProductPrice // ignore: cast_nullable_to_non_nullable
              as int,
      null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as String,
      null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      null == productionOrder
          ? _value.productionOrder
          : productionOrder // ignore: cast_nullable_to_non_nullable
              as ProductionOrder,
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      null == productIssue
          ? _value.productIssue
          : productIssue // ignore: cast_nullable_to_non_nullable
              as ProductIssue,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductIssueDetailImpl extends _ProductIssueDetail {
  _$ProductIssueDetailImpl(
      this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) this.updatedAt,
      this.qty,
      this.price,
      @JsonKey(name: 'subtotal') this.subTotal,
      @JsonKey(name: 'product_price') this.productPrice,
      @JsonKey(name: 'total_product_price') this.totalProductPrice,
      this.warehouse,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson) this.unit,
      @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
      this.productionOrder,
      @JsonKey(name: 'product', fromJson: Product.fromJson) this.product,
      @JsonKey(name: 'product_issued', fromJson: ProductIssue.fromJson)
      this.productIssue)
      : super._();

  factory _$ProductIssueDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductIssueDetailImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  final int qty;
  @override
  final int price;
  @override
  @JsonKey(name: 'subtotal')
  final int subTotal;
  @override
  @JsonKey(name: 'product_price')
  final int productPrice;
  @override
  @JsonKey(name: 'total_product_price')
  final int totalProductPrice;
  @override
  final String warehouse;
  @override
  @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
  final MaterialUnit unit;
  @override
  @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
  final ProductionOrder productionOrder;
  @override
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  final Product product;
  @override
  @JsonKey(name: 'product_issued', fromJson: ProductIssue.fromJson)
  final ProductIssue productIssue;

  @override
  String toString() {
    return 'ProductIssueDetail(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, qty: $qty, price: $price, subTotal: $subTotal, productPrice: $productPrice, totalProductPrice: $totalProductPrice, warehouse: $warehouse, unit: $unit, productionOrder: $productionOrder, product: $product, productIssue: $productIssue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductIssueDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.subTotal, subTotal) ||
                other.subTotal == subTotal) &&
            (identical(other.productPrice, productPrice) ||
                other.productPrice == productPrice) &&
            (identical(other.totalProductPrice, totalProductPrice) ||
                other.totalProductPrice == totalProductPrice) &&
            (identical(other.warehouse, warehouse) ||
                other.warehouse == warehouse) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.productionOrder, productionOrder) ||
                other.productionOrder == productionOrder) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.productIssue, productIssue) ||
                other.productIssue == productIssue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updatedAt,
      qty,
      price,
      subTotal,
      productPrice,
      totalProductPrice,
      warehouse,
      unit,
      productionOrder,
      product,
      productIssue);

  /// Create a copy of ProductIssueDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductIssueDetailImplCopyWith<_$ProductIssueDetailImpl> get copyWith =>
      __$$ProductIssueDetailImplCopyWithImpl<_$ProductIssueDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductIssueDetailImplToJson(
      this,
    );
  }
}

abstract class _ProductIssueDetail extends ProductIssueDetail {
  factory _ProductIssueDetail(
      final int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      final DateTime updatedAt,
      final int qty,
      final int price,
      @JsonKey(name: 'subtotal') final int subTotal,
      @JsonKey(name: 'product_price') final int productPrice,
      @JsonKey(name: 'total_product_price') final int totalProductPrice,
      final String warehouse,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
      final MaterialUnit unit,
      @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
      final ProductionOrder productionOrder,
      @JsonKey(name: 'product', fromJson: Product.fromJson)
      final Product product,
      @JsonKey(name: 'product_issued', fromJson: ProductIssue.fromJson)
      final ProductIssue productIssue) = _$ProductIssueDetailImpl;
  _ProductIssueDetail._() : super._();

  factory _ProductIssueDetail.fromJson(Map<String, dynamic> json) =
      _$ProductIssueDetailImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  int get qty;
  @override
  int get price;
  @override
  @JsonKey(name: 'subtotal')
  int get subTotal;
  @override
  @JsonKey(name: 'product_price')
  int get productPrice;
  @override
  @JsonKey(name: 'total_product_price')
  int get totalProductPrice;
  @override
  String get warehouse;
  @override
  @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unit;
  @override
  @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
  ProductionOrder get productionOrder;
  @override
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  Product get product;
  @override
  @JsonKey(name: 'product_issued', fromJson: ProductIssue.fromJson)
  ProductIssue get productIssue;

  /// Create a copy of ProductIssueDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductIssueDetailImplCopyWith<_$ProductIssueDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
