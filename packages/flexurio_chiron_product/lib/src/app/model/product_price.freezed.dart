// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_price.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductPrice _$ProductPriceFromJson(Map<String, dynamic> json) {
  return _ProductPrice.fromJson(json);
}

/// @nodoc
mixin _$ProductPrice {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updateAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date', fromJson: isoDateToDateTime)
  DateTime get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date', fromJson: dateTimeNullable)
  DateTime? get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_price')
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'bonus_price')
  double get bonusPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'primary_price')
  double get primaryPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'strip_price')
  double get stripPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'tablet_price')
  double get tabletPrice => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Product.fromJson)
  Product get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_used')
  bool get isUsed => throw _privateConstructorUsedError;
  @JsonKey(name: 'strip_hpp')
  double get stripHpp => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Currency.fromJson)
  Currency get currency => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductPriceCopyWith<ProductPrice> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductPriceCopyWith<$Res> {
  factory $ProductPriceCopyWith(
          ProductPrice value, $Res Function(ProductPrice) then) =
      _$ProductPriceCopyWithImpl<$Res, ProductPrice>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updateAt,
      @JsonKey(name: 'start_date', fromJson: isoDateToDateTime)
      DateTime startDate,
      @JsonKey(name: 'end_date', fromJson: dateTimeNullable) DateTime? endDate,
      @JsonKey(name: 'product_price') double price,
      @JsonKey(name: 'bonus_price') double bonusPrice,
      @JsonKey(name: 'primary_price') double primaryPrice,
      @JsonKey(name: 'strip_price') double stripPrice,
      @JsonKey(name: 'tablet_price') double tabletPrice,
      @JsonKey(fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'is_used') bool isUsed,
      @JsonKey(name: 'strip_hpp') double stripHpp,
      @JsonKey(fromJson: Currency.fromJson) Currency currency,
      String? name});

  $ProductCopyWith<$Res> get product;
  $CurrencyCopyWith<$Res> get currency;
}

/// @nodoc
class _$ProductPriceCopyWithImpl<$Res, $Val extends ProductPrice>
    implements $ProductPriceCopyWith<$Res> {
  _$ProductPriceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updateAt = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? price = null,
    Object? bonusPrice = null,
    Object? primaryPrice = null,
    Object? stripPrice = null,
    Object? tabletPrice = null,
    Object? product = null,
    Object? isUsed = null,
    Object? stripHpp = null,
    Object? currency = null,
    Object? name = freezed,
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
      updateAt: null == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      bonusPrice: null == bonusPrice
          ? _value.bonusPrice
          : bonusPrice // ignore: cast_nullable_to_non_nullable
              as double,
      primaryPrice: null == primaryPrice
          ? _value.primaryPrice
          : primaryPrice // ignore: cast_nullable_to_non_nullable
              as double,
      stripPrice: null == stripPrice
          ? _value.stripPrice
          : stripPrice // ignore: cast_nullable_to_non_nullable
              as double,
      tabletPrice: null == tabletPrice
          ? _value.tabletPrice
          : tabletPrice // ignore: cast_nullable_to_non_nullable
              as double,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      isUsed: null == isUsed
          ? _value.isUsed
          : isUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      stripHpp: null == stripHpp
          ? _value.stripHpp
          : stripHpp // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
  $CurrencyCopyWith<$Res> get currency {
    return $CurrencyCopyWith<$Res>(_value.currency, (value) {
      return _then(_value.copyWith(currency: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductPriceImplCopyWith<$Res>
    implements $ProductPriceCopyWith<$Res> {
  factory _$$ProductPriceImplCopyWith(
          _$ProductPriceImpl value, $Res Function(_$ProductPriceImpl) then) =
      __$$ProductPriceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updateAt,
      @JsonKey(name: 'start_date', fromJson: isoDateToDateTime)
      DateTime startDate,
      @JsonKey(name: 'end_date', fromJson: dateTimeNullable) DateTime? endDate,
      @JsonKey(name: 'product_price') double price,
      @JsonKey(name: 'bonus_price') double bonusPrice,
      @JsonKey(name: 'primary_price') double primaryPrice,
      @JsonKey(name: 'strip_price') double stripPrice,
      @JsonKey(name: 'tablet_price') double tabletPrice,
      @JsonKey(fromJson: Product.fromJson) Product product,
      @JsonKey(name: 'is_used') bool isUsed,
      @JsonKey(name: 'strip_hpp') double stripHpp,
      @JsonKey(fromJson: Currency.fromJson) Currency currency,
      String? name});

  @override
  $ProductCopyWith<$Res> get product;
  @override
  $CurrencyCopyWith<$Res> get currency;
}

/// @nodoc
class __$$ProductPriceImplCopyWithImpl<$Res>
    extends _$ProductPriceCopyWithImpl<$Res, _$ProductPriceImpl>
    implements _$$ProductPriceImplCopyWith<$Res> {
  __$$ProductPriceImplCopyWithImpl(
      _$ProductPriceImpl _value, $Res Function(_$ProductPriceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? updateAt = null,
    Object? startDate = null,
    Object? endDate = freezed,
    Object? price = null,
    Object? bonusPrice = null,
    Object? primaryPrice = null,
    Object? stripPrice = null,
    Object? tabletPrice = null,
    Object? product = null,
    Object? isUsed = null,
    Object? stripHpp = null,
    Object? currency = null,
    Object? name = freezed,
  }) {
    return _then(_$ProductPriceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateAt: null == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      bonusPrice: null == bonusPrice
          ? _value.bonusPrice
          : bonusPrice // ignore: cast_nullable_to_non_nullable
              as double,
      primaryPrice: null == primaryPrice
          ? _value.primaryPrice
          : primaryPrice // ignore: cast_nullable_to_non_nullable
              as double,
      stripPrice: null == stripPrice
          ? _value.stripPrice
          : stripPrice // ignore: cast_nullable_to_non_nullable
              as double,
      tabletPrice: null == tabletPrice
          ? _value.tabletPrice
          : tabletPrice // ignore: cast_nullable_to_non_nullable
              as double,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      isUsed: null == isUsed
          ? _value.isUsed
          : isUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      stripHpp: null == stripHpp
          ? _value.stripHpp
          : stripHpp // ignore: cast_nullable_to_non_nullable
              as double,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductPriceImpl extends _ProductPrice {
  _$ProductPriceImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updateAt,
      @JsonKey(name: 'start_date', fromJson: isoDateToDateTime)
      required this.startDate,
      @JsonKey(name: 'end_date', fromJson: dateTimeNullable)
      required this.endDate,
      @JsonKey(name: 'product_price') required this.price,
      @JsonKey(name: 'bonus_price') required this.bonusPrice,
      @JsonKey(name: 'primary_price') required this.primaryPrice,
      @JsonKey(name: 'strip_price') required this.stripPrice,
      @JsonKey(name: 'tablet_price') required this.tabletPrice,
      @JsonKey(fromJson: Product.fromJson) required this.product,
      @JsonKey(name: 'is_used') required this.isUsed,
      @JsonKey(name: 'strip_hpp') required this.stripHpp,
      @JsonKey(fromJson: Currency.fromJson) required this.currency,
      this.name})
      : super._();

  factory _$ProductPriceImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductPriceImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updateAt;
  @override
  @JsonKey(name: 'start_date', fromJson: isoDateToDateTime)
  final DateTime startDate;
  @override
  @JsonKey(name: 'end_date', fromJson: dateTimeNullable)
  final DateTime? endDate;
  @override
  @JsonKey(name: 'product_price')
  final double price;
  @override
  @JsonKey(name: 'bonus_price')
  final double bonusPrice;
  @override
  @JsonKey(name: 'primary_price')
  final double primaryPrice;
  @override
  @JsonKey(name: 'strip_price')
  final double stripPrice;
  @override
  @JsonKey(name: 'tablet_price')
  final double tabletPrice;
  @override
  @JsonKey(fromJson: Product.fromJson)
  final Product product;
  @override
  @JsonKey(name: 'is_used')
  final bool isUsed;
  @override
  @JsonKey(name: 'strip_hpp')
  final double stripHpp;
  @override
  @JsonKey(fromJson: Currency.fromJson)
  final Currency currency;
  @override
  final String? name;

  @override
  String toString() {
    return 'ProductPrice(id: $id, createdAt: $createdAt, updateAt: $updateAt, startDate: $startDate, endDate: $endDate, price: $price, bonusPrice: $bonusPrice, primaryPrice: $primaryPrice, stripPrice: $stripPrice, tabletPrice: $tabletPrice, product: $product, isUsed: $isUsed, stripHpp: $stripHpp, currency: $currency, name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductPriceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.bonusPrice, bonusPrice) ||
                other.bonusPrice == bonusPrice) &&
            (identical(other.primaryPrice, primaryPrice) ||
                other.primaryPrice == primaryPrice) &&
            (identical(other.stripPrice, stripPrice) ||
                other.stripPrice == stripPrice) &&
            (identical(other.tabletPrice, tabletPrice) ||
                other.tabletPrice == tabletPrice) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.isUsed, isUsed) || other.isUsed == isUsed) &&
            (identical(other.stripHpp, stripHpp) ||
                other.stripHpp == stripHpp) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updateAt,
      startDate,
      endDate,
      price,
      bonusPrice,
      primaryPrice,
      stripPrice,
      tabletPrice,
      product,
      isUsed,
      stripHpp,
      currency,
      name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductPriceImplCopyWith<_$ProductPriceImpl> get copyWith =>
      __$$ProductPriceImplCopyWithImpl<_$ProductPriceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductPriceImplToJson(
      this,
    );
  }
}

abstract class _ProductPrice extends ProductPrice {
  factory _ProductPrice(
      {required final int id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updateAt,
      @JsonKey(name: 'start_date', fromJson: isoDateToDateTime)
      required final DateTime startDate,
      @JsonKey(name: 'end_date', fromJson: dateTimeNullable)
      required final DateTime? endDate,
      @JsonKey(name: 'product_price') required final double price,
      @JsonKey(name: 'bonus_price') required final double bonusPrice,
      @JsonKey(name: 'primary_price') required final double primaryPrice,
      @JsonKey(name: 'strip_price') required final double stripPrice,
      @JsonKey(name: 'tablet_price') required final double tabletPrice,
      @JsonKey(fromJson: Product.fromJson) required final Product product,
      @JsonKey(name: 'is_used') required final bool isUsed,
      @JsonKey(name: 'strip_hpp') required final double stripHpp,
      @JsonKey(fromJson: Currency.fromJson) required final Currency currency,
      final String? name}) = _$ProductPriceImpl;
  _ProductPrice._() : super._();

  factory _ProductPrice.fromJson(Map<String, dynamic> json) =
      _$ProductPriceImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updateAt;
  @override
  @JsonKey(name: 'start_date', fromJson: isoDateToDateTime)
  DateTime get startDate;
  @override
  @JsonKey(name: 'end_date', fromJson: dateTimeNullable)
  DateTime? get endDate;
  @override
  @JsonKey(name: 'product_price')
  double get price;
  @override
  @JsonKey(name: 'bonus_price')
  double get bonusPrice;
  @override
  @JsonKey(name: 'primary_price')
  double get primaryPrice;
  @override
  @JsonKey(name: 'strip_price')
  double get stripPrice;
  @override
  @JsonKey(name: 'tablet_price')
  double get tabletPrice;
  @override
  @JsonKey(fromJson: Product.fromJson)
  Product get product;
  @override
  @JsonKey(name: 'is_used')
  bool get isUsed;
  @override
  @JsonKey(name: 'strip_hpp')
  double get stripHpp;
  @override
  @JsonKey(fromJson: Currency.fromJson)
  Currency get currency;
  @override
  String? get name;
  @override
  @JsonKey(ignore: true)
  _$$ProductPriceImplCopyWith<_$ProductPriceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
