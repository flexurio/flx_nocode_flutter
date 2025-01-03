// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_request_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProductRequestDetail _$ProductRequestDetailFromJson(Map<String, dynamic> json) {
  return _ProductRequestDetail.fromJson(json);
}

/// @nodoc
mixin _$ProductRequestDetail {
  int? get id => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  double? get price => throw _privateConstructorUsedError;
  double? get subtotal => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_percent')
  double? get discountPercent => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_value')
  double? get discountValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'price_after_discount')
  double? get priceAfterDiscount => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_price')
  double? get productPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_product_price')
  double? get totalProductPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_delivery')
  int? get quantityDelivery => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity_remaining', defaultValue: 0)
  int? get quantityRemaining => throw _privateConstructorUsedError;
  @JsonKey(name: 'product_id', fromJson: Product.fromJson)
  Product? get product => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit_id')
  String get unit => throw _privateConstructorUsedError;

  /// Serializes this ProductRequestDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductRequestDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductRequestDetailCopyWith<ProductRequestDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductRequestDetailCopyWith<$Res> {
  factory $ProductRequestDetailCopyWith(ProductRequestDetail value,
          $Res Function(ProductRequestDetail) then) =
      _$ProductRequestDetailCopyWithImpl<$Res, ProductRequestDetail>;
  @useResult
  $Res call(
      {int? id,
      int? quantity,
      double? price,
      double? subtotal,
      @JsonKey(name: 'discount_percent') double? discountPercent,
      @JsonKey(name: 'discount_value') double? discountValue,
      @JsonKey(name: 'price_after_discount') double? priceAfterDiscount,
      @JsonKey(name: 'product_price') double? productPrice,
      @JsonKey(name: 'total_product_price') double? totalProductPrice,
      @JsonKey(name: 'quantity_delivery') int? quantityDelivery,
      @JsonKey(name: 'quantity_remaining', defaultValue: 0)
      int? quantityRemaining,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson) Product? product,
      @JsonKey(name: 'unit_id') String unit});

  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class _$ProductRequestDetailCopyWithImpl<$Res,
        $Val extends ProductRequestDetail>
    implements $ProductRequestDetailCopyWith<$Res> {
  _$ProductRequestDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductRequestDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? quantity = freezed,
    Object? price = freezed,
    Object? subtotal = freezed,
    Object? discountPercent = freezed,
    Object? discountValue = freezed,
    Object? priceAfterDiscount = freezed,
    Object? productPrice = freezed,
    Object? totalProductPrice = freezed,
    Object? quantityDelivery = freezed,
    Object? quantityRemaining = freezed,
    Object? product = freezed,
    Object? unit = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      subtotal: freezed == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      discountPercent: freezed == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double?,
      discountValue: freezed == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double?,
      priceAfterDiscount: freezed == priceAfterDiscount
          ? _value.priceAfterDiscount
          : priceAfterDiscount // ignore: cast_nullable_to_non_nullable
              as double?,
      productPrice: freezed == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      totalProductPrice: freezed == totalProductPrice
          ? _value.totalProductPrice
          : totalProductPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      quantityDelivery: freezed == quantityDelivery
          ? _value.quantityDelivery
          : quantityDelivery // ignore: cast_nullable_to_non_nullable
              as int?,
      quantityRemaining: freezed == quantityRemaining
          ? _value.quantityRemaining
          : quantityRemaining // ignore: cast_nullable_to_non_nullable
              as int?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of ProductRequestDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProductRequestDetailImplCopyWith<$Res>
    implements $ProductRequestDetailCopyWith<$Res> {
  factory _$$ProductRequestDetailImplCopyWith(_$ProductRequestDetailImpl value,
          $Res Function(_$ProductRequestDetailImpl) then) =
      __$$ProductRequestDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      int? quantity,
      double? price,
      double? subtotal,
      @JsonKey(name: 'discount_percent') double? discountPercent,
      @JsonKey(name: 'discount_value') double? discountValue,
      @JsonKey(name: 'price_after_discount') double? priceAfterDiscount,
      @JsonKey(name: 'product_price') double? productPrice,
      @JsonKey(name: 'total_product_price') double? totalProductPrice,
      @JsonKey(name: 'quantity_delivery') int? quantityDelivery,
      @JsonKey(name: 'quantity_remaining', defaultValue: 0)
      int? quantityRemaining,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson) Product? product,
      @JsonKey(name: 'unit_id') String unit});

  @override
  $ProductCopyWith<$Res>? get product;
}

/// @nodoc
class __$$ProductRequestDetailImplCopyWithImpl<$Res>
    extends _$ProductRequestDetailCopyWithImpl<$Res, _$ProductRequestDetailImpl>
    implements _$$ProductRequestDetailImplCopyWith<$Res> {
  __$$ProductRequestDetailImplCopyWithImpl(_$ProductRequestDetailImpl _value,
      $Res Function(_$ProductRequestDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductRequestDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? quantity = freezed,
    Object? price = freezed,
    Object? subtotal = freezed,
    Object? discountPercent = freezed,
    Object? discountValue = freezed,
    Object? priceAfterDiscount = freezed,
    Object? productPrice = freezed,
    Object? totalProductPrice = freezed,
    Object? quantityDelivery = freezed,
    Object? quantityRemaining = freezed,
    Object? product = freezed,
    Object? unit = null,
  }) {
    return _then(_$ProductRequestDetailImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      subtotal: freezed == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      discountPercent: freezed == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double?,
      discountValue: freezed == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double?,
      priceAfterDiscount: freezed == priceAfterDiscount
          ? _value.priceAfterDiscount
          : priceAfterDiscount // ignore: cast_nullable_to_non_nullable
              as double?,
      productPrice: freezed == productPrice
          ? _value.productPrice
          : productPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      totalProductPrice: freezed == totalProductPrice
          ? _value.totalProductPrice
          : totalProductPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      quantityDelivery: freezed == quantityDelivery
          ? _value.quantityDelivery
          : quantityDelivery // ignore: cast_nullable_to_non_nullable
              as int?,
      quantityRemaining: freezed == quantityRemaining
          ? _value.quantityRemaining
          : quantityRemaining // ignore: cast_nullable_to_non_nullable
              as int?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductRequestDetailImpl extends _ProductRequestDetail {
  const _$ProductRequestDetailImpl(
      {required this.id,
      required this.quantity,
      required this.price,
      required this.subtotal,
      @JsonKey(name: 'discount_percent') required this.discountPercent,
      @JsonKey(name: 'discount_value') required this.discountValue,
      @JsonKey(name: 'price_after_discount') required this.priceAfterDiscount,
      @JsonKey(name: 'product_price') required this.productPrice,
      @JsonKey(name: 'total_product_price') required this.totalProductPrice,
      @JsonKey(name: 'quantity_delivery') required this.quantityDelivery,
      @JsonKey(name: 'quantity_remaining', defaultValue: 0)
      required this.quantityRemaining,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson)
      required this.product,
      @JsonKey(name: 'unit_id') required this.unit})
      : super._();

  factory _$ProductRequestDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductRequestDetailImplFromJson(json);

  @override
  final int? id;
  @override
  final int? quantity;
  @override
  final double? price;
  @override
  final double? subtotal;
  @override
  @JsonKey(name: 'discount_percent')
  final double? discountPercent;
  @override
  @JsonKey(name: 'discount_value')
  final double? discountValue;
  @override
  @JsonKey(name: 'price_after_discount')
  final double? priceAfterDiscount;
  @override
  @JsonKey(name: 'product_price')
  final double? productPrice;
  @override
  @JsonKey(name: 'total_product_price')
  final double? totalProductPrice;
  @override
  @JsonKey(name: 'quantity_delivery')
  final int? quantityDelivery;
  @override
  @JsonKey(name: 'quantity_remaining', defaultValue: 0)
  final int? quantityRemaining;
  @override
  @JsonKey(name: 'product_id', fromJson: Product.fromJson)
  final Product? product;
  @override
  @JsonKey(name: 'unit_id')
  final String unit;

  @override
  String toString() {
    return 'ProductRequestDetail(id: $id, quantity: $quantity, price: $price, subtotal: $subtotal, discountPercent: $discountPercent, discountValue: $discountValue, priceAfterDiscount: $priceAfterDiscount, productPrice: $productPrice, totalProductPrice: $totalProductPrice, quantityDelivery: $quantityDelivery, quantityRemaining: $quantityRemaining, product: $product, unit: $unit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductRequestDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discountPercent, discountPercent) ||
                other.discountPercent == discountPercent) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.priceAfterDiscount, priceAfterDiscount) ||
                other.priceAfterDiscount == priceAfterDiscount) &&
            (identical(other.productPrice, productPrice) ||
                other.productPrice == productPrice) &&
            (identical(other.totalProductPrice, totalProductPrice) ||
                other.totalProductPrice == totalProductPrice) &&
            (identical(other.quantityDelivery, quantityDelivery) ||
                other.quantityDelivery == quantityDelivery) &&
            (identical(other.quantityRemaining, quantityRemaining) ||
                other.quantityRemaining == quantityRemaining) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      quantity,
      price,
      subtotal,
      discountPercent,
      discountValue,
      priceAfterDiscount,
      productPrice,
      totalProductPrice,
      quantityDelivery,
      quantityRemaining,
      product,
      unit);

  /// Create a copy of ProductRequestDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductRequestDetailImplCopyWith<_$ProductRequestDetailImpl>
      get copyWith =>
          __$$ProductRequestDetailImplCopyWithImpl<_$ProductRequestDetailImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductRequestDetailImplToJson(
      this,
    );
  }
}

abstract class _ProductRequestDetail extends ProductRequestDetail {
  const factory _ProductRequestDetail(
      {required final int? id,
      required final int? quantity,
      required final double? price,
      required final double? subtotal,
      @JsonKey(name: 'discount_percent') required final double? discountPercent,
      @JsonKey(name: 'discount_value') required final double? discountValue,
      @JsonKey(name: 'price_after_discount')
      required final double? priceAfterDiscount,
      @JsonKey(name: 'product_price') required final double? productPrice,
      @JsonKey(name: 'total_product_price')
      required final double? totalProductPrice,
      @JsonKey(name: 'quantity_delivery') required final int? quantityDelivery,
      @JsonKey(name: 'quantity_remaining', defaultValue: 0)
      required final int? quantityRemaining,
      @JsonKey(name: 'product_id', fromJson: Product.fromJson)
      required final Product? product,
      @JsonKey(name: 'unit_id')
      required final String unit}) = _$ProductRequestDetailImpl;
  const _ProductRequestDetail._() : super._();

  factory _ProductRequestDetail.fromJson(Map<String, dynamic> json) =
      _$ProductRequestDetailImpl.fromJson;

  @override
  int? get id;
  @override
  int? get quantity;
  @override
  double? get price;
  @override
  double? get subtotal;
  @override
  @JsonKey(name: 'discount_percent')
  double? get discountPercent;
  @override
  @JsonKey(name: 'discount_value')
  double? get discountValue;
  @override
  @JsonKey(name: 'price_after_discount')
  double? get priceAfterDiscount;
  @override
  @JsonKey(name: 'product_price')
  double? get productPrice;
  @override
  @JsonKey(name: 'total_product_price')
  double? get totalProductPrice;
  @override
  @JsonKey(name: 'quantity_delivery')
  int? get quantityDelivery;
  @override
  @JsonKey(name: 'quantity_remaining', defaultValue: 0)
  int? get quantityRemaining;
  @override
  @JsonKey(name: 'product_id', fromJson: Product.fromJson)
  Product? get product;
  @override
  @JsonKey(name: 'unit_id')
  String get unit;

  /// Create a copy of ProductRequestDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductRequestDetailImplCopyWith<_$ProductRequestDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}
