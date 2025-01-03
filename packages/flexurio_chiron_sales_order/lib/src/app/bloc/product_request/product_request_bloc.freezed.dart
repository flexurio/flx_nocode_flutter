// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_request_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductRequestState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function(List<ProductRequestDetail>? products,
            ProductRequestFormPurchaseOrder? productRequestFormPurchaseOrder)
        initial,
    required TResult Function() loading,
    required TResult Function(String? message) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function(List<ProductRequestDetail>? products,
            ProductRequestFormPurchaseOrder? productRequestFormPurchaseOrder)?
        initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function(List<ProductRequestDetail>? products,
            ProductRequestFormPurchaseOrder? productRequestFormPurchaseOrder)?
        initial,
    TResult Function()? loading,
    TResult Function(String? message)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductRequestStateCopyWith<$Res> {
  factory $ProductRequestStateCopyWith(
          ProductRequestState value, $Res Function(ProductRequestState) then) =
      _$ProductRequestStateCopyWithImpl<$Res, ProductRequestState>;
}

/// @nodoc
class _$ProductRequestStateCopyWithImpl<$Res, $Val extends ProductRequestState>
    implements $ProductRequestStateCopyWith<$Res> {
  _$ProductRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductRequestState
  /// with the given fields replaced by the non-null parameter values.
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
    extends _$ProductRequestStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductRequestState
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
    return 'ProductRequestState.error(error: $error)';
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

  /// Create a copy of ProductRequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function(List<ProductRequestDetail>? products,
            ProductRequestFormPurchaseOrder? productRequestFormPurchaseOrder)
        initial,
    required TResult Function() loading,
    required TResult Function(String? message) success,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function(List<ProductRequestDetail>? products,
            ProductRequestFormPurchaseOrder? productRequestFormPurchaseOrder)?
        initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? success,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function(List<ProductRequestDetail>? products,
            ProductRequestFormPurchaseOrder? productRequestFormPurchaseOrder)?
        initial,
    TResult Function()? loading,
    TResult Function(String? message)? success,
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
    required TResult Function(_Error value) error,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ProductRequestState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of ProductRequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<ProductRequestDetail>? products,
      ProductRequestFormPurchaseOrder? productRequestFormPurchaseOrder});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ProductRequestStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductRequestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = freezed,
    Object? productRequestFormPurchaseOrder = freezed,
  }) {
    return _then(_$InitialImpl(
      products: freezed == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductRequestDetail>?,
      productRequestFormPurchaseOrder: freezed ==
              productRequestFormPurchaseOrder
          ? _value.productRequestFormPurchaseOrder
          : productRequestFormPurchaseOrder // ignore: cast_nullable_to_non_nullable
              as ProductRequestFormPurchaseOrder?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {final List<ProductRequestDetail>? products,
      this.productRequestFormPurchaseOrder})
      : _products = products;

  final List<ProductRequestDetail>? _products;
  @override
  List<ProductRequestDetail>? get products {
    final value = _products;
    if (value == null) return null;
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ProductRequestFormPurchaseOrder? productRequestFormPurchaseOrder;

  @override
  String toString() {
    return 'ProductRequestState.initial(products: $products, productRequestFormPurchaseOrder: $productRequestFormPurchaseOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.productRequestFormPurchaseOrder,
                    productRequestFormPurchaseOrder) ||
                other.productRequestFormPurchaseOrder ==
                    productRequestFormPurchaseOrder));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      productRequestFormPurchaseOrder);

  /// Create a copy of ProductRequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function(List<ProductRequestDetail>? products,
            ProductRequestFormPurchaseOrder? productRequestFormPurchaseOrder)
        initial,
    required TResult Function() loading,
    required TResult Function(String? message) success,
  }) {
    return initial(products, productRequestFormPurchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function(List<ProductRequestDetail>? products,
            ProductRequestFormPurchaseOrder? productRequestFormPurchaseOrder)?
        initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? success,
  }) {
    return initial?.call(products, productRequestFormPurchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function(List<ProductRequestDetail>? products,
            ProductRequestFormPurchaseOrder? productRequestFormPurchaseOrder)?
        initial,
    TResult Function()? loading,
    TResult Function(String? message)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(products, productRequestFormPurchaseOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ProductRequestState {
  const factory _Initial(
      {final List<ProductRequestDetail>? products,
      final ProductRequestFormPurchaseOrder?
          productRequestFormPurchaseOrder}) = _$InitialImpl;

  List<ProductRequestDetail>? get products;
  ProductRequestFormPurchaseOrder? get productRequestFormPurchaseOrder;

  /// Create a copy of ProductRequestState
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
    extends _$ProductRequestStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductRequestState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ProductRequestState.loading()';
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
    required TResult Function(String error) error,
    required TResult Function(List<ProductRequestDetail>? products,
            ProductRequestFormPurchaseOrder? productRequestFormPurchaseOrder)
        initial,
    required TResult Function() loading,
    required TResult Function(String? message) success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function(List<ProductRequestDetail>? products,
            ProductRequestFormPurchaseOrder? productRequestFormPurchaseOrder)?
        initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function(List<ProductRequestDetail>? products,
            ProductRequestFormPurchaseOrder? productRequestFormPurchaseOrder)?
        initial,
    TResult Function()? loading,
    TResult Function(String? message)? success,
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
    required TResult Function(_Error value) error,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ProductRequestState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$ProductRequestStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductRequestState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$SuccessImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'ProductRequestState.success(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ProductRequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function(List<ProductRequestDetail>? products,
            ProductRequestFormPurchaseOrder? productRequestFormPurchaseOrder)
        initial,
    required TResult Function() loading,
    required TResult Function(String? message) success,
  }) {
    return success(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function(List<ProductRequestDetail>? products,
            ProductRequestFormPurchaseOrder? productRequestFormPurchaseOrder)?
        initial,
    TResult? Function()? loading,
    TResult? Function(String? message)? success,
  }) {
    return success?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function(List<ProductRequestDetail>? products,
            ProductRequestFormPurchaseOrder? productRequestFormPurchaseOrder)?
        initial,
    TResult Function()? loading,
    TResult Function(String? message)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements ProductRequestState {
  const factory _Success({final String? message}) = _$SuccessImpl;

  String? get message;

  /// Create a copy of ProductRequestState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductRequestEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductRequestDetail> products)
        addAllProduct,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        cancelConfirm,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        confirm,
    required TResult Function(ProductRequestDetail productRequestDetail)
        createFormProductToLocal,
    required TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        createFormPurchaseOrderToLocal,
    required TResult Function(ProductRequest productRequest) delete,
    required TResult Function(ProductRequestDetail productRequestDetail)
        deleteDetail,
    required TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        editFormPurchaseOrder,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)
        editProductionRequestDetail,
    required TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)
        createNewProductDetail,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        initialize,
    required TResult Function(ProductRequestDetail detail) remove,
    required TResult Function() submit,
    required TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)
        submitSalesOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult? Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult? Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult? Function(ProductRequest productRequest)? delete,
    TResult? Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult? Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult? Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult? Function(ProductRequestDetail detail)? remove,
    TResult? Function()? submit,
    TResult? Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult Function(ProductRequest productRequest)? delete,
    TResult Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult Function(ProductRequestDetail detail)? remove,
    TResult Function()? submit,
    TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAllProduct value) addAllProduct,
    required TResult Function(_CancelConfirm value) cancelConfirm,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_CreateFormProductToLocal value)
        createFormProductToLocal,
    required TResult Function(_CreateFormPurchaseOrderToLocal value)
        createFormPurchaseOrderToLocal,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteDetail value) deleteDetail,
    required TResult Function(_EditFormPurchaseOrder value)
        editFormPurchaseOrder,
    required TResult Function(_EditProductionRequestDetail value)
        editProductionRequestDetail,
    required TResult Function(_CreateNewProductDetail value)
        createNewProductDetail,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitSalesOrder value) submitSalesOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAllProduct value)? addAllProduct,
    TResult? Function(_CancelConfirm value)? cancelConfirm,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_CreateFormProductToLocal value)?
        createFormProductToLocal,
    TResult? Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteDetail value)? deleteDetail,
    TResult? Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult? Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult? Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitSalesOrder value)? submitSalesOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAllProduct value)? addAllProduct,
    TResult Function(_CancelConfirm value)? cancelConfirm,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_CreateFormProductToLocal value)? createFormProductToLocal,
    TResult Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteDetail value)? deleteDetail,
    TResult Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Remove value)? remove,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitSalesOrder value)? submitSalesOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductRequestEventCopyWith<$Res> {
  factory $ProductRequestEventCopyWith(
          ProductRequestEvent value, $Res Function(ProductRequestEvent) then) =
      _$ProductRequestEventCopyWithImpl<$Res, ProductRequestEvent>;
}

/// @nodoc
class _$ProductRequestEventCopyWithImpl<$Res, $Val extends ProductRequestEvent>
    implements $ProductRequestEventCopyWith<$Res> {
  _$ProductRequestEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AddAllProductImplCopyWith<$Res> {
  factory _$$AddAllProductImplCopyWith(
          _$AddAllProductImpl value, $Res Function(_$AddAllProductImpl) then) =
      __$$AddAllProductImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<ProductRequestDetail> products});
}

/// @nodoc
class __$$AddAllProductImplCopyWithImpl<$Res>
    extends _$ProductRequestEventCopyWithImpl<$Res, _$AddAllProductImpl>
    implements _$$AddAllProductImplCopyWith<$Res> {
  __$$AddAllProductImplCopyWithImpl(
      _$AddAllProductImpl _value, $Res Function(_$AddAllProductImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$AddAllProductImpl(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductRequestDetail>,
    ));
  }
}

/// @nodoc

class _$AddAllProductImpl implements _AddAllProduct {
  const _$AddAllProductImpl(
      {required final List<ProductRequestDetail> products})
      : _products = products;

  final List<ProductRequestDetail> _products;
  @override
  List<ProductRequestDetail> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'ProductRequestEvent.addAllProduct(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddAllProductImpl &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_products));

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddAllProductImplCopyWith<_$AddAllProductImpl> get copyWith =>
      __$$AddAllProductImplCopyWithImpl<_$AddAllProductImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductRequestDetail> products)
        addAllProduct,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        cancelConfirm,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        confirm,
    required TResult Function(ProductRequestDetail productRequestDetail)
        createFormProductToLocal,
    required TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        createFormPurchaseOrderToLocal,
    required TResult Function(ProductRequest productRequest) delete,
    required TResult Function(ProductRequestDetail productRequestDetail)
        deleteDetail,
    required TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        editFormPurchaseOrder,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)
        editProductionRequestDetail,
    required TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)
        createNewProductDetail,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        initialize,
    required TResult Function(ProductRequestDetail detail) remove,
    required TResult Function() submit,
    required TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)
        submitSalesOrder,
  }) {
    return addAllProduct(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult? Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult? Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult? Function(ProductRequest productRequest)? delete,
    TResult? Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult? Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult? Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult? Function(ProductRequestDetail detail)? remove,
    TResult? Function()? submit,
    TResult? Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
  }) {
    return addAllProduct?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult Function(ProductRequest productRequest)? delete,
    TResult Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult Function(ProductRequestDetail detail)? remove,
    TResult Function()? submit,
    TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
    required TResult orElse(),
  }) {
    if (addAllProduct != null) {
      return addAllProduct(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAllProduct value) addAllProduct,
    required TResult Function(_CancelConfirm value) cancelConfirm,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_CreateFormProductToLocal value)
        createFormProductToLocal,
    required TResult Function(_CreateFormPurchaseOrderToLocal value)
        createFormPurchaseOrderToLocal,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteDetail value) deleteDetail,
    required TResult Function(_EditFormPurchaseOrder value)
        editFormPurchaseOrder,
    required TResult Function(_EditProductionRequestDetail value)
        editProductionRequestDetail,
    required TResult Function(_CreateNewProductDetail value)
        createNewProductDetail,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitSalesOrder value) submitSalesOrder,
  }) {
    return addAllProduct(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAllProduct value)? addAllProduct,
    TResult? Function(_CancelConfirm value)? cancelConfirm,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_CreateFormProductToLocal value)?
        createFormProductToLocal,
    TResult? Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteDetail value)? deleteDetail,
    TResult? Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult? Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult? Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitSalesOrder value)? submitSalesOrder,
  }) {
    return addAllProduct?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAllProduct value)? addAllProduct,
    TResult Function(_CancelConfirm value)? cancelConfirm,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_CreateFormProductToLocal value)? createFormProductToLocal,
    TResult Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteDetail value)? deleteDetail,
    TResult Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Remove value)? remove,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitSalesOrder value)? submitSalesOrder,
    required TResult orElse(),
  }) {
    if (addAllProduct != null) {
      return addAllProduct(this);
    }
    return orElse();
  }
}

abstract class _AddAllProduct implements ProductRequestEvent {
  const factory _AddAllProduct(
          {required final List<ProductRequestDetail> products}) =
      _$AddAllProductImpl;

  List<ProductRequestDetail> get products;

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddAllProductImplCopyWith<_$AddAllProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CancelConfirmImplCopyWith<$Res> {
  factory _$$CancelConfirmImplCopyWith(
          _$CancelConfirmImpl value, $Res Function(_$CancelConfirmImpl) then) =
      __$$CancelConfirmImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductRequestFormPurchaseOrder productRequest});
}

/// @nodoc
class __$$CancelConfirmImplCopyWithImpl<$Res>
    extends _$ProductRequestEventCopyWithImpl<$Res, _$CancelConfirmImpl>
    implements _$$CancelConfirmImplCopyWith<$Res> {
  __$$CancelConfirmImplCopyWithImpl(
      _$CancelConfirmImpl _value, $Res Function(_$CancelConfirmImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productRequest = null,
  }) {
    return _then(_$CancelConfirmImpl(
      productRequest: null == productRequest
          ? _value.productRequest
          : productRequest // ignore: cast_nullable_to_non_nullable
              as ProductRequestFormPurchaseOrder,
    ));
  }
}

/// @nodoc

class _$CancelConfirmImpl implements _CancelConfirm {
  const _$CancelConfirmImpl({required this.productRequest});

  @override
  final ProductRequestFormPurchaseOrder productRequest;

  @override
  String toString() {
    return 'ProductRequestEvent.cancelConfirm(productRequest: $productRequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CancelConfirmImpl &&
            (identical(other.productRequest, productRequest) ||
                other.productRequest == productRequest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productRequest);

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CancelConfirmImplCopyWith<_$CancelConfirmImpl> get copyWith =>
      __$$CancelConfirmImplCopyWithImpl<_$CancelConfirmImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductRequestDetail> products)
        addAllProduct,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        cancelConfirm,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        confirm,
    required TResult Function(ProductRequestDetail productRequestDetail)
        createFormProductToLocal,
    required TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        createFormPurchaseOrderToLocal,
    required TResult Function(ProductRequest productRequest) delete,
    required TResult Function(ProductRequestDetail productRequestDetail)
        deleteDetail,
    required TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        editFormPurchaseOrder,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)
        editProductionRequestDetail,
    required TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)
        createNewProductDetail,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        initialize,
    required TResult Function(ProductRequestDetail detail) remove,
    required TResult Function() submit,
    required TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)
        submitSalesOrder,
  }) {
    return cancelConfirm(productRequest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult? Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult? Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult? Function(ProductRequest productRequest)? delete,
    TResult? Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult? Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult? Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult? Function(ProductRequestDetail detail)? remove,
    TResult? Function()? submit,
    TResult? Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
  }) {
    return cancelConfirm?.call(productRequest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult Function(ProductRequest productRequest)? delete,
    TResult Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult Function(ProductRequestDetail detail)? remove,
    TResult Function()? submit,
    TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
    required TResult orElse(),
  }) {
    if (cancelConfirm != null) {
      return cancelConfirm(productRequest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAllProduct value) addAllProduct,
    required TResult Function(_CancelConfirm value) cancelConfirm,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_CreateFormProductToLocal value)
        createFormProductToLocal,
    required TResult Function(_CreateFormPurchaseOrderToLocal value)
        createFormPurchaseOrderToLocal,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteDetail value) deleteDetail,
    required TResult Function(_EditFormPurchaseOrder value)
        editFormPurchaseOrder,
    required TResult Function(_EditProductionRequestDetail value)
        editProductionRequestDetail,
    required TResult Function(_CreateNewProductDetail value)
        createNewProductDetail,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitSalesOrder value) submitSalesOrder,
  }) {
    return cancelConfirm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAllProduct value)? addAllProduct,
    TResult? Function(_CancelConfirm value)? cancelConfirm,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_CreateFormProductToLocal value)?
        createFormProductToLocal,
    TResult? Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteDetail value)? deleteDetail,
    TResult? Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult? Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult? Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitSalesOrder value)? submitSalesOrder,
  }) {
    return cancelConfirm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAllProduct value)? addAllProduct,
    TResult Function(_CancelConfirm value)? cancelConfirm,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_CreateFormProductToLocal value)? createFormProductToLocal,
    TResult Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteDetail value)? deleteDetail,
    TResult Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Remove value)? remove,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitSalesOrder value)? submitSalesOrder,
    required TResult orElse(),
  }) {
    if (cancelConfirm != null) {
      return cancelConfirm(this);
    }
    return orElse();
  }
}

abstract class _CancelConfirm implements ProductRequestEvent {
  const factory _CancelConfirm(
          {required final ProductRequestFormPurchaseOrder productRequest}) =
      _$CancelConfirmImpl;

  ProductRequestFormPurchaseOrder get productRequest;

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CancelConfirmImplCopyWith<_$CancelConfirmImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfirmImplCopyWith<$Res> {
  factory _$$ConfirmImplCopyWith(
          _$ConfirmImpl value, $Res Function(_$ConfirmImpl) then) =
      __$$ConfirmImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductRequestFormPurchaseOrder productRequest});
}

/// @nodoc
class __$$ConfirmImplCopyWithImpl<$Res>
    extends _$ProductRequestEventCopyWithImpl<$Res, _$ConfirmImpl>
    implements _$$ConfirmImplCopyWith<$Res> {
  __$$ConfirmImplCopyWithImpl(
      _$ConfirmImpl _value, $Res Function(_$ConfirmImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productRequest = null,
  }) {
    return _then(_$ConfirmImpl(
      productRequest: null == productRequest
          ? _value.productRequest
          : productRequest // ignore: cast_nullable_to_non_nullable
              as ProductRequestFormPurchaseOrder,
    ));
  }
}

/// @nodoc

class _$ConfirmImpl implements _Confirm {
  const _$ConfirmImpl({required this.productRequest});

  @override
  final ProductRequestFormPurchaseOrder productRequest;

  @override
  String toString() {
    return 'ProductRequestEvent.confirm(productRequest: $productRequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmImpl &&
            (identical(other.productRequest, productRequest) ||
                other.productRequest == productRequest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productRequest);

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmImplCopyWith<_$ConfirmImpl> get copyWith =>
      __$$ConfirmImplCopyWithImpl<_$ConfirmImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductRequestDetail> products)
        addAllProduct,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        cancelConfirm,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        confirm,
    required TResult Function(ProductRequestDetail productRequestDetail)
        createFormProductToLocal,
    required TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        createFormPurchaseOrderToLocal,
    required TResult Function(ProductRequest productRequest) delete,
    required TResult Function(ProductRequestDetail productRequestDetail)
        deleteDetail,
    required TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        editFormPurchaseOrder,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)
        editProductionRequestDetail,
    required TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)
        createNewProductDetail,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        initialize,
    required TResult Function(ProductRequestDetail detail) remove,
    required TResult Function() submit,
    required TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)
        submitSalesOrder,
  }) {
    return confirm(productRequest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult? Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult? Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult? Function(ProductRequest productRequest)? delete,
    TResult? Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult? Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult? Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult? Function(ProductRequestDetail detail)? remove,
    TResult? Function()? submit,
    TResult? Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
  }) {
    return confirm?.call(productRequest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult Function(ProductRequest productRequest)? delete,
    TResult Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult Function(ProductRequestDetail detail)? remove,
    TResult Function()? submit,
    TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
    required TResult orElse(),
  }) {
    if (confirm != null) {
      return confirm(productRequest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAllProduct value) addAllProduct,
    required TResult Function(_CancelConfirm value) cancelConfirm,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_CreateFormProductToLocal value)
        createFormProductToLocal,
    required TResult Function(_CreateFormPurchaseOrderToLocal value)
        createFormPurchaseOrderToLocal,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteDetail value) deleteDetail,
    required TResult Function(_EditFormPurchaseOrder value)
        editFormPurchaseOrder,
    required TResult Function(_EditProductionRequestDetail value)
        editProductionRequestDetail,
    required TResult Function(_CreateNewProductDetail value)
        createNewProductDetail,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitSalesOrder value) submitSalesOrder,
  }) {
    return confirm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAllProduct value)? addAllProduct,
    TResult? Function(_CancelConfirm value)? cancelConfirm,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_CreateFormProductToLocal value)?
        createFormProductToLocal,
    TResult? Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteDetail value)? deleteDetail,
    TResult? Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult? Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult? Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitSalesOrder value)? submitSalesOrder,
  }) {
    return confirm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAllProduct value)? addAllProduct,
    TResult Function(_CancelConfirm value)? cancelConfirm,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_CreateFormProductToLocal value)? createFormProductToLocal,
    TResult Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteDetail value)? deleteDetail,
    TResult Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Remove value)? remove,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitSalesOrder value)? submitSalesOrder,
    required TResult orElse(),
  }) {
    if (confirm != null) {
      return confirm(this);
    }
    return orElse();
  }
}

abstract class _Confirm implements ProductRequestEvent {
  const factory _Confirm(
          {required final ProductRequestFormPurchaseOrder productRequest}) =
      _$ConfirmImpl;

  ProductRequestFormPurchaseOrder get productRequest;

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfirmImplCopyWith<_$ConfirmImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateFormProductToLocalImplCopyWith<$Res> {
  factory _$$CreateFormProductToLocalImplCopyWith(
          _$CreateFormProductToLocalImpl value,
          $Res Function(_$CreateFormProductToLocalImpl) then) =
      __$$CreateFormProductToLocalImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductRequestDetail productRequestDetail});

  $ProductRequestDetailCopyWith<$Res> get productRequestDetail;
}

/// @nodoc
class __$$CreateFormProductToLocalImplCopyWithImpl<$Res>
    extends _$ProductRequestEventCopyWithImpl<$Res,
        _$CreateFormProductToLocalImpl>
    implements _$$CreateFormProductToLocalImplCopyWith<$Res> {
  __$$CreateFormProductToLocalImplCopyWithImpl(
      _$CreateFormProductToLocalImpl _value,
      $Res Function(_$CreateFormProductToLocalImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productRequestDetail = null,
  }) {
    return _then(_$CreateFormProductToLocalImpl(
      productRequestDetail: null == productRequestDetail
          ? _value.productRequestDetail
          : productRequestDetail // ignore: cast_nullable_to_non_nullable
              as ProductRequestDetail,
    ));
  }

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductRequestDetailCopyWith<$Res> get productRequestDetail {
    return $ProductRequestDetailCopyWith<$Res>(_value.productRequestDetail,
        (value) {
      return _then(_value.copyWith(productRequestDetail: value));
    });
  }
}

/// @nodoc

class _$CreateFormProductToLocalImpl implements _CreateFormProductToLocal {
  const _$CreateFormProductToLocalImpl({required this.productRequestDetail});

  @override
  final ProductRequestDetail productRequestDetail;

  @override
  String toString() {
    return 'ProductRequestEvent.createFormProductToLocal(productRequestDetail: $productRequestDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFormProductToLocalImpl &&
            (identical(other.productRequestDetail, productRequestDetail) ||
                other.productRequestDetail == productRequestDetail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productRequestDetail);

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFormProductToLocalImplCopyWith<_$CreateFormProductToLocalImpl>
      get copyWith => __$$CreateFormProductToLocalImplCopyWithImpl<
          _$CreateFormProductToLocalImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductRequestDetail> products)
        addAllProduct,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        cancelConfirm,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        confirm,
    required TResult Function(ProductRequestDetail productRequestDetail)
        createFormProductToLocal,
    required TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        createFormPurchaseOrderToLocal,
    required TResult Function(ProductRequest productRequest) delete,
    required TResult Function(ProductRequestDetail productRequestDetail)
        deleteDetail,
    required TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        editFormPurchaseOrder,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)
        editProductionRequestDetail,
    required TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)
        createNewProductDetail,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        initialize,
    required TResult Function(ProductRequestDetail detail) remove,
    required TResult Function() submit,
    required TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)
        submitSalesOrder,
  }) {
    return createFormProductToLocal(productRequestDetail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult? Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult? Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult? Function(ProductRequest productRequest)? delete,
    TResult? Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult? Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult? Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult? Function(ProductRequestDetail detail)? remove,
    TResult? Function()? submit,
    TResult? Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
  }) {
    return createFormProductToLocal?.call(productRequestDetail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult Function(ProductRequest productRequest)? delete,
    TResult Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult Function(ProductRequestDetail detail)? remove,
    TResult Function()? submit,
    TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
    required TResult orElse(),
  }) {
    if (createFormProductToLocal != null) {
      return createFormProductToLocal(productRequestDetail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAllProduct value) addAllProduct,
    required TResult Function(_CancelConfirm value) cancelConfirm,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_CreateFormProductToLocal value)
        createFormProductToLocal,
    required TResult Function(_CreateFormPurchaseOrderToLocal value)
        createFormPurchaseOrderToLocal,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteDetail value) deleteDetail,
    required TResult Function(_EditFormPurchaseOrder value)
        editFormPurchaseOrder,
    required TResult Function(_EditProductionRequestDetail value)
        editProductionRequestDetail,
    required TResult Function(_CreateNewProductDetail value)
        createNewProductDetail,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitSalesOrder value) submitSalesOrder,
  }) {
    return createFormProductToLocal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAllProduct value)? addAllProduct,
    TResult? Function(_CancelConfirm value)? cancelConfirm,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_CreateFormProductToLocal value)?
        createFormProductToLocal,
    TResult? Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteDetail value)? deleteDetail,
    TResult? Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult? Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult? Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitSalesOrder value)? submitSalesOrder,
  }) {
    return createFormProductToLocal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAllProduct value)? addAllProduct,
    TResult Function(_CancelConfirm value)? cancelConfirm,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_CreateFormProductToLocal value)? createFormProductToLocal,
    TResult Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteDetail value)? deleteDetail,
    TResult Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Remove value)? remove,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitSalesOrder value)? submitSalesOrder,
    required TResult orElse(),
  }) {
    if (createFormProductToLocal != null) {
      return createFormProductToLocal(this);
    }
    return orElse();
  }
}

abstract class _CreateFormProductToLocal implements ProductRequestEvent {
  const factory _CreateFormProductToLocal(
          {required final ProductRequestDetail productRequestDetail}) =
      _$CreateFormProductToLocalImpl;

  ProductRequestDetail get productRequestDetail;

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFormProductToLocalImplCopyWith<_$CreateFormProductToLocalImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateFormPurchaseOrderToLocalImplCopyWith<$Res> {
  factory _$$CreateFormPurchaseOrderToLocalImplCopyWith(
          _$CreateFormPurchaseOrderToLocalImpl value,
          $Res Function(_$CreateFormPurchaseOrderToLocalImpl) then) =
      __$$CreateFormPurchaseOrderToLocalImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder});
}

/// @nodoc
class __$$CreateFormPurchaseOrderToLocalImplCopyWithImpl<$Res>
    extends _$ProductRequestEventCopyWithImpl<$Res,
        _$CreateFormPurchaseOrderToLocalImpl>
    implements _$$CreateFormPurchaseOrderToLocalImplCopyWith<$Res> {
  __$$CreateFormPurchaseOrderToLocalImplCopyWithImpl(
      _$CreateFormPurchaseOrderToLocalImpl _value,
      $Res Function(_$CreateFormPurchaseOrderToLocalImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productRequestFormPurchaseOrder = null,
  }) {
    return _then(_$CreateFormPurchaseOrderToLocalImpl(
      null == productRequestFormPurchaseOrder
          ? _value.productRequestFormPurchaseOrder
          : productRequestFormPurchaseOrder // ignore: cast_nullable_to_non_nullable
              as ProductRequestFormPurchaseOrder,
    ));
  }
}

/// @nodoc

class _$CreateFormPurchaseOrderToLocalImpl
    implements _CreateFormPurchaseOrderToLocal {
  const _$CreateFormPurchaseOrderToLocalImpl(
      this.productRequestFormPurchaseOrder);

  @override
  final ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder;

  @override
  String toString() {
    return 'ProductRequestEvent.createFormPurchaseOrderToLocal(productRequestFormPurchaseOrder: $productRequestFormPurchaseOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFormPurchaseOrderToLocalImpl &&
            (identical(other.productRequestFormPurchaseOrder,
                    productRequestFormPurchaseOrder) ||
                other.productRequestFormPurchaseOrder ==
                    productRequestFormPurchaseOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productRequestFormPurchaseOrder);

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFormPurchaseOrderToLocalImplCopyWith<
          _$CreateFormPurchaseOrderToLocalImpl>
      get copyWith => __$$CreateFormPurchaseOrderToLocalImplCopyWithImpl<
          _$CreateFormPurchaseOrderToLocalImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductRequestDetail> products)
        addAllProduct,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        cancelConfirm,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        confirm,
    required TResult Function(ProductRequestDetail productRequestDetail)
        createFormProductToLocal,
    required TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        createFormPurchaseOrderToLocal,
    required TResult Function(ProductRequest productRequest) delete,
    required TResult Function(ProductRequestDetail productRequestDetail)
        deleteDetail,
    required TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        editFormPurchaseOrder,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)
        editProductionRequestDetail,
    required TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)
        createNewProductDetail,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        initialize,
    required TResult Function(ProductRequestDetail detail) remove,
    required TResult Function() submit,
    required TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)
        submitSalesOrder,
  }) {
    return createFormPurchaseOrderToLocal(productRequestFormPurchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult? Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult? Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult? Function(ProductRequest productRequest)? delete,
    TResult? Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult? Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult? Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult? Function(ProductRequestDetail detail)? remove,
    TResult? Function()? submit,
    TResult? Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
  }) {
    return createFormPurchaseOrderToLocal
        ?.call(productRequestFormPurchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult Function(ProductRequest productRequest)? delete,
    TResult Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult Function(ProductRequestDetail detail)? remove,
    TResult Function()? submit,
    TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
    required TResult orElse(),
  }) {
    if (createFormPurchaseOrderToLocal != null) {
      return createFormPurchaseOrderToLocal(productRequestFormPurchaseOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAllProduct value) addAllProduct,
    required TResult Function(_CancelConfirm value) cancelConfirm,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_CreateFormProductToLocal value)
        createFormProductToLocal,
    required TResult Function(_CreateFormPurchaseOrderToLocal value)
        createFormPurchaseOrderToLocal,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteDetail value) deleteDetail,
    required TResult Function(_EditFormPurchaseOrder value)
        editFormPurchaseOrder,
    required TResult Function(_EditProductionRequestDetail value)
        editProductionRequestDetail,
    required TResult Function(_CreateNewProductDetail value)
        createNewProductDetail,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitSalesOrder value) submitSalesOrder,
  }) {
    return createFormPurchaseOrderToLocal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAllProduct value)? addAllProduct,
    TResult? Function(_CancelConfirm value)? cancelConfirm,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_CreateFormProductToLocal value)?
        createFormProductToLocal,
    TResult? Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteDetail value)? deleteDetail,
    TResult? Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult? Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult? Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitSalesOrder value)? submitSalesOrder,
  }) {
    return createFormPurchaseOrderToLocal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAllProduct value)? addAllProduct,
    TResult Function(_CancelConfirm value)? cancelConfirm,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_CreateFormProductToLocal value)? createFormProductToLocal,
    TResult Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteDetail value)? deleteDetail,
    TResult Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Remove value)? remove,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitSalesOrder value)? submitSalesOrder,
    required TResult orElse(),
  }) {
    if (createFormPurchaseOrderToLocal != null) {
      return createFormPurchaseOrderToLocal(this);
    }
    return orElse();
  }
}

abstract class _CreateFormPurchaseOrderToLocal implements ProductRequestEvent {
  const factory _CreateFormPurchaseOrderToLocal(
          final ProductRequestFormPurchaseOrder
              productRequestFormPurchaseOrder) =
      _$CreateFormPurchaseOrderToLocalImpl;

  ProductRequestFormPurchaseOrder get productRequestFormPurchaseOrder;

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFormPurchaseOrderToLocalImplCopyWith<
          _$CreateFormPurchaseOrderToLocalImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductRequest productRequest});

  $ProductRequestCopyWith<$Res> get productRequest;
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$ProductRequestEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productRequest = null,
  }) {
    return _then(_$DeleteImpl(
      null == productRequest
          ? _value.productRequest
          : productRequest // ignore: cast_nullable_to_non_nullable
              as ProductRequest,
    ));
  }

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductRequestCopyWith<$Res> get productRequest {
    return $ProductRequestCopyWith<$Res>(_value.productRequest, (value) {
      return _then(_value.copyWith(productRequest: value));
    });
  }
}

/// @nodoc

class _$DeleteImpl implements _Delete {
  const _$DeleteImpl(this.productRequest);

  @override
  final ProductRequest productRequest;

  @override
  String toString() {
    return 'ProductRequestEvent.delete(productRequest: $productRequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteImpl &&
            (identical(other.productRequest, productRequest) ||
                other.productRequest == productRequest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productRequest);

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      __$$DeleteImplCopyWithImpl<_$DeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductRequestDetail> products)
        addAllProduct,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        cancelConfirm,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        confirm,
    required TResult Function(ProductRequestDetail productRequestDetail)
        createFormProductToLocal,
    required TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        createFormPurchaseOrderToLocal,
    required TResult Function(ProductRequest productRequest) delete,
    required TResult Function(ProductRequestDetail productRequestDetail)
        deleteDetail,
    required TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        editFormPurchaseOrder,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)
        editProductionRequestDetail,
    required TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)
        createNewProductDetail,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        initialize,
    required TResult Function(ProductRequestDetail detail) remove,
    required TResult Function() submit,
    required TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)
        submitSalesOrder,
  }) {
    return delete(productRequest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult? Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult? Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult? Function(ProductRequest productRequest)? delete,
    TResult? Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult? Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult? Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult? Function(ProductRequestDetail detail)? remove,
    TResult? Function()? submit,
    TResult? Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
  }) {
    return delete?.call(productRequest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult Function(ProductRequest productRequest)? delete,
    TResult Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult Function(ProductRequestDetail detail)? remove,
    TResult Function()? submit,
    TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(productRequest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAllProduct value) addAllProduct,
    required TResult Function(_CancelConfirm value) cancelConfirm,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_CreateFormProductToLocal value)
        createFormProductToLocal,
    required TResult Function(_CreateFormPurchaseOrderToLocal value)
        createFormPurchaseOrderToLocal,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteDetail value) deleteDetail,
    required TResult Function(_EditFormPurchaseOrder value)
        editFormPurchaseOrder,
    required TResult Function(_EditProductionRequestDetail value)
        editProductionRequestDetail,
    required TResult Function(_CreateNewProductDetail value)
        createNewProductDetail,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitSalesOrder value) submitSalesOrder,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAllProduct value)? addAllProduct,
    TResult? Function(_CancelConfirm value)? cancelConfirm,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_CreateFormProductToLocal value)?
        createFormProductToLocal,
    TResult? Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteDetail value)? deleteDetail,
    TResult? Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult? Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult? Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitSalesOrder value)? submitSalesOrder,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAllProduct value)? addAllProduct,
    TResult Function(_CancelConfirm value)? cancelConfirm,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_CreateFormProductToLocal value)? createFormProductToLocal,
    TResult Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteDetail value)? deleteDetail,
    TResult Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Remove value)? remove,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitSalesOrder value)? submitSalesOrder,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements ProductRequestEvent {
  const factory _Delete(final ProductRequest productRequest) = _$DeleteImpl;

  ProductRequest get productRequest;

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteDetailImplCopyWith<$Res> {
  factory _$$DeleteDetailImplCopyWith(
          _$DeleteDetailImpl value, $Res Function(_$DeleteDetailImpl) then) =
      __$$DeleteDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductRequestDetail productRequestDetail});

  $ProductRequestDetailCopyWith<$Res> get productRequestDetail;
}

/// @nodoc
class __$$DeleteDetailImplCopyWithImpl<$Res>
    extends _$ProductRequestEventCopyWithImpl<$Res, _$DeleteDetailImpl>
    implements _$$DeleteDetailImplCopyWith<$Res> {
  __$$DeleteDetailImplCopyWithImpl(
      _$DeleteDetailImpl _value, $Res Function(_$DeleteDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productRequestDetail = null,
  }) {
    return _then(_$DeleteDetailImpl(
      null == productRequestDetail
          ? _value.productRequestDetail
          : productRequestDetail // ignore: cast_nullable_to_non_nullable
              as ProductRequestDetail,
    ));
  }

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductRequestDetailCopyWith<$Res> get productRequestDetail {
    return $ProductRequestDetailCopyWith<$Res>(_value.productRequestDetail,
        (value) {
      return _then(_value.copyWith(productRequestDetail: value));
    });
  }
}

/// @nodoc

class _$DeleteDetailImpl implements _DeleteDetail {
  const _$DeleteDetailImpl(this.productRequestDetail);

  @override
  final ProductRequestDetail productRequestDetail;

  @override
  String toString() {
    return 'ProductRequestEvent.deleteDetail(productRequestDetail: $productRequestDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteDetailImpl &&
            (identical(other.productRequestDetail, productRequestDetail) ||
                other.productRequestDetail == productRequestDetail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productRequestDetail);

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteDetailImplCopyWith<_$DeleteDetailImpl> get copyWith =>
      __$$DeleteDetailImplCopyWithImpl<_$DeleteDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductRequestDetail> products)
        addAllProduct,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        cancelConfirm,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        confirm,
    required TResult Function(ProductRequestDetail productRequestDetail)
        createFormProductToLocal,
    required TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        createFormPurchaseOrderToLocal,
    required TResult Function(ProductRequest productRequest) delete,
    required TResult Function(ProductRequestDetail productRequestDetail)
        deleteDetail,
    required TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        editFormPurchaseOrder,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)
        editProductionRequestDetail,
    required TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)
        createNewProductDetail,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        initialize,
    required TResult Function(ProductRequestDetail detail) remove,
    required TResult Function() submit,
    required TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)
        submitSalesOrder,
  }) {
    return deleteDetail(productRequestDetail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult? Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult? Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult? Function(ProductRequest productRequest)? delete,
    TResult? Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult? Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult? Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult? Function(ProductRequestDetail detail)? remove,
    TResult? Function()? submit,
    TResult? Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
  }) {
    return deleteDetail?.call(productRequestDetail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult Function(ProductRequest productRequest)? delete,
    TResult Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult Function(ProductRequestDetail detail)? remove,
    TResult Function()? submit,
    TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
    required TResult orElse(),
  }) {
    if (deleteDetail != null) {
      return deleteDetail(productRequestDetail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAllProduct value) addAllProduct,
    required TResult Function(_CancelConfirm value) cancelConfirm,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_CreateFormProductToLocal value)
        createFormProductToLocal,
    required TResult Function(_CreateFormPurchaseOrderToLocal value)
        createFormPurchaseOrderToLocal,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteDetail value) deleteDetail,
    required TResult Function(_EditFormPurchaseOrder value)
        editFormPurchaseOrder,
    required TResult Function(_EditProductionRequestDetail value)
        editProductionRequestDetail,
    required TResult Function(_CreateNewProductDetail value)
        createNewProductDetail,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitSalesOrder value) submitSalesOrder,
  }) {
    return deleteDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAllProduct value)? addAllProduct,
    TResult? Function(_CancelConfirm value)? cancelConfirm,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_CreateFormProductToLocal value)?
        createFormProductToLocal,
    TResult? Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteDetail value)? deleteDetail,
    TResult? Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult? Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult? Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitSalesOrder value)? submitSalesOrder,
  }) {
    return deleteDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAllProduct value)? addAllProduct,
    TResult Function(_CancelConfirm value)? cancelConfirm,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_CreateFormProductToLocal value)? createFormProductToLocal,
    TResult Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteDetail value)? deleteDetail,
    TResult Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Remove value)? remove,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitSalesOrder value)? submitSalesOrder,
    required TResult orElse(),
  }) {
    if (deleteDetail != null) {
      return deleteDetail(this);
    }
    return orElse();
  }
}

abstract class _DeleteDetail implements ProductRequestEvent {
  const factory _DeleteDetail(final ProductRequestDetail productRequestDetail) =
      _$DeleteDetailImpl;

  ProductRequestDetail get productRequestDetail;

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteDetailImplCopyWith<_$DeleteDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditFormPurchaseOrderImplCopyWith<$Res> {
  factory _$$EditFormPurchaseOrderImplCopyWith(
          _$EditFormPurchaseOrderImpl value,
          $Res Function(_$EditFormPurchaseOrderImpl) then) =
      __$$EditFormPurchaseOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {ProductRequest productRequest,
      ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder});

  $ProductRequestCopyWith<$Res> get productRequest;
}

/// @nodoc
class __$$EditFormPurchaseOrderImplCopyWithImpl<$Res>
    extends _$ProductRequestEventCopyWithImpl<$Res, _$EditFormPurchaseOrderImpl>
    implements _$$EditFormPurchaseOrderImplCopyWith<$Res> {
  __$$EditFormPurchaseOrderImplCopyWithImpl(_$EditFormPurchaseOrderImpl _value,
      $Res Function(_$EditFormPurchaseOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productRequest = null,
    Object? productRequestFormPurchaseOrder = null,
  }) {
    return _then(_$EditFormPurchaseOrderImpl(
      null == productRequest
          ? _value.productRequest
          : productRequest // ignore: cast_nullable_to_non_nullable
              as ProductRequest,
      null == productRequestFormPurchaseOrder
          ? _value.productRequestFormPurchaseOrder
          : productRequestFormPurchaseOrder // ignore: cast_nullable_to_non_nullable
              as ProductRequestFormPurchaseOrder,
    ));
  }

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductRequestCopyWith<$Res> get productRequest {
    return $ProductRequestCopyWith<$Res>(_value.productRequest, (value) {
      return _then(_value.copyWith(productRequest: value));
    });
  }
}

/// @nodoc

class _$EditFormPurchaseOrderImpl implements _EditFormPurchaseOrder {
  const _$EditFormPurchaseOrderImpl(
      this.productRequest, this.productRequestFormPurchaseOrder);

  @override
  final ProductRequest productRequest;
  @override
  final ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder;

  @override
  String toString() {
    return 'ProductRequestEvent.editFormPurchaseOrder(productRequest: $productRequest, productRequestFormPurchaseOrder: $productRequestFormPurchaseOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditFormPurchaseOrderImpl &&
            (identical(other.productRequest, productRequest) ||
                other.productRequest == productRequest) &&
            (identical(other.productRequestFormPurchaseOrder,
                    productRequestFormPurchaseOrder) ||
                other.productRequestFormPurchaseOrder ==
                    productRequestFormPurchaseOrder));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, productRequest, productRequestFormPurchaseOrder);

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditFormPurchaseOrderImplCopyWith<_$EditFormPurchaseOrderImpl>
      get copyWith => __$$EditFormPurchaseOrderImplCopyWithImpl<
          _$EditFormPurchaseOrderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductRequestDetail> products)
        addAllProduct,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        cancelConfirm,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        confirm,
    required TResult Function(ProductRequestDetail productRequestDetail)
        createFormProductToLocal,
    required TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        createFormPurchaseOrderToLocal,
    required TResult Function(ProductRequest productRequest) delete,
    required TResult Function(ProductRequestDetail productRequestDetail)
        deleteDetail,
    required TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        editFormPurchaseOrder,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)
        editProductionRequestDetail,
    required TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)
        createNewProductDetail,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        initialize,
    required TResult Function(ProductRequestDetail detail) remove,
    required TResult Function() submit,
    required TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)
        submitSalesOrder,
  }) {
    return editFormPurchaseOrder(
        productRequest, productRequestFormPurchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult? Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult? Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult? Function(ProductRequest productRequest)? delete,
    TResult? Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult? Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult? Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult? Function(ProductRequestDetail detail)? remove,
    TResult? Function()? submit,
    TResult? Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
  }) {
    return editFormPurchaseOrder?.call(
        productRequest, productRequestFormPurchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult Function(ProductRequest productRequest)? delete,
    TResult Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult Function(ProductRequestDetail detail)? remove,
    TResult Function()? submit,
    TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
    required TResult orElse(),
  }) {
    if (editFormPurchaseOrder != null) {
      return editFormPurchaseOrder(
          productRequest, productRequestFormPurchaseOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAllProduct value) addAllProduct,
    required TResult Function(_CancelConfirm value) cancelConfirm,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_CreateFormProductToLocal value)
        createFormProductToLocal,
    required TResult Function(_CreateFormPurchaseOrderToLocal value)
        createFormPurchaseOrderToLocal,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteDetail value) deleteDetail,
    required TResult Function(_EditFormPurchaseOrder value)
        editFormPurchaseOrder,
    required TResult Function(_EditProductionRequestDetail value)
        editProductionRequestDetail,
    required TResult Function(_CreateNewProductDetail value)
        createNewProductDetail,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitSalesOrder value) submitSalesOrder,
  }) {
    return editFormPurchaseOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAllProduct value)? addAllProduct,
    TResult? Function(_CancelConfirm value)? cancelConfirm,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_CreateFormProductToLocal value)?
        createFormProductToLocal,
    TResult? Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteDetail value)? deleteDetail,
    TResult? Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult? Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult? Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitSalesOrder value)? submitSalesOrder,
  }) {
    return editFormPurchaseOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAllProduct value)? addAllProduct,
    TResult Function(_CancelConfirm value)? cancelConfirm,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_CreateFormProductToLocal value)? createFormProductToLocal,
    TResult Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteDetail value)? deleteDetail,
    TResult Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Remove value)? remove,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitSalesOrder value)? submitSalesOrder,
    required TResult orElse(),
  }) {
    if (editFormPurchaseOrder != null) {
      return editFormPurchaseOrder(this);
    }
    return orElse();
  }
}

abstract class _EditFormPurchaseOrder implements ProductRequestEvent {
  const factory _EditFormPurchaseOrder(
      final ProductRequest productRequest,
      final ProductRequestFormPurchaseOrder
          productRequestFormPurchaseOrder) = _$EditFormPurchaseOrderImpl;

  ProductRequest get productRequest;
  ProductRequestFormPurchaseOrder get productRequestFormPurchaseOrder;

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditFormPurchaseOrderImplCopyWith<_$EditFormPurchaseOrderImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditProductionRequestDetailImplCopyWith<$Res> {
  factory _$$EditProductionRequestDetailImplCopyWith(
          _$EditProductionRequestDetailImpl value,
          $Res Function(_$EditProductionRequestDetailImpl) then) =
      __$$EditProductionRequestDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {ProductRequestFormPurchaseOrder productRequest,
      ProductRequestDetail productRequestDetail});

  $ProductRequestDetailCopyWith<$Res> get productRequestDetail;
}

/// @nodoc
class __$$EditProductionRequestDetailImplCopyWithImpl<$Res>
    extends _$ProductRequestEventCopyWithImpl<$Res,
        _$EditProductionRequestDetailImpl>
    implements _$$EditProductionRequestDetailImplCopyWith<$Res> {
  __$$EditProductionRequestDetailImplCopyWithImpl(
      _$EditProductionRequestDetailImpl _value,
      $Res Function(_$EditProductionRequestDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productRequest = null,
    Object? productRequestDetail = null,
  }) {
    return _then(_$EditProductionRequestDetailImpl(
      null == productRequest
          ? _value.productRequest
          : productRequest // ignore: cast_nullable_to_non_nullable
              as ProductRequestFormPurchaseOrder,
      null == productRequestDetail
          ? _value.productRequestDetail
          : productRequestDetail // ignore: cast_nullable_to_non_nullable
              as ProductRequestDetail,
    ));
  }

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductRequestDetailCopyWith<$Res> get productRequestDetail {
    return $ProductRequestDetailCopyWith<$Res>(_value.productRequestDetail,
        (value) {
      return _then(_value.copyWith(productRequestDetail: value));
    });
  }
}

/// @nodoc

class _$EditProductionRequestDetailImpl
    implements _EditProductionRequestDetail {
  const _$EditProductionRequestDetailImpl(
      this.productRequest, this.productRequestDetail);

  @override
  final ProductRequestFormPurchaseOrder productRequest;
  @override
  final ProductRequestDetail productRequestDetail;

  @override
  String toString() {
    return 'ProductRequestEvent.editProductionRequestDetail(productRequest: $productRequest, productRequestDetail: $productRequestDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditProductionRequestDetailImpl &&
            (identical(other.productRequest, productRequest) ||
                other.productRequest == productRequest) &&
            (identical(other.productRequestDetail, productRequestDetail) ||
                other.productRequestDetail == productRequestDetail));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, productRequest, productRequestDetail);

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditProductionRequestDetailImplCopyWith<_$EditProductionRequestDetailImpl>
      get copyWith => __$$EditProductionRequestDetailImplCopyWithImpl<
          _$EditProductionRequestDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductRequestDetail> products)
        addAllProduct,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        cancelConfirm,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        confirm,
    required TResult Function(ProductRequestDetail productRequestDetail)
        createFormProductToLocal,
    required TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        createFormPurchaseOrderToLocal,
    required TResult Function(ProductRequest productRequest) delete,
    required TResult Function(ProductRequestDetail productRequestDetail)
        deleteDetail,
    required TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        editFormPurchaseOrder,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)
        editProductionRequestDetail,
    required TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)
        createNewProductDetail,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        initialize,
    required TResult Function(ProductRequestDetail detail) remove,
    required TResult Function() submit,
    required TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)
        submitSalesOrder,
  }) {
    return editProductionRequestDetail(productRequest, productRequestDetail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult? Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult? Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult? Function(ProductRequest productRequest)? delete,
    TResult? Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult? Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult? Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult? Function(ProductRequestDetail detail)? remove,
    TResult? Function()? submit,
    TResult? Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
  }) {
    return editProductionRequestDetail?.call(
        productRequest, productRequestDetail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult Function(ProductRequest productRequest)? delete,
    TResult Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult Function(ProductRequestDetail detail)? remove,
    TResult Function()? submit,
    TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
    required TResult orElse(),
  }) {
    if (editProductionRequestDetail != null) {
      return editProductionRequestDetail(productRequest, productRequestDetail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAllProduct value) addAllProduct,
    required TResult Function(_CancelConfirm value) cancelConfirm,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_CreateFormProductToLocal value)
        createFormProductToLocal,
    required TResult Function(_CreateFormPurchaseOrderToLocal value)
        createFormPurchaseOrderToLocal,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteDetail value) deleteDetail,
    required TResult Function(_EditFormPurchaseOrder value)
        editFormPurchaseOrder,
    required TResult Function(_EditProductionRequestDetail value)
        editProductionRequestDetail,
    required TResult Function(_CreateNewProductDetail value)
        createNewProductDetail,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitSalesOrder value) submitSalesOrder,
  }) {
    return editProductionRequestDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAllProduct value)? addAllProduct,
    TResult? Function(_CancelConfirm value)? cancelConfirm,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_CreateFormProductToLocal value)?
        createFormProductToLocal,
    TResult? Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteDetail value)? deleteDetail,
    TResult? Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult? Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult? Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitSalesOrder value)? submitSalesOrder,
  }) {
    return editProductionRequestDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAllProduct value)? addAllProduct,
    TResult Function(_CancelConfirm value)? cancelConfirm,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_CreateFormProductToLocal value)? createFormProductToLocal,
    TResult Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteDetail value)? deleteDetail,
    TResult Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Remove value)? remove,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitSalesOrder value)? submitSalesOrder,
    required TResult orElse(),
  }) {
    if (editProductionRequestDetail != null) {
      return editProductionRequestDetail(this);
    }
    return orElse();
  }
}

abstract class _EditProductionRequestDetail implements ProductRequestEvent {
  const factory _EditProductionRequestDetail(
          final ProductRequestFormPurchaseOrder productRequest,
          final ProductRequestDetail productRequestDetail) =
      _$EditProductionRequestDetailImpl;

  ProductRequestFormPurchaseOrder get productRequest;
  ProductRequestDetail get productRequestDetail;

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditProductionRequestDetailImplCopyWith<_$EditProductionRequestDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateNewProductDetailImplCopyWith<$Res> {
  factory _$$CreateNewProductDetailImplCopyWith(
          _$CreateNewProductDetailImpl value,
          $Res Function(_$CreateNewProductDetailImpl) then) =
      __$$CreateNewProductDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String productRequestId,
      double discountPrice,
      ProductRequestDetail product});

  $ProductRequestDetailCopyWith<$Res> get product;
}

/// @nodoc
class __$$CreateNewProductDetailImplCopyWithImpl<$Res>
    extends _$ProductRequestEventCopyWithImpl<$Res,
        _$CreateNewProductDetailImpl>
    implements _$$CreateNewProductDetailImplCopyWith<$Res> {
  __$$CreateNewProductDetailImplCopyWithImpl(
      _$CreateNewProductDetailImpl _value,
      $Res Function(_$CreateNewProductDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productRequestId = null,
    Object? discountPrice = null,
    Object? product = null,
  }) {
    return _then(_$CreateNewProductDetailImpl(
      null == productRequestId
          ? _value.productRequestId
          : productRequestId // ignore: cast_nullable_to_non_nullable
              as String,
      null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as double,
      null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductRequestDetail,
    ));
  }

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductRequestDetailCopyWith<$Res> get product {
    return $ProductRequestDetailCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc

class _$CreateNewProductDetailImpl implements _CreateNewProductDetail {
  const _$CreateNewProductDetailImpl(
      this.productRequestId, this.discountPrice, this.product);

  @override
  final String productRequestId;
  @override
  final double discountPrice;
  @override
  final ProductRequestDetail product;

  @override
  String toString() {
    return 'ProductRequestEvent.createNewProductDetail(productRequestId: $productRequestId, discountPrice: $discountPrice, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateNewProductDetailImpl &&
            (identical(other.productRequestId, productRequestId) ||
                other.productRequestId == productRequestId) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, productRequestId, discountPrice, product);

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateNewProductDetailImplCopyWith<_$CreateNewProductDetailImpl>
      get copyWith => __$$CreateNewProductDetailImplCopyWithImpl<
          _$CreateNewProductDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductRequestDetail> products)
        addAllProduct,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        cancelConfirm,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        confirm,
    required TResult Function(ProductRequestDetail productRequestDetail)
        createFormProductToLocal,
    required TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        createFormPurchaseOrderToLocal,
    required TResult Function(ProductRequest productRequest) delete,
    required TResult Function(ProductRequestDetail productRequestDetail)
        deleteDetail,
    required TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        editFormPurchaseOrder,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)
        editProductionRequestDetail,
    required TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)
        createNewProductDetail,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        initialize,
    required TResult Function(ProductRequestDetail detail) remove,
    required TResult Function() submit,
    required TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)
        submitSalesOrder,
  }) {
    return createNewProductDetail(productRequestId, discountPrice, product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult? Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult? Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult? Function(ProductRequest productRequest)? delete,
    TResult? Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult? Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult? Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult? Function(ProductRequestDetail detail)? remove,
    TResult? Function()? submit,
    TResult? Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
  }) {
    return createNewProductDetail?.call(
        productRequestId, discountPrice, product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult Function(ProductRequest productRequest)? delete,
    TResult Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult Function(ProductRequestDetail detail)? remove,
    TResult Function()? submit,
    TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
    required TResult orElse(),
  }) {
    if (createNewProductDetail != null) {
      return createNewProductDetail(productRequestId, discountPrice, product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAllProduct value) addAllProduct,
    required TResult Function(_CancelConfirm value) cancelConfirm,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_CreateFormProductToLocal value)
        createFormProductToLocal,
    required TResult Function(_CreateFormPurchaseOrderToLocal value)
        createFormPurchaseOrderToLocal,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteDetail value) deleteDetail,
    required TResult Function(_EditFormPurchaseOrder value)
        editFormPurchaseOrder,
    required TResult Function(_EditProductionRequestDetail value)
        editProductionRequestDetail,
    required TResult Function(_CreateNewProductDetail value)
        createNewProductDetail,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitSalesOrder value) submitSalesOrder,
  }) {
    return createNewProductDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAllProduct value)? addAllProduct,
    TResult? Function(_CancelConfirm value)? cancelConfirm,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_CreateFormProductToLocal value)?
        createFormProductToLocal,
    TResult? Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteDetail value)? deleteDetail,
    TResult? Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult? Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult? Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitSalesOrder value)? submitSalesOrder,
  }) {
    return createNewProductDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAllProduct value)? addAllProduct,
    TResult Function(_CancelConfirm value)? cancelConfirm,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_CreateFormProductToLocal value)? createFormProductToLocal,
    TResult Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteDetail value)? deleteDetail,
    TResult Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Remove value)? remove,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitSalesOrder value)? submitSalesOrder,
    required TResult orElse(),
  }) {
    if (createNewProductDetail != null) {
      return createNewProductDetail(this);
    }
    return orElse();
  }
}

abstract class _CreateNewProductDetail implements ProductRequestEvent {
  const factory _CreateNewProductDetail(
      final String productRequestId,
      final double discountPrice,
      final ProductRequestDetail product) = _$CreateNewProductDetailImpl;

  String get productRequestId;
  double get discountPrice;
  ProductRequestDetail get product;

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateNewProductDetailImplCopyWith<_$CreateNewProductDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductRequestFormPurchaseOrder productRequest});
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$ProductRequestEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productRequest = null,
  }) {
    return _then(_$InitializeImpl(
      null == productRequest
          ? _value.productRequest
          : productRequest // ignore: cast_nullable_to_non_nullable
              as ProductRequestFormPurchaseOrder,
    ));
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl(this.productRequest);

  @override
  final ProductRequestFormPurchaseOrder productRequest;

  @override
  String toString() {
    return 'ProductRequestEvent.initialize(productRequest: $productRequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.productRequest, productRequest) ||
                other.productRequest == productRequest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productRequest);

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductRequestDetail> products)
        addAllProduct,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        cancelConfirm,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        confirm,
    required TResult Function(ProductRequestDetail productRequestDetail)
        createFormProductToLocal,
    required TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        createFormPurchaseOrderToLocal,
    required TResult Function(ProductRequest productRequest) delete,
    required TResult Function(ProductRequestDetail productRequestDetail)
        deleteDetail,
    required TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        editFormPurchaseOrder,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)
        editProductionRequestDetail,
    required TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)
        createNewProductDetail,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        initialize,
    required TResult Function(ProductRequestDetail detail) remove,
    required TResult Function() submit,
    required TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)
        submitSalesOrder,
  }) {
    return initialize(productRequest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult? Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult? Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult? Function(ProductRequest productRequest)? delete,
    TResult? Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult? Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult? Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult? Function(ProductRequestDetail detail)? remove,
    TResult? Function()? submit,
    TResult? Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
  }) {
    return initialize?.call(productRequest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult Function(ProductRequest productRequest)? delete,
    TResult Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult Function(ProductRequestDetail detail)? remove,
    TResult Function()? submit,
    TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(productRequest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAllProduct value) addAllProduct,
    required TResult Function(_CancelConfirm value) cancelConfirm,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_CreateFormProductToLocal value)
        createFormProductToLocal,
    required TResult Function(_CreateFormPurchaseOrderToLocal value)
        createFormPurchaseOrderToLocal,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteDetail value) deleteDetail,
    required TResult Function(_EditFormPurchaseOrder value)
        editFormPurchaseOrder,
    required TResult Function(_EditProductionRequestDetail value)
        editProductionRequestDetail,
    required TResult Function(_CreateNewProductDetail value)
        createNewProductDetail,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitSalesOrder value) submitSalesOrder,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAllProduct value)? addAllProduct,
    TResult? Function(_CancelConfirm value)? cancelConfirm,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_CreateFormProductToLocal value)?
        createFormProductToLocal,
    TResult? Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteDetail value)? deleteDetail,
    TResult? Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult? Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult? Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitSalesOrder value)? submitSalesOrder,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAllProduct value)? addAllProduct,
    TResult Function(_CancelConfirm value)? cancelConfirm,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_CreateFormProductToLocal value)? createFormProductToLocal,
    TResult Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteDetail value)? deleteDetail,
    TResult Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Remove value)? remove,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitSalesOrder value)? submitSalesOrder,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements ProductRequestEvent {
  const factory _Initialize(
      final ProductRequestFormPurchaseOrder productRequest) = _$InitializeImpl;

  ProductRequestFormPurchaseOrder get productRequest;

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveImplCopyWith<$Res> {
  factory _$$RemoveImplCopyWith(
          _$RemoveImpl value, $Res Function(_$RemoveImpl) then) =
      __$$RemoveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductRequestDetail detail});

  $ProductRequestDetailCopyWith<$Res> get detail;
}

/// @nodoc
class __$$RemoveImplCopyWithImpl<$Res>
    extends _$ProductRequestEventCopyWithImpl<$Res, _$RemoveImpl>
    implements _$$RemoveImplCopyWith<$Res> {
  __$$RemoveImplCopyWithImpl(
      _$RemoveImpl _value, $Res Function(_$RemoveImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? detail = null,
  }) {
    return _then(_$RemoveImpl(
      null == detail
          ? _value.detail
          : detail // ignore: cast_nullable_to_non_nullable
              as ProductRequestDetail,
    ));
  }

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductRequestDetailCopyWith<$Res> get detail {
    return $ProductRequestDetailCopyWith<$Res>(_value.detail, (value) {
      return _then(_value.copyWith(detail: value));
    });
  }
}

/// @nodoc

class _$RemoveImpl implements _Remove {
  const _$RemoveImpl(this.detail);

  @override
  final ProductRequestDetail detail;

  @override
  String toString() {
    return 'ProductRequestEvent.remove(detail: $detail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveImpl &&
            (identical(other.detail, detail) || other.detail == detail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, detail);

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveImplCopyWith<_$RemoveImpl> get copyWith =>
      __$$RemoveImplCopyWithImpl<_$RemoveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductRequestDetail> products)
        addAllProduct,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        cancelConfirm,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        confirm,
    required TResult Function(ProductRequestDetail productRequestDetail)
        createFormProductToLocal,
    required TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        createFormPurchaseOrderToLocal,
    required TResult Function(ProductRequest productRequest) delete,
    required TResult Function(ProductRequestDetail productRequestDetail)
        deleteDetail,
    required TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        editFormPurchaseOrder,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)
        editProductionRequestDetail,
    required TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)
        createNewProductDetail,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        initialize,
    required TResult Function(ProductRequestDetail detail) remove,
    required TResult Function() submit,
    required TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)
        submitSalesOrder,
  }) {
    return remove(detail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult? Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult? Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult? Function(ProductRequest productRequest)? delete,
    TResult? Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult? Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult? Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult? Function(ProductRequestDetail detail)? remove,
    TResult? Function()? submit,
    TResult? Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
  }) {
    return remove?.call(detail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult Function(ProductRequest productRequest)? delete,
    TResult Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult Function(ProductRequestDetail detail)? remove,
    TResult Function()? submit,
    TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(detail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAllProduct value) addAllProduct,
    required TResult Function(_CancelConfirm value) cancelConfirm,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_CreateFormProductToLocal value)
        createFormProductToLocal,
    required TResult Function(_CreateFormPurchaseOrderToLocal value)
        createFormPurchaseOrderToLocal,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteDetail value) deleteDetail,
    required TResult Function(_EditFormPurchaseOrder value)
        editFormPurchaseOrder,
    required TResult Function(_EditProductionRequestDetail value)
        editProductionRequestDetail,
    required TResult Function(_CreateNewProductDetail value)
        createNewProductDetail,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitSalesOrder value) submitSalesOrder,
  }) {
    return remove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAllProduct value)? addAllProduct,
    TResult? Function(_CancelConfirm value)? cancelConfirm,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_CreateFormProductToLocal value)?
        createFormProductToLocal,
    TResult? Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteDetail value)? deleteDetail,
    TResult? Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult? Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult? Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitSalesOrder value)? submitSalesOrder,
  }) {
    return remove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAllProduct value)? addAllProduct,
    TResult Function(_CancelConfirm value)? cancelConfirm,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_CreateFormProductToLocal value)? createFormProductToLocal,
    TResult Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteDetail value)? deleteDetail,
    TResult Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Remove value)? remove,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitSalesOrder value)? submitSalesOrder,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(this);
    }
    return orElse();
  }
}

abstract class _Remove implements ProductRequestEvent {
  const factory _Remove(final ProductRequestDetail detail) = _$RemoveImpl;

  ProductRequestDetail get detail;

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveImplCopyWith<_$RemoveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitImplCopyWith<$Res> {
  factory _$$SubmitImplCopyWith(
          _$SubmitImpl value, $Res Function(_$SubmitImpl) then) =
      __$$SubmitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubmitImplCopyWithImpl<$Res>
    extends _$ProductRequestEventCopyWithImpl<$Res, _$SubmitImpl>
    implements _$$SubmitImplCopyWith<$Res> {
  __$$SubmitImplCopyWithImpl(
      _$SubmitImpl _value, $Res Function(_$SubmitImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SubmitImpl implements _Submit {
  const _$SubmitImpl();

  @override
  String toString() {
    return 'ProductRequestEvent.submit()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SubmitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductRequestDetail> products)
        addAllProduct,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        cancelConfirm,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        confirm,
    required TResult Function(ProductRequestDetail productRequestDetail)
        createFormProductToLocal,
    required TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        createFormPurchaseOrderToLocal,
    required TResult Function(ProductRequest productRequest) delete,
    required TResult Function(ProductRequestDetail productRequestDetail)
        deleteDetail,
    required TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        editFormPurchaseOrder,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)
        editProductionRequestDetail,
    required TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)
        createNewProductDetail,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        initialize,
    required TResult Function(ProductRequestDetail detail) remove,
    required TResult Function() submit,
    required TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)
        submitSalesOrder,
  }) {
    return submit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult? Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult? Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult? Function(ProductRequest productRequest)? delete,
    TResult? Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult? Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult? Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult? Function(ProductRequestDetail detail)? remove,
    TResult? Function()? submit,
    TResult? Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
  }) {
    return submit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult Function(ProductRequest productRequest)? delete,
    TResult Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult Function(ProductRequestDetail detail)? remove,
    TResult Function()? submit,
    TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAllProduct value) addAllProduct,
    required TResult Function(_CancelConfirm value) cancelConfirm,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_CreateFormProductToLocal value)
        createFormProductToLocal,
    required TResult Function(_CreateFormPurchaseOrderToLocal value)
        createFormPurchaseOrderToLocal,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteDetail value) deleteDetail,
    required TResult Function(_EditFormPurchaseOrder value)
        editFormPurchaseOrder,
    required TResult Function(_EditProductionRequestDetail value)
        editProductionRequestDetail,
    required TResult Function(_CreateNewProductDetail value)
        createNewProductDetail,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitSalesOrder value) submitSalesOrder,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAllProduct value)? addAllProduct,
    TResult? Function(_CancelConfirm value)? cancelConfirm,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_CreateFormProductToLocal value)?
        createFormProductToLocal,
    TResult? Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteDetail value)? deleteDetail,
    TResult? Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult? Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult? Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitSalesOrder value)? submitSalesOrder,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAllProduct value)? addAllProduct,
    TResult Function(_CancelConfirm value)? cancelConfirm,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_CreateFormProductToLocal value)? createFormProductToLocal,
    TResult Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteDetail value)? deleteDetail,
    TResult Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Remove value)? remove,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitSalesOrder value)? submitSalesOrder,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class _Submit implements ProductRequestEvent {
  const factory _Submit() = _$SubmitImpl;
}

/// @nodoc
abstract class _$$SubmitSalesOrderImplCopyWith<$Res> {
  factory _$$SubmitSalesOrderImplCopyWith(_$SubmitSalesOrderImpl value,
          $Res Function(_$SubmitSalesOrderImpl) then) =
      __$$SubmitSalesOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<SalesOrderDetail> salesOrderDetail, ProductRequest productRequest});

  $ProductRequestCopyWith<$Res> get productRequest;
}

/// @nodoc
class __$$SubmitSalesOrderImplCopyWithImpl<$Res>
    extends _$ProductRequestEventCopyWithImpl<$Res, _$SubmitSalesOrderImpl>
    implements _$$SubmitSalesOrderImplCopyWith<$Res> {
  __$$SubmitSalesOrderImplCopyWithImpl(_$SubmitSalesOrderImpl _value,
      $Res Function(_$SubmitSalesOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrderDetail = null,
    Object? productRequest = null,
  }) {
    return _then(_$SubmitSalesOrderImpl(
      salesOrderDetail: null == salesOrderDetail
          ? _value._salesOrderDetail
          : salesOrderDetail // ignore: cast_nullable_to_non_nullable
              as List<SalesOrderDetail>,
      productRequest: null == productRequest
          ? _value.productRequest
          : productRequest // ignore: cast_nullable_to_non_nullable
              as ProductRequest,
    ));
  }

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductRequestCopyWith<$Res> get productRequest {
    return $ProductRequestCopyWith<$Res>(_value.productRequest, (value) {
      return _then(_value.copyWith(productRequest: value));
    });
  }
}

/// @nodoc

class _$SubmitSalesOrderImpl implements _SubmitSalesOrder {
  const _$SubmitSalesOrderImpl(
      {required final List<SalesOrderDetail> salesOrderDetail,
      required this.productRequest})
      : _salesOrderDetail = salesOrderDetail;

  final List<SalesOrderDetail> _salesOrderDetail;
  @override
  List<SalesOrderDetail> get salesOrderDetail {
    if (_salesOrderDetail is EqualUnmodifiableListView)
      return _salesOrderDetail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_salesOrderDetail);
  }

  @override
  final ProductRequest productRequest;

  @override
  String toString() {
    return 'ProductRequestEvent.submitSalesOrder(salesOrderDetail: $salesOrderDetail, productRequest: $productRequest)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitSalesOrderImpl &&
            const DeepCollectionEquality()
                .equals(other._salesOrderDetail, _salesOrderDetail) &&
            (identical(other.productRequest, productRequest) ||
                other.productRequest == productRequest));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_salesOrderDetail), productRequest);

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitSalesOrderImplCopyWith<_$SubmitSalesOrderImpl> get copyWith =>
      __$$SubmitSalesOrderImplCopyWithImpl<_$SubmitSalesOrderImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductRequestDetail> products)
        addAllProduct,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        cancelConfirm,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        confirm,
    required TResult Function(ProductRequestDetail productRequestDetail)
        createFormProductToLocal,
    required TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        createFormPurchaseOrderToLocal,
    required TResult Function(ProductRequest productRequest) delete,
    required TResult Function(ProductRequestDetail productRequestDetail)
        deleteDetail,
    required TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)
        editFormPurchaseOrder,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)
        editProductionRequestDetail,
    required TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)
        createNewProductDetail,
    required TResult Function(ProductRequestFormPurchaseOrder productRequest)
        initialize,
    required TResult Function(ProductRequestDetail detail) remove,
    required TResult Function() submit,
    required TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)
        submitSalesOrder,
  }) {
    return submitSalesOrder(salesOrderDetail, productRequest);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult? Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult? Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult? Function(ProductRequest productRequest)? delete,
    TResult? Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult? Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult? Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult? Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult? Function(ProductRequestDetail detail)? remove,
    TResult? Function()? submit,
    TResult? Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
  }) {
    return submitSalesOrder?.call(salesOrderDetail, productRequest);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductRequestDetail> products)? addAllProduct,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        cancelConfirm,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)? confirm,
    TResult Function(ProductRequestDetail productRequestDetail)?
        createFormProductToLocal,
    TResult Function(
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        createFormPurchaseOrderToLocal,
    TResult Function(ProductRequest productRequest)? delete,
    TResult Function(ProductRequestDetail productRequestDetail)? deleteDetail,
    TResult Function(ProductRequest productRequest,
            ProductRequestFormPurchaseOrder productRequestFormPurchaseOrder)?
        editFormPurchaseOrder,
    TResult Function(ProductRequestFormPurchaseOrder productRequest,
            ProductRequestDetail productRequestDetail)?
        editProductionRequestDetail,
    TResult Function(String productRequestId, double discountPrice,
            ProductRequestDetail product)?
        createNewProductDetail,
    TResult Function(ProductRequestFormPurchaseOrder productRequest)?
        initialize,
    TResult Function(ProductRequestDetail detail)? remove,
    TResult Function()? submit,
    TResult Function(List<SalesOrderDetail> salesOrderDetail,
            ProductRequest productRequest)?
        submitSalesOrder,
    required TResult orElse(),
  }) {
    if (submitSalesOrder != null) {
      return submitSalesOrder(salesOrderDetail, productRequest);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAllProduct value) addAllProduct,
    required TResult Function(_CancelConfirm value) cancelConfirm,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_CreateFormProductToLocal value)
        createFormProductToLocal,
    required TResult Function(_CreateFormPurchaseOrderToLocal value)
        createFormPurchaseOrderToLocal,
    required TResult Function(_Delete value) delete,
    required TResult Function(_DeleteDetail value) deleteDetail,
    required TResult Function(_EditFormPurchaseOrder value)
        editFormPurchaseOrder,
    required TResult Function(_EditProductionRequestDetail value)
        editProductionRequestDetail,
    required TResult Function(_CreateNewProductDetail value)
        createNewProductDetail,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitSalesOrder value) submitSalesOrder,
  }) {
    return submitSalesOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAllProduct value)? addAllProduct,
    TResult? Function(_CancelConfirm value)? cancelConfirm,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_CreateFormProductToLocal value)?
        createFormProductToLocal,
    TResult? Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_DeleteDetail value)? deleteDetail,
    TResult? Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult? Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult? Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitSalesOrder value)? submitSalesOrder,
  }) {
    return submitSalesOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAllProduct value)? addAllProduct,
    TResult Function(_CancelConfirm value)? cancelConfirm,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_CreateFormProductToLocal value)? createFormProductToLocal,
    TResult Function(_CreateFormPurchaseOrderToLocal value)?
        createFormPurchaseOrderToLocal,
    TResult Function(_Delete value)? delete,
    TResult Function(_DeleteDetail value)? deleteDetail,
    TResult Function(_EditFormPurchaseOrder value)? editFormPurchaseOrder,
    TResult Function(_EditProductionRequestDetail value)?
        editProductionRequestDetail,
    TResult Function(_CreateNewProductDetail value)? createNewProductDetail,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Remove value)? remove,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitSalesOrder value)? submitSalesOrder,
    required TResult orElse(),
  }) {
    if (submitSalesOrder != null) {
      return submitSalesOrder(this);
    }
    return orElse();
  }
}

abstract class _SubmitSalesOrder implements ProductRequestEvent {
  const factory _SubmitSalesOrder(
      {required final List<SalesOrderDetail> salesOrderDetail,
      required final ProductRequest productRequest}) = _$SubmitSalesOrderImpl;

  List<SalesOrderDetail> get salesOrderDetail;
  ProductRequest get productRequest;

  /// Create a copy of ProductRequestEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubmitSalesOrderImplCopyWith<_$SubmitSalesOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
