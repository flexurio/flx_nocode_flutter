// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_return_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductReturnState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductReturnDetail> products,
            ProductReturnCustomerForm? customerForm)
        initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductReturnDetail> products,
            ProductReturnCustomerForm? customerForm)?
        initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductReturnDetail> products,
            ProductReturnCustomerForm? customerForm)?
        initial,
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
abstract class $ProductReturnStateCopyWith<$Res> {
  factory $ProductReturnStateCopyWith(
          ProductReturnState value, $Res Function(ProductReturnState) then) =
      _$ProductReturnStateCopyWithImpl<$Res, ProductReturnState>;
}

/// @nodoc
class _$ProductReturnStateCopyWithImpl<$Res, $Val extends ProductReturnState>
    implements $ProductReturnStateCopyWith<$Res> {
  _$ProductReturnStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductReturnState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<ProductReturnDetail> products,
      ProductReturnCustomerForm? customerForm});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ProductReturnStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductReturnState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? customerForm = freezed,
  }) {
    return _then(_$InitialImpl(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductReturnDetail>,
      customerForm: freezed == customerForm
          ? _value.customerForm
          : customerForm // ignore: cast_nullable_to_non_nullable
              as ProductReturnCustomerForm?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required final List<ProductReturnDetail> products, this.customerForm})
      : _products = products;

  final List<ProductReturnDetail> _products;
  @override
  List<ProductReturnDetail> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final ProductReturnCustomerForm? customerForm;

  @override
  String toString() {
    return 'ProductReturnState.initial(products: $products, customerForm: $customerForm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.customerForm, customerForm) ||
                other.customerForm == customerForm));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_products), customerForm);

  /// Create a copy of ProductReturnState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductReturnDetail> products,
            ProductReturnCustomerForm? customerForm)
        initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return initial(products, customerForm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductReturnDetail> products,
            ProductReturnCustomerForm? customerForm)?
        initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call(products, customerForm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductReturnDetail> products,
            ProductReturnCustomerForm? customerForm)?
        initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(products, customerForm);
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

abstract class _Initial implements ProductReturnState {
  const factory _Initial(
      {required final List<ProductReturnDetail> products,
      final ProductReturnCustomerForm? customerForm}) = _$InitialImpl;

  List<ProductReturnDetail> get products;
  ProductReturnCustomerForm? get customerForm;

  /// Create a copy of ProductReturnState
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
    extends _$ProductReturnStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductReturnState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ProductReturnState.loading()';
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
    required TResult Function(List<ProductReturnDetail> products,
            ProductReturnCustomerForm? customerForm)
        initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductReturnDetail> products,
            ProductReturnCustomerForm? customerForm)?
        initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductReturnDetail> products,
            ProductReturnCustomerForm? customerForm)?
        initial,
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

abstract class _Loading implements ProductReturnState {
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
    extends _$ProductReturnStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductReturnState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'ProductReturnState.success()';
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
    required TResult Function(List<ProductReturnDetail> products,
            ProductReturnCustomerForm? customerForm)
        initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductReturnDetail> products,
            ProductReturnCustomerForm? customerForm)?
        initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductReturnDetail> products,
            ProductReturnCustomerForm? customerForm)?
        initial,
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

abstract class _Success implements ProductReturnState {
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
    extends _$ProductReturnStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductReturnState
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
    return 'ProductReturnState.error(error: $error)';
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

  /// Create a copy of ProductReturnState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductReturnDetail> products,
            ProductReturnCustomerForm? customerForm)
        initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductReturnDetail> products,
            ProductReturnCustomerForm? customerForm)?
        initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductReturnDetail> products,
            ProductReturnCustomerForm? customerForm)?
        initial,
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

abstract class _Error implements ProductReturnState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of ProductReturnState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductReturnEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductReturnCustomerForm customerForm)
        createFormCustomer,
    required TResult Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)
        editFormCustomer,
    required TResult Function(ProductReturnDetail products) productAdd,
    required TResult Function(ProductReturnDetail products) remove,
    required TResult Function(ProductReturn productReturn) confirmMarketing,
    required TResult Function(ProductReturn productReturn) confirmPpic,
    required TResult Function(ProductReturn productReturn) undoConfirmMarketing,
    required TResult Function(ProductReturn productReturn) undoConfirmPpic,
    required TResult Function(ProductReturn productReturn) delete,
    required TResult Function(double discountValue, double ppnValue) submit,
    required TResult Function(ProductReturn productReturn) initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReturnCustomerForm customerForm)?
        createFormCustomer,
    TResult? Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)?
        editFormCustomer,
    TResult? Function(ProductReturnDetail products)? productAdd,
    TResult? Function(ProductReturnDetail products)? remove,
    TResult? Function(ProductReturn productReturn)? confirmMarketing,
    TResult? Function(ProductReturn productReturn)? confirmPpic,
    TResult? Function(ProductReturn productReturn)? undoConfirmMarketing,
    TResult? Function(ProductReturn productReturn)? undoConfirmPpic,
    TResult? Function(ProductReturn productReturn)? delete,
    TResult? Function(double discountValue, double ppnValue)? submit,
    TResult? Function(ProductReturn productReturn)? initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReturnCustomerForm customerForm)?
        createFormCustomer,
    TResult Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)?
        editFormCustomer,
    TResult Function(ProductReturnDetail products)? productAdd,
    TResult Function(ProductReturnDetail products)? remove,
    TResult Function(ProductReturn productReturn)? confirmMarketing,
    TResult Function(ProductReturn productReturn)? confirmPpic,
    TResult Function(ProductReturn productReturn)? undoConfirmMarketing,
    TResult Function(ProductReturn productReturn)? undoConfirmPpic,
    TResult Function(ProductReturn productReturn)? delete,
    TResult Function(double discountValue, double ppnValue)? submit,
    TResult Function(ProductReturn productReturn)? initialize,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) createFormCustomer,
    required TResult Function(_Edit value) editFormCustomer,
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_Remove value) remove,
    required TResult Function(_ConfirmMarketing value) confirmMarketing,
    required TResult Function(_ConfirmPpic value) confirmPpic,
    required TResult Function(_UndoConfirmMarketing value) undoConfirmMarketing,
    required TResult Function(_UndoConfirmPpic value) undoConfirmPpic,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Submit value) submit,
    required TResult Function(_Initialize value) initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? createFormCustomer,
    TResult? Function(_Edit value)? editFormCustomer,
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_ConfirmMarketing value)? confirmMarketing,
    TResult? Function(_ConfirmPpic value)? confirmPpic,
    TResult? Function(_UndoConfirmMarketing value)? undoConfirmMarketing,
    TResult? Function(_UndoConfirmPpic value)? undoConfirmPpic,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_Initialize value)? initialize,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? createFormCustomer,
    TResult Function(_Edit value)? editFormCustomer,
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_Remove value)? remove,
    TResult Function(_ConfirmMarketing value)? confirmMarketing,
    TResult Function(_ConfirmPpic value)? confirmPpic,
    TResult Function(_UndoConfirmMarketing value)? undoConfirmMarketing,
    TResult Function(_UndoConfirmPpic value)? undoConfirmPpic,
    TResult Function(_Delete value)? delete,
    TResult Function(_Submit value)? submit,
    TResult Function(_Initialize value)? initialize,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReturnEventCopyWith<$Res> {
  factory $ProductReturnEventCopyWith(
          ProductReturnEvent value, $Res Function(ProductReturnEvent) then) =
      _$ProductReturnEventCopyWithImpl<$Res, ProductReturnEvent>;
}

/// @nodoc
class _$ProductReturnEventCopyWithImpl<$Res, $Val extends ProductReturnEvent>
    implements $ProductReturnEventCopyWith<$Res> {
  _$ProductReturnEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CreateImplCopyWith<$Res> {
  factory _$$CreateImplCopyWith(
          _$CreateImpl value, $Res Function(_$CreateImpl) then) =
      __$$CreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductReturnCustomerForm customerForm});
}

/// @nodoc
class __$$CreateImplCopyWithImpl<$Res>
    extends _$ProductReturnEventCopyWithImpl<$Res, _$CreateImpl>
    implements _$$CreateImplCopyWith<$Res> {
  __$$CreateImplCopyWithImpl(
      _$CreateImpl _value, $Res Function(_$CreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? customerForm = null,
  }) {
    return _then(_$CreateImpl(
      customerForm: null == customerForm
          ? _value.customerForm
          : customerForm // ignore: cast_nullable_to_non_nullable
              as ProductReturnCustomerForm,
    ));
  }
}

/// @nodoc

class _$CreateImpl implements _Create {
  const _$CreateImpl({required this.customerForm});

  @override
  final ProductReturnCustomerForm customerForm;

  @override
  String toString() {
    return 'ProductReturnEvent.createFormCustomer(customerForm: $customerForm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateImpl &&
            (identical(other.customerForm, customerForm) ||
                other.customerForm == customerForm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, customerForm);

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      __$$CreateImplCopyWithImpl<_$CreateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductReturnCustomerForm customerForm)
        createFormCustomer,
    required TResult Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)
        editFormCustomer,
    required TResult Function(ProductReturnDetail products) productAdd,
    required TResult Function(ProductReturnDetail products) remove,
    required TResult Function(ProductReturn productReturn) confirmMarketing,
    required TResult Function(ProductReturn productReturn) confirmPpic,
    required TResult Function(ProductReturn productReturn) undoConfirmMarketing,
    required TResult Function(ProductReturn productReturn) undoConfirmPpic,
    required TResult Function(ProductReturn productReturn) delete,
    required TResult Function(double discountValue, double ppnValue) submit,
    required TResult Function(ProductReturn productReturn) initialize,
  }) {
    return createFormCustomer(customerForm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReturnCustomerForm customerForm)?
        createFormCustomer,
    TResult? Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)?
        editFormCustomer,
    TResult? Function(ProductReturnDetail products)? productAdd,
    TResult? Function(ProductReturnDetail products)? remove,
    TResult? Function(ProductReturn productReturn)? confirmMarketing,
    TResult? Function(ProductReturn productReturn)? confirmPpic,
    TResult? Function(ProductReturn productReturn)? undoConfirmMarketing,
    TResult? Function(ProductReturn productReturn)? undoConfirmPpic,
    TResult? Function(ProductReturn productReturn)? delete,
    TResult? Function(double discountValue, double ppnValue)? submit,
    TResult? Function(ProductReturn productReturn)? initialize,
  }) {
    return createFormCustomer?.call(customerForm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReturnCustomerForm customerForm)?
        createFormCustomer,
    TResult Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)?
        editFormCustomer,
    TResult Function(ProductReturnDetail products)? productAdd,
    TResult Function(ProductReturnDetail products)? remove,
    TResult Function(ProductReturn productReturn)? confirmMarketing,
    TResult Function(ProductReturn productReturn)? confirmPpic,
    TResult Function(ProductReturn productReturn)? undoConfirmMarketing,
    TResult Function(ProductReturn productReturn)? undoConfirmPpic,
    TResult Function(ProductReturn productReturn)? delete,
    TResult Function(double discountValue, double ppnValue)? submit,
    TResult Function(ProductReturn productReturn)? initialize,
    required TResult orElse(),
  }) {
    if (createFormCustomer != null) {
      return createFormCustomer(customerForm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) createFormCustomer,
    required TResult Function(_Edit value) editFormCustomer,
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_Remove value) remove,
    required TResult Function(_ConfirmMarketing value) confirmMarketing,
    required TResult Function(_ConfirmPpic value) confirmPpic,
    required TResult Function(_UndoConfirmMarketing value) undoConfirmMarketing,
    required TResult Function(_UndoConfirmPpic value) undoConfirmPpic,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Submit value) submit,
    required TResult Function(_Initialize value) initialize,
  }) {
    return createFormCustomer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? createFormCustomer,
    TResult? Function(_Edit value)? editFormCustomer,
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_ConfirmMarketing value)? confirmMarketing,
    TResult? Function(_ConfirmPpic value)? confirmPpic,
    TResult? Function(_UndoConfirmMarketing value)? undoConfirmMarketing,
    TResult? Function(_UndoConfirmPpic value)? undoConfirmPpic,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_Initialize value)? initialize,
  }) {
    return createFormCustomer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? createFormCustomer,
    TResult Function(_Edit value)? editFormCustomer,
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_Remove value)? remove,
    TResult Function(_ConfirmMarketing value)? confirmMarketing,
    TResult Function(_ConfirmPpic value)? confirmPpic,
    TResult Function(_UndoConfirmMarketing value)? undoConfirmMarketing,
    TResult Function(_UndoConfirmPpic value)? undoConfirmPpic,
    TResult Function(_Delete value)? delete,
    TResult Function(_Submit value)? submit,
    TResult Function(_Initialize value)? initialize,
    required TResult orElse(),
  }) {
    if (createFormCustomer != null) {
      return createFormCustomer(this);
    }
    return orElse();
  }
}

abstract class _Create implements ProductReturnEvent {
  const factory _Create(
      {required final ProductReturnCustomerForm customerForm}) = _$CreateImpl;

  ProductReturnCustomerForm get customerForm;

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditImplCopyWith<$Res> {
  factory _$$EditImplCopyWith(
          _$EditImpl value, $Res Function(_$EditImpl) then) =
      __$$EditImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String productReturnId,
      Currency currency,
      Customer customer,
      Department department,
      TransactionType transactionType,
      String description,
      double subtotal,
      double discountPercent,
      double discountValue,
      double ppnPercent,
      double ppnValue,
      double accountValue,
      String referenceNo});

  $CurrencyCopyWith<$Res> get currency;
  $CustomerCopyWith<$Res> get customer;
  $DepartmentCopyWith<$Res> get department;
  $TransactionTypeCopyWith<$Res> get transactionType;
}

/// @nodoc
class __$$EditImplCopyWithImpl<$Res>
    extends _$ProductReturnEventCopyWithImpl<$Res, _$EditImpl>
    implements _$$EditImplCopyWith<$Res> {
  __$$EditImplCopyWithImpl(_$EditImpl _value, $Res Function(_$EditImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productReturnId = null,
    Object? currency = null,
    Object? customer = null,
    Object? department = null,
    Object? transactionType = null,
    Object? description = null,
    Object? subtotal = null,
    Object? discountPercent = null,
    Object? discountValue = null,
    Object? ppnPercent = null,
    Object? ppnValue = null,
    Object? accountValue = null,
    Object? referenceNo = null,
  }) {
    return _then(_$EditImpl(
      productReturnId: null == productReturnId
          ? _value.productReturnId
          : productReturnId // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as Currency,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      subtotal: null == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double,
      discountPercent: null == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double,
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      ppnPercent: null == ppnPercent
          ? _value.ppnPercent
          : ppnPercent // ignore: cast_nullable_to_non_nullable
              as double,
      ppnValue: null == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as double,
      accountValue: null == accountValue
          ? _value.accountValue
          : accountValue // ignore: cast_nullable_to_non_nullable
              as double,
      referenceNo: null == referenceNo
          ? _value.referenceNo
          : referenceNo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrencyCopyWith<$Res> get currency {
    return $CurrencyCopyWith<$Res>(_value.currency, (value) {
      return _then(_value.copyWith(currency: value));
    });
  }

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res> get customer {
    return $CustomerCopyWith<$Res>(_value.customer, (value) {
      return _then(_value.copyWith(customer: value));
    });
  }

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DepartmentCopyWith<$Res> get department {
    return $DepartmentCopyWith<$Res>(_value.department, (value) {
      return _then(_value.copyWith(department: value));
    });
  }

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionTypeCopyWith<$Res> get transactionType {
    return $TransactionTypeCopyWith<$Res>(_value.transactionType, (value) {
      return _then(_value.copyWith(transactionType: value));
    });
  }
}

/// @nodoc

class _$EditImpl implements _Edit {
  const _$EditImpl(
      {required this.productReturnId,
      required this.currency,
      required this.customer,
      required this.department,
      required this.transactionType,
      required this.description,
      required this.subtotal,
      required this.discountPercent,
      required this.discountValue,
      required this.ppnPercent,
      required this.ppnValue,
      required this.accountValue,
      required this.referenceNo});

  @override
  final String productReturnId;
  @override
  final Currency currency;
  @override
  final Customer customer;
  @override
  final Department department;
  @override
  final TransactionType transactionType;
  @override
  final String description;
  @override
  final double subtotal;
  @override
  final double discountPercent;
  @override
  final double discountValue;
  @override
  final double ppnPercent;
  @override
  final double ppnValue;
  @override
  final double accountValue;
  @override
  final String referenceNo;

  @override
  String toString() {
    return 'ProductReturnEvent.editFormCustomer(productReturnId: $productReturnId, currency: $currency, customer: $customer, department: $department, transactionType: $transactionType, description: $description, subtotal: $subtotal, discountPercent: $discountPercent, discountValue: $discountValue, ppnPercent: $ppnPercent, ppnValue: $ppnValue, accountValue: $accountValue, referenceNo: $referenceNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditImpl &&
            (identical(other.productReturnId, productReturnId) ||
                other.productReturnId == productReturnId) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.discountPercent, discountPercent) ||
                other.discountPercent == discountPercent) &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.ppnPercent, ppnPercent) ||
                other.ppnPercent == ppnPercent) &&
            (identical(other.ppnValue, ppnValue) ||
                other.ppnValue == ppnValue) &&
            (identical(other.accountValue, accountValue) ||
                other.accountValue == accountValue) &&
            (identical(other.referenceNo, referenceNo) ||
                other.referenceNo == referenceNo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      productReturnId,
      currency,
      customer,
      department,
      transactionType,
      description,
      subtotal,
      discountPercent,
      discountValue,
      ppnPercent,
      ppnValue,
      accountValue,
      referenceNo);

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditImplCopyWith<_$EditImpl> get copyWith =>
      __$$EditImplCopyWithImpl<_$EditImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductReturnCustomerForm customerForm)
        createFormCustomer,
    required TResult Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)
        editFormCustomer,
    required TResult Function(ProductReturnDetail products) productAdd,
    required TResult Function(ProductReturnDetail products) remove,
    required TResult Function(ProductReturn productReturn) confirmMarketing,
    required TResult Function(ProductReturn productReturn) confirmPpic,
    required TResult Function(ProductReturn productReturn) undoConfirmMarketing,
    required TResult Function(ProductReturn productReturn) undoConfirmPpic,
    required TResult Function(ProductReturn productReturn) delete,
    required TResult Function(double discountValue, double ppnValue) submit,
    required TResult Function(ProductReturn productReturn) initialize,
  }) {
    return editFormCustomer(
        productReturnId,
        currency,
        customer,
        department,
        transactionType,
        description,
        subtotal,
        discountPercent,
        discountValue,
        ppnPercent,
        ppnValue,
        accountValue,
        referenceNo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReturnCustomerForm customerForm)?
        createFormCustomer,
    TResult? Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)?
        editFormCustomer,
    TResult? Function(ProductReturnDetail products)? productAdd,
    TResult? Function(ProductReturnDetail products)? remove,
    TResult? Function(ProductReturn productReturn)? confirmMarketing,
    TResult? Function(ProductReturn productReturn)? confirmPpic,
    TResult? Function(ProductReturn productReturn)? undoConfirmMarketing,
    TResult? Function(ProductReturn productReturn)? undoConfirmPpic,
    TResult? Function(ProductReturn productReturn)? delete,
    TResult? Function(double discountValue, double ppnValue)? submit,
    TResult? Function(ProductReturn productReturn)? initialize,
  }) {
    return editFormCustomer?.call(
        productReturnId,
        currency,
        customer,
        department,
        transactionType,
        description,
        subtotal,
        discountPercent,
        discountValue,
        ppnPercent,
        ppnValue,
        accountValue,
        referenceNo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReturnCustomerForm customerForm)?
        createFormCustomer,
    TResult Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)?
        editFormCustomer,
    TResult Function(ProductReturnDetail products)? productAdd,
    TResult Function(ProductReturnDetail products)? remove,
    TResult Function(ProductReturn productReturn)? confirmMarketing,
    TResult Function(ProductReturn productReturn)? confirmPpic,
    TResult Function(ProductReturn productReturn)? undoConfirmMarketing,
    TResult Function(ProductReturn productReturn)? undoConfirmPpic,
    TResult Function(ProductReturn productReturn)? delete,
    TResult Function(double discountValue, double ppnValue)? submit,
    TResult Function(ProductReturn productReturn)? initialize,
    required TResult orElse(),
  }) {
    if (editFormCustomer != null) {
      return editFormCustomer(
          productReturnId,
          currency,
          customer,
          department,
          transactionType,
          description,
          subtotal,
          discountPercent,
          discountValue,
          ppnPercent,
          ppnValue,
          accountValue,
          referenceNo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) createFormCustomer,
    required TResult Function(_Edit value) editFormCustomer,
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_Remove value) remove,
    required TResult Function(_ConfirmMarketing value) confirmMarketing,
    required TResult Function(_ConfirmPpic value) confirmPpic,
    required TResult Function(_UndoConfirmMarketing value) undoConfirmMarketing,
    required TResult Function(_UndoConfirmPpic value) undoConfirmPpic,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Submit value) submit,
    required TResult Function(_Initialize value) initialize,
  }) {
    return editFormCustomer(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? createFormCustomer,
    TResult? Function(_Edit value)? editFormCustomer,
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_ConfirmMarketing value)? confirmMarketing,
    TResult? Function(_ConfirmPpic value)? confirmPpic,
    TResult? Function(_UndoConfirmMarketing value)? undoConfirmMarketing,
    TResult? Function(_UndoConfirmPpic value)? undoConfirmPpic,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_Initialize value)? initialize,
  }) {
    return editFormCustomer?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? createFormCustomer,
    TResult Function(_Edit value)? editFormCustomer,
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_Remove value)? remove,
    TResult Function(_ConfirmMarketing value)? confirmMarketing,
    TResult Function(_ConfirmPpic value)? confirmPpic,
    TResult Function(_UndoConfirmMarketing value)? undoConfirmMarketing,
    TResult Function(_UndoConfirmPpic value)? undoConfirmPpic,
    TResult Function(_Delete value)? delete,
    TResult Function(_Submit value)? submit,
    TResult Function(_Initialize value)? initialize,
    required TResult orElse(),
  }) {
    if (editFormCustomer != null) {
      return editFormCustomer(this);
    }
    return orElse();
  }
}

abstract class _Edit implements ProductReturnEvent {
  const factory _Edit(
      {required final String productReturnId,
      required final Currency currency,
      required final Customer customer,
      required final Department department,
      required final TransactionType transactionType,
      required final String description,
      required final double subtotal,
      required final double discountPercent,
      required final double discountValue,
      required final double ppnPercent,
      required final double ppnValue,
      required final double accountValue,
      required final String referenceNo}) = _$EditImpl;

  String get productReturnId;
  Currency get currency;
  Customer get customer;
  Department get department;
  TransactionType get transactionType;
  String get description;
  double get subtotal;
  double get discountPercent;
  double get discountValue;
  double get ppnPercent;
  double get ppnValue;
  double get accountValue;
  String get referenceNo;

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditImplCopyWith<_$EditImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductAddImplCopyWith<$Res> {
  factory _$$ProductAddImplCopyWith(
          _$ProductAddImpl value, $Res Function(_$ProductAddImpl) then) =
      __$$ProductAddImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductReturnDetail products});

  $ProductReturnDetailCopyWith<$Res> get products;
}

/// @nodoc
class __$$ProductAddImplCopyWithImpl<$Res>
    extends _$ProductReturnEventCopyWithImpl<$Res, _$ProductAddImpl>
    implements _$$ProductAddImplCopyWith<$Res> {
  __$$ProductAddImplCopyWithImpl(
      _$ProductAddImpl _value, $Res Function(_$ProductAddImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$ProductAddImpl(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as ProductReturnDetail,
    ));
  }

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductReturnDetailCopyWith<$Res> get products {
    return $ProductReturnDetailCopyWith<$Res>(_value.products, (value) {
      return _then(_value.copyWith(products: value));
    });
  }
}

/// @nodoc

class _$ProductAddImpl implements _ProductAdd {
  const _$ProductAddImpl({required this.products});

  @override
  final ProductReturnDetail products;

  @override
  String toString() {
    return 'ProductReturnEvent.productAdd(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductAddImpl &&
            (identical(other.products, products) ||
                other.products == products));
  }

  @override
  int get hashCode => Object.hash(runtimeType, products);

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductAddImplCopyWith<_$ProductAddImpl> get copyWith =>
      __$$ProductAddImplCopyWithImpl<_$ProductAddImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductReturnCustomerForm customerForm)
        createFormCustomer,
    required TResult Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)
        editFormCustomer,
    required TResult Function(ProductReturnDetail products) productAdd,
    required TResult Function(ProductReturnDetail products) remove,
    required TResult Function(ProductReturn productReturn) confirmMarketing,
    required TResult Function(ProductReturn productReturn) confirmPpic,
    required TResult Function(ProductReturn productReturn) undoConfirmMarketing,
    required TResult Function(ProductReturn productReturn) undoConfirmPpic,
    required TResult Function(ProductReturn productReturn) delete,
    required TResult Function(double discountValue, double ppnValue) submit,
    required TResult Function(ProductReturn productReturn) initialize,
  }) {
    return productAdd(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReturnCustomerForm customerForm)?
        createFormCustomer,
    TResult? Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)?
        editFormCustomer,
    TResult? Function(ProductReturnDetail products)? productAdd,
    TResult? Function(ProductReturnDetail products)? remove,
    TResult? Function(ProductReturn productReturn)? confirmMarketing,
    TResult? Function(ProductReturn productReturn)? confirmPpic,
    TResult? Function(ProductReturn productReturn)? undoConfirmMarketing,
    TResult? Function(ProductReturn productReturn)? undoConfirmPpic,
    TResult? Function(ProductReturn productReturn)? delete,
    TResult? Function(double discountValue, double ppnValue)? submit,
    TResult? Function(ProductReturn productReturn)? initialize,
  }) {
    return productAdd?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReturnCustomerForm customerForm)?
        createFormCustomer,
    TResult Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)?
        editFormCustomer,
    TResult Function(ProductReturnDetail products)? productAdd,
    TResult Function(ProductReturnDetail products)? remove,
    TResult Function(ProductReturn productReturn)? confirmMarketing,
    TResult Function(ProductReturn productReturn)? confirmPpic,
    TResult Function(ProductReturn productReturn)? undoConfirmMarketing,
    TResult Function(ProductReturn productReturn)? undoConfirmPpic,
    TResult Function(ProductReturn productReturn)? delete,
    TResult Function(double discountValue, double ppnValue)? submit,
    TResult Function(ProductReturn productReturn)? initialize,
    required TResult orElse(),
  }) {
    if (productAdd != null) {
      return productAdd(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) createFormCustomer,
    required TResult Function(_Edit value) editFormCustomer,
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_Remove value) remove,
    required TResult Function(_ConfirmMarketing value) confirmMarketing,
    required TResult Function(_ConfirmPpic value) confirmPpic,
    required TResult Function(_UndoConfirmMarketing value) undoConfirmMarketing,
    required TResult Function(_UndoConfirmPpic value) undoConfirmPpic,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Submit value) submit,
    required TResult Function(_Initialize value) initialize,
  }) {
    return productAdd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? createFormCustomer,
    TResult? Function(_Edit value)? editFormCustomer,
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_ConfirmMarketing value)? confirmMarketing,
    TResult? Function(_ConfirmPpic value)? confirmPpic,
    TResult? Function(_UndoConfirmMarketing value)? undoConfirmMarketing,
    TResult? Function(_UndoConfirmPpic value)? undoConfirmPpic,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_Initialize value)? initialize,
  }) {
    return productAdd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? createFormCustomer,
    TResult Function(_Edit value)? editFormCustomer,
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_Remove value)? remove,
    TResult Function(_ConfirmMarketing value)? confirmMarketing,
    TResult Function(_ConfirmPpic value)? confirmPpic,
    TResult Function(_UndoConfirmMarketing value)? undoConfirmMarketing,
    TResult Function(_UndoConfirmPpic value)? undoConfirmPpic,
    TResult Function(_Delete value)? delete,
    TResult Function(_Submit value)? submit,
    TResult Function(_Initialize value)? initialize,
    required TResult orElse(),
  }) {
    if (productAdd != null) {
      return productAdd(this);
    }
    return orElse();
  }
}

abstract class _ProductAdd implements ProductReturnEvent {
  const factory _ProductAdd({required final ProductReturnDetail products}) =
      _$ProductAddImpl;

  ProductReturnDetail get products;

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductAddImplCopyWith<_$ProductAddImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveImplCopyWith<$Res> {
  factory _$$RemoveImplCopyWith(
          _$RemoveImpl value, $Res Function(_$RemoveImpl) then) =
      __$$RemoveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductReturnDetail products});

  $ProductReturnDetailCopyWith<$Res> get products;
}

/// @nodoc
class __$$RemoveImplCopyWithImpl<$Res>
    extends _$ProductReturnEventCopyWithImpl<$Res, _$RemoveImpl>
    implements _$$RemoveImplCopyWith<$Res> {
  __$$RemoveImplCopyWithImpl(
      _$RemoveImpl _value, $Res Function(_$RemoveImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
  }) {
    return _then(_$RemoveImpl(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as ProductReturnDetail,
    ));
  }

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductReturnDetailCopyWith<$Res> get products {
    return $ProductReturnDetailCopyWith<$Res>(_value.products, (value) {
      return _then(_value.copyWith(products: value));
    });
  }
}

/// @nodoc

class _$RemoveImpl implements _Remove {
  const _$RemoveImpl({required this.products});

  @override
  final ProductReturnDetail products;

  @override
  String toString() {
    return 'ProductReturnEvent.remove(products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveImpl &&
            (identical(other.products, products) ||
                other.products == products));
  }

  @override
  int get hashCode => Object.hash(runtimeType, products);

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveImplCopyWith<_$RemoveImpl> get copyWith =>
      __$$RemoveImplCopyWithImpl<_$RemoveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductReturnCustomerForm customerForm)
        createFormCustomer,
    required TResult Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)
        editFormCustomer,
    required TResult Function(ProductReturnDetail products) productAdd,
    required TResult Function(ProductReturnDetail products) remove,
    required TResult Function(ProductReturn productReturn) confirmMarketing,
    required TResult Function(ProductReturn productReturn) confirmPpic,
    required TResult Function(ProductReturn productReturn) undoConfirmMarketing,
    required TResult Function(ProductReturn productReturn) undoConfirmPpic,
    required TResult Function(ProductReturn productReturn) delete,
    required TResult Function(double discountValue, double ppnValue) submit,
    required TResult Function(ProductReturn productReturn) initialize,
  }) {
    return remove(products);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReturnCustomerForm customerForm)?
        createFormCustomer,
    TResult? Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)?
        editFormCustomer,
    TResult? Function(ProductReturnDetail products)? productAdd,
    TResult? Function(ProductReturnDetail products)? remove,
    TResult? Function(ProductReturn productReturn)? confirmMarketing,
    TResult? Function(ProductReturn productReturn)? confirmPpic,
    TResult? Function(ProductReturn productReturn)? undoConfirmMarketing,
    TResult? Function(ProductReturn productReturn)? undoConfirmPpic,
    TResult? Function(ProductReturn productReturn)? delete,
    TResult? Function(double discountValue, double ppnValue)? submit,
    TResult? Function(ProductReturn productReturn)? initialize,
  }) {
    return remove?.call(products);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReturnCustomerForm customerForm)?
        createFormCustomer,
    TResult Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)?
        editFormCustomer,
    TResult Function(ProductReturnDetail products)? productAdd,
    TResult Function(ProductReturnDetail products)? remove,
    TResult Function(ProductReturn productReturn)? confirmMarketing,
    TResult Function(ProductReturn productReturn)? confirmPpic,
    TResult Function(ProductReturn productReturn)? undoConfirmMarketing,
    TResult Function(ProductReturn productReturn)? undoConfirmPpic,
    TResult Function(ProductReturn productReturn)? delete,
    TResult Function(double discountValue, double ppnValue)? submit,
    TResult Function(ProductReturn productReturn)? initialize,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(products);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) createFormCustomer,
    required TResult Function(_Edit value) editFormCustomer,
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_Remove value) remove,
    required TResult Function(_ConfirmMarketing value) confirmMarketing,
    required TResult Function(_ConfirmPpic value) confirmPpic,
    required TResult Function(_UndoConfirmMarketing value) undoConfirmMarketing,
    required TResult Function(_UndoConfirmPpic value) undoConfirmPpic,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Submit value) submit,
    required TResult Function(_Initialize value) initialize,
  }) {
    return remove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? createFormCustomer,
    TResult? Function(_Edit value)? editFormCustomer,
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_ConfirmMarketing value)? confirmMarketing,
    TResult? Function(_ConfirmPpic value)? confirmPpic,
    TResult? Function(_UndoConfirmMarketing value)? undoConfirmMarketing,
    TResult? Function(_UndoConfirmPpic value)? undoConfirmPpic,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_Initialize value)? initialize,
  }) {
    return remove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? createFormCustomer,
    TResult Function(_Edit value)? editFormCustomer,
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_Remove value)? remove,
    TResult Function(_ConfirmMarketing value)? confirmMarketing,
    TResult Function(_ConfirmPpic value)? confirmPpic,
    TResult Function(_UndoConfirmMarketing value)? undoConfirmMarketing,
    TResult Function(_UndoConfirmPpic value)? undoConfirmPpic,
    TResult Function(_Delete value)? delete,
    TResult Function(_Submit value)? submit,
    TResult Function(_Initialize value)? initialize,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(this);
    }
    return orElse();
  }
}

abstract class _Remove implements ProductReturnEvent {
  const factory _Remove({required final ProductReturnDetail products}) =
      _$RemoveImpl;

  ProductReturnDetail get products;

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveImplCopyWith<_$RemoveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfirmMarketingImplCopyWith<$Res> {
  factory _$$ConfirmMarketingImplCopyWith(_$ConfirmMarketingImpl value,
          $Res Function(_$ConfirmMarketingImpl) then) =
      __$$ConfirmMarketingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductReturn productReturn});

  $ProductReturnCopyWith<$Res> get productReturn;
}

/// @nodoc
class __$$ConfirmMarketingImplCopyWithImpl<$Res>
    extends _$ProductReturnEventCopyWithImpl<$Res, _$ConfirmMarketingImpl>
    implements _$$ConfirmMarketingImplCopyWith<$Res> {
  __$$ConfirmMarketingImplCopyWithImpl(_$ConfirmMarketingImpl _value,
      $Res Function(_$ConfirmMarketingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productReturn = null,
  }) {
    return _then(_$ConfirmMarketingImpl(
      productReturn: null == productReturn
          ? _value.productReturn
          : productReturn // ignore: cast_nullable_to_non_nullable
              as ProductReturn,
    ));
  }

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductReturnCopyWith<$Res> get productReturn {
    return $ProductReturnCopyWith<$Res>(_value.productReturn, (value) {
      return _then(_value.copyWith(productReturn: value));
    });
  }
}

/// @nodoc

class _$ConfirmMarketingImpl implements _ConfirmMarketing {
  const _$ConfirmMarketingImpl({required this.productReturn});

  @override
  final ProductReturn productReturn;

  @override
  String toString() {
    return 'ProductReturnEvent.confirmMarketing(productReturn: $productReturn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmMarketingImpl &&
            (identical(other.productReturn, productReturn) ||
                other.productReturn == productReturn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productReturn);

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmMarketingImplCopyWith<_$ConfirmMarketingImpl> get copyWith =>
      __$$ConfirmMarketingImplCopyWithImpl<_$ConfirmMarketingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductReturnCustomerForm customerForm)
        createFormCustomer,
    required TResult Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)
        editFormCustomer,
    required TResult Function(ProductReturnDetail products) productAdd,
    required TResult Function(ProductReturnDetail products) remove,
    required TResult Function(ProductReturn productReturn) confirmMarketing,
    required TResult Function(ProductReturn productReturn) confirmPpic,
    required TResult Function(ProductReturn productReturn) undoConfirmMarketing,
    required TResult Function(ProductReturn productReturn) undoConfirmPpic,
    required TResult Function(ProductReturn productReturn) delete,
    required TResult Function(double discountValue, double ppnValue) submit,
    required TResult Function(ProductReturn productReturn) initialize,
  }) {
    return confirmMarketing(productReturn);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReturnCustomerForm customerForm)?
        createFormCustomer,
    TResult? Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)?
        editFormCustomer,
    TResult? Function(ProductReturnDetail products)? productAdd,
    TResult? Function(ProductReturnDetail products)? remove,
    TResult? Function(ProductReturn productReturn)? confirmMarketing,
    TResult? Function(ProductReturn productReturn)? confirmPpic,
    TResult? Function(ProductReturn productReturn)? undoConfirmMarketing,
    TResult? Function(ProductReturn productReturn)? undoConfirmPpic,
    TResult? Function(ProductReturn productReturn)? delete,
    TResult? Function(double discountValue, double ppnValue)? submit,
    TResult? Function(ProductReturn productReturn)? initialize,
  }) {
    return confirmMarketing?.call(productReturn);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReturnCustomerForm customerForm)?
        createFormCustomer,
    TResult Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)?
        editFormCustomer,
    TResult Function(ProductReturnDetail products)? productAdd,
    TResult Function(ProductReturnDetail products)? remove,
    TResult Function(ProductReturn productReturn)? confirmMarketing,
    TResult Function(ProductReturn productReturn)? confirmPpic,
    TResult Function(ProductReturn productReturn)? undoConfirmMarketing,
    TResult Function(ProductReturn productReturn)? undoConfirmPpic,
    TResult Function(ProductReturn productReturn)? delete,
    TResult Function(double discountValue, double ppnValue)? submit,
    TResult Function(ProductReturn productReturn)? initialize,
    required TResult orElse(),
  }) {
    if (confirmMarketing != null) {
      return confirmMarketing(productReturn);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) createFormCustomer,
    required TResult Function(_Edit value) editFormCustomer,
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_Remove value) remove,
    required TResult Function(_ConfirmMarketing value) confirmMarketing,
    required TResult Function(_ConfirmPpic value) confirmPpic,
    required TResult Function(_UndoConfirmMarketing value) undoConfirmMarketing,
    required TResult Function(_UndoConfirmPpic value) undoConfirmPpic,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Submit value) submit,
    required TResult Function(_Initialize value) initialize,
  }) {
    return confirmMarketing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? createFormCustomer,
    TResult? Function(_Edit value)? editFormCustomer,
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_ConfirmMarketing value)? confirmMarketing,
    TResult? Function(_ConfirmPpic value)? confirmPpic,
    TResult? Function(_UndoConfirmMarketing value)? undoConfirmMarketing,
    TResult? Function(_UndoConfirmPpic value)? undoConfirmPpic,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_Initialize value)? initialize,
  }) {
    return confirmMarketing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? createFormCustomer,
    TResult Function(_Edit value)? editFormCustomer,
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_Remove value)? remove,
    TResult Function(_ConfirmMarketing value)? confirmMarketing,
    TResult Function(_ConfirmPpic value)? confirmPpic,
    TResult Function(_UndoConfirmMarketing value)? undoConfirmMarketing,
    TResult Function(_UndoConfirmPpic value)? undoConfirmPpic,
    TResult Function(_Delete value)? delete,
    TResult Function(_Submit value)? submit,
    TResult Function(_Initialize value)? initialize,
    required TResult orElse(),
  }) {
    if (confirmMarketing != null) {
      return confirmMarketing(this);
    }
    return orElse();
  }
}

abstract class _ConfirmMarketing implements ProductReturnEvent {
  const factory _ConfirmMarketing(
      {required final ProductReturn productReturn}) = _$ConfirmMarketingImpl;

  ProductReturn get productReturn;

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfirmMarketingImplCopyWith<_$ConfirmMarketingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfirmPpicImplCopyWith<$Res> {
  factory _$$ConfirmPpicImplCopyWith(
          _$ConfirmPpicImpl value, $Res Function(_$ConfirmPpicImpl) then) =
      __$$ConfirmPpicImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductReturn productReturn});

  $ProductReturnCopyWith<$Res> get productReturn;
}

/// @nodoc
class __$$ConfirmPpicImplCopyWithImpl<$Res>
    extends _$ProductReturnEventCopyWithImpl<$Res, _$ConfirmPpicImpl>
    implements _$$ConfirmPpicImplCopyWith<$Res> {
  __$$ConfirmPpicImplCopyWithImpl(
      _$ConfirmPpicImpl _value, $Res Function(_$ConfirmPpicImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productReturn = null,
  }) {
    return _then(_$ConfirmPpicImpl(
      productReturn: null == productReturn
          ? _value.productReturn
          : productReturn // ignore: cast_nullable_to_non_nullable
              as ProductReturn,
    ));
  }

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductReturnCopyWith<$Res> get productReturn {
    return $ProductReturnCopyWith<$Res>(_value.productReturn, (value) {
      return _then(_value.copyWith(productReturn: value));
    });
  }
}

/// @nodoc

class _$ConfirmPpicImpl implements _ConfirmPpic {
  const _$ConfirmPpicImpl({required this.productReturn});

  @override
  final ProductReturn productReturn;

  @override
  String toString() {
    return 'ProductReturnEvent.confirmPpic(productReturn: $productReturn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmPpicImpl &&
            (identical(other.productReturn, productReturn) ||
                other.productReturn == productReturn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productReturn);

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmPpicImplCopyWith<_$ConfirmPpicImpl> get copyWith =>
      __$$ConfirmPpicImplCopyWithImpl<_$ConfirmPpicImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductReturnCustomerForm customerForm)
        createFormCustomer,
    required TResult Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)
        editFormCustomer,
    required TResult Function(ProductReturnDetail products) productAdd,
    required TResult Function(ProductReturnDetail products) remove,
    required TResult Function(ProductReturn productReturn) confirmMarketing,
    required TResult Function(ProductReturn productReturn) confirmPpic,
    required TResult Function(ProductReturn productReturn) undoConfirmMarketing,
    required TResult Function(ProductReturn productReturn) undoConfirmPpic,
    required TResult Function(ProductReturn productReturn) delete,
    required TResult Function(double discountValue, double ppnValue) submit,
    required TResult Function(ProductReturn productReturn) initialize,
  }) {
    return confirmPpic(productReturn);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReturnCustomerForm customerForm)?
        createFormCustomer,
    TResult? Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)?
        editFormCustomer,
    TResult? Function(ProductReturnDetail products)? productAdd,
    TResult? Function(ProductReturnDetail products)? remove,
    TResult? Function(ProductReturn productReturn)? confirmMarketing,
    TResult? Function(ProductReturn productReturn)? confirmPpic,
    TResult? Function(ProductReturn productReturn)? undoConfirmMarketing,
    TResult? Function(ProductReturn productReturn)? undoConfirmPpic,
    TResult? Function(ProductReturn productReturn)? delete,
    TResult? Function(double discountValue, double ppnValue)? submit,
    TResult? Function(ProductReturn productReturn)? initialize,
  }) {
    return confirmPpic?.call(productReturn);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReturnCustomerForm customerForm)?
        createFormCustomer,
    TResult Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)?
        editFormCustomer,
    TResult Function(ProductReturnDetail products)? productAdd,
    TResult Function(ProductReturnDetail products)? remove,
    TResult Function(ProductReturn productReturn)? confirmMarketing,
    TResult Function(ProductReturn productReturn)? confirmPpic,
    TResult Function(ProductReturn productReturn)? undoConfirmMarketing,
    TResult Function(ProductReturn productReturn)? undoConfirmPpic,
    TResult Function(ProductReturn productReturn)? delete,
    TResult Function(double discountValue, double ppnValue)? submit,
    TResult Function(ProductReturn productReturn)? initialize,
    required TResult orElse(),
  }) {
    if (confirmPpic != null) {
      return confirmPpic(productReturn);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) createFormCustomer,
    required TResult Function(_Edit value) editFormCustomer,
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_Remove value) remove,
    required TResult Function(_ConfirmMarketing value) confirmMarketing,
    required TResult Function(_ConfirmPpic value) confirmPpic,
    required TResult Function(_UndoConfirmMarketing value) undoConfirmMarketing,
    required TResult Function(_UndoConfirmPpic value) undoConfirmPpic,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Submit value) submit,
    required TResult Function(_Initialize value) initialize,
  }) {
    return confirmPpic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? createFormCustomer,
    TResult? Function(_Edit value)? editFormCustomer,
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_ConfirmMarketing value)? confirmMarketing,
    TResult? Function(_ConfirmPpic value)? confirmPpic,
    TResult? Function(_UndoConfirmMarketing value)? undoConfirmMarketing,
    TResult? Function(_UndoConfirmPpic value)? undoConfirmPpic,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_Initialize value)? initialize,
  }) {
    return confirmPpic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? createFormCustomer,
    TResult Function(_Edit value)? editFormCustomer,
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_Remove value)? remove,
    TResult Function(_ConfirmMarketing value)? confirmMarketing,
    TResult Function(_ConfirmPpic value)? confirmPpic,
    TResult Function(_UndoConfirmMarketing value)? undoConfirmMarketing,
    TResult Function(_UndoConfirmPpic value)? undoConfirmPpic,
    TResult Function(_Delete value)? delete,
    TResult Function(_Submit value)? submit,
    TResult Function(_Initialize value)? initialize,
    required TResult orElse(),
  }) {
    if (confirmPpic != null) {
      return confirmPpic(this);
    }
    return orElse();
  }
}

abstract class _ConfirmPpic implements ProductReturnEvent {
  const factory _ConfirmPpic({required final ProductReturn productReturn}) =
      _$ConfirmPpicImpl;

  ProductReturn get productReturn;

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfirmPpicImplCopyWith<_$ConfirmPpicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UndoConfirmMarketingImplCopyWith<$Res> {
  factory _$$UndoConfirmMarketingImplCopyWith(_$UndoConfirmMarketingImpl value,
          $Res Function(_$UndoConfirmMarketingImpl) then) =
      __$$UndoConfirmMarketingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductReturn productReturn});

  $ProductReturnCopyWith<$Res> get productReturn;
}

/// @nodoc
class __$$UndoConfirmMarketingImplCopyWithImpl<$Res>
    extends _$ProductReturnEventCopyWithImpl<$Res, _$UndoConfirmMarketingImpl>
    implements _$$UndoConfirmMarketingImplCopyWith<$Res> {
  __$$UndoConfirmMarketingImplCopyWithImpl(_$UndoConfirmMarketingImpl _value,
      $Res Function(_$UndoConfirmMarketingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productReturn = null,
  }) {
    return _then(_$UndoConfirmMarketingImpl(
      productReturn: null == productReturn
          ? _value.productReturn
          : productReturn // ignore: cast_nullable_to_non_nullable
              as ProductReturn,
    ));
  }

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductReturnCopyWith<$Res> get productReturn {
    return $ProductReturnCopyWith<$Res>(_value.productReturn, (value) {
      return _then(_value.copyWith(productReturn: value));
    });
  }
}

/// @nodoc

class _$UndoConfirmMarketingImpl implements _UndoConfirmMarketing {
  const _$UndoConfirmMarketingImpl({required this.productReturn});

  @override
  final ProductReturn productReturn;

  @override
  String toString() {
    return 'ProductReturnEvent.undoConfirmMarketing(productReturn: $productReturn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UndoConfirmMarketingImpl &&
            (identical(other.productReturn, productReturn) ||
                other.productReturn == productReturn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productReturn);

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UndoConfirmMarketingImplCopyWith<_$UndoConfirmMarketingImpl>
      get copyWith =>
          __$$UndoConfirmMarketingImplCopyWithImpl<_$UndoConfirmMarketingImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductReturnCustomerForm customerForm)
        createFormCustomer,
    required TResult Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)
        editFormCustomer,
    required TResult Function(ProductReturnDetail products) productAdd,
    required TResult Function(ProductReturnDetail products) remove,
    required TResult Function(ProductReturn productReturn) confirmMarketing,
    required TResult Function(ProductReturn productReturn) confirmPpic,
    required TResult Function(ProductReturn productReturn) undoConfirmMarketing,
    required TResult Function(ProductReturn productReturn) undoConfirmPpic,
    required TResult Function(ProductReturn productReturn) delete,
    required TResult Function(double discountValue, double ppnValue) submit,
    required TResult Function(ProductReturn productReturn) initialize,
  }) {
    return undoConfirmMarketing(productReturn);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReturnCustomerForm customerForm)?
        createFormCustomer,
    TResult? Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)?
        editFormCustomer,
    TResult? Function(ProductReturnDetail products)? productAdd,
    TResult? Function(ProductReturnDetail products)? remove,
    TResult? Function(ProductReturn productReturn)? confirmMarketing,
    TResult? Function(ProductReturn productReturn)? confirmPpic,
    TResult? Function(ProductReturn productReturn)? undoConfirmMarketing,
    TResult? Function(ProductReturn productReturn)? undoConfirmPpic,
    TResult? Function(ProductReturn productReturn)? delete,
    TResult? Function(double discountValue, double ppnValue)? submit,
    TResult? Function(ProductReturn productReturn)? initialize,
  }) {
    return undoConfirmMarketing?.call(productReturn);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReturnCustomerForm customerForm)?
        createFormCustomer,
    TResult Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)?
        editFormCustomer,
    TResult Function(ProductReturnDetail products)? productAdd,
    TResult Function(ProductReturnDetail products)? remove,
    TResult Function(ProductReturn productReturn)? confirmMarketing,
    TResult Function(ProductReturn productReturn)? confirmPpic,
    TResult Function(ProductReturn productReturn)? undoConfirmMarketing,
    TResult Function(ProductReturn productReturn)? undoConfirmPpic,
    TResult Function(ProductReturn productReturn)? delete,
    TResult Function(double discountValue, double ppnValue)? submit,
    TResult Function(ProductReturn productReturn)? initialize,
    required TResult orElse(),
  }) {
    if (undoConfirmMarketing != null) {
      return undoConfirmMarketing(productReturn);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) createFormCustomer,
    required TResult Function(_Edit value) editFormCustomer,
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_Remove value) remove,
    required TResult Function(_ConfirmMarketing value) confirmMarketing,
    required TResult Function(_ConfirmPpic value) confirmPpic,
    required TResult Function(_UndoConfirmMarketing value) undoConfirmMarketing,
    required TResult Function(_UndoConfirmPpic value) undoConfirmPpic,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Submit value) submit,
    required TResult Function(_Initialize value) initialize,
  }) {
    return undoConfirmMarketing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? createFormCustomer,
    TResult? Function(_Edit value)? editFormCustomer,
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_ConfirmMarketing value)? confirmMarketing,
    TResult? Function(_ConfirmPpic value)? confirmPpic,
    TResult? Function(_UndoConfirmMarketing value)? undoConfirmMarketing,
    TResult? Function(_UndoConfirmPpic value)? undoConfirmPpic,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_Initialize value)? initialize,
  }) {
    return undoConfirmMarketing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? createFormCustomer,
    TResult Function(_Edit value)? editFormCustomer,
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_Remove value)? remove,
    TResult Function(_ConfirmMarketing value)? confirmMarketing,
    TResult Function(_ConfirmPpic value)? confirmPpic,
    TResult Function(_UndoConfirmMarketing value)? undoConfirmMarketing,
    TResult Function(_UndoConfirmPpic value)? undoConfirmPpic,
    TResult Function(_Delete value)? delete,
    TResult Function(_Submit value)? submit,
    TResult Function(_Initialize value)? initialize,
    required TResult orElse(),
  }) {
    if (undoConfirmMarketing != null) {
      return undoConfirmMarketing(this);
    }
    return orElse();
  }
}

abstract class _UndoConfirmMarketing implements ProductReturnEvent {
  const factory _UndoConfirmMarketing(
          {required final ProductReturn productReturn}) =
      _$UndoConfirmMarketingImpl;

  ProductReturn get productReturn;

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UndoConfirmMarketingImplCopyWith<_$UndoConfirmMarketingImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UndoConfirmPpicImplCopyWith<$Res> {
  factory _$$UndoConfirmPpicImplCopyWith(_$UndoConfirmPpicImpl value,
          $Res Function(_$UndoConfirmPpicImpl) then) =
      __$$UndoConfirmPpicImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductReturn productReturn});

  $ProductReturnCopyWith<$Res> get productReturn;
}

/// @nodoc
class __$$UndoConfirmPpicImplCopyWithImpl<$Res>
    extends _$ProductReturnEventCopyWithImpl<$Res, _$UndoConfirmPpicImpl>
    implements _$$UndoConfirmPpicImplCopyWith<$Res> {
  __$$UndoConfirmPpicImplCopyWithImpl(
      _$UndoConfirmPpicImpl _value, $Res Function(_$UndoConfirmPpicImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productReturn = null,
  }) {
    return _then(_$UndoConfirmPpicImpl(
      productReturn: null == productReturn
          ? _value.productReturn
          : productReturn // ignore: cast_nullable_to_non_nullable
              as ProductReturn,
    ));
  }

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductReturnCopyWith<$Res> get productReturn {
    return $ProductReturnCopyWith<$Res>(_value.productReturn, (value) {
      return _then(_value.copyWith(productReturn: value));
    });
  }
}

/// @nodoc

class _$UndoConfirmPpicImpl implements _UndoConfirmPpic {
  const _$UndoConfirmPpicImpl({required this.productReturn});

  @override
  final ProductReturn productReturn;

  @override
  String toString() {
    return 'ProductReturnEvent.undoConfirmPpic(productReturn: $productReturn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UndoConfirmPpicImpl &&
            (identical(other.productReturn, productReturn) ||
                other.productReturn == productReturn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productReturn);

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UndoConfirmPpicImplCopyWith<_$UndoConfirmPpicImpl> get copyWith =>
      __$$UndoConfirmPpicImplCopyWithImpl<_$UndoConfirmPpicImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductReturnCustomerForm customerForm)
        createFormCustomer,
    required TResult Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)
        editFormCustomer,
    required TResult Function(ProductReturnDetail products) productAdd,
    required TResult Function(ProductReturnDetail products) remove,
    required TResult Function(ProductReturn productReturn) confirmMarketing,
    required TResult Function(ProductReturn productReturn) confirmPpic,
    required TResult Function(ProductReturn productReturn) undoConfirmMarketing,
    required TResult Function(ProductReturn productReturn) undoConfirmPpic,
    required TResult Function(ProductReturn productReturn) delete,
    required TResult Function(double discountValue, double ppnValue) submit,
    required TResult Function(ProductReturn productReturn) initialize,
  }) {
    return undoConfirmPpic(productReturn);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReturnCustomerForm customerForm)?
        createFormCustomer,
    TResult? Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)?
        editFormCustomer,
    TResult? Function(ProductReturnDetail products)? productAdd,
    TResult? Function(ProductReturnDetail products)? remove,
    TResult? Function(ProductReturn productReturn)? confirmMarketing,
    TResult? Function(ProductReturn productReturn)? confirmPpic,
    TResult? Function(ProductReturn productReturn)? undoConfirmMarketing,
    TResult? Function(ProductReturn productReturn)? undoConfirmPpic,
    TResult? Function(ProductReturn productReturn)? delete,
    TResult? Function(double discountValue, double ppnValue)? submit,
    TResult? Function(ProductReturn productReturn)? initialize,
  }) {
    return undoConfirmPpic?.call(productReturn);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReturnCustomerForm customerForm)?
        createFormCustomer,
    TResult Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)?
        editFormCustomer,
    TResult Function(ProductReturnDetail products)? productAdd,
    TResult Function(ProductReturnDetail products)? remove,
    TResult Function(ProductReturn productReturn)? confirmMarketing,
    TResult Function(ProductReturn productReturn)? confirmPpic,
    TResult Function(ProductReturn productReturn)? undoConfirmMarketing,
    TResult Function(ProductReturn productReturn)? undoConfirmPpic,
    TResult Function(ProductReturn productReturn)? delete,
    TResult Function(double discountValue, double ppnValue)? submit,
    TResult Function(ProductReturn productReturn)? initialize,
    required TResult orElse(),
  }) {
    if (undoConfirmPpic != null) {
      return undoConfirmPpic(productReturn);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) createFormCustomer,
    required TResult Function(_Edit value) editFormCustomer,
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_Remove value) remove,
    required TResult Function(_ConfirmMarketing value) confirmMarketing,
    required TResult Function(_ConfirmPpic value) confirmPpic,
    required TResult Function(_UndoConfirmMarketing value) undoConfirmMarketing,
    required TResult Function(_UndoConfirmPpic value) undoConfirmPpic,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Submit value) submit,
    required TResult Function(_Initialize value) initialize,
  }) {
    return undoConfirmPpic(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? createFormCustomer,
    TResult? Function(_Edit value)? editFormCustomer,
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_ConfirmMarketing value)? confirmMarketing,
    TResult? Function(_ConfirmPpic value)? confirmPpic,
    TResult? Function(_UndoConfirmMarketing value)? undoConfirmMarketing,
    TResult? Function(_UndoConfirmPpic value)? undoConfirmPpic,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_Initialize value)? initialize,
  }) {
    return undoConfirmPpic?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? createFormCustomer,
    TResult Function(_Edit value)? editFormCustomer,
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_Remove value)? remove,
    TResult Function(_ConfirmMarketing value)? confirmMarketing,
    TResult Function(_ConfirmPpic value)? confirmPpic,
    TResult Function(_UndoConfirmMarketing value)? undoConfirmMarketing,
    TResult Function(_UndoConfirmPpic value)? undoConfirmPpic,
    TResult Function(_Delete value)? delete,
    TResult Function(_Submit value)? submit,
    TResult Function(_Initialize value)? initialize,
    required TResult orElse(),
  }) {
    if (undoConfirmPpic != null) {
      return undoConfirmPpic(this);
    }
    return orElse();
  }
}

abstract class _UndoConfirmPpic implements ProductReturnEvent {
  const factory _UndoConfirmPpic({required final ProductReturn productReturn}) =
      _$UndoConfirmPpicImpl;

  ProductReturn get productReturn;

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UndoConfirmPpicImplCopyWith<_$UndoConfirmPpicImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductReturn productReturn});

  $ProductReturnCopyWith<$Res> get productReturn;
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$ProductReturnEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productReturn = null,
  }) {
    return _then(_$DeleteImpl(
      productReturn: null == productReturn
          ? _value.productReturn
          : productReturn // ignore: cast_nullable_to_non_nullable
              as ProductReturn,
    ));
  }

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductReturnCopyWith<$Res> get productReturn {
    return $ProductReturnCopyWith<$Res>(_value.productReturn, (value) {
      return _then(_value.copyWith(productReturn: value));
    });
  }
}

/// @nodoc

class _$DeleteImpl implements _Delete {
  const _$DeleteImpl({required this.productReturn});

  @override
  final ProductReturn productReturn;

  @override
  String toString() {
    return 'ProductReturnEvent.delete(productReturn: $productReturn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteImpl &&
            (identical(other.productReturn, productReturn) ||
                other.productReturn == productReturn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productReturn);

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      __$$DeleteImplCopyWithImpl<_$DeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductReturnCustomerForm customerForm)
        createFormCustomer,
    required TResult Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)
        editFormCustomer,
    required TResult Function(ProductReturnDetail products) productAdd,
    required TResult Function(ProductReturnDetail products) remove,
    required TResult Function(ProductReturn productReturn) confirmMarketing,
    required TResult Function(ProductReturn productReturn) confirmPpic,
    required TResult Function(ProductReturn productReturn) undoConfirmMarketing,
    required TResult Function(ProductReturn productReturn) undoConfirmPpic,
    required TResult Function(ProductReturn productReturn) delete,
    required TResult Function(double discountValue, double ppnValue) submit,
    required TResult Function(ProductReturn productReturn) initialize,
  }) {
    return delete(productReturn);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReturnCustomerForm customerForm)?
        createFormCustomer,
    TResult? Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)?
        editFormCustomer,
    TResult? Function(ProductReturnDetail products)? productAdd,
    TResult? Function(ProductReturnDetail products)? remove,
    TResult? Function(ProductReturn productReturn)? confirmMarketing,
    TResult? Function(ProductReturn productReturn)? confirmPpic,
    TResult? Function(ProductReturn productReturn)? undoConfirmMarketing,
    TResult? Function(ProductReturn productReturn)? undoConfirmPpic,
    TResult? Function(ProductReturn productReturn)? delete,
    TResult? Function(double discountValue, double ppnValue)? submit,
    TResult? Function(ProductReturn productReturn)? initialize,
  }) {
    return delete?.call(productReturn);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReturnCustomerForm customerForm)?
        createFormCustomer,
    TResult Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)?
        editFormCustomer,
    TResult Function(ProductReturnDetail products)? productAdd,
    TResult Function(ProductReturnDetail products)? remove,
    TResult Function(ProductReturn productReturn)? confirmMarketing,
    TResult Function(ProductReturn productReturn)? confirmPpic,
    TResult Function(ProductReturn productReturn)? undoConfirmMarketing,
    TResult Function(ProductReturn productReturn)? undoConfirmPpic,
    TResult Function(ProductReturn productReturn)? delete,
    TResult Function(double discountValue, double ppnValue)? submit,
    TResult Function(ProductReturn productReturn)? initialize,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(productReturn);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) createFormCustomer,
    required TResult Function(_Edit value) editFormCustomer,
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_Remove value) remove,
    required TResult Function(_ConfirmMarketing value) confirmMarketing,
    required TResult Function(_ConfirmPpic value) confirmPpic,
    required TResult Function(_UndoConfirmMarketing value) undoConfirmMarketing,
    required TResult Function(_UndoConfirmPpic value) undoConfirmPpic,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Submit value) submit,
    required TResult Function(_Initialize value) initialize,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? createFormCustomer,
    TResult? Function(_Edit value)? editFormCustomer,
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_ConfirmMarketing value)? confirmMarketing,
    TResult? Function(_ConfirmPpic value)? confirmPpic,
    TResult? Function(_UndoConfirmMarketing value)? undoConfirmMarketing,
    TResult? Function(_UndoConfirmPpic value)? undoConfirmPpic,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_Initialize value)? initialize,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? createFormCustomer,
    TResult Function(_Edit value)? editFormCustomer,
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_Remove value)? remove,
    TResult Function(_ConfirmMarketing value)? confirmMarketing,
    TResult Function(_ConfirmPpic value)? confirmPpic,
    TResult Function(_UndoConfirmMarketing value)? undoConfirmMarketing,
    TResult Function(_UndoConfirmPpic value)? undoConfirmPpic,
    TResult Function(_Delete value)? delete,
    TResult Function(_Submit value)? submit,
    TResult Function(_Initialize value)? initialize,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements ProductReturnEvent {
  const factory _Delete({required final ProductReturn productReturn}) =
      _$DeleteImpl;

  ProductReturn get productReturn;

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitImplCopyWith<$Res> {
  factory _$$SubmitImplCopyWith(
          _$SubmitImpl value, $Res Function(_$SubmitImpl) then) =
      __$$SubmitImplCopyWithImpl<$Res>;
  @useResult
  $Res call({double discountValue, double ppnValue});
}

/// @nodoc
class __$$SubmitImplCopyWithImpl<$Res>
    extends _$ProductReturnEventCopyWithImpl<$Res, _$SubmitImpl>
    implements _$$SubmitImplCopyWith<$Res> {
  __$$SubmitImplCopyWithImpl(
      _$SubmitImpl _value, $Res Function(_$SubmitImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? discountValue = null,
    Object? ppnValue = null,
  }) {
    return _then(_$SubmitImpl(
      discountValue: null == discountValue
          ? _value.discountValue
          : discountValue // ignore: cast_nullable_to_non_nullable
              as double,
      ppnValue: null == ppnValue
          ? _value.ppnValue
          : ppnValue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$SubmitImpl implements _Submit {
  const _$SubmitImpl({required this.discountValue, required this.ppnValue});

  @override
  final double discountValue;
  @override
  final double ppnValue;

  @override
  String toString() {
    return 'ProductReturnEvent.submit(discountValue: $discountValue, ppnValue: $ppnValue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitImpl &&
            (identical(other.discountValue, discountValue) ||
                other.discountValue == discountValue) &&
            (identical(other.ppnValue, ppnValue) ||
                other.ppnValue == ppnValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, discountValue, ppnValue);

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitImplCopyWith<_$SubmitImpl> get copyWith =>
      __$$SubmitImplCopyWithImpl<_$SubmitImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductReturnCustomerForm customerForm)
        createFormCustomer,
    required TResult Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)
        editFormCustomer,
    required TResult Function(ProductReturnDetail products) productAdd,
    required TResult Function(ProductReturnDetail products) remove,
    required TResult Function(ProductReturn productReturn) confirmMarketing,
    required TResult Function(ProductReturn productReturn) confirmPpic,
    required TResult Function(ProductReturn productReturn) undoConfirmMarketing,
    required TResult Function(ProductReturn productReturn) undoConfirmPpic,
    required TResult Function(ProductReturn productReturn) delete,
    required TResult Function(double discountValue, double ppnValue) submit,
    required TResult Function(ProductReturn productReturn) initialize,
  }) {
    return submit(discountValue, ppnValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReturnCustomerForm customerForm)?
        createFormCustomer,
    TResult? Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)?
        editFormCustomer,
    TResult? Function(ProductReturnDetail products)? productAdd,
    TResult? Function(ProductReturnDetail products)? remove,
    TResult? Function(ProductReturn productReturn)? confirmMarketing,
    TResult? Function(ProductReturn productReturn)? confirmPpic,
    TResult? Function(ProductReturn productReturn)? undoConfirmMarketing,
    TResult? Function(ProductReturn productReturn)? undoConfirmPpic,
    TResult? Function(ProductReturn productReturn)? delete,
    TResult? Function(double discountValue, double ppnValue)? submit,
    TResult? Function(ProductReturn productReturn)? initialize,
  }) {
    return submit?.call(discountValue, ppnValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReturnCustomerForm customerForm)?
        createFormCustomer,
    TResult Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)?
        editFormCustomer,
    TResult Function(ProductReturnDetail products)? productAdd,
    TResult Function(ProductReturnDetail products)? remove,
    TResult Function(ProductReturn productReturn)? confirmMarketing,
    TResult Function(ProductReturn productReturn)? confirmPpic,
    TResult Function(ProductReturn productReturn)? undoConfirmMarketing,
    TResult Function(ProductReturn productReturn)? undoConfirmPpic,
    TResult Function(ProductReturn productReturn)? delete,
    TResult Function(double discountValue, double ppnValue)? submit,
    TResult Function(ProductReturn productReturn)? initialize,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(discountValue, ppnValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) createFormCustomer,
    required TResult Function(_Edit value) editFormCustomer,
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_Remove value) remove,
    required TResult Function(_ConfirmMarketing value) confirmMarketing,
    required TResult Function(_ConfirmPpic value) confirmPpic,
    required TResult Function(_UndoConfirmMarketing value) undoConfirmMarketing,
    required TResult Function(_UndoConfirmPpic value) undoConfirmPpic,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Submit value) submit,
    required TResult Function(_Initialize value) initialize,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? createFormCustomer,
    TResult? Function(_Edit value)? editFormCustomer,
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_ConfirmMarketing value)? confirmMarketing,
    TResult? Function(_ConfirmPpic value)? confirmPpic,
    TResult? Function(_UndoConfirmMarketing value)? undoConfirmMarketing,
    TResult? Function(_UndoConfirmPpic value)? undoConfirmPpic,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_Initialize value)? initialize,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? createFormCustomer,
    TResult Function(_Edit value)? editFormCustomer,
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_Remove value)? remove,
    TResult Function(_ConfirmMarketing value)? confirmMarketing,
    TResult Function(_ConfirmPpic value)? confirmPpic,
    TResult Function(_UndoConfirmMarketing value)? undoConfirmMarketing,
    TResult Function(_UndoConfirmPpic value)? undoConfirmPpic,
    TResult Function(_Delete value)? delete,
    TResult Function(_Submit value)? submit,
    TResult Function(_Initialize value)? initialize,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class _Submit implements ProductReturnEvent {
  const factory _Submit(
      {required final double discountValue,
      required final double ppnValue}) = _$SubmitImpl;

  double get discountValue;
  double get ppnValue;

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubmitImplCopyWith<_$SubmitImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductReturn productReturn});

  $ProductReturnCopyWith<$Res> get productReturn;
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$ProductReturnEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productReturn = null,
  }) {
    return _then(_$InitializeImpl(
      null == productReturn
          ? _value.productReturn
          : productReturn // ignore: cast_nullable_to_non_nullable
              as ProductReturn,
    ));
  }

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductReturnCopyWith<$Res> get productReturn {
    return $ProductReturnCopyWith<$Res>(_value.productReturn, (value) {
      return _then(_value.copyWith(productReturn: value));
    });
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl(this.productReturn);

  @override
  final ProductReturn productReturn;

  @override
  String toString() {
    return 'ProductReturnEvent.initialize(productReturn: $productReturn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.productReturn, productReturn) ||
                other.productReturn == productReturn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productReturn);

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductReturnCustomerForm customerForm)
        createFormCustomer,
    required TResult Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)
        editFormCustomer,
    required TResult Function(ProductReturnDetail products) productAdd,
    required TResult Function(ProductReturnDetail products) remove,
    required TResult Function(ProductReturn productReturn) confirmMarketing,
    required TResult Function(ProductReturn productReturn) confirmPpic,
    required TResult Function(ProductReturn productReturn) undoConfirmMarketing,
    required TResult Function(ProductReturn productReturn) undoConfirmPpic,
    required TResult Function(ProductReturn productReturn) delete,
    required TResult Function(double discountValue, double ppnValue) submit,
    required TResult Function(ProductReturn productReturn) initialize,
  }) {
    return initialize(productReturn);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReturnCustomerForm customerForm)?
        createFormCustomer,
    TResult? Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)?
        editFormCustomer,
    TResult? Function(ProductReturnDetail products)? productAdd,
    TResult? Function(ProductReturnDetail products)? remove,
    TResult? Function(ProductReturn productReturn)? confirmMarketing,
    TResult? Function(ProductReturn productReturn)? confirmPpic,
    TResult? Function(ProductReturn productReturn)? undoConfirmMarketing,
    TResult? Function(ProductReturn productReturn)? undoConfirmPpic,
    TResult? Function(ProductReturn productReturn)? delete,
    TResult? Function(double discountValue, double ppnValue)? submit,
    TResult? Function(ProductReturn productReturn)? initialize,
  }) {
    return initialize?.call(productReturn);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReturnCustomerForm customerForm)?
        createFormCustomer,
    TResult Function(
            String productReturnId,
            Currency currency,
            Customer customer,
            Department department,
            TransactionType transactionType,
            String description,
            double subtotal,
            double discountPercent,
            double discountValue,
            double ppnPercent,
            double ppnValue,
            double accountValue,
            String referenceNo)?
        editFormCustomer,
    TResult Function(ProductReturnDetail products)? productAdd,
    TResult Function(ProductReturnDetail products)? remove,
    TResult Function(ProductReturn productReturn)? confirmMarketing,
    TResult Function(ProductReturn productReturn)? confirmPpic,
    TResult Function(ProductReturn productReturn)? undoConfirmMarketing,
    TResult Function(ProductReturn productReturn)? undoConfirmPpic,
    TResult Function(ProductReturn productReturn)? delete,
    TResult Function(double discountValue, double ppnValue)? submit,
    TResult Function(ProductReturn productReturn)? initialize,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(productReturn);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) createFormCustomer,
    required TResult Function(_Edit value) editFormCustomer,
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_Remove value) remove,
    required TResult Function(_ConfirmMarketing value) confirmMarketing,
    required TResult Function(_ConfirmPpic value) confirmPpic,
    required TResult Function(_UndoConfirmMarketing value) undoConfirmMarketing,
    required TResult Function(_UndoConfirmPpic value) undoConfirmPpic,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Submit value) submit,
    required TResult Function(_Initialize value) initialize,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? createFormCustomer,
    TResult? Function(_Edit value)? editFormCustomer,
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_ConfirmMarketing value)? confirmMarketing,
    TResult? Function(_ConfirmPpic value)? confirmPpic,
    TResult? Function(_UndoConfirmMarketing value)? undoConfirmMarketing,
    TResult? Function(_UndoConfirmPpic value)? undoConfirmPpic,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_Initialize value)? initialize,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? createFormCustomer,
    TResult Function(_Edit value)? editFormCustomer,
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_Remove value)? remove,
    TResult Function(_ConfirmMarketing value)? confirmMarketing,
    TResult Function(_ConfirmPpic value)? confirmPpic,
    TResult Function(_UndoConfirmMarketing value)? undoConfirmMarketing,
    TResult Function(_UndoConfirmPpic value)? undoConfirmPpic,
    TResult Function(_Delete value)? delete,
    TResult Function(_Submit value)? submit,
    TResult Function(_Initialize value)? initialize,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements ProductReturnEvent {
  const factory _Initialize(final ProductReturn productReturn) =
      _$InitializeImpl;

  ProductReturn get productReturn;

  /// Create a copy of ProductReturnEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
