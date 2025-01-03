// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$OrderCartEvent {
  ProductStockWithPrice get product => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductStockWithPrice product) increaseQuantity,
    required TResult Function(ProductStockWithPrice product) decreaseQuantity,
    required TResult Function(ProductStockWithPrice product, double quantity)
        setQuantity,
    required TResult Function(ProductStockWithPrice product) removeProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductStockWithPrice product)? increaseQuantity,
    TResult? Function(ProductStockWithPrice product)? decreaseQuantity,
    TResult? Function(ProductStockWithPrice product, double quantity)?
        setQuantity,
    TResult? Function(ProductStockWithPrice product)? removeProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductStockWithPrice product)? increaseQuantity,
    TResult Function(ProductStockWithPrice product)? decreaseQuantity,
    TResult Function(ProductStockWithPrice product, double quantity)?
        setQuantity,
    TResult Function(ProductStockWithPrice product)? removeProduct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IncreaseQuantity value) increaseQuantity,
    required TResult Function(_DecreaseQuantity value) decreaseQuantity,
    required TResult Function(_SetQuantity value) setQuantity,
    required TResult Function(_RemoveProduct value) removeProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IncreaseQuantity value)? increaseQuantity,
    TResult? Function(_DecreaseQuantity value)? decreaseQuantity,
    TResult? Function(_SetQuantity value)? setQuantity,
    TResult? Function(_RemoveProduct value)? removeProduct,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IncreaseQuantity value)? increaseQuantity,
    TResult Function(_DecreaseQuantity value)? decreaseQuantity,
    TResult Function(_SetQuantity value)? setQuantity,
    TResult Function(_RemoveProduct value)? removeProduct,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of OrderCartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderCartEventCopyWith<OrderCartEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCartEventCopyWith<$Res> {
  factory $OrderCartEventCopyWith(
          OrderCartEvent value, $Res Function(OrderCartEvent) then) =
      _$OrderCartEventCopyWithImpl<$Res, OrderCartEvent>;
  @useResult
  $Res call({ProductStockWithPrice product});

  $ProductStockWithPriceCopyWith<$Res> get product;
}

/// @nodoc
class _$OrderCartEventCopyWithImpl<$Res, $Val extends OrderCartEvent>
    implements $OrderCartEventCopyWith<$Res> {
  _$OrderCartEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderCartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductStockWithPrice,
    ) as $Val);
  }

  /// Create a copy of OrderCartEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductStockWithPriceCopyWith<$Res> get product {
    return $ProductStockWithPriceCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$IncreaseQuantityImplCopyWith<$Res>
    implements $OrderCartEventCopyWith<$Res> {
  factory _$$IncreaseQuantityImplCopyWith(_$IncreaseQuantityImpl value,
          $Res Function(_$IncreaseQuantityImpl) then) =
      __$$IncreaseQuantityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProductStockWithPrice product});

  @override
  $ProductStockWithPriceCopyWith<$Res> get product;
}

/// @nodoc
class __$$IncreaseQuantityImplCopyWithImpl<$Res>
    extends _$OrderCartEventCopyWithImpl<$Res, _$IncreaseQuantityImpl>
    implements _$$IncreaseQuantityImplCopyWith<$Res> {
  __$$IncreaseQuantityImplCopyWithImpl(_$IncreaseQuantityImpl _value,
      $Res Function(_$IncreaseQuantityImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderCartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$IncreaseQuantityImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductStockWithPrice,
    ));
  }
}

/// @nodoc

class _$IncreaseQuantityImpl implements _IncreaseQuantity {
  const _$IncreaseQuantityImpl({required this.product});

  @override
  final ProductStockWithPrice product;

  @override
  String toString() {
    return 'OrderCartEvent.increaseQuantity(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncreaseQuantityImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  /// Create a copy of OrderCartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$IncreaseQuantityImplCopyWith<_$IncreaseQuantityImpl> get copyWith =>
      __$$IncreaseQuantityImplCopyWithImpl<_$IncreaseQuantityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductStockWithPrice product) increaseQuantity,
    required TResult Function(ProductStockWithPrice product) decreaseQuantity,
    required TResult Function(ProductStockWithPrice product, double quantity)
        setQuantity,
    required TResult Function(ProductStockWithPrice product) removeProduct,
  }) {
    return increaseQuantity(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductStockWithPrice product)? increaseQuantity,
    TResult? Function(ProductStockWithPrice product)? decreaseQuantity,
    TResult? Function(ProductStockWithPrice product, double quantity)?
        setQuantity,
    TResult? Function(ProductStockWithPrice product)? removeProduct,
  }) {
    return increaseQuantity?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductStockWithPrice product)? increaseQuantity,
    TResult Function(ProductStockWithPrice product)? decreaseQuantity,
    TResult Function(ProductStockWithPrice product, double quantity)?
        setQuantity,
    TResult Function(ProductStockWithPrice product)? removeProduct,
    required TResult orElse(),
  }) {
    if (increaseQuantity != null) {
      return increaseQuantity(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IncreaseQuantity value) increaseQuantity,
    required TResult Function(_DecreaseQuantity value) decreaseQuantity,
    required TResult Function(_SetQuantity value) setQuantity,
    required TResult Function(_RemoveProduct value) removeProduct,
  }) {
    return increaseQuantity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IncreaseQuantity value)? increaseQuantity,
    TResult? Function(_DecreaseQuantity value)? decreaseQuantity,
    TResult? Function(_SetQuantity value)? setQuantity,
    TResult? Function(_RemoveProduct value)? removeProduct,
  }) {
    return increaseQuantity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IncreaseQuantity value)? increaseQuantity,
    TResult Function(_DecreaseQuantity value)? decreaseQuantity,
    TResult Function(_SetQuantity value)? setQuantity,
    TResult Function(_RemoveProduct value)? removeProduct,
    required TResult orElse(),
  }) {
    if (increaseQuantity != null) {
      return increaseQuantity(this);
    }
    return orElse();
  }
}

abstract class _IncreaseQuantity implements OrderCartEvent {
  const factory _IncreaseQuantity(
      {required final ProductStockWithPrice product}) = _$IncreaseQuantityImpl;

  @override
  ProductStockWithPrice get product;

  /// Create a copy of OrderCartEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$IncreaseQuantityImplCopyWith<_$IncreaseQuantityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DecreaseQuantityImplCopyWith<$Res>
    implements $OrderCartEventCopyWith<$Res> {
  factory _$$DecreaseQuantityImplCopyWith(_$DecreaseQuantityImpl value,
          $Res Function(_$DecreaseQuantityImpl) then) =
      __$$DecreaseQuantityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProductStockWithPrice product});

  @override
  $ProductStockWithPriceCopyWith<$Res> get product;
}

/// @nodoc
class __$$DecreaseQuantityImplCopyWithImpl<$Res>
    extends _$OrderCartEventCopyWithImpl<$Res, _$DecreaseQuantityImpl>
    implements _$$DecreaseQuantityImplCopyWith<$Res> {
  __$$DecreaseQuantityImplCopyWithImpl(_$DecreaseQuantityImpl _value,
      $Res Function(_$DecreaseQuantityImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderCartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$DecreaseQuantityImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductStockWithPrice,
    ));
  }
}

/// @nodoc

class _$DecreaseQuantityImpl implements _DecreaseQuantity {
  const _$DecreaseQuantityImpl({required this.product});

  @override
  final ProductStockWithPrice product;

  @override
  String toString() {
    return 'OrderCartEvent.decreaseQuantity(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DecreaseQuantityImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  /// Create a copy of OrderCartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DecreaseQuantityImplCopyWith<_$DecreaseQuantityImpl> get copyWith =>
      __$$DecreaseQuantityImplCopyWithImpl<_$DecreaseQuantityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductStockWithPrice product) increaseQuantity,
    required TResult Function(ProductStockWithPrice product) decreaseQuantity,
    required TResult Function(ProductStockWithPrice product, double quantity)
        setQuantity,
    required TResult Function(ProductStockWithPrice product) removeProduct,
  }) {
    return decreaseQuantity(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductStockWithPrice product)? increaseQuantity,
    TResult? Function(ProductStockWithPrice product)? decreaseQuantity,
    TResult? Function(ProductStockWithPrice product, double quantity)?
        setQuantity,
    TResult? Function(ProductStockWithPrice product)? removeProduct,
  }) {
    return decreaseQuantity?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductStockWithPrice product)? increaseQuantity,
    TResult Function(ProductStockWithPrice product)? decreaseQuantity,
    TResult Function(ProductStockWithPrice product, double quantity)?
        setQuantity,
    TResult Function(ProductStockWithPrice product)? removeProduct,
    required TResult orElse(),
  }) {
    if (decreaseQuantity != null) {
      return decreaseQuantity(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IncreaseQuantity value) increaseQuantity,
    required TResult Function(_DecreaseQuantity value) decreaseQuantity,
    required TResult Function(_SetQuantity value) setQuantity,
    required TResult Function(_RemoveProduct value) removeProduct,
  }) {
    return decreaseQuantity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IncreaseQuantity value)? increaseQuantity,
    TResult? Function(_DecreaseQuantity value)? decreaseQuantity,
    TResult? Function(_SetQuantity value)? setQuantity,
    TResult? Function(_RemoveProduct value)? removeProduct,
  }) {
    return decreaseQuantity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IncreaseQuantity value)? increaseQuantity,
    TResult Function(_DecreaseQuantity value)? decreaseQuantity,
    TResult Function(_SetQuantity value)? setQuantity,
    TResult Function(_RemoveProduct value)? removeProduct,
    required TResult orElse(),
  }) {
    if (decreaseQuantity != null) {
      return decreaseQuantity(this);
    }
    return orElse();
  }
}

abstract class _DecreaseQuantity implements OrderCartEvent {
  const factory _DecreaseQuantity(
      {required final ProductStockWithPrice product}) = _$DecreaseQuantityImpl;

  @override
  ProductStockWithPrice get product;

  /// Create a copy of OrderCartEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DecreaseQuantityImplCopyWith<_$DecreaseQuantityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetQuantityImplCopyWith<$Res>
    implements $OrderCartEventCopyWith<$Res> {
  factory _$$SetQuantityImplCopyWith(
          _$SetQuantityImpl value, $Res Function(_$SetQuantityImpl) then) =
      __$$SetQuantityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProductStockWithPrice product, double quantity});

  @override
  $ProductStockWithPriceCopyWith<$Res> get product;
}

/// @nodoc
class __$$SetQuantityImplCopyWithImpl<$Res>
    extends _$OrderCartEventCopyWithImpl<$Res, _$SetQuantityImpl>
    implements _$$SetQuantityImplCopyWith<$Res> {
  __$$SetQuantityImplCopyWithImpl(
      _$SetQuantityImpl _value, $Res Function(_$SetQuantityImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderCartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? quantity = null,
  }) {
    return _then(_$SetQuantityImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductStockWithPrice,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$SetQuantityImpl implements _SetQuantity {
  const _$SetQuantityImpl({required this.product, required this.quantity});

  @override
  final ProductStockWithPrice product;
  @override
  final double quantity;

  @override
  String toString() {
    return 'OrderCartEvent.setQuantity(product: $product, quantity: $quantity)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetQuantityImpl &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product, quantity);

  /// Create a copy of OrderCartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetQuantityImplCopyWith<_$SetQuantityImpl> get copyWith =>
      __$$SetQuantityImplCopyWithImpl<_$SetQuantityImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductStockWithPrice product) increaseQuantity,
    required TResult Function(ProductStockWithPrice product) decreaseQuantity,
    required TResult Function(ProductStockWithPrice product, double quantity)
        setQuantity,
    required TResult Function(ProductStockWithPrice product) removeProduct,
  }) {
    return setQuantity(product, quantity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductStockWithPrice product)? increaseQuantity,
    TResult? Function(ProductStockWithPrice product)? decreaseQuantity,
    TResult? Function(ProductStockWithPrice product, double quantity)?
        setQuantity,
    TResult? Function(ProductStockWithPrice product)? removeProduct,
  }) {
    return setQuantity?.call(product, quantity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductStockWithPrice product)? increaseQuantity,
    TResult Function(ProductStockWithPrice product)? decreaseQuantity,
    TResult Function(ProductStockWithPrice product, double quantity)?
        setQuantity,
    TResult Function(ProductStockWithPrice product)? removeProduct,
    required TResult orElse(),
  }) {
    if (setQuantity != null) {
      return setQuantity(product, quantity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IncreaseQuantity value) increaseQuantity,
    required TResult Function(_DecreaseQuantity value) decreaseQuantity,
    required TResult Function(_SetQuantity value) setQuantity,
    required TResult Function(_RemoveProduct value) removeProduct,
  }) {
    return setQuantity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IncreaseQuantity value)? increaseQuantity,
    TResult? Function(_DecreaseQuantity value)? decreaseQuantity,
    TResult? Function(_SetQuantity value)? setQuantity,
    TResult? Function(_RemoveProduct value)? removeProduct,
  }) {
    return setQuantity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IncreaseQuantity value)? increaseQuantity,
    TResult Function(_DecreaseQuantity value)? decreaseQuantity,
    TResult Function(_SetQuantity value)? setQuantity,
    TResult Function(_RemoveProduct value)? removeProduct,
    required TResult orElse(),
  }) {
    if (setQuantity != null) {
      return setQuantity(this);
    }
    return orElse();
  }
}

abstract class _SetQuantity implements OrderCartEvent {
  const factory _SetQuantity(
      {required final ProductStockWithPrice product,
      required final double quantity}) = _$SetQuantityImpl;

  @override
  ProductStockWithPrice get product;
  double get quantity;

  /// Create a copy of OrderCartEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetQuantityImplCopyWith<_$SetQuantityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveProductImplCopyWith<$Res>
    implements $OrderCartEventCopyWith<$Res> {
  factory _$$RemoveProductImplCopyWith(
          _$RemoveProductImpl value, $Res Function(_$RemoveProductImpl) then) =
      __$$RemoveProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProductStockWithPrice product});

  @override
  $ProductStockWithPriceCopyWith<$Res> get product;
}

/// @nodoc
class __$$RemoveProductImplCopyWithImpl<$Res>
    extends _$OrderCartEventCopyWithImpl<$Res, _$RemoveProductImpl>
    implements _$$RemoveProductImplCopyWith<$Res> {
  __$$RemoveProductImplCopyWithImpl(
      _$RemoveProductImpl _value, $Res Function(_$RemoveProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of OrderCartEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$RemoveProductImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductStockWithPrice,
    ));
  }
}

/// @nodoc

class _$RemoveProductImpl implements _RemoveProduct {
  const _$RemoveProductImpl({required this.product});

  @override
  final ProductStockWithPrice product;

  @override
  String toString() {
    return 'OrderCartEvent.removeProduct(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveProductImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  /// Create a copy of OrderCartEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveProductImplCopyWith<_$RemoveProductImpl> get copyWith =>
      __$$RemoveProductImplCopyWithImpl<_$RemoveProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductStockWithPrice product) increaseQuantity,
    required TResult Function(ProductStockWithPrice product) decreaseQuantity,
    required TResult Function(ProductStockWithPrice product, double quantity)
        setQuantity,
    required TResult Function(ProductStockWithPrice product) removeProduct,
  }) {
    return removeProduct(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductStockWithPrice product)? increaseQuantity,
    TResult? Function(ProductStockWithPrice product)? decreaseQuantity,
    TResult? Function(ProductStockWithPrice product, double quantity)?
        setQuantity,
    TResult? Function(ProductStockWithPrice product)? removeProduct,
  }) {
    return removeProduct?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductStockWithPrice product)? increaseQuantity,
    TResult Function(ProductStockWithPrice product)? decreaseQuantity,
    TResult Function(ProductStockWithPrice product, double quantity)?
        setQuantity,
    TResult Function(ProductStockWithPrice product)? removeProduct,
    required TResult orElse(),
  }) {
    if (removeProduct != null) {
      return removeProduct(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_IncreaseQuantity value) increaseQuantity,
    required TResult Function(_DecreaseQuantity value) decreaseQuantity,
    required TResult Function(_SetQuantity value) setQuantity,
    required TResult Function(_RemoveProduct value) removeProduct,
  }) {
    return removeProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_IncreaseQuantity value)? increaseQuantity,
    TResult? Function(_DecreaseQuantity value)? decreaseQuantity,
    TResult? Function(_SetQuantity value)? setQuantity,
    TResult? Function(_RemoveProduct value)? removeProduct,
  }) {
    return removeProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_IncreaseQuantity value)? increaseQuantity,
    TResult Function(_DecreaseQuantity value)? decreaseQuantity,
    TResult Function(_SetQuantity value)? setQuantity,
    TResult Function(_RemoveProduct value)? removeProduct,
    required TResult orElse(),
  }) {
    if (removeProduct != null) {
      return removeProduct(this);
    }
    return orElse();
  }
}

abstract class _RemoveProduct implements OrderCartEvent {
  const factory _RemoveProduct({required final ProductStockWithPrice product}) =
      _$RemoveProductImpl;

  @override
  ProductStockWithPrice get product;

  /// Create a copy of OrderCartEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveProductImplCopyWith<_$RemoveProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
