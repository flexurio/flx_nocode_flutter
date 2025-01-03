// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_stock.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductStock _$ProductStockFromJson(Map<String, dynamic> json) {
  return _ProductStock.fromJson(json);
}

/// @nodoc
mixin _$ProductStock {
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updateById => throw _privateConstructorUsedError;
  String get period => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_in')
  int get qtyIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_out')
  int get qtyOut => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_out_marketing')
  int get qtyOutMarketing => throw _privateConstructorUsedError;
  String? get warehouse => throw _privateConstructorUsedError;
  @JsonKey(name: 'beginning_balance')
  int get beginningBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'ending_balance')
  int get endingBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'ending_balance_marketing')
  int get endingBalanceMarketing => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  DateTime get expiredDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_group', fromJson: ProductGroup.fromJson)
  ProductGroup get productGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no')
  Batch get batch => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Product.fromJson)
  Product get product => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductStockCopyWith<ProductStock> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStockCopyWith<$Res> {
  factory $ProductStockCopyWith(
          ProductStock value, $Res Function(ProductStock) then) =
      _$ProductStockCopyWithImpl<$Res, ProductStock>;
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      String period,
      @JsonKey(name: 'qty_in') int qtyIn,
      @JsonKey(name: 'qty_out') int qtyOut,
      @JsonKey(name: 'qty_out_marketing') int qtyOutMarketing,
      String? warehouse,
      @JsonKey(name: 'beginning_balance') int beginningBalance,
      @JsonKey(name: 'ending_balance') int endingBalance,
      @JsonKey(name: 'ending_balance_marketing') int endingBalanceMarketing,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      DateTime expiredDate,
      @JsonKey(name: 'product_group', fromJson: ProductGroup.fromJson)
      ProductGroup productGroup,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson) MaterialUnit unit,
      @JsonKey(name: 'batch_no') Batch batch,
      @JsonKey(fromJson: Product.fromJson) Product product});

  $ProductGroupCopyWith<$Res> get productGroup;
  $MaterialUnitCopyWith<$Res> get unit;
  $BatchCopyWith<$Res> get batch;
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$ProductStockCopyWithImpl<$Res, $Val extends ProductStock>
    implements $ProductStockCopyWith<$Res> {
  _$ProductStockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
    Object? period = null,
    Object? qtyIn = null,
    Object? qtyOut = null,
    Object? qtyOutMarketing = null,
    Object? warehouse = freezed,
    Object? beginningBalance = null,
    Object? endingBalance = null,
    Object? endingBalanceMarketing = null,
    Object? expiredDate = null,
    Object? productGroup = null,
    Object? unit = null,
    Object? batch = null,
    Object? product = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateById: null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      qtyIn: null == qtyIn
          ? _value.qtyIn
          : qtyIn // ignore: cast_nullable_to_non_nullable
              as int,
      qtyOut: null == qtyOut
          ? _value.qtyOut
          : qtyOut // ignore: cast_nullable_to_non_nullable
              as int,
      qtyOutMarketing: null == qtyOutMarketing
          ? _value.qtyOutMarketing
          : qtyOutMarketing // ignore: cast_nullable_to_non_nullable
              as int,
      warehouse: freezed == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as String?,
      beginningBalance: null == beginningBalance
          ? _value.beginningBalance
          : beginningBalance // ignore: cast_nullable_to_non_nullable
              as int,
      endingBalance: null == endingBalance
          ? _value.endingBalance
          : endingBalance // ignore: cast_nullable_to_non_nullable
              as int,
      endingBalanceMarketing: null == endingBalanceMarketing
          ? _value.endingBalanceMarketing
          : endingBalanceMarketing // ignore: cast_nullable_to_non_nullable
              as int,
      expiredDate: null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      productGroup: null == productGroup
          ? _value.productGroup
          : productGroup // ignore: cast_nullable_to_non_nullable
              as ProductGroup,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as Batch,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductGroupCopyWith<$Res> get productGroup {
    return $ProductGroupCopyWith<$Res>(_value.productGroup, (value) {
      return _then(_value.copyWith(productGroup: value) as $Val);
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
  $BatchCopyWith<$Res> get batch {
    return $BatchCopyWith<$Res>(_value.batch, (value) {
      return _then(_value.copyWith(batch: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductStockImplCopyWith<$Res>
    implements $ProductStockCopyWith<$Res> {
  factory _$$ProductStockImplCopyWith(
          _$ProductStockImpl value, $Res Function(_$ProductStockImpl) then) =
      __$$ProductStockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      String period,
      @JsonKey(name: 'qty_in') int qtyIn,
      @JsonKey(name: 'qty_out') int qtyOut,
      @JsonKey(name: 'qty_out_marketing') int qtyOutMarketing,
      String? warehouse,
      @JsonKey(name: 'beginning_balance') int beginningBalance,
      @JsonKey(name: 'ending_balance') int endingBalance,
      @JsonKey(name: 'ending_balance_marketing') int endingBalanceMarketing,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      DateTime expiredDate,
      @JsonKey(name: 'product_group', fromJson: ProductGroup.fromJson)
      ProductGroup productGroup,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson) MaterialUnit unit,
      @JsonKey(name: 'batch_no') Batch batch,
      @JsonKey(fromJson: Product.fromJson) Product product});

  @override
  $ProductGroupCopyWith<$Res> get productGroup;
  @override
  $MaterialUnitCopyWith<$Res> get unit;
  @override
  $BatchCopyWith<$Res> get batch;
  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$ProductStockImplCopyWithImpl<$Res>
    extends _$ProductStockCopyWithImpl<$Res, _$ProductStockImpl>
    implements _$$ProductStockImplCopyWith<$Res> {
  __$$ProductStockImplCopyWithImpl(
      _$ProductStockImpl _value, $Res Function(_$ProductStockImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
    Object? period = null,
    Object? qtyIn = null,
    Object? qtyOut = null,
    Object? qtyOutMarketing = null,
    Object? warehouse = freezed,
    Object? beginningBalance = null,
    Object? endingBalance = null,
    Object? endingBalanceMarketing = null,
    Object? expiredDate = null,
    Object? productGroup = null,
    Object? unit = null,
    Object? batch = null,
    Object? product = null,
  }) {
    return _then(_$ProductStockImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateById: null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      qtyIn: null == qtyIn
          ? _value.qtyIn
          : qtyIn // ignore: cast_nullable_to_non_nullable
              as int,
      qtyOut: null == qtyOut
          ? _value.qtyOut
          : qtyOut // ignore: cast_nullable_to_non_nullable
              as int,
      qtyOutMarketing: null == qtyOutMarketing
          ? _value.qtyOutMarketing
          : qtyOutMarketing // ignore: cast_nullable_to_non_nullable
              as int,
      warehouse: freezed == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as String?,
      beginningBalance: null == beginningBalance
          ? _value.beginningBalance
          : beginningBalance // ignore: cast_nullable_to_non_nullable
              as int,
      endingBalance: null == endingBalance
          ? _value.endingBalance
          : endingBalance // ignore: cast_nullable_to_non_nullable
              as int,
      endingBalanceMarketing: null == endingBalanceMarketing
          ? _value.endingBalanceMarketing
          : endingBalanceMarketing // ignore: cast_nullable_to_non_nullable
              as int,
      expiredDate: null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      productGroup: null == productGroup
          ? _value.productGroup
          : productGroup // ignore: cast_nullable_to_non_nullable
              as ProductGroup,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      batch: null == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as Batch,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductStockImpl extends _ProductStock {
  const _$ProductStockImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'updated_by_id') required this.updateById,
      required this.period,
      @JsonKey(name: 'qty_in') required this.qtyIn,
      @JsonKey(name: 'qty_out') required this.qtyOut,
      @JsonKey(name: 'qty_out_marketing') required this.qtyOutMarketing,
      required this.warehouse,
      @JsonKey(name: 'beginning_balance') required this.beginningBalance,
      @JsonKey(name: 'ending_balance') required this.endingBalance,
      @JsonKey(name: 'ending_balance_marketing')
      required this.endingBalanceMarketing,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      required this.expiredDate,
      @JsonKey(name: 'product_group', fromJson: ProductGroup.fromJson)
      required this.productGroup,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
      required this.unit,
      @JsonKey(name: 'batch_no') required this.batch,
      @JsonKey(fromJson: Product.fromJson) required this.product})
      : super._();

  factory _$ProductStockImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductStockImplFromJson(json);

  @override
  final String? id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createAt;
  @override
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'updated_by_id')
  final int updateById;
  @override
  final String period;
  @override
  @JsonKey(name: 'qty_in')
  final int qtyIn;
  @override
  @JsonKey(name: 'qty_out')
  final int qtyOut;
  @override
  @JsonKey(name: 'qty_out_marketing')
  final int qtyOutMarketing;
  @override
  final String? warehouse;
  @override
  @JsonKey(name: 'beginning_balance')
  final int beginningBalance;
  @override
  @JsonKey(name: 'ending_balance')
  final int endingBalance;
  @override
  @JsonKey(name: 'ending_balance_marketing')
  final int endingBalanceMarketing;
  @override
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  final DateTime expiredDate;
  @override
  @JsonKey(name: 'product_group', fromJson: ProductGroup.fromJson)
  final ProductGroup productGroup;
  @override
  @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
  final MaterialUnit unit;
  @override
  @JsonKey(name: 'batch_no')
  final Batch batch;
  @override
  @JsonKey(fromJson: Product.fromJson)
  final Product product;

  @override
  String toString() {
    return 'ProductStock(id: $id, createAt: $createAt, createdById: $createdById, updatedAt: $updatedAt, updateById: $updateById, period: $period, qtyIn: $qtyIn, qtyOut: $qtyOut, qtyOutMarketing: $qtyOutMarketing, warehouse: $warehouse, beginningBalance: $beginningBalance, endingBalance: $endingBalance, endingBalanceMarketing: $endingBalanceMarketing, expiredDate: $expiredDate, productGroup: $productGroup, unit: $unit, batch: $batch, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductStockImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updateById, updateById) ||
                other.updateById == updateById) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.qtyIn, qtyIn) || other.qtyIn == qtyIn) &&
            (identical(other.qtyOut, qtyOut) || other.qtyOut == qtyOut) &&
            (identical(other.qtyOutMarketing, qtyOutMarketing) ||
                other.qtyOutMarketing == qtyOutMarketing) &&
            (identical(other.warehouse, warehouse) ||
                other.warehouse == warehouse) &&
            (identical(other.beginningBalance, beginningBalance) ||
                other.beginningBalance == beginningBalance) &&
            (identical(other.endingBalance, endingBalance) ||
                other.endingBalance == endingBalance) &&
            (identical(other.endingBalanceMarketing, endingBalanceMarketing) ||
                other.endingBalanceMarketing == endingBalanceMarketing) &&
            (identical(other.expiredDate, expiredDate) ||
                other.expiredDate == expiredDate) &&
            (identical(other.productGroup, productGroup) ||
                other.productGroup == productGroup) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.product, product) || other.product == product));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createAt,
      createdById,
      updatedAt,
      updateById,
      period,
      qtyIn,
      qtyOut,
      qtyOutMarketing,
      warehouse,
      beginningBalance,
      endingBalance,
      endingBalanceMarketing,
      expiredDate,
      productGroup,
      unit,
      batch,
      product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductStockImplCopyWith<_$ProductStockImpl> get copyWith =>
      __$$ProductStockImplCopyWithImpl<_$ProductStockImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductStockImplToJson(
      this,
    );
  }
}

abstract class _ProductStock extends ProductStock {
  const factory _ProductStock(
      {required final String? id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createAt,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') required final int updateById,
      required final String period,
      @JsonKey(name: 'qty_in') required final int qtyIn,
      @JsonKey(name: 'qty_out') required final int qtyOut,
      @JsonKey(name: 'qty_out_marketing') required final int qtyOutMarketing,
      required final String? warehouse,
      @JsonKey(name: 'beginning_balance') required final int beginningBalance,
      @JsonKey(name: 'ending_balance') required final int endingBalance,
      @JsonKey(name: 'ending_balance_marketing')
      required final int endingBalanceMarketing,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      required final DateTime expiredDate,
      @JsonKey(name: 'product_group', fromJson: ProductGroup.fromJson)
      required final ProductGroup productGroup,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
      required final MaterialUnit unit,
      @JsonKey(name: 'batch_no') required final Batch batch,
      @JsonKey(fromJson: Product.fromJson)
      required final Product product}) = _$ProductStockImpl;
  const _ProductStock._() : super._();

  factory _ProductStock.fromJson(Map<String, dynamic> json) =
      _$ProductStockImpl.fromJson;

  @override
  String? get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createAt;
  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'updated_by_id')
  int get updateById;
  @override
  String get period;
  @override
  @JsonKey(name: 'qty_in')
  int get qtyIn;
  @override
  @JsonKey(name: 'qty_out')
  int get qtyOut;
  @override
  @JsonKey(name: 'qty_out_marketing')
  int get qtyOutMarketing;
  @override
  String? get warehouse;
  @override
  @JsonKey(name: 'beginning_balance')
  int get beginningBalance;
  @override
  @JsonKey(name: 'ending_balance')
  int get endingBalance;
  @override
  @JsonKey(name: 'ending_balance_marketing')
  int get endingBalanceMarketing;
  @override
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  DateTime get expiredDate;
  @override
  @JsonKey(name: 'product_group', fromJson: ProductGroup.fromJson)
  ProductGroup get productGroup;
  @override
  @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unit;
  @override
  @JsonKey(name: 'batch_no')
  Batch get batch;
  @override
  @JsonKey(fromJson: Product.fromJson)
  Product get product;
  @override
  @JsonKey(ignore: true)
  _$$ProductStockImplCopyWith<_$ProductStockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Batch _$BatchFromJson(Map<String, dynamic> json) {
  return _Batch.fromJson(json);
}

/// @nodoc
mixin _$Batch {
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BatchCopyWith<Batch> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BatchCopyWith<$Res> {
  factory $BatchCopyWith(Batch value, $Res Function(Batch) then) =
      _$BatchCopyWithImpl<$Res, Batch>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$BatchCopyWithImpl<$Res, $Val extends Batch>
    implements $BatchCopyWith<$Res> {
  _$BatchCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BatchImplCopyWith<$Res> implements $BatchCopyWith<$Res> {
  factory _$$BatchImplCopyWith(
          _$BatchImpl value, $Res Function(_$BatchImpl) then) =
      __$$BatchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$BatchImplCopyWithImpl<$Res>
    extends _$BatchCopyWithImpl<$Res, _$BatchImpl>
    implements _$$BatchImplCopyWith<$Res> {
  __$$BatchImplCopyWithImpl(
      _$BatchImpl _value, $Res Function(_$BatchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$BatchImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BatchImpl implements _Batch {
  _$BatchImpl(this.id);

  factory _$BatchImpl.fromJson(Map<String, dynamic> json) =>
      _$$BatchImplFromJson(json);

  @override
  final String id;

  @override
  String toString() {
    return 'Batch(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BatchImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BatchImplCopyWith<_$BatchImpl> get copyWith =>
      __$$BatchImplCopyWithImpl<_$BatchImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BatchImplToJson(
      this,
    );
  }
}

abstract class _Batch implements Batch {
  factory _Batch(final String id) = _$BatchImpl;

  factory _Batch.fromJson(Map<String, dynamic> json) = _$BatchImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$BatchImplCopyWith<_$BatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
