// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_stock_initial.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductStockInitial _$ProductStockInitialFromJson(Map<String, dynamic> json) {
  return _ProductStockInitial.fromJson(json);
}

/// @nodoc
mixin _$ProductStockInitial {
  String get period => throw _privateConstructorUsedError;
  String get warehouse => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  DateTime get expiredDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_id')
  String get unitId => throw _privateConstructorUsedError;
  @JsonKey(name: 'beginning_balance')
  int get beginningBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'ending_balance')
  int get endingBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_ending_balance')
  int get totalEndingBalance => throw _privateConstructorUsedError;
  Product get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no_id')
  String get batchNoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updatedById => throw _privateConstructorUsedError;

  /// Serializes this ProductStockInitial to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductStockInitial
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductStockInitialCopyWith<ProductStockInitial> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStockInitialCopyWith<$Res> {
  factory $ProductStockInitialCopyWith(
          ProductStockInitial value, $Res Function(ProductStockInitial) then) =
      _$ProductStockInitialCopyWithImpl<$Res, ProductStockInitial>;
  @useResult
  $Res call(
      {String period,
      String warehouse,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      DateTime expiredDate,
      @JsonKey(name: 'unit_id') String unitId,
      @JsonKey(name: 'beginning_balance') int beginningBalance,
      @JsonKey(name: 'ending_balance') int endingBalance,
      @JsonKey(name: 'total_ending_balance') int totalEndingBalance,
      Product product,
      @JsonKey(name: 'batch_no_id') String batchNoId,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_by_id') int updatedById});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class _$ProductStockInitialCopyWithImpl<$Res, $Val extends ProductStockInitial>
    implements $ProductStockInitialCopyWith<$Res> {
  _$ProductStockInitialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductStockInitial
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? warehouse = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? expiredDate = null,
    Object? unitId = null,
    Object? beginningBalance = null,
    Object? endingBalance = null,
    Object? totalEndingBalance = null,
    Object? product = null,
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
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      beginningBalance: null == beginningBalance
          ? _value.beginningBalance
          : beginningBalance // ignore: cast_nullable_to_non_nullable
              as int,
      endingBalance: null == endingBalance
          ? _value.endingBalance
          : endingBalance // ignore: cast_nullable_to_non_nullable
              as int,
      totalEndingBalance: null == totalEndingBalance
          ? _value.totalEndingBalance
          : totalEndingBalance // ignore: cast_nullable_to_non_nullable
              as int,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
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

  /// Create a copy of ProductStockInitial
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
abstract class _$$ProductStockInitialImplCopyWith<$Res>
    implements $ProductStockInitialCopyWith<$Res> {
  factory _$$ProductStockInitialImplCopyWith(_$ProductStockInitialImpl value,
          $Res Function(_$ProductStockInitialImpl) then) =
      __$$ProductStockInitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String period,
      String warehouse,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      DateTime expiredDate,
      @JsonKey(name: 'unit_id') String unitId,
      @JsonKey(name: 'beginning_balance') int beginningBalance,
      @JsonKey(name: 'ending_balance') int endingBalance,
      @JsonKey(name: 'total_ending_balance') int totalEndingBalance,
      Product product,
      @JsonKey(name: 'batch_no_id') String batchNoId,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_by_id') int updatedById});

  @override
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$ProductStockInitialImplCopyWithImpl<$Res>
    extends _$ProductStockInitialCopyWithImpl<$Res, _$ProductStockInitialImpl>
    implements _$$ProductStockInitialImplCopyWith<$Res> {
  __$$ProductStockInitialImplCopyWithImpl(_$ProductStockInitialImpl _value,
      $Res Function(_$ProductStockInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductStockInitial
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? period = null,
    Object? warehouse = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? expiredDate = null,
    Object? unitId = null,
    Object? beginningBalance = null,
    Object? endingBalance = null,
    Object? totalEndingBalance = null,
    Object? product = null,
    Object? batchNoId = null,
    Object? createdById = null,
    Object? updatedById = null,
  }) {
    return _then(_$ProductStockInitialImpl(
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      warehouse: null == warehouse
          ? _value.warehouse
          : warehouse // ignore: cast_nullable_to_non_nullable
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
      unitId: null == unitId
          ? _value.unitId
          : unitId // ignore: cast_nullable_to_non_nullable
              as String,
      beginningBalance: null == beginningBalance
          ? _value.beginningBalance
          : beginningBalance // ignore: cast_nullable_to_non_nullable
              as int,
      endingBalance: null == endingBalance
          ? _value.endingBalance
          : endingBalance // ignore: cast_nullable_to_non_nullable
              as int,
      totalEndingBalance: null == totalEndingBalance
          ? _value.totalEndingBalance
          : totalEndingBalance // ignore: cast_nullable_to_non_nullable
              as int,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
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
class _$ProductStockInitialImpl extends _ProductStockInitial {
  const _$ProductStockInitialImpl(
      {required this.period,
      required this.warehouse,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      required this.expiredDate,
      @JsonKey(name: 'unit_id') required this.unitId,
      @JsonKey(name: 'beginning_balance') required this.beginningBalance,
      @JsonKey(name: 'ending_balance') required this.endingBalance,
      @JsonKey(name: 'total_ending_balance') required this.totalEndingBalance,
      required this.product,
      @JsonKey(name: 'batch_no_id') required this.batchNoId,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_by_id') required this.updatedById})
      : super._();

  factory _$ProductStockInitialImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductStockInitialImplFromJson(json);

  @override
  final String period;
  @override
  final String warehouse;
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
  @JsonKey(name: 'unit_id')
  final String unitId;
  @override
  @JsonKey(name: 'beginning_balance')
  final int beginningBalance;
  @override
  @JsonKey(name: 'ending_balance')
  final int endingBalance;
  @override
  @JsonKey(name: 'total_ending_balance')
  final int totalEndingBalance;
  @override
  final Product product;
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
    return 'ProductStockInitial(period: $period, warehouse: $warehouse, createdAt: $createdAt, updatedAt: $updatedAt, expiredDate: $expiredDate, unitId: $unitId, beginningBalance: $beginningBalance, endingBalance: $endingBalance, totalEndingBalance: $totalEndingBalance, product: $product, batchNoId: $batchNoId, createdById: $createdById, updatedById: $updatedById)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductStockInitialImpl &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.warehouse, warehouse) ||
                other.warehouse == warehouse) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.expiredDate, expiredDate) ||
                other.expiredDate == expiredDate) &&
            (identical(other.unitId, unitId) || other.unitId == unitId) &&
            (identical(other.beginningBalance, beginningBalance) ||
                other.beginningBalance == beginningBalance) &&
            (identical(other.endingBalance, endingBalance) ||
                other.endingBalance == endingBalance) &&
            (identical(other.totalEndingBalance, totalEndingBalance) ||
                other.totalEndingBalance == totalEndingBalance) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.batchNoId, batchNoId) ||
                other.batchNoId == batchNoId) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      period,
      warehouse,
      createdAt,
      updatedAt,
      expiredDate,
      unitId,
      beginningBalance,
      endingBalance,
      totalEndingBalance,
      product,
      batchNoId,
      createdById,
      updatedById);

  /// Create a copy of ProductStockInitial
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductStockInitialImplCopyWith<_$ProductStockInitialImpl> get copyWith =>
      __$$ProductStockInitialImplCopyWithImpl<_$ProductStockInitialImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductStockInitialImplToJson(
      this,
    );
  }
}

abstract class _ProductStockInitial extends ProductStockInitial {
  const factory _ProductStockInitial(
      {required final String period,
      required final String warehouse,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      required final DateTime expiredDate,
      @JsonKey(name: 'unit_id') required final String unitId,
      @JsonKey(name: 'beginning_balance') required final int beginningBalance,
      @JsonKey(name: 'ending_balance') required final int endingBalance,
      @JsonKey(name: 'total_ending_balance')
      required final int totalEndingBalance,
      required final Product product,
      @JsonKey(name: 'batch_no_id') required final String batchNoId,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'updated_by_id')
      required final int updatedById}) = _$ProductStockInitialImpl;
  const _ProductStockInitial._() : super._();

  factory _ProductStockInitial.fromJson(Map<String, dynamic> json) =
      _$ProductStockInitialImpl.fromJson;

  @override
  String get period;
  @override
  String get warehouse;
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
  @JsonKey(name: 'unit_id')
  String get unitId;
  @override
  @JsonKey(name: 'beginning_balance')
  int get beginningBalance;
  @override
  @JsonKey(name: 'ending_balance')
  int get endingBalance;
  @override
  @JsonKey(name: 'total_ending_balance')
  int get totalEndingBalance;
  @override
  Product get product;
  @override
  @JsonKey(name: 'batch_no_id')
  String get batchNoId;
  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  @JsonKey(name: 'updated_by_id')
  int get updatedById;

  /// Create a copy of ProductStockInitial
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductStockInitialImplCopyWith<_$ProductStockInitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
