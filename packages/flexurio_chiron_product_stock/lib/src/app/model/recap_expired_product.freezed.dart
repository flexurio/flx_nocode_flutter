// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recap_expired_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecapExpiredProduct _$RecapExpiredProductFromJson(Map<String, dynamic> json) {
  return _RecapExpiredProduct.fromJson(json);
}

/// @nodoc
mixin _$RecapExpiredProduct {
  @JsonKey(name: 'period')
  String get period => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updateById => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_in')
  int get qtyIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_out')
  int get qtyOut => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_out_marketing')
  int get qtyOutMarketing => throw _privateConstructorUsedError;
  @JsonKey(name: 'warehouse')
  String get warehouse => throw _privateConstructorUsedError;
  @JsonKey(name: 'beginning_balance')
  int get beginningBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'ending_balance')
  int get endingBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'ending_balance_marketing')
  int get endingBalanceMarketing => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  DateTime get expiredDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_received_id')
  String get productReceivedId => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no_id')
  String get batchNoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  Product get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit')
  String get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'division')
  String get division => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_product_receive')
  int get qtyProductReceive => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_at', fromJson: isoDateToDateTime)
  DateTime get releaseAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecapExpiredProductCopyWith<RecapExpiredProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecapExpiredProductCopyWith<$Res> {
  factory $RecapExpiredProductCopyWith(
          RecapExpiredProduct value, $Res Function(RecapExpiredProduct) then) =
      _$RecapExpiredProductCopyWithImpl<$Res, RecapExpiredProduct>;
  @useResult
  $Res call(
      {@JsonKey(name: 'period') String period,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      @JsonKey(name: 'qty_in') int qtyIn,
      @JsonKey(name: 'qty_out') int qtyOut,
      @JsonKey(name: 'qty_out_marketing') int qtyOutMarketing,
      @JsonKey(name: 'warehouse') String warehouse,
      @JsonKey(name: 'beginning_balance') int beginningBalance,
      @JsonKey(name: 'ending_balance') int endingBalance,
      @JsonKey(name: 'ending_balance_marketing') int endingBalanceMarketing,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      DateTime expiredDate,
      @JsonKey(name: 'product_received_id') String productReceivedId,
      @JsonKey(name: 'batch_no_id') String batchNoId,
      @JsonKey(name: 'product', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'unit') String unit,
      @JsonKey(name: 'division') String division,
      @JsonKey(name: 'qty_product_receive') int qtyProductReceive,
      @JsonKey(name: 'release_at', fromJson: isoDateToDateTime)
      DateTime releaseAt});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$RecapExpiredProductCopyWithImpl<$Res, $Val extends RecapExpiredProduct>
    implements $RecapExpiredProductCopyWith<$Res> {
  _$RecapExpiredProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
    Object? qtyIn = null,
    Object? qtyOut = null,
    Object? qtyOutMarketing = null,
    Object? warehouse = null,
    Object? beginningBalance = null,
    Object? endingBalance = null,
    Object? endingBalanceMarketing = null,
    Object? expiredDate = null,
    Object? productReceivedId = null,
    Object? batchNoId = null,
    Object? product = null,
    Object? unit = null,
    Object? division = null,
    Object? qtyProductReceive = null,
    Object? releaseAt = null,
  }) {
    return _then(_value.copyWith(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
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
      updateById: null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
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
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as String,
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
      productReceivedId: null == productReceivedId
          ? _value.productReceivedId
          : productReceivedId // ignore: cast_nullable_to_non_nullable
              as String,
      batchNoId: null == batchNoId
          ? _value.batchNoId
          : batchNoId // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      division: null == division
          ? _value.division
          : division // ignore: cast_nullable_to_non_nullable
              as String,
      qtyProductReceive: null == qtyProductReceive
          ? _value.qtyProductReceive
          : qtyProductReceive // ignore: cast_nullable_to_non_nullable
              as int,
      releaseAt: null == releaseAt
          ? _value.releaseAt
          : releaseAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
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
abstract class _$$RecapExpiredProductImplCopyWith<$Res>
    implements $RecapExpiredProductCopyWith<$Res> {
  factory _$$RecapExpiredProductImplCopyWith(_$RecapExpiredProductImpl value,
          $Res Function(_$RecapExpiredProductImpl) then) =
      __$$RecapExpiredProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'period') String period,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      @JsonKey(name: 'qty_in') int qtyIn,
      @JsonKey(name: 'qty_out') int qtyOut,
      @JsonKey(name: 'qty_out_marketing') int qtyOutMarketing,
      @JsonKey(name: 'warehouse') String warehouse,
      @JsonKey(name: 'beginning_balance') int beginningBalance,
      @JsonKey(name: 'ending_balance') int endingBalance,
      @JsonKey(name: 'ending_balance_marketing') int endingBalanceMarketing,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      DateTime expiredDate,
      @JsonKey(name: 'product_received_id') String productReceivedId,
      @JsonKey(name: 'batch_no_id') String batchNoId,
      @JsonKey(name: 'product', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'unit') String unit,
      @JsonKey(name: 'division') String division,
      @JsonKey(name: 'qty_product_receive') int qtyProductReceive,
      @JsonKey(name: 'release_at', fromJson: isoDateToDateTime)
      DateTime releaseAt});

  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$RecapExpiredProductImplCopyWithImpl<$Res>
    extends _$RecapExpiredProductCopyWithImpl<$Res, _$RecapExpiredProductImpl>
    implements _$$RecapExpiredProductImplCopyWith<$Res> {
  __$$RecapExpiredProductImplCopyWithImpl(_$RecapExpiredProductImpl _value,
      $Res Function(_$RecapExpiredProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
    Object? qtyIn = null,
    Object? qtyOut = null,
    Object? qtyOutMarketing = null,
    Object? warehouse = null,
    Object? beginningBalance = null,
    Object? endingBalance = null,
    Object? endingBalanceMarketing = null,
    Object? expiredDate = null,
    Object? productReceivedId = null,
    Object? batchNoId = null,
    Object? product = null,
    Object? unit = null,
    Object? division = null,
    Object? qtyProductReceive = null,
    Object? releaseAt = null,
  }) {
    return _then(_$RecapExpiredProductImpl(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
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
      updateById: null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
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
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as String,
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
      productReceivedId: null == productReceivedId
          ? _value.productReceivedId
          : productReceivedId // ignore: cast_nullable_to_non_nullable
              as String,
      batchNoId: null == batchNoId
          ? _value.batchNoId
          : batchNoId // ignore: cast_nullable_to_non_nullable
              as String,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      division: null == division
          ? _value.division
          : division // ignore: cast_nullable_to_non_nullable
              as String,
      qtyProductReceive: null == qtyProductReceive
          ? _value.qtyProductReceive
          : qtyProductReceive // ignore: cast_nullable_to_non_nullable
              as int,
      releaseAt: null == releaseAt
          ? _value.releaseAt
          : releaseAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecapExpiredProductImpl extends _RecapExpiredProduct {
  const _$RecapExpiredProductImpl(
      {@JsonKey(name: 'period') required this.period,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'updated_by_id') required this.updateById,
      @JsonKey(name: 'qty_in') required this.qtyIn,
      @JsonKey(name: 'qty_out') required this.qtyOut,
      @JsonKey(name: 'qty_out_marketing') required this.qtyOutMarketing,
      @JsonKey(name: 'warehouse') required this.warehouse,
      @JsonKey(name: 'beginning_balance') required this.beginningBalance,
      @JsonKey(name: 'ending_balance') required this.endingBalance,
      @JsonKey(name: 'ending_balance_marketing')
      required this.endingBalanceMarketing,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      required this.expiredDate,
      @JsonKey(name: 'product_received_id') required this.productReceivedId,
      @JsonKey(name: 'batch_no_id') required this.batchNoId,
      @JsonKey(name: 'product', fromJson: Product.fromJson)
      required this.product,
      @JsonKey(name: 'unit') required this.unit,
      @JsonKey(name: 'division') required this.division,
      @JsonKey(name: 'qty_product_receive') required this.qtyProductReceive,
      @JsonKey(name: 'release_at', fromJson: isoDateToDateTime)
      required this.releaseAt})
      : super._();

  factory _$RecapExpiredProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecapExpiredProductImplFromJson(json);

  @override
  @JsonKey(name: 'period')
  final String period;
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
  final int updateById;
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
  @JsonKey(name: 'warehouse')
  final String warehouse;
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
  @JsonKey(name: 'product_received_id')
  final String productReceivedId;
  @override
  @JsonKey(name: 'batch_no_id')
  final String batchNoId;
  @override
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  final Product product;
  @override
  @JsonKey(name: 'unit')
  final String unit;
  @override
  @JsonKey(name: 'division')
  final String division;
  @override
  @JsonKey(name: 'qty_product_receive')
  final int qtyProductReceive;
  @override
  @JsonKey(name: 'release_at', fromJson: isoDateToDateTime)
  final DateTime releaseAt;

  @override
  String toString() {
    return 'RecapExpiredProduct(period: $period, createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, updateById: $updateById, qtyIn: $qtyIn, qtyOut: $qtyOut, qtyOutMarketing: $qtyOutMarketing, warehouse: $warehouse, beginningBalance: $beginningBalance, endingBalance: $endingBalance, endingBalanceMarketing: $endingBalanceMarketing, expiredDate: $expiredDate, productReceivedId: $productReceivedId, batchNoId: $batchNoId, product: $product, unit: $unit, division: $division, qtyProductReceive: $qtyProductReceive, releaseAt: $releaseAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecapExpiredProductImpl &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updateById, updateById) ||
                other.updateById == updateById) &&
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
            (identical(other.productReceivedId, productReceivedId) ||
                other.productReceivedId == productReceivedId) &&
            (identical(other.batchNoId, batchNoId) ||
                other.batchNoId == batchNoId) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.division, division) ||
                other.division == division) &&
            (identical(other.qtyProductReceive, qtyProductReceive) ||
                other.qtyProductReceive == qtyProductReceive) &&
            (identical(other.releaseAt, releaseAt) ||
                other.releaseAt == releaseAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        period,
        createdAt,
        createdById,
        updatedAt,
        updateById,
        qtyIn,
        qtyOut,
        qtyOutMarketing,
        warehouse,
        beginningBalance,
        endingBalance,
        endingBalanceMarketing,
        expiredDate,
        productReceivedId,
        batchNoId,
        product,
        unit,
        division,
        qtyProductReceive,
        releaseAt
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecapExpiredProductImplCopyWith<_$RecapExpiredProductImpl> get copyWith =>
      __$$RecapExpiredProductImplCopyWithImpl<_$RecapExpiredProductImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecapExpiredProductImplToJson(
      this,
    );
  }
}

abstract class _RecapExpiredProduct extends RecapExpiredProduct {
  const factory _RecapExpiredProduct(
      {@JsonKey(name: 'period') required final String period,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') required final int updateById,
      @JsonKey(name: 'qty_in') required final int qtyIn,
      @JsonKey(name: 'qty_out') required final int qtyOut,
      @JsonKey(name: 'qty_out_marketing') required final int qtyOutMarketing,
      @JsonKey(name: 'warehouse') required final String warehouse,
      @JsonKey(name: 'beginning_balance') required final int beginningBalance,
      @JsonKey(name: 'ending_balance') required final int endingBalance,
      @JsonKey(name: 'ending_balance_marketing')
      required final int endingBalanceMarketing,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      required final DateTime expiredDate,
      @JsonKey(name: 'product_received_id')
      required final String productReceivedId,
      @JsonKey(name: 'batch_no_id') required final String batchNoId,
      @JsonKey(name: 'product', fromJson: Product.fromJson)
      required final Product product,
      @JsonKey(name: 'unit') required final String unit,
      @JsonKey(name: 'division') required final String division,
      @JsonKey(name: 'qty_product_receive')
      required final int qtyProductReceive,
      @JsonKey(name: 'release_at', fromJson: isoDateToDateTime)
      required final DateTime releaseAt}) = _$RecapExpiredProductImpl;
  const _RecapExpiredProduct._() : super._();

  factory _RecapExpiredProduct.fromJson(Map<String, dynamic> json) =
      _$RecapExpiredProductImpl.fromJson;

  @override
  @JsonKey(name: 'period')
  String get period;
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
  int get updateById;
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
  @JsonKey(name: 'warehouse')
  String get warehouse;
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
  @JsonKey(name: 'product_received_id')
  String get productReceivedId;
  @override
  @JsonKey(name: 'batch_no_id')
  String get batchNoId;
  @override
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  Product get product;
  @override
  @JsonKey(name: 'unit')
  String get unit;
  @override
  @JsonKey(name: 'division')
  String get division;
  @override
  @JsonKey(name: 'qty_product_receive')
  int get qtyProductReceive;
  @override
  @JsonKey(name: 'release_at', fromJson: isoDateToDateTime)
  DateTime get releaseAt;
  @override
  @JsonKey(ignore: true)
  _$$RecapExpiredProductImplCopyWith<_$RecapExpiredProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
