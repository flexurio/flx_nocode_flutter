// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_stock_recap.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductStockRecap _$ProductStockRecapFromJson(Map<String, dynamic> json) {
  return _ProductStockRecap.fromJson(json);
}

/// @nodoc
mixin _$ProductStockRecap {
  String get period => throw _privateConstructorUsedError;
  String get warehouse => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String get division => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  DateTime get expiredDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'release_at', fromJson: isoDateToDateTime)
  DateTime get releaseAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_in')
  int get qtyIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_out')
  int get qtyOut => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_out_marketing')
  int get qtyOutMarketing => throw _privateConstructorUsedError;
  @JsonKey(name: 'beginning_balance')
  int get beginningBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'ending_balance')
  int get endingBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'ending_balance_marketing')
  int get endingBalanceMarketing => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_product_receive')
  int get qtyProductReceive => throw _privateConstructorUsedError;
  Product get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_received_id')
  String get productReceivedId => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no_id')
  String get batchNoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updatedById => throw _privateConstructorUsedError;

  /// Serializes this ProductStockRecap to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductStockRecap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductStockRecapCopyWith<ProductStockRecap> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStockRecapCopyWith<$Res> {
  factory $ProductStockRecapCopyWith(
          ProductStockRecap value, $Res Function(ProductStockRecap) then) =
      _$ProductStockRecapCopyWithImpl<$Res, ProductStockRecap>;
  @useResult
  $Res call(
      {String period,
      String warehouse,
      String unit,
      String division,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      DateTime expiredDate,
      @JsonKey(name: 'release_at', fromJson: isoDateToDateTime)
      DateTime releaseAt,
      @JsonKey(name: 'qty_in') int qtyIn,
      @JsonKey(name: 'qty_out') int qtyOut,
      @JsonKey(name: 'qty_out_marketing') int qtyOutMarketing,
      @JsonKey(name: 'beginning_balance') int beginningBalance,
      @JsonKey(name: 'ending_balance') int endingBalance,
      @JsonKey(name: 'ending_balance_marketing') int endingBalanceMarketing,
      @JsonKey(name: 'qty_product_receive') int qtyProductReceive,
      Product product,
      @JsonKey(name: 'product_received_id') String productReceivedId,
      @JsonKey(name: 'batch_no_id') String batchNoId,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_by_id') int updatedById});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$ProductStockRecapCopyWithImpl<$Res, $Val extends ProductStockRecap>
    implements $ProductStockRecapCopyWith<$Res> {
  _$ProductStockRecapCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductStockRecap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? warehouse = null,
    Object? unit = null,
    Object? division = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? expiredDate = null,
    Object? releaseAt = null,
    Object? qtyIn = null,
    Object? qtyOut = null,
    Object? qtyOutMarketing = null,
    Object? beginningBalance = null,
    Object? endingBalance = null,
    Object? endingBalanceMarketing = null,
    Object? qtyProductReceive = null,
    Object? product = null,
    Object? productReceivedId = null,
    Object? batchNoId = null,
    Object? createdById = null,
    Object? updatedById = null,
  }) {
    return _then(_value.copyWith(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      division: null == division
          ? _value.division
          : division // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiredDate: null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      releaseAt: null == releaseAt
          ? _value.releaseAt
          : releaseAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      qtyProductReceive: null == qtyProductReceive
          ? _value.qtyProductReceive
          : qtyProductReceive // ignore: cast_nullable_to_non_nullable
              as int,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      productReceivedId: null == productReceivedId
          ? _value.productReceivedId
          : productReceivedId // ignore: cast_nullable_to_non_nullable
              as String,
      batchNoId: null == batchNoId
          ? _value.batchNoId
          : batchNoId // ignore: cast_nullable_to_non_nullable
              as String,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of ProductStockRecap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductStockRecapImplCopyWith<$Res>
    implements $ProductStockRecapCopyWith<$Res> {
  factory _$$ProductStockRecapImplCopyWith(_$ProductStockRecapImpl value,
          $Res Function(_$ProductStockRecapImpl) then) =
      __$$ProductStockRecapImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String period,
      String warehouse,
      String unit,
      String division,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      DateTime expiredDate,
      @JsonKey(name: 'release_at', fromJson: isoDateToDateTime)
      DateTime releaseAt,
      @JsonKey(name: 'qty_in') int qtyIn,
      @JsonKey(name: 'qty_out') int qtyOut,
      @JsonKey(name: 'qty_out_marketing') int qtyOutMarketing,
      @JsonKey(name: 'beginning_balance') int beginningBalance,
      @JsonKey(name: 'ending_balance') int endingBalance,
      @JsonKey(name: 'ending_balance_marketing') int endingBalanceMarketing,
      @JsonKey(name: 'qty_product_receive') int qtyProductReceive,
      Product product,
      @JsonKey(name: 'product_received_id') String productReceivedId,
      @JsonKey(name: 'batch_no_id') String batchNoId,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_by_id') int updatedById});

  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$ProductStockRecapImplCopyWithImpl<$Res>
    extends _$ProductStockRecapCopyWithImpl<$Res, _$ProductStockRecapImpl>
    implements _$$ProductStockRecapImplCopyWith<$Res> {
  __$$ProductStockRecapImplCopyWithImpl(_$ProductStockRecapImpl _value,
      $Res Function(_$ProductStockRecapImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductStockRecap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? warehouse = null,
    Object? unit = null,
    Object? division = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? expiredDate = null,
    Object? releaseAt = null,
    Object? qtyIn = null,
    Object? qtyOut = null,
    Object? qtyOutMarketing = null,
    Object? beginningBalance = null,
    Object? endingBalance = null,
    Object? endingBalanceMarketing = null,
    Object? qtyProductReceive = null,
    Object? product = null,
    Object? productReceivedId = null,
    Object? batchNoId = null,
    Object? createdById = null,
    Object? updatedById = null,
  }) {
    return _then(_$ProductStockRecapImpl(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      division: null == division
          ? _value.division
          : division // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expiredDate: null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      releaseAt: null == releaseAt
          ? _value.releaseAt
          : releaseAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
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
      qtyProductReceive: null == qtyProductReceive
          ? _value.qtyProductReceive
          : qtyProductReceive // ignore: cast_nullable_to_non_nullable
              as int,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      productReceivedId: null == productReceivedId
          ? _value.productReceivedId
          : productReceivedId // ignore: cast_nullable_to_non_nullable
              as String,
      batchNoId: null == batchNoId
          ? _value.batchNoId
          : batchNoId // ignore: cast_nullable_to_non_nullable
              as String,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductStockRecapImpl extends _ProductStockRecap {
  const _$ProductStockRecapImpl(
      {required this.period,
      required this.warehouse,
      required this.unit,
      required this.division,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      required this.expiredDate,
      @JsonKey(name: 'release_at', fromJson: isoDateToDateTime)
      required this.releaseAt,
      @JsonKey(name: 'qty_in') required this.qtyIn,
      @JsonKey(name: 'qty_out') required this.qtyOut,
      @JsonKey(name: 'qty_out_marketing') required this.qtyOutMarketing,
      @JsonKey(name: 'beginning_balance') required this.beginningBalance,
      @JsonKey(name: 'ending_balance') required this.endingBalance,
      @JsonKey(name: 'ending_balance_marketing')
      required this.endingBalanceMarketing,
      @JsonKey(name: 'qty_product_receive') required this.qtyProductReceive,
      required this.product,
      @JsonKey(name: 'product_received_id') required this.productReceivedId,
      @JsonKey(name: 'batch_no_id') required this.batchNoId,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_by_id') required this.updatedById})
      : super._();

  factory _$ProductStockRecapImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductStockRecapImplFromJson(json);

  @override
  final String period;
  @override
  final String warehouse;
  @override
  final String unit;
  @override
  final String division;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  final DateTime expiredDate;
  @override
  @JsonKey(name: 'release_at', fromJson: isoDateToDateTime)
  final DateTime releaseAt;
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
  @JsonKey(name: 'beginning_balance')
  final int beginningBalance;
  @override
  @JsonKey(name: 'ending_balance')
  final int endingBalance;
  @override
  @JsonKey(name: 'ending_balance_marketing')
  final int endingBalanceMarketing;
  @override
  @JsonKey(name: 'qty_product_receive')
  final int qtyProductReceive;
  @override
  final Product product;
  @override
  @JsonKey(name: 'product_received_id')
  final String productReceivedId;
  @override
  @JsonKey(name: 'batch_no_id')
  final String batchNoId;
  @override
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @override
  @JsonKey(name: 'updated_by_id')
  final int updatedById;

  @override
  String toString() {
    return 'ProductStockRecap(period: $period, warehouse: $warehouse, unit: $unit, division: $division, createdAt: $createdAt, updatedAt: $updatedAt, expiredDate: $expiredDate, releaseAt: $releaseAt, qtyIn: $qtyIn, qtyOut: $qtyOut, qtyOutMarketing: $qtyOutMarketing, beginningBalance: $beginningBalance, endingBalance: $endingBalance, endingBalanceMarketing: $endingBalanceMarketing, qtyProductReceive: $qtyProductReceive, product: $product, productReceivedId: $productReceivedId, batchNoId: $batchNoId, createdById: $createdById, updatedById: $updatedById)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductStockRecapImpl &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.warehouse, warehouse) ||
                other.warehouse == warehouse) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.division, division) ||
                other.division == division) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.expiredDate, expiredDate) ||
                other.expiredDate == expiredDate) &&
            (identical(other.releaseAt, releaseAt) ||
                other.releaseAt == releaseAt) &&
            (identical(other.qtyIn, qtyIn) || other.qtyIn == qtyIn) &&
            (identical(other.qtyOut, qtyOut) || other.qtyOut == qtyOut) &&
            (identical(other.qtyOutMarketing, qtyOutMarketing) ||
                other.qtyOutMarketing == qtyOutMarketing) &&
            (identical(other.beginningBalance, beginningBalance) ||
                other.beginningBalance == beginningBalance) &&
            (identical(other.endingBalance, endingBalance) ||
                other.endingBalance == endingBalance) &&
            (identical(other.endingBalanceMarketing, endingBalanceMarketing) ||
                other.endingBalanceMarketing == endingBalanceMarketing) &&
            (identical(other.qtyProductReceive, qtyProductReceive) ||
                other.qtyProductReceive == qtyProductReceive) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.productReceivedId, productReceivedId) ||
                other.productReceivedId == productReceivedId) &&
            (identical(other.batchNoId, batchNoId) ||
                other.batchNoId == batchNoId) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        period,
        warehouse,
        unit,
        division,
        createdAt,
        updatedAt,
        expiredDate,
        releaseAt,
        qtyIn,
        qtyOut,
        qtyOutMarketing,
        beginningBalance,
        endingBalance,
        endingBalanceMarketing,
        qtyProductReceive,
        product,
        productReceivedId,
        batchNoId,
        createdById,
        updatedById
      ]);

  /// Create a copy of ProductStockRecap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductStockRecapImplCopyWith<_$ProductStockRecapImpl> get copyWith =>
      __$$ProductStockRecapImplCopyWithImpl<_$ProductStockRecapImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductStockRecapImplToJson(
      this,
    );
  }
}

abstract class _ProductStockRecap extends ProductStockRecap {
  const factory _ProductStockRecap(
      {required final String period,
      required final String warehouse,
      required final String unit,
      required final String division,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      required final DateTime expiredDate,
      @JsonKey(name: 'release_at', fromJson: isoDateToDateTime)
      required final DateTime releaseAt,
      @JsonKey(name: 'qty_in') required final int qtyIn,
      @JsonKey(name: 'qty_out') required final int qtyOut,
      @JsonKey(name: 'qty_out_marketing') required final int qtyOutMarketing,
      @JsonKey(name: 'beginning_balance') required final int beginningBalance,
      @JsonKey(name: 'ending_balance') required final int endingBalance,
      @JsonKey(name: 'ending_balance_marketing')
      required final int endingBalanceMarketing,
      @JsonKey(name: 'qty_product_receive')
      required final int qtyProductReceive,
      required final Product product,
      @JsonKey(name: 'product_received_id')
      required final String productReceivedId,
      @JsonKey(name: 'batch_no_id') required final String batchNoId,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'updated_by_id')
      required final int updatedById}) = _$ProductStockRecapImpl;
  const _ProductStockRecap._() : super._();

  factory _ProductStockRecap.fromJson(Map<String, dynamic> json) =
      _$ProductStockRecapImpl.fromJson;

  @override
  String get period;
  @override
  String get warehouse;
  @override
  String get unit;
  @override
  String get division;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  DateTime get expiredDate;
  @override
  @JsonKey(name: 'release_at', fromJson: isoDateToDateTime)
  DateTime get releaseAt;
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
  @JsonKey(name: 'beginning_balance')
  int get beginningBalance;
  @override
  @JsonKey(name: 'ending_balance')
  int get endingBalance;
  @override
  @JsonKey(name: 'ending_balance_marketing')
  int get endingBalanceMarketing;
  @override
  @JsonKey(name: 'qty_product_receive')
  int get qtyProductReceive;
  @override
  Product get product;
  @override
  @JsonKey(name: 'product_received_id')
  String get productReceivedId;
  @override
  @JsonKey(name: 'batch_no_id')
  String get batchNoId;
  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  @JsonKey(name: 'updated_by_id')
  int get updatedById;

  /// Create a copy of ProductStockRecap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductStockRecapImplCopyWith<_$ProductStockRecapImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
