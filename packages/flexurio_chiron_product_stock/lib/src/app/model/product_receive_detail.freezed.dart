// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_receive_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductReceiveDetail _$ProductReceiveDetailFromJson(Map<String, dynamic> json) {
  return _ProductReceiveDetail.fromJson(json);
}

/// @nodoc
mixin _$ProductReceiveDetail {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updatedById => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_date')
  DateTime get expiredDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty')
  int get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_received', fromJson: ProductReceive.fromJson)
  ProductReceive get productReceive => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Warehouse.fromString)
  Warehouse get warehouse => throw _privateConstructorUsedError;
  @JsonKey(fromJson: MaterialUnit.fromJson)
  MaterialUnit get unit => throw _privateConstructorUsedError;
  @JsonKey(fromJson: ProductReceiveDetailStatus.fromString)
  ProductReceiveDetailStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  Product get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
  ProductionOrder get productionOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_at', fromJson: dateTimeNullable)
  DateTime? get releaseAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_by_id')
  int? get releaseById => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductReceiveDetailCopyWith<ProductReceiveDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReceiveDetailCopyWith<$Res> {
  factory $ProductReceiveDetailCopyWith(ProductReceiveDetail value,
          $Res Function(ProductReceiveDetail) then) =
      _$ProductReceiveDetailCopyWithImpl<$Res, ProductReceiveDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'expired_date') DateTime expiredDate,
      @JsonKey(name: 'qty') int quantity,
      @JsonKey(name: 'product_received', fromJson: ProductReceive.fromJson)
      ProductReceive productReceive,
      @JsonKey(fromJson: Warehouse.fromString) Warehouse warehouse,
      @JsonKey(fromJson: MaterialUnit.fromJson) MaterialUnit unit,
      @JsonKey(fromJson: ProductReceiveDetailStatus.fromString)
      ProductReceiveDetailStatus status,
      @JsonKey(name: 'product', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
      ProductionOrder productionOrder,
      @JsonKey(name: 'release_at', fromJson: dateTimeNullable)
      DateTime? releaseAt,
      @JsonKey(name: 'release_by_id') int? releaseById});

  $ProductReceiveCopyWith<$Res> get productReceive;
  $MaterialUnitCopyWith<$Res> get unit;
  $ProductCopyWith<$Res> get product;
  $ProductionOrderCopyWith<$Res> get productionOrder;
}

/// @nodoc
class _$ProductReceiveDetailCopyWithImpl<$Res,
        $Val extends ProductReceiveDetail>
    implements $ProductReceiveDetailCopyWith<$Res> {
  _$ProductReceiveDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updatedById = null,
    Object? expiredDate = null,
    Object? quantity = null,
    Object? productReceive = null,
    Object? warehouse = null,
    Object? unit = null,
    Object? status = null,
    Object? product = null,
    Object? productionOrder = null,
    Object? releaseAt = freezed,
    Object? releaseById = freezed,
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
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      expiredDate: null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      productReceive: null == productReceive
          ? _value.productReceive
          : productReceive // ignore: cast_nullable_to_non_nullable
              as ProductReceive,
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as Warehouse,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProductReceiveDetailStatus,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      productionOrder: null == productionOrder
          ? _value.productionOrder
          : productionOrder // ignore: cast_nullable_to_non_nullable
              as ProductionOrder,
      releaseAt: freezed == releaseAt
          ? _value.releaseAt
          : releaseAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      releaseById: freezed == releaseById
          ? _value.releaseById
          : releaseById // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductReceiveCopyWith<$Res> get productReceive {
    return $ProductReceiveCopyWith<$Res>(_value.productReceive, (value) {
      return _then(_value.copyWith(productReceive: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get unit {
    return $MaterialUnitCopyWith<$Res>(_value.unit, (value) {
      return _then(_value.copyWith(unit: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductionOrderCopyWith<$Res> get productionOrder {
    return $ProductionOrderCopyWith<$Res>(_value.productionOrder, (value) {
      return _then(_value.copyWith(productionOrder: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductReceiveDetailImplCopyWith<$Res>
    implements $ProductReceiveDetailCopyWith<$Res> {
  factory _$$ProductReceiveDetailImplCopyWith(_$ProductReceiveDetailImpl value,
          $Res Function(_$ProductReceiveDetailImpl) then) =
      __$$ProductReceiveDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'expired_date') DateTime expiredDate,
      @JsonKey(name: 'qty') int quantity,
      @JsonKey(name: 'product_received', fromJson: ProductReceive.fromJson)
      ProductReceive productReceive,
      @JsonKey(fromJson: Warehouse.fromString) Warehouse warehouse,
      @JsonKey(fromJson: MaterialUnit.fromJson) MaterialUnit unit,
      @JsonKey(fromJson: ProductReceiveDetailStatus.fromString)
      ProductReceiveDetailStatus status,
      @JsonKey(name: 'product', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
      ProductionOrder productionOrder,
      @JsonKey(name: 'release_at', fromJson: dateTimeNullable)
      DateTime? releaseAt,
      @JsonKey(name: 'release_by_id') int? releaseById});

  @override
  $ProductReceiveCopyWith<$Res> get productReceive;
  @override
  $MaterialUnitCopyWith<$Res> get unit;
  @override
  $ProductCopyWith<$Res> get product;
  @override
  $ProductionOrderCopyWith<$Res> get productionOrder;
}

/// @nodoc
class __$$ProductReceiveDetailImplCopyWithImpl<$Res>
    extends _$ProductReceiveDetailCopyWithImpl<$Res, _$ProductReceiveDetailImpl>
    implements _$$ProductReceiveDetailImplCopyWith<$Res> {
  __$$ProductReceiveDetailImplCopyWithImpl(_$ProductReceiveDetailImpl _value,
      $Res Function(_$ProductReceiveDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updatedById = null,
    Object? expiredDate = null,
    Object? quantity = null,
    Object? productReceive = null,
    Object? warehouse = null,
    Object? unit = null,
    Object? status = null,
    Object? product = null,
    Object? productionOrder = null,
    Object? releaseAt = freezed,
    Object? releaseById = freezed,
  }) {
    return _then(_$ProductReceiveDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      expiredDate: null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
      productReceive: null == productReceive
          ? _value.productReceive
          : productReceive // ignore: cast_nullable_to_non_nullable
              as ProductReceive,
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as Warehouse,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ProductReceiveDetailStatus,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      productionOrder: null == productionOrder
          ? _value.productionOrder
          : productionOrder // ignore: cast_nullable_to_non_nullable
              as ProductionOrder,
      releaseAt: freezed == releaseAt
          ? _value.releaseAt
          : releaseAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      releaseById: freezed == releaseById
          ? _value.releaseById
          : releaseById // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductReceiveDetailImpl extends _ProductReceiveDetail {
  _$ProductReceiveDetailImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'updated_by_id') required this.updatedById,
      @JsonKey(name: 'expired_date') required this.expiredDate,
      @JsonKey(name: 'qty') required this.quantity,
      @JsonKey(name: 'product_received', fromJson: ProductReceive.fromJson)
      required this.productReceive,
      @JsonKey(fromJson: Warehouse.fromString) required this.warehouse,
      @JsonKey(fromJson: MaterialUnit.fromJson) required this.unit,
      @JsonKey(fromJson: ProductReceiveDetailStatus.fromString)
      required this.status,
      @JsonKey(name: 'product', fromJson: Product.fromJson)
      required this.product,
      @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
      required this.productionOrder,
      @JsonKey(name: 'release_at', fromJson: dateTimeNullable) this.releaseAt,
      @JsonKey(name: 'release_by_id') this.releaseById})
      : super._();

  factory _$ProductReceiveDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductReceiveDetailImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'updated_by_id')
  final int updatedById;
  @override
  @JsonKey(name: 'expired_date')
  final DateTime expiredDate;
  @override
  @JsonKey(name: 'qty')
  final int quantity;
  @override
  @JsonKey(name: 'product_received', fromJson: ProductReceive.fromJson)
  final ProductReceive productReceive;
  @override
  @JsonKey(fromJson: Warehouse.fromString)
  final Warehouse warehouse;
  @override
  @JsonKey(fromJson: MaterialUnit.fromJson)
  final MaterialUnit unit;
  @override
  @JsonKey(fromJson: ProductReceiveDetailStatus.fromString)
  final ProductReceiveDetailStatus status;
  @override
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  final Product product;
  @override
  @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
  final ProductionOrder productionOrder;
  @override
  @JsonKey(name: 'release_at', fromJson: dateTimeNullable)
  final DateTime? releaseAt;
  @override
  @JsonKey(name: 'release_by_id')
  final int? releaseById;

  @override
  String toString() {
    return 'ProductReceiveDetail(id: $id, createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, updatedById: $updatedById, expiredDate: $expiredDate, quantity: $quantity, productReceive: $productReceive, warehouse: $warehouse, unit: $unit, status: $status, product: $product, productionOrder: $productionOrder, releaseAt: $releaseAt, releaseById: $releaseById)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductReceiveDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.expiredDate, expiredDate) ||
                other.expiredDate == expiredDate) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.productReceive, productReceive) ||
                other.productReceive == productReceive) &&
            (identical(other.warehouse, warehouse) ||
                other.warehouse == warehouse) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.productionOrder, productionOrder) ||
                other.productionOrder == productionOrder) &&
            (identical(other.releaseAt, releaseAt) ||
                other.releaseAt == releaseAt) &&
            (identical(other.releaseById, releaseById) ||
                other.releaseById == releaseById));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      createdById,
      updatedAt,
      updatedById,
      expiredDate,
      quantity,
      productReceive,
      warehouse,
      unit,
      status,
      product,
      productionOrder,
      releaseAt,
      releaseById);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductReceiveDetailImplCopyWith<_$ProductReceiveDetailImpl>
      get copyWith =>
          __$$ProductReceiveDetailImplCopyWithImpl<_$ProductReceiveDetailImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductReceiveDetailImplToJson(
      this,
    );
  }
}

abstract class _ProductReceiveDetail extends ProductReceiveDetail {
  factory _ProductReceiveDetail(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
          required final DateTime createdAt,
          @JsonKey(name: 'created_by_id') required final int createdById,
          @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
          required final DateTime updatedAt,
          @JsonKey(name: 'updated_by_id') required final int updatedById,
          @JsonKey(name: 'expired_date') required final DateTime expiredDate,
          @JsonKey(name: 'qty') required final int quantity,
          @JsonKey(name: 'product_received', fromJson: ProductReceive.fromJson)
          required final ProductReceive productReceive,
          @JsonKey(fromJson: Warehouse.fromString)
          required final Warehouse warehouse,
          @JsonKey(fromJson: MaterialUnit.fromJson)
          required final MaterialUnit unit,
          @JsonKey(fromJson: ProductReceiveDetailStatus.fromString)
          required final ProductReceiveDetailStatus status,
          @JsonKey(name: 'product', fromJson: Product.fromJson)
          required final Product product,
          @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
          required final ProductionOrder productionOrder,
          @JsonKey(name: 'release_at', fromJson: dateTimeNullable)
          final DateTime? releaseAt,
          @JsonKey(name: 'release_by_id') final int? releaseById}) =
      _$ProductReceiveDetailImpl;
  _ProductReceiveDetail._() : super._();

  factory _ProductReceiveDetail.fromJson(Map<String, dynamic> json) =
      _$ProductReceiveDetailImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'updated_by_id')
  int get updatedById;
  @override
  @JsonKey(name: 'expired_date')
  DateTime get expiredDate;
  @override
  @JsonKey(name: 'qty')
  int get quantity;
  @override
  @JsonKey(name: 'product_received', fromJson: ProductReceive.fromJson)
  ProductReceive get productReceive;
  @override
  @JsonKey(fromJson: Warehouse.fromString)
  Warehouse get warehouse;
  @override
  @JsonKey(fromJson: MaterialUnit.fromJson)
  MaterialUnit get unit;
  @override
  @JsonKey(fromJson: ProductReceiveDetailStatus.fromString)
  ProductReceiveDetailStatus get status;
  @override
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  Product get product;
  @override
  @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
  ProductionOrder get productionOrder;
  @override
  @JsonKey(name: 'release_at', fromJson: dateTimeNullable)
  DateTime? get releaseAt;
  @override
  @JsonKey(name: 'release_by_id')
  int? get releaseById;
  @override
  @JsonKey(ignore: true)
  _$$ProductReceiveDetailImplCopyWith<_$ProductReceiveDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}
