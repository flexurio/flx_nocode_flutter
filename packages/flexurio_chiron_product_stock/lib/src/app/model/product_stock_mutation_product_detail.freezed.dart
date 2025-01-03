// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_stock_mutation_product_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductStockMutationProductDetail _$ProductStockMutationProductDetailFromJson(
    Map<String, dynamic> json) {
  return _ProductStockMutationProductDetail.fromJson(json);
}

/// @nodoc
mixin _$ProductStockMutationProductDetail {
  @JsonKey(name: 'product_id')
  String get productId => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_name')
  String get productName => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_division')
  String get productDivision => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'beginning_balance')
  int get beginningBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_in')
  int get qtyIn => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_out')
  int get qtyOut => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_out_return')
  int get qtyOutReturn => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_out_another')
  int get qtyOutAnother => throw _privateConstructorUsedError;
  @JsonKey(name: 'ending_balance')
  int get endingBalance => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  DateTime get expiredDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductStockMutationProductDetailCopyWith<ProductStockMutationProductDetail>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStockMutationProductDetailCopyWith<$Res> {
  factory $ProductStockMutationProductDetailCopyWith(
          ProductStockMutationProductDetail value,
          $Res Function(ProductStockMutationProductDetail) then) =
      _$ProductStockMutationProductDetailCopyWithImpl<$Res,
          ProductStockMutationProductDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'product_division') String productDivision,
      String unit,
      @JsonKey(name: 'beginning_balance') int beginningBalance,
      @JsonKey(name: 'qty_in') int qtyIn,
      @JsonKey(name: 'qty_out') int qtyOut,
      @JsonKey(name: 'qty_out_return') int qtyOutReturn,
      @JsonKey(name: 'qty_out_another') int qtyOutAnother,
      @JsonKey(name: 'ending_balance') int endingBalance,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      DateTime expiredDate});
}

/// @nodoc
class _$ProductStockMutationProductDetailCopyWithImpl<$Res,
        $Val extends ProductStockMutationProductDetail>
    implements $ProductStockMutationProductDetailCopyWith<$Res> {
  _$ProductStockMutationProductDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? productDivision = null,
    Object? unit = null,
    Object? beginningBalance = null,
    Object? qtyIn = null,
    Object? qtyOut = null,
    Object? qtyOutReturn = null,
    Object? qtyOutAnother = null,
    Object? endingBalance = null,
    Object? expiredDate = null,
  }) {
    return _then(_value.copyWith(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productDivision: null == productDivision
          ? _value.productDivision
          : productDivision // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      beginningBalance: null == beginningBalance
          ? _value.beginningBalance
          : beginningBalance // ignore: cast_nullable_to_non_nullable
              as int,
      qtyIn: null == qtyIn
          ? _value.qtyIn
          : qtyIn // ignore: cast_nullable_to_non_nullable
              as int,
      qtyOut: null == qtyOut
          ? _value.qtyOut
          : qtyOut // ignore: cast_nullable_to_non_nullable
              as int,
      qtyOutReturn: null == qtyOutReturn
          ? _value.qtyOutReturn
          : qtyOutReturn // ignore: cast_nullable_to_non_nullable
              as int,
      qtyOutAnother: null == qtyOutAnother
          ? _value.qtyOutAnother
          : qtyOutAnother // ignore: cast_nullable_to_non_nullable
              as int,
      endingBalance: null == endingBalance
          ? _value.endingBalance
          : endingBalance // ignore: cast_nullable_to_non_nullable
              as int,
      expiredDate: null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductStockMutationProductDetailImplCopyWith<$Res>
    implements $ProductStockMutationProductDetailCopyWith<$Res> {
  factory _$$ProductStockMutationProductDetailImplCopyWith(
          _$ProductStockMutationProductDetailImpl value,
          $Res Function(_$ProductStockMutationProductDetailImpl) then) =
      __$$ProductStockMutationProductDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'product_id') String productId,
      @JsonKey(name: 'product_name') String productName,
      @JsonKey(name: 'product_division') String productDivision,
      String unit,
      @JsonKey(name: 'beginning_balance') int beginningBalance,
      @JsonKey(name: 'qty_in') int qtyIn,
      @JsonKey(name: 'qty_out') int qtyOut,
      @JsonKey(name: 'qty_out_return') int qtyOutReturn,
      @JsonKey(name: 'qty_out_another') int qtyOutAnother,
      @JsonKey(name: 'ending_balance') int endingBalance,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      DateTime expiredDate});
}

/// @nodoc
class __$$ProductStockMutationProductDetailImplCopyWithImpl<$Res>
    extends _$ProductStockMutationProductDetailCopyWithImpl<$Res,
        _$ProductStockMutationProductDetailImpl>
    implements _$$ProductStockMutationProductDetailImplCopyWith<$Res> {
  __$$ProductStockMutationProductDetailImplCopyWithImpl(
      _$ProductStockMutationProductDetailImpl _value,
      $Res Function(_$ProductStockMutationProductDetailImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
    Object? productName = null,
    Object? productDivision = null,
    Object? unit = null,
    Object? beginningBalance = null,
    Object? qtyIn = null,
    Object? qtyOut = null,
    Object? qtyOutReturn = null,
    Object? qtyOutAnother = null,
    Object? endingBalance = null,
    Object? expiredDate = null,
  }) {
    return _then(_$ProductStockMutationProductDetailImpl(
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productDivision: null == productDivision
          ? _value.productDivision
          : productDivision // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      beginningBalance: null == beginningBalance
          ? _value.beginningBalance
          : beginningBalance // ignore: cast_nullable_to_non_nullable
              as int,
      qtyIn: null == qtyIn
          ? _value.qtyIn
          : qtyIn // ignore: cast_nullable_to_non_nullable
              as int,
      qtyOut: null == qtyOut
          ? _value.qtyOut
          : qtyOut // ignore: cast_nullable_to_non_nullable
              as int,
      qtyOutReturn: null == qtyOutReturn
          ? _value.qtyOutReturn
          : qtyOutReturn // ignore: cast_nullable_to_non_nullable
              as int,
      qtyOutAnother: null == qtyOutAnother
          ? _value.qtyOutAnother
          : qtyOutAnother // ignore: cast_nullable_to_non_nullable
              as int,
      endingBalance: null == endingBalance
          ? _value.endingBalance
          : endingBalance // ignore: cast_nullable_to_non_nullable
              as int,
      expiredDate: null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductStockMutationProductDetailImpl
    extends _ProductStockMutationProductDetail {
  const _$ProductStockMutationProductDetailImpl(
      {@JsonKey(name: 'product_id') required this.productId,
      @JsonKey(name: 'product_name') required this.productName,
      @JsonKey(name: 'product_division') required this.productDivision,
      required this.unit,
      @JsonKey(name: 'beginning_balance') required this.beginningBalance,
      @JsonKey(name: 'qty_in') required this.qtyIn,
      @JsonKey(name: 'qty_out') required this.qtyOut,
      @JsonKey(name: 'qty_out_return') required this.qtyOutReturn,
      @JsonKey(name: 'qty_out_another') required this.qtyOutAnother,
      @JsonKey(name: 'ending_balance') required this.endingBalance,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      required this.expiredDate})
      : super._();

  factory _$ProductStockMutationProductDetailImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$ProductStockMutationProductDetailImplFromJson(json);

  @override
  @JsonKey(name: 'product_id')
  final String productId;
  @override
  @JsonKey(name: 'product_name')
  final String productName;
  @override
  @JsonKey(name: 'product_division')
  final String productDivision;
  @override
  final String unit;
  @override
  @JsonKey(name: 'beginning_balance')
  final int beginningBalance;
  @override
  @JsonKey(name: 'qty_in')
  final int qtyIn;
  @override
  @JsonKey(name: 'qty_out')
  final int qtyOut;
  @override
  @JsonKey(name: 'qty_out_return')
  final int qtyOutReturn;
  @override
  @JsonKey(name: 'qty_out_another')
  final int qtyOutAnother;
  @override
  @JsonKey(name: 'ending_balance')
  final int endingBalance;
  @override
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  final DateTime expiredDate;

  @override
  String toString() {
    return 'ProductStockMutationProductDetail(productId: $productId, productName: $productName, productDivision: $productDivision, unit: $unit, beginningBalance: $beginningBalance, qtyIn: $qtyIn, qtyOut: $qtyOut, qtyOutReturn: $qtyOutReturn, qtyOutAnother: $qtyOutAnother, endingBalance: $endingBalance, expiredDate: $expiredDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductStockMutationProductDetailImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productDivision, productDivision) ||
                other.productDivision == productDivision) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.beginningBalance, beginningBalance) ||
                other.beginningBalance == beginningBalance) &&
            (identical(other.qtyIn, qtyIn) || other.qtyIn == qtyIn) &&
            (identical(other.qtyOut, qtyOut) || other.qtyOut == qtyOut) &&
            (identical(other.qtyOutReturn, qtyOutReturn) ||
                other.qtyOutReturn == qtyOutReturn) &&
            (identical(other.qtyOutAnother, qtyOutAnother) ||
                other.qtyOutAnother == qtyOutAnother) &&
            (identical(other.endingBalance, endingBalance) ||
                other.endingBalance == endingBalance) &&
            (identical(other.expiredDate, expiredDate) ||
                other.expiredDate == expiredDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      productId,
      productName,
      productDivision,
      unit,
      beginningBalance,
      qtyIn,
      qtyOut,
      qtyOutReturn,
      qtyOutAnother,
      endingBalance,
      expiredDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductStockMutationProductDetailImplCopyWith<
          _$ProductStockMutationProductDetailImpl>
      get copyWith => __$$ProductStockMutationProductDetailImplCopyWithImpl<
          _$ProductStockMutationProductDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductStockMutationProductDetailImplToJson(
      this,
    );
  }
}

abstract class _ProductStockMutationProductDetail
    extends ProductStockMutationProductDetail {
  const factory _ProductStockMutationProductDetail(
      {@JsonKey(name: 'product_id') required final String productId,
      @JsonKey(name: 'product_name') required final String productName,
      @JsonKey(name: 'product_division') required final String productDivision,
      required final String unit,
      @JsonKey(name: 'beginning_balance') required final int beginningBalance,
      @JsonKey(name: 'qty_in') required final int qtyIn,
      @JsonKey(name: 'qty_out') required final int qtyOut,
      @JsonKey(name: 'qty_out_return') required final int qtyOutReturn,
      @JsonKey(name: 'qty_out_another') required final int qtyOutAnother,
      @JsonKey(name: 'ending_balance') required final int endingBalance,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      required final DateTime
          expiredDate}) = _$ProductStockMutationProductDetailImpl;
  const _ProductStockMutationProductDetail._() : super._();

  factory _ProductStockMutationProductDetail.fromJson(
          Map<String, dynamic> json) =
      _$ProductStockMutationProductDetailImpl.fromJson;

  @override
  @JsonKey(name: 'product_id')
  String get productId;
  @override
  @JsonKey(name: 'product_name')
  String get productName;
  @override
  @JsonKey(name: 'product_division')
  String get productDivision;
  @override
  String get unit;
  @override
  @JsonKey(name: 'beginning_balance')
  int get beginningBalance;
  @override
  @JsonKey(name: 'qty_in')
  int get qtyIn;
  @override
  @JsonKey(name: 'qty_out')
  int get qtyOut;
  @override
  @JsonKey(name: 'qty_out_return')
  int get qtyOutReturn;
  @override
  @JsonKey(name: 'qty_out_another')
  int get qtyOutAnother;
  @override
  @JsonKey(name: 'ending_balance')
  int get endingBalance;
  @override
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  DateTime get expiredDate;
  @override
  @JsonKey(ignore: true)
  _$$ProductStockMutationProductDetailImplCopyWith<
          _$ProductStockMutationProductDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}
