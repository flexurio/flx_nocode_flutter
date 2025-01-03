// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recap_product_expenditure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecapProductExpenditure _$RecapProductExpenditureFromJson(
    Map<String, dynamic> json) {
  return _RecapProductExpenditure.fromJson(json);
}

/// @nodoc
mixin _$RecapProductExpenditure {
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty')
  double get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  DateTime get expiredDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch_no_id')
  String get batchNoId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_id')
  String get customerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_name')
  String get customerName => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_city')
  String get customerCity => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  Product get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_issued', fromJson: ProductIssue.fromJson)
  ProductIssue get productIssue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecapProductExpenditureCopyWith<RecapProductExpenditure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecapProductExpenditureCopyWith<$Res> {
  factory $RecapProductExpenditureCopyWith(RecapProductExpenditure value,
          $Res Function(RecapProductExpenditure) then) =
      _$RecapProductExpenditureCopyWithImpl<$Res, RecapProductExpenditure>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'qty') double qty,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      DateTime expiredDate,
      @JsonKey(name: 'batch_no_id') String batchNoId,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'customer_city') String customerCity,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson) MaterialUnit unit,
      @JsonKey(name: 'product', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'product_issued', fromJson: ProductIssue.fromJson)
      ProductIssue productIssue});

  $MaterialUnitCopyWith<$Res> get unit;
  $ProductCopyWith<$Res> get product;
  $ProductIssueCopyWith<$Res> get productIssue;
}

/// @nodoc
class _$RecapProductExpenditureCopyWithImpl<$Res,
        $Val extends RecapProductExpenditure>
    implements $RecapProductExpenditureCopyWith<$Res> {
  _$RecapProductExpenditureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? qty = null,
    Object? expiredDate = null,
    Object? batchNoId = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? customerCity = null,
    Object? unit = null,
    Object? product = null,
    Object? productIssue = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
      expiredDate: null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      batchNoId: null == batchNoId
          ? _value.batchNoId
          : batchNoId // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerCity: null == customerCity
          ? _value.customerCity
          : customerCity // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
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
  $ProductIssueCopyWith<$Res> get productIssue {
    return $ProductIssueCopyWith<$Res>(_value.productIssue, (value) {
      return _then(_value.copyWith(productIssue: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecapProductExpenditureImplCopyWith<$Res>
    implements $RecapProductExpenditureCopyWith<$Res> {
  factory _$$RecapProductExpenditureImplCopyWith(
          _$RecapProductExpenditureImpl value,
          $Res Function(_$RecapProductExpenditureImpl) then) =
      __$$RecapProductExpenditureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'qty') double qty,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      DateTime expiredDate,
      @JsonKey(name: 'batch_no_id') String batchNoId,
      @JsonKey(name: 'customer_id') String customerId,
      @JsonKey(name: 'customer_name') String customerName,
      @JsonKey(name: 'customer_city') String customerCity,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson) MaterialUnit unit,
      @JsonKey(name: 'product', fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'product_issued', fromJson: ProductIssue.fromJson)
      ProductIssue productIssue});

  @override
  $MaterialUnitCopyWith<$Res> get unit;
  @override
  $ProductCopyWith<$Res> get product;
  @override
  $ProductIssueCopyWith<$Res> get productIssue;
}

/// @nodoc
class __$$RecapProductExpenditureImplCopyWithImpl<$Res>
    extends _$RecapProductExpenditureCopyWithImpl<$Res,
        _$RecapProductExpenditureImpl>
    implements _$$RecapProductExpenditureImplCopyWith<$Res> {
  __$$RecapProductExpenditureImplCopyWithImpl(
      _$RecapProductExpenditureImpl _value,
      $Res Function(_$RecapProductExpenditureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? qty = null,
    Object? expiredDate = null,
    Object? batchNoId = null,
    Object? customerId = null,
    Object? customerName = null,
    Object? customerCity = null,
    Object? unit = null,
    Object? product = null,
    Object? productIssue = null,
  }) {
    return _then(_$RecapProductExpenditureImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      qty: null == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double,
      expiredDate: null == expiredDate
          ? _value.expiredDate
          : expiredDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      batchNoId: null == batchNoId
          ? _value.batchNoId
          : batchNoId // ignore: cast_nullable_to_non_nullable
              as String,
      customerId: null == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String,
      customerName: null == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String,
      customerCity: null == customerCity
          ? _value.customerCity
          : customerCity // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      productIssue: null == productIssue
          ? _value.productIssue
          : productIssue // ignore: cast_nullable_to_non_nullable
              as ProductIssue,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecapProductExpenditureImpl extends _RecapProductExpenditure {
  const _$RecapProductExpenditureImpl(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'qty') required this.qty,
      @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
      required this.expiredDate,
      @JsonKey(name: 'batch_no_id') required this.batchNoId,
      @JsonKey(name: 'customer_id') required this.customerId,
      @JsonKey(name: 'customer_name') required this.customerName,
      @JsonKey(name: 'customer_city') required this.customerCity,
      @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
      required this.unit,
      @JsonKey(name: 'product', fromJson: Product.fromJson)
      required this.product,
      @JsonKey(name: 'product_issued', fromJson: ProductIssue.fromJson)
      required this.productIssue})
      : super._();

  factory _$RecapProductExpenditureImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecapProductExpenditureImplFromJson(json);

  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'qty')
  final double qty;
  @override
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  final DateTime expiredDate;
  @override
  @JsonKey(name: 'batch_no_id')
  final String batchNoId;
  @override
  @JsonKey(name: 'customer_id')
  final String customerId;
  @override
  @JsonKey(name: 'customer_name')
  final String customerName;
  @override
  @JsonKey(name: 'customer_city')
  final String customerCity;
  @override
  @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
  final MaterialUnit unit;
  @override
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  final Product product;
  @override
  @JsonKey(name: 'product_issued', fromJson: ProductIssue.fromJson)
  final ProductIssue productIssue;

  @override
  String toString() {
    return 'RecapProductExpenditure(createdAt: $createdAt, qty: $qty, expiredDate: $expiredDate, batchNoId: $batchNoId, customerId: $customerId, customerName: $customerName, customerCity: $customerCity, unit: $unit, product: $product, productIssue: $productIssue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecapProductExpenditureImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.expiredDate, expiredDate) ||
                other.expiredDate == expiredDate) &&
            (identical(other.batchNoId, batchNoId) ||
                other.batchNoId == batchNoId) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerCity, customerCity) ||
                other.customerCity == customerCity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.productIssue, productIssue) ||
                other.productIssue == productIssue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      qty,
      expiredDate,
      batchNoId,
      customerId,
      customerName,
      customerCity,
      unit,
      product,
      productIssue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecapProductExpenditureImplCopyWith<_$RecapProductExpenditureImpl>
      get copyWith => __$$RecapProductExpenditureImplCopyWithImpl<
          _$RecapProductExpenditureImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecapProductExpenditureImplToJson(
      this,
    );
  }
}

abstract class _RecapProductExpenditure extends RecapProductExpenditure {
  const factory _RecapProductExpenditure(
          {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
          required final DateTime createdAt,
          @JsonKey(name: 'qty') required final double qty,
          @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
          required final DateTime expiredDate,
          @JsonKey(name: 'batch_no_id') required final String batchNoId,
          @JsonKey(name: 'customer_id') required final String customerId,
          @JsonKey(name: 'customer_name') required final String customerName,
          @JsonKey(name: 'customer_city') required final String customerCity,
          @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
          required final MaterialUnit unit,
          @JsonKey(name: 'product', fromJson: Product.fromJson)
          required final Product product,
          @JsonKey(name: 'product_issued', fromJson: ProductIssue.fromJson)
          required final ProductIssue productIssue}) =
      _$RecapProductExpenditureImpl;
  const _RecapProductExpenditure._() : super._();

  factory _RecapProductExpenditure.fromJson(Map<String, dynamic> json) =
      _$RecapProductExpenditureImpl.fromJson;

  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'qty')
  double get qty;
  @override
  @JsonKey(name: 'expired_date', fromJson: isoDateToDateTime)
  DateTime get expiredDate;
  @override
  @JsonKey(name: 'batch_no_id')
  String get batchNoId;
  @override
  @JsonKey(name: 'customer_id')
  String get customerId;
  @override
  @JsonKey(name: 'customer_name')
  String get customerName;
  @override
  @JsonKey(name: 'customer_city')
  String get customerCity;
  @override
  @JsonKey(name: 'unit', fromJson: MaterialUnit.fromJson)
  MaterialUnit get unit;
  @override
  @JsonKey(name: 'product', fromJson: Product.fromJson)
  Product get product;
  @override
  @JsonKey(name: 'product_issued', fromJson: ProductIssue.fromJson)
  ProductIssue get productIssue;
  @override
  @JsonKey(ignore: true)
  _$$RecapProductExpenditureImplCopyWith<_$RecapProductExpenditureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
