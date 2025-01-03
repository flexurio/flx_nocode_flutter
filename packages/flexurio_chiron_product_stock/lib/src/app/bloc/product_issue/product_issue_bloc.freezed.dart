// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_issue_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductIssueState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductIssueDetail>? products) initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductIssueDetail>? products)? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductIssueDetail>? products)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductIssueStateCopyWith<$Res> {
  factory $ProductIssueStateCopyWith(
          ProductIssueState value, $Res Function(ProductIssueState) then) =
      _$ProductIssueStateCopyWithImpl<$Res, ProductIssueState>;
}

/// @nodoc
class _$ProductIssueStateCopyWithImpl<$Res, $Val extends ProductIssueState>
    implements $ProductIssueStateCopyWith<$Res> {
  _$ProductIssueStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductIssueState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProductIssueDetail>? products});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ProductIssueStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductIssueState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = freezed,
  }) {
    return _then(_$InitialImpl(
      products: freezed == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductIssueDetail>?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({final List<ProductIssueDetail>? products})
      : _products = products;

  final List<ProductIssueDetail>? _products;
  @override
  List<ProductIssueDetail>? get products {
    final value = _products;
    if (value == null) return null;
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ProductIssueState.initial(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  /// Create a copy of ProductIssueState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductIssueDetail>? products) initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return initial(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductIssueDetail>? products)? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductIssueDetail>? products)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ProductIssueState {
  const factory _Initial({final List<ProductIssueDetail>? products}) =
      _$InitialImpl;

  List<ProductIssueDetail>? get products;

  /// Create a copy of ProductIssueState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$ProductIssueStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductIssueState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ProductIssueState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductIssueDetail>? products) initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductIssueDetail>? products)? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductIssueDetail>? products)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ProductIssueState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$ProductIssueStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductIssueState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'ProductIssueState.success()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductIssueDetail>? products) initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductIssueDetail>? products)? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductIssueDetail>? products)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements ProductIssueState {
  const factory _Success() = _$SuccessImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$ProductIssueStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductIssueState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'ProductIssueState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of ProductIssueState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductIssueDetail>? products) initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductIssueDetail>? products)? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductIssueDetail>? products)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ProductIssueState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of ProductIssueState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductIssueEvent {
  ProductIssue get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ProductIssue id,
            DateTime deliveryOrderReceived,
            DateTime deliveryDate,
            String expedition,
            String shippingNo,
            ProductIssueShipmentVia shipmentVia,
            int shippingCharge,
            int packageQty,
            int kilogramQty,
            DateTime endPackingDate)
        deliveryActual,
    required TResult Function(ProductIssue id, DateTime deliveryOrderDate,
            DateTime salesOrderReceiveDate)
        delivery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            ProductIssue id,
            DateTime deliveryOrderReceived,
            DateTime deliveryDate,
            String expedition,
            String shippingNo,
            ProductIssueShipmentVia shipmentVia,
            int shippingCharge,
            int packageQty,
            int kilogramQty,
            DateTime endPackingDate)?
        deliveryActual,
    TResult? Function(ProductIssue id, DateTime deliveryOrderDate,
            DateTime salesOrderReceiveDate)?
        delivery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            ProductIssue id,
            DateTime deliveryOrderReceived,
            DateTime deliveryDate,
            String expedition,
            String shippingNo,
            ProductIssueShipmentVia shipmentVia,
            int shippingCharge,
            int packageQty,
            int kilogramQty,
            DateTime endPackingDate)?
        deliveryActual,
    TResult Function(ProductIssue id, DateTime deliveryOrderDate,
            DateTime salesOrderReceiveDate)?
        delivery,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeliveryActual value) deliveryActual,
    required TResult Function(_Delivery value) delivery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeliveryActual value)? deliveryActual,
    TResult? Function(_Delivery value)? delivery,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeliveryActual value)? deliveryActual,
    TResult Function(_Delivery value)? delivery,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ProductIssueEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductIssueEventCopyWith<ProductIssueEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductIssueEventCopyWith<$Res> {
  factory $ProductIssueEventCopyWith(
          ProductIssueEvent value, $Res Function(ProductIssueEvent) then) =
      _$ProductIssueEventCopyWithImpl<$Res, ProductIssueEvent>;
  @useResult
  $Res call({ProductIssue id});

  $ProductIssueCopyWith<$Res> get id;
}

/// @nodoc
class _$ProductIssueEventCopyWithImpl<$Res, $Val extends ProductIssueEvent>
    implements $ProductIssueEventCopyWith<$Res> {
  _$ProductIssueEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductIssueEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as ProductIssue,
    ) as $Val);
  }

  /// Create a copy of ProductIssueEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductIssueCopyWith<$Res> get id {
    return $ProductIssueCopyWith<$Res>(_value.id, (value) {
      return _then(_value.copyWith(id: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DeliveryActualImplCopyWith<$Res>
    implements $ProductIssueEventCopyWith<$Res> {
  factory _$$DeliveryActualImplCopyWith(_$DeliveryActualImpl value,
          $Res Function(_$DeliveryActualImpl) then) =
      __$$DeliveryActualImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProductIssue id,
      DateTime deliveryOrderReceived,
      DateTime deliveryDate,
      String expedition,
      String shippingNo,
      ProductIssueShipmentVia shipmentVia,
      int shippingCharge,
      int packageQty,
      int kilogramQty,
      DateTime endPackingDate});

  @override
  $ProductIssueCopyWith<$Res> get id;
}

/// @nodoc
class __$$DeliveryActualImplCopyWithImpl<$Res>
    extends _$ProductIssueEventCopyWithImpl<$Res, _$DeliveryActualImpl>
    implements _$$DeliveryActualImplCopyWith<$Res> {
  __$$DeliveryActualImplCopyWithImpl(
      _$DeliveryActualImpl _value, $Res Function(_$DeliveryActualImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductIssueEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deliveryOrderReceived = null,
    Object? deliveryDate = null,
    Object? expedition = null,
    Object? shippingNo = null,
    Object? shipmentVia = null,
    Object? shippingCharge = null,
    Object? packageQty = null,
    Object? kilogramQty = null,
    Object? endPackingDate = null,
  }) {
    return _then(_$DeliveryActualImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as ProductIssue,
      deliveryOrderReceived: null == deliveryOrderReceived
          ? _value.deliveryOrderReceived
          : deliveryOrderReceived // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryDate: null == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      expedition: null == expedition
          ? _value.expedition
          : expedition // ignore: cast_nullable_to_non_nullable
              as String,
      shippingNo: null == shippingNo
          ? _value.shippingNo
          : shippingNo // ignore: cast_nullable_to_non_nullable
              as String,
      shipmentVia: null == shipmentVia
          ? _value.shipmentVia
          : shipmentVia // ignore: cast_nullable_to_non_nullable
              as ProductIssueShipmentVia,
      shippingCharge: null == shippingCharge
          ? _value.shippingCharge
          : shippingCharge // ignore: cast_nullable_to_non_nullable
              as int,
      packageQty: null == packageQty
          ? _value.packageQty
          : packageQty // ignore: cast_nullable_to_non_nullable
              as int,
      kilogramQty: null == kilogramQty
          ? _value.kilogramQty
          : kilogramQty // ignore: cast_nullable_to_non_nullable
              as int,
      endPackingDate: null == endPackingDate
          ? _value.endPackingDate
          : endPackingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$DeliveryActualImpl implements _DeliveryActual {
  const _$DeliveryActualImpl(
      {required this.id,
      required this.deliveryOrderReceived,
      required this.deliveryDate,
      required this.expedition,
      required this.shippingNo,
      required this.shipmentVia,
      required this.shippingCharge,
      required this.packageQty,
      required this.kilogramQty,
      required this.endPackingDate});

  @override
  final ProductIssue id;
  @override
  final DateTime deliveryOrderReceived;
  @override
  final DateTime deliveryDate;
  @override
  final String expedition;
  @override
  final String shippingNo;
  @override
  final ProductIssueShipmentVia shipmentVia;
  @override
  final int shippingCharge;
  @override
  final int packageQty;
  @override
  final int kilogramQty;
  @override
  final DateTime endPackingDate;

  @override
  String toString() {
    return 'ProductIssueEvent.deliveryActual(id: $id, deliveryOrderReceived: $deliveryOrderReceived, deliveryDate: $deliveryDate, expedition: $expedition, shippingNo: $shippingNo, shipmentVia: $shipmentVia, shippingCharge: $shippingCharge, packageQty: $packageQty, kilogramQty: $kilogramQty, endPackingDate: $endPackingDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryActualImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.deliveryOrderReceived, deliveryOrderReceived) ||
                other.deliveryOrderReceived == deliveryOrderReceived) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(other.expedition, expedition) ||
                other.expedition == expedition) &&
            (identical(other.shippingNo, shippingNo) ||
                other.shippingNo == shippingNo) &&
            (identical(other.shipmentVia, shipmentVia) ||
                other.shipmentVia == shipmentVia) &&
            (identical(other.shippingCharge, shippingCharge) ||
                other.shippingCharge == shippingCharge) &&
            (identical(other.packageQty, packageQty) ||
                other.packageQty == packageQty) &&
            (identical(other.kilogramQty, kilogramQty) ||
                other.kilogramQty == kilogramQty) &&
            (identical(other.endPackingDate, endPackingDate) ||
                other.endPackingDate == endPackingDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      deliveryOrderReceived,
      deliveryDate,
      expedition,
      shippingNo,
      shipmentVia,
      shippingCharge,
      packageQty,
      kilogramQty,
      endPackingDate);

  /// Create a copy of ProductIssueEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryActualImplCopyWith<_$DeliveryActualImpl> get copyWith =>
      __$$DeliveryActualImplCopyWithImpl<_$DeliveryActualImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ProductIssue id,
            DateTime deliveryOrderReceived,
            DateTime deliveryDate,
            String expedition,
            String shippingNo,
            ProductIssueShipmentVia shipmentVia,
            int shippingCharge,
            int packageQty,
            int kilogramQty,
            DateTime endPackingDate)
        deliveryActual,
    required TResult Function(ProductIssue id, DateTime deliveryOrderDate,
            DateTime salesOrderReceiveDate)
        delivery,
  }) {
    return deliveryActual(
        id,
        deliveryOrderReceived,
        deliveryDate,
        expedition,
        shippingNo,
        shipmentVia,
        shippingCharge,
        packageQty,
        kilogramQty,
        endPackingDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            ProductIssue id,
            DateTime deliveryOrderReceived,
            DateTime deliveryDate,
            String expedition,
            String shippingNo,
            ProductIssueShipmentVia shipmentVia,
            int shippingCharge,
            int packageQty,
            int kilogramQty,
            DateTime endPackingDate)?
        deliveryActual,
    TResult? Function(ProductIssue id, DateTime deliveryOrderDate,
            DateTime salesOrderReceiveDate)?
        delivery,
  }) {
    return deliveryActual?.call(
        id,
        deliveryOrderReceived,
        deliveryDate,
        expedition,
        shippingNo,
        shipmentVia,
        shippingCharge,
        packageQty,
        kilogramQty,
        endPackingDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            ProductIssue id,
            DateTime deliveryOrderReceived,
            DateTime deliveryDate,
            String expedition,
            String shippingNo,
            ProductIssueShipmentVia shipmentVia,
            int shippingCharge,
            int packageQty,
            int kilogramQty,
            DateTime endPackingDate)?
        deliveryActual,
    TResult Function(ProductIssue id, DateTime deliveryOrderDate,
            DateTime salesOrderReceiveDate)?
        delivery,
    required TResult orElse(),
  }) {
    if (deliveryActual != null) {
      return deliveryActual(
          id,
          deliveryOrderReceived,
          deliveryDate,
          expedition,
          shippingNo,
          shipmentVia,
          shippingCharge,
          packageQty,
          kilogramQty,
          endPackingDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeliveryActual value) deliveryActual,
    required TResult Function(_Delivery value) delivery,
  }) {
    return deliveryActual(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeliveryActual value)? deliveryActual,
    TResult? Function(_Delivery value)? delivery,
  }) {
    return deliveryActual?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeliveryActual value)? deliveryActual,
    TResult Function(_Delivery value)? delivery,
    required TResult orElse(),
  }) {
    if (deliveryActual != null) {
      return deliveryActual(this);
    }
    return orElse();
  }
}

abstract class _DeliveryActual implements ProductIssueEvent {
  const factory _DeliveryActual(
      {required final ProductIssue id,
      required final DateTime deliveryOrderReceived,
      required final DateTime deliveryDate,
      required final String expedition,
      required final String shippingNo,
      required final ProductIssueShipmentVia shipmentVia,
      required final int shippingCharge,
      required final int packageQty,
      required final int kilogramQty,
      required final DateTime endPackingDate}) = _$DeliveryActualImpl;

  @override
  ProductIssue get id;
  DateTime get deliveryOrderReceived;
  DateTime get deliveryDate;
  String get expedition;
  String get shippingNo;
  ProductIssueShipmentVia get shipmentVia;
  int get shippingCharge;
  int get packageQty;
  int get kilogramQty;
  DateTime get endPackingDate;

  /// Create a copy of ProductIssueEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryActualImplCopyWith<_$DeliveryActualImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeliveryImplCopyWith<$Res>
    implements $ProductIssueEventCopyWith<$Res> {
  factory _$$DeliveryImplCopyWith(
          _$DeliveryImpl value, $Res Function(_$DeliveryImpl) then) =
      __$$DeliveryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ProductIssue id,
      DateTime deliveryOrderDate,
      DateTime salesOrderReceiveDate});

  @override
  $ProductIssueCopyWith<$Res> get id;
}

/// @nodoc
class __$$DeliveryImplCopyWithImpl<$Res>
    extends _$ProductIssueEventCopyWithImpl<$Res, _$DeliveryImpl>
    implements _$$DeliveryImplCopyWith<$Res> {
  __$$DeliveryImplCopyWithImpl(
      _$DeliveryImpl _value, $Res Function(_$DeliveryImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductIssueEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? deliveryOrderDate = null,
    Object? salesOrderReceiveDate = null,
  }) {
    return _then(_$DeliveryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as ProductIssue,
      deliveryOrderDate: null == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      salesOrderReceiveDate: null == salesOrderReceiveDate
          ? _value.salesOrderReceiveDate
          : salesOrderReceiveDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$DeliveryImpl implements _Delivery {
  const _$DeliveryImpl(
      {required this.id,
      required this.deliveryOrderDate,
      required this.salesOrderReceiveDate});

  @override
  final ProductIssue id;
  @override
  final DateTime deliveryOrderDate;
  @override
  final DateTime salesOrderReceiveDate;

  @override
  String toString() {
    return 'ProductIssueEvent.delivery(id: $id, deliveryOrderDate: $deliveryOrderDate, salesOrderReceiveDate: $salesOrderReceiveDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeliveryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.deliveryOrderDate, deliveryOrderDate) ||
                other.deliveryOrderDate == deliveryOrderDate) &&
            (identical(other.salesOrderReceiveDate, salesOrderReceiveDate) ||
                other.salesOrderReceiveDate == salesOrderReceiveDate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, deliveryOrderDate, salesOrderReceiveDate);

  /// Create a copy of ProductIssueEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeliveryImplCopyWith<_$DeliveryImpl> get copyWith =>
      __$$DeliveryImplCopyWithImpl<_$DeliveryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            ProductIssue id,
            DateTime deliveryOrderReceived,
            DateTime deliveryDate,
            String expedition,
            String shippingNo,
            ProductIssueShipmentVia shipmentVia,
            int shippingCharge,
            int packageQty,
            int kilogramQty,
            DateTime endPackingDate)
        deliveryActual,
    required TResult Function(ProductIssue id, DateTime deliveryOrderDate,
            DateTime salesOrderReceiveDate)
        delivery,
  }) {
    return delivery(id, deliveryOrderDate, salesOrderReceiveDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            ProductIssue id,
            DateTime deliveryOrderReceived,
            DateTime deliveryDate,
            String expedition,
            String shippingNo,
            ProductIssueShipmentVia shipmentVia,
            int shippingCharge,
            int packageQty,
            int kilogramQty,
            DateTime endPackingDate)?
        deliveryActual,
    TResult? Function(ProductIssue id, DateTime deliveryOrderDate,
            DateTime salesOrderReceiveDate)?
        delivery,
  }) {
    return delivery?.call(id, deliveryOrderDate, salesOrderReceiveDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            ProductIssue id,
            DateTime deliveryOrderReceived,
            DateTime deliveryDate,
            String expedition,
            String shippingNo,
            ProductIssueShipmentVia shipmentVia,
            int shippingCharge,
            int packageQty,
            int kilogramQty,
            DateTime endPackingDate)?
        deliveryActual,
    TResult Function(ProductIssue id, DateTime deliveryOrderDate,
            DateTime salesOrderReceiveDate)?
        delivery,
    required TResult orElse(),
  }) {
    if (delivery != null) {
      return delivery(id, deliveryOrderDate, salesOrderReceiveDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_DeliveryActual value) deliveryActual,
    required TResult Function(_Delivery value) delivery,
  }) {
    return delivery(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_DeliveryActual value)? deliveryActual,
    TResult? Function(_Delivery value)? delivery,
  }) {
    return delivery?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_DeliveryActual value)? deliveryActual,
    TResult Function(_Delivery value)? delivery,
    required TResult orElse(),
  }) {
    if (delivery != null) {
      return delivery(this);
    }
    return orElse();
  }
}

abstract class _Delivery implements ProductIssueEvent {
  const factory _Delivery(
      {required final ProductIssue id,
      required final DateTime deliveryOrderDate,
      required final DateTime salesOrderReceiveDate}) = _$DeliveryImpl;

  @override
  ProductIssue get id;
  DateTime get deliveryOrderDate;
  DateTime get salesOrderReceiveDate;

  /// Create a copy of ProductIssueEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeliveryImplCopyWith<_$DeliveryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
