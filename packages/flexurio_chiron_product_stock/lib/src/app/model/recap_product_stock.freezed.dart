// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recap_product_stock.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecapProductStock _$RecapProductStockFromJson(Map<String, dynamic> json) {
  return _RecapProductStock.fromJson(json);
}

/// @nodoc
mixin _$RecapProductStock {
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'period', fromJson: periodFromJson)
  DateTime get period => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_quarantine')
  int get qtyQuarantine => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_release')
  int get qtyRelease => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_reject')
  int get qtyReject => throw _privateConstructorUsedError;
  @JsonKey(name: 'warehouse', fromJson: RecapProductStockWarehouse.fromString)
  RecapProductStockWarehouse get warehouse =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'product_group', fromJson: ProductGroup.fromJson)
  ProductGroup get productGroup => throw _privateConstructorUsedError;
  Product get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
  ProductionOrder get productionOrder => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unit => throw _privateConstructorUsedError;

  /// Serializes this RecapProductStock to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecapProductStock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecapProductStockCopyWith<RecapProductStock> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecapProductStockCopyWith<$Res> {
  factory $RecapProductStockCopyWith(
          RecapProductStock value, $Res Function(RecapProductStock) then) =
      _$RecapProductStockCopyWithImpl<$Res, RecapProductStock>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'period', fromJson: periodFromJson) DateTime period,
      @JsonKey(name: 'qty_quarantine') int qtyQuarantine,
      @JsonKey(name: 'qty_release') int qtyRelease,
      @JsonKey(name: 'qty_reject') int qtyReject,
      @JsonKey(
          name: 'warehouse', fromJson: RecapProductStockWarehouse.fromString)
      RecapProductStockWarehouse warehouse,
      @JsonKey(name: 'product_group', fromJson: ProductGroup.fromJson)
      ProductGroup productGroup,
      Product product,
      @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
      ProductionOrder productionOrder,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
      MaterialUnit unit});

  $ProductGroupCopyWith<$Res> get productGroup;
  $ProductCopyWith<$Res> get product;
  $ProductionOrderCopyWith<$Res> get productionOrder;
  $MaterialUnitCopyWith<$Res> get unit;
}

/// @nodoc
class _$RecapProductStockCopyWithImpl<$Res, $Val extends RecapProductStock>
    implements $RecapProductStockCopyWith<$Res> {
  _$RecapProductStockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecapProductStock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? period = null,
    Object? qtyQuarantine = null,
    Object? qtyRelease = null,
    Object? qtyReject = null,
    Object? warehouse = null,
    Object? productGroup = null,
    Object? product = null,
    Object? productionOrder = null,
    Object? unit = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as DateTime,
      qtyQuarantine: null == qtyQuarantine
          ? _value.qtyQuarantine
          : qtyQuarantine // ignore: cast_nullable_to_non_nullable
              as int,
      qtyRelease: null == qtyRelease
          ? _value.qtyRelease
          : qtyRelease // ignore: cast_nullable_to_non_nullable
              as int,
      qtyReject: null == qtyReject
          ? _value.qtyReject
          : qtyReject // ignore: cast_nullable_to_non_nullable
              as int,
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as RecapProductStockWarehouse,
      productGroup: null == productGroup
          ? _value.productGroup
          : productGroup // ignore: cast_nullable_to_non_nullable
              as ProductGroup,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      productionOrder: null == productionOrder
          ? _value.productionOrder
          : productionOrder // ignore: cast_nullable_to_non_nullable
              as ProductionOrder,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
    ) as $Val);
  }

  /// Create a copy of RecapProductStock
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductGroupCopyWith<$Res> get productGroup {
    return $ProductGroupCopyWith<$Res>(_value.productGroup, (value) {
      return _then(_value.copyWith(productGroup: value) as $Val);
    });
  }

  /// Create a copy of RecapProductStock
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }

  /// Create a copy of RecapProductStock
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductionOrderCopyWith<$Res> get productionOrder {
    return $ProductionOrderCopyWith<$Res>(_value.productionOrder, (value) {
      return _then(_value.copyWith(productionOrder: value) as $Val);
    });
  }

  /// Create a copy of RecapProductStock
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get unit {
    return $MaterialUnitCopyWith<$Res>(_value.unit, (value) {
      return _then(_value.copyWith(unit: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecapProductStockImplCopyWith<$Res>
    implements $RecapProductStockCopyWith<$Res> {
  factory _$$RecapProductStockImplCopyWith(_$RecapProductStockImpl value,
          $Res Function(_$RecapProductStockImpl) then) =
      __$$RecapProductStockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'period', fromJson: periodFromJson) DateTime period,
      @JsonKey(name: 'qty_quarantine') int qtyQuarantine,
      @JsonKey(name: 'qty_release') int qtyRelease,
      @JsonKey(name: 'qty_reject') int qtyReject,
      @JsonKey(
          name: 'warehouse', fromJson: RecapProductStockWarehouse.fromString)
      RecapProductStockWarehouse warehouse,
      @JsonKey(name: 'product_group', fromJson: ProductGroup.fromJson)
      ProductGroup productGroup,
      Product product,
      @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
      ProductionOrder productionOrder,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
      MaterialUnit unit});

  @override
  $ProductGroupCopyWith<$Res> get productGroup;
  @override
  $ProductCopyWith<$Res> get product;
  @override
  $ProductionOrderCopyWith<$Res> get productionOrder;
  @override
  $MaterialUnitCopyWith<$Res> get unit;
}

/// @nodoc
class __$$RecapProductStockImplCopyWithImpl<$Res>
    extends _$RecapProductStockCopyWithImpl<$Res, _$RecapProductStockImpl>
    implements _$$RecapProductStockImplCopyWith<$Res> {
  __$$RecapProductStockImplCopyWithImpl(_$RecapProductStockImpl _value,
      $Res Function(_$RecapProductStockImpl) _then)
      : super(_value, _then);

  /// Create a copy of RecapProductStock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? period = null,
    Object? qtyQuarantine = null,
    Object? qtyRelease = null,
    Object? qtyReject = null,
    Object? warehouse = null,
    Object? productGroup = null,
    Object? product = null,
    Object? productionOrder = null,
    Object? unit = null,
  }) {
    return _then(_$RecapProductStockImpl(
      null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == qtyQuarantine
          ? _value.qtyQuarantine
          : qtyQuarantine // ignore: cast_nullable_to_non_nullable
              as int,
      null == qtyRelease
          ? _value.qtyRelease
          : qtyRelease // ignore: cast_nullable_to_non_nullable
              as int,
      null == qtyReject
          ? _value.qtyReject
          : qtyReject // ignore: cast_nullable_to_non_nullable
              as int,
      null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as RecapProductStockWarehouse,
      null == productGroup
          ? _value.productGroup
          : productGroup // ignore: cast_nullable_to_non_nullable
              as ProductGroup,
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      null == productionOrder
          ? _value.productionOrder
          : productionOrder // ignore: cast_nullable_to_non_nullable
              as ProductionOrder,
      null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecapProductStockImpl extends _RecapProductStock {
  _$RecapProductStockImpl(
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) this.updatedAt,
      @JsonKey(name: 'period', fromJson: periodFromJson) this.period,
      @JsonKey(name: 'qty_quarantine') this.qtyQuarantine,
      @JsonKey(name: 'qty_release') this.qtyRelease,
      @JsonKey(name: 'qty_reject') this.qtyReject,
      @JsonKey(
          name: 'warehouse', fromJson: RecapProductStockWarehouse.fromString)
      this.warehouse,
      @JsonKey(name: 'product_group', fromJson: ProductGroup.fromJson)
      this.productGroup,
      this.product,
      @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
      this.productionOrder,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson) this.unit)
      : super._();

  factory _$RecapProductStockImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecapProductStockImplFromJson(json);

  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'period', fromJson: periodFromJson)
  final DateTime period;
  @override
  @JsonKey(name: 'qty_quarantine')
  final int qtyQuarantine;
  @override
  @JsonKey(name: 'qty_release')
  final int qtyRelease;
  @override
  @JsonKey(name: 'qty_reject')
  final int qtyReject;
  @override
  @JsonKey(name: 'warehouse', fromJson: RecapProductStockWarehouse.fromString)
  final RecapProductStockWarehouse warehouse;
  @override
  @JsonKey(name: 'product_group', fromJson: ProductGroup.fromJson)
  final ProductGroup productGroup;
  @override
  final Product product;
  @override
  @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
  final ProductionOrder productionOrder;
  @override
  @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
  final MaterialUnit unit;

  @override
  String toString() {
    return 'RecapProductStock(createdAt: $createdAt, updatedAt: $updatedAt, period: $period, qtyQuarantine: $qtyQuarantine, qtyRelease: $qtyRelease, qtyReject: $qtyReject, warehouse: $warehouse, productGroup: $productGroup, product: $product, productionOrder: $productionOrder, unit: $unit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecapProductStockImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.qtyQuarantine, qtyQuarantine) ||
                other.qtyQuarantine == qtyQuarantine) &&
            (identical(other.qtyRelease, qtyRelease) ||
                other.qtyRelease == qtyRelease) &&
            (identical(other.qtyReject, qtyReject) ||
                other.qtyReject == qtyReject) &&
            (identical(other.warehouse, warehouse) ||
                other.warehouse == warehouse) &&
            (identical(other.productGroup, productGroup) ||
                other.productGroup == productGroup) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.productionOrder, productionOrder) ||
                other.productionOrder == productionOrder) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      updatedAt,
      period,
      qtyQuarantine,
      qtyRelease,
      qtyReject,
      warehouse,
      productGroup,
      product,
      productionOrder,
      unit);

  /// Create a copy of RecapProductStock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecapProductStockImplCopyWith<_$RecapProductStockImpl> get copyWith =>
      __$$RecapProductStockImplCopyWithImpl<_$RecapProductStockImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecapProductStockImplToJson(
      this,
    );
  }
}

abstract class _RecapProductStock extends RecapProductStock {
  factory _RecapProductStock(
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      final DateTime updatedAt,
      @JsonKey(name: 'period', fromJson: periodFromJson) final DateTime period,
      @JsonKey(name: 'qty_quarantine') final int qtyQuarantine,
      @JsonKey(name: 'qty_release') final int qtyRelease,
      @JsonKey(name: 'qty_reject') final int qtyReject,
      @JsonKey(
          name: 'warehouse', fromJson: RecapProductStockWarehouse.fromString)
      final RecapProductStockWarehouse warehouse,
      @JsonKey(name: 'product_group', fromJson: ProductGroup.fromJson)
      final ProductGroup productGroup,
      final Product product,
      @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
      final ProductionOrder productionOrder,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
      final MaterialUnit unit) = _$RecapProductStockImpl;
  _RecapProductStock._() : super._();

  factory _RecapProductStock.fromJson(Map<String, dynamic> json) =
      _$RecapProductStockImpl.fromJson;

  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'period', fromJson: periodFromJson)
  DateTime get period;
  @override
  @JsonKey(name: 'qty_quarantine')
  int get qtyQuarantine;
  @override
  @JsonKey(name: 'qty_release')
  int get qtyRelease;
  @override
  @JsonKey(name: 'qty_reject')
  int get qtyReject;
  @override
  @JsonKey(name: 'warehouse', fromJson: RecapProductStockWarehouse.fromString)
  RecapProductStockWarehouse get warehouse;
  @override
  @JsonKey(name: 'product_group', fromJson: ProductGroup.fromJson)
  ProductGroup get productGroup;
  @override
  Product get product;
  @override
  @JsonKey(name: 'batch_no', fromJson: ProductionOrder.fromJson)
  ProductionOrder get productionOrder;
  @override
  @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unit;

  /// Create a copy of RecapProductStock
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecapProductStockImplCopyWith<_$RecapProductStockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
