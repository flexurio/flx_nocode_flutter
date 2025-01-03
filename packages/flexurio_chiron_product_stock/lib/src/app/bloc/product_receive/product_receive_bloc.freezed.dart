// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_receive_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductReceiveState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductReceiveDetail> productReceiveDetails,
            ProductReceiveFormTransaction? productReceiveForm)
        initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductReceiveDetail> productReceiveDetails,
            ProductReceiveFormTransaction? productReceiveForm)?
        initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductReceiveDetail> productReceiveDetails,
            ProductReceiveFormTransaction? productReceiveForm)?
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
abstract class $ProductReceiveStateCopyWith<$Res> {
  factory $ProductReceiveStateCopyWith(
          ProductReceiveState value, $Res Function(ProductReceiveState) then) =
      _$ProductReceiveStateCopyWithImpl<$Res, ProductReceiveState>;
}

/// @nodoc
class _$ProductReceiveStateCopyWithImpl<$Res, $Val extends ProductReceiveState>
    implements $ProductReceiveStateCopyWith<$Res> {
  _$ProductReceiveStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<ProductReceiveDetail> productReceiveDetails,
      ProductReceiveFormTransaction? productReceiveForm});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ProductReceiveStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productReceiveDetails = null,
    Object? productReceiveForm = freezed,
  }) {
    return _then(_$InitialImpl(
      productReceiveDetails: null == productReceiveDetails
          ? _value._productReceiveDetails
          : productReceiveDetails // ignore: cast_nullable_to_non_nullable
              as List<ProductReceiveDetail>,
      productReceiveForm: freezed == productReceiveForm
          ? _value.productReceiveForm
          : productReceiveForm // ignore: cast_nullable_to_non_nullable
              as ProductReceiveFormTransaction?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required final List<ProductReceiveDetail> productReceiveDetails,
      this.productReceiveForm})
      : _productReceiveDetails = productReceiveDetails;

  final List<ProductReceiveDetail> _productReceiveDetails;
  @override
  List<ProductReceiveDetail> get productReceiveDetails {
    if (_productReceiveDetails is EqualUnmodifiableListView)
      return _productReceiveDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_productReceiveDetails);
  }

  @override
  final ProductReceiveFormTransaction? productReceiveForm;

  @override
  String toString() {
    return 'ProductReceiveState.initial(productReceiveDetails: $productReceiveDetails, productReceiveForm: $productReceiveForm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._productReceiveDetails, _productReceiveDetails) &&
            (identical(other.productReceiveForm, productReceiveForm) ||
                other.productReceiveForm == productReceiveForm));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_productReceiveDetails),
      productReceiveForm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductReceiveDetail> productReceiveDetails,
            ProductReceiveFormTransaction? productReceiveForm)
        initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return initial(productReceiveDetails, productReceiveForm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<ProductReceiveDetail> productReceiveDetails,
            ProductReceiveFormTransaction? productReceiveForm)?
        initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call(productReceiveDetails, productReceiveForm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<ProductReceiveDetail> productReceiveDetails,
            ProductReceiveFormTransaction? productReceiveForm)?
        initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(productReceiveDetails, productReceiveForm);
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

abstract class _Initial implements ProductReceiveState {
  const factory _Initial(
      {required final List<ProductReceiveDetail> productReceiveDetails,
      final ProductReceiveFormTransaction? productReceiveForm}) = _$InitialImpl;

  List<ProductReceiveDetail> get productReceiveDetails;
  ProductReceiveFormTransaction? get productReceiveForm;
  @JsonKey(ignore: true)
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
    extends _$ProductReceiveStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ProductReceiveState.loading()';
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
    required TResult Function(List<ProductReceiveDetail> productReceiveDetails,
            ProductReceiveFormTransaction? productReceiveForm)
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
    TResult? Function(List<ProductReceiveDetail> productReceiveDetails,
            ProductReceiveFormTransaction? productReceiveForm)?
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
    TResult Function(List<ProductReceiveDetail> productReceiveDetails,
            ProductReceiveFormTransaction? productReceiveForm)?
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

abstract class _Loading implements ProductReceiveState {
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
    extends _$ProductReceiveStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'ProductReceiveState.success()';
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
    required TResult Function(List<ProductReceiveDetail> productReceiveDetails,
            ProductReceiveFormTransaction? productReceiveForm)
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
    TResult? Function(List<ProductReceiveDetail> productReceiveDetails,
            ProductReceiveFormTransaction? productReceiveForm)?
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
    TResult Function(List<ProductReceiveDetail> productReceiveDetails,
            ProductReceiveFormTransaction? productReceiveForm)?
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

abstract class _Success implements ProductReceiveState {
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
    extends _$ProductReceiveStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

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
    return 'ProductReceiveState.error(error: $error)';
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<ProductReceiveDetail> productReceiveDetails,
            ProductReceiveFormTransaction? productReceiveForm)
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
    TResult? Function(List<ProductReceiveDetail> productReceiveDetails,
            ProductReceiveFormTransaction? productReceiveForm)?
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
    TResult Function(List<ProductReceiveDetail> productReceiveDetails,
            ProductReceiveFormTransaction? productReceiveForm)?
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

abstract class _Error implements ProductReceiveState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductReceiveEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductReceive productReceive) initialize,
    required TResult Function() submit,
    required TResult Function(ProductReceiveFormTransaction productReceiveForm)
        transactionCreate,
    required TResult Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)
        transactionEdit,
    required TResult Function(ProductReceiveDetail productReceive) productEdit,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productAdd,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productRelease,
    required TResult Function(
            ProductReceiveDetail productReceiveDetail, String reason)
        productReject,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productRemove,
    required TResult Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)
        productReceiveHeaderEdit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReceive productReceive)? initialize,
    TResult? Function()? submit,
    TResult? Function(ProductReceiveFormTransaction productReceiveForm)?
        transactionCreate,
    TResult? Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)?
        transactionEdit,
    TResult? Function(ProductReceiveDetail productReceive)? productEdit,
    TResult? Function(ProductReceiveDetail productReceiveDetail)? productAdd,
    TResult? Function(ProductReceiveDetail productReceiveDetail)?
        productRelease,
    TResult? Function(ProductReceiveDetail productReceiveDetail, String reason)?
        productReject,
    TResult? Function(ProductReceiveDetail productReceiveDetail)? productRemove,
    TResult? Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)?
        productReceiveHeaderEdit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReceive productReceive)? initialize,
    TResult Function()? submit,
    TResult Function(ProductReceiveFormTransaction productReceiveForm)?
        transactionCreate,
    TResult Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)?
        transactionEdit,
    TResult Function(ProductReceiveDetail productReceive)? productEdit,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productAdd,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productRelease,
    TResult Function(ProductReceiveDetail productReceiveDetail, String reason)?
        productReject,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productRemove,
    TResult Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)?
        productReceiveHeaderEdit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Submit value) submit,
    required TResult Function(_TransactionCreate value) transactionCreate,
    required TResult Function(_TransactionEdit value) transactionEdit,
    required TResult Function(_ProductEdit value) productEdit,
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_ProductRelease value) productRelease,
    required TResult Function(_ProductReject value) productReject,
    required TResult Function(_ProductRemove value) productRemove,
    required TResult Function(_ProductReceiveHeaderEdit value)
        productReceiveHeaderEdit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_TransactionCreate value)? transactionCreate,
    TResult? Function(_TransactionEdit value)? transactionEdit,
    TResult? Function(_ProductEdit value)? productEdit,
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_ProductRelease value)? productRelease,
    TResult? Function(_ProductReject value)? productReject,
    TResult? Function(_ProductRemove value)? productRemove,
    TResult? Function(_ProductReceiveHeaderEdit value)?
        productReceiveHeaderEdit,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Submit value)? submit,
    TResult Function(_TransactionCreate value)? transactionCreate,
    TResult Function(_TransactionEdit value)? transactionEdit,
    TResult Function(_ProductEdit value)? productEdit,
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_ProductRelease value)? productRelease,
    TResult Function(_ProductReject value)? productReject,
    TResult Function(_ProductRemove value)? productRemove,
    TResult Function(_ProductReceiveHeaderEdit value)? productReceiveHeaderEdit,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReceiveEventCopyWith<$Res> {
  factory $ProductReceiveEventCopyWith(
          ProductReceiveEvent value, $Res Function(ProductReceiveEvent) then) =
      _$ProductReceiveEventCopyWithImpl<$Res, ProductReceiveEvent>;
}

/// @nodoc
class _$ProductReceiveEventCopyWithImpl<$Res, $Val extends ProductReceiveEvent>
    implements $ProductReceiveEventCopyWith<$Res> {
  _$ProductReceiveEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductReceive productReceive});

  $ProductReceiveCopyWith<$Res> get productReceive;
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$ProductReceiveEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productReceive = null,
  }) {
    return _then(_$InitializeImpl(
      null == productReceive
          ? _value.productReceive
          : productReceive // ignore: cast_nullable_to_non_nullable
              as ProductReceive,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductReceiveCopyWith<$Res> get productReceive {
    return $ProductReceiveCopyWith<$Res>(_value.productReceive, (value) {
      return _then(_value.copyWith(productReceive: value));
    });
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl(this.productReceive);

  @override
  final ProductReceive productReceive;

  @override
  String toString() {
    return 'ProductReceiveEvent.initialize(productReceive: $productReceive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.productReceive, productReceive) ||
                other.productReceive == productReceive));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productReceive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductReceive productReceive) initialize,
    required TResult Function() submit,
    required TResult Function(ProductReceiveFormTransaction productReceiveForm)
        transactionCreate,
    required TResult Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)
        transactionEdit,
    required TResult Function(ProductReceiveDetail productReceive) productEdit,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productAdd,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productRelease,
    required TResult Function(
            ProductReceiveDetail productReceiveDetail, String reason)
        productReject,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productRemove,
    required TResult Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)
        productReceiveHeaderEdit,
  }) {
    return initialize(productReceive);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReceive productReceive)? initialize,
    TResult? Function()? submit,
    TResult? Function(ProductReceiveFormTransaction productReceiveForm)?
        transactionCreate,
    TResult? Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)?
        transactionEdit,
    TResult? Function(ProductReceiveDetail productReceive)? productEdit,
    TResult? Function(ProductReceiveDetail productReceiveDetail)? productAdd,
    TResult? Function(ProductReceiveDetail productReceiveDetail)?
        productRelease,
    TResult? Function(ProductReceiveDetail productReceiveDetail, String reason)?
        productReject,
    TResult? Function(ProductReceiveDetail productReceiveDetail)? productRemove,
    TResult? Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)?
        productReceiveHeaderEdit,
  }) {
    return initialize?.call(productReceive);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReceive productReceive)? initialize,
    TResult Function()? submit,
    TResult Function(ProductReceiveFormTransaction productReceiveForm)?
        transactionCreate,
    TResult Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)?
        transactionEdit,
    TResult Function(ProductReceiveDetail productReceive)? productEdit,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productAdd,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productRelease,
    TResult Function(ProductReceiveDetail productReceiveDetail, String reason)?
        productReject,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productRemove,
    TResult Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)?
        productReceiveHeaderEdit,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(productReceive);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Submit value) submit,
    required TResult Function(_TransactionCreate value) transactionCreate,
    required TResult Function(_TransactionEdit value) transactionEdit,
    required TResult Function(_ProductEdit value) productEdit,
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_ProductRelease value) productRelease,
    required TResult Function(_ProductReject value) productReject,
    required TResult Function(_ProductRemove value) productRemove,
    required TResult Function(_ProductReceiveHeaderEdit value)
        productReceiveHeaderEdit,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_TransactionCreate value)? transactionCreate,
    TResult? Function(_TransactionEdit value)? transactionEdit,
    TResult? Function(_ProductEdit value)? productEdit,
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_ProductRelease value)? productRelease,
    TResult? Function(_ProductReject value)? productReject,
    TResult? Function(_ProductRemove value)? productRemove,
    TResult? Function(_ProductReceiveHeaderEdit value)?
        productReceiveHeaderEdit,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Submit value)? submit,
    TResult Function(_TransactionCreate value)? transactionCreate,
    TResult Function(_TransactionEdit value)? transactionEdit,
    TResult Function(_ProductEdit value)? productEdit,
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_ProductRelease value)? productRelease,
    TResult Function(_ProductReject value)? productReject,
    TResult Function(_ProductRemove value)? productRemove,
    TResult Function(_ProductReceiveHeaderEdit value)? productReceiveHeaderEdit,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements ProductReceiveEvent {
  const factory _Initialize(final ProductReceive productReceive) =
      _$InitializeImpl;

  ProductReceive get productReceive;
  @JsonKey(ignore: true)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
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
    extends _$ProductReceiveEventCopyWithImpl<$Res, _$SubmitImpl>
    implements _$$SubmitImplCopyWith<$Res> {
  __$$SubmitImplCopyWithImpl(
      _$SubmitImpl _value, $Res Function(_$SubmitImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SubmitImpl implements _Submit {
  const _$SubmitImpl();

  @override
  String toString() {
    return 'ProductReceiveEvent.submit()';
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
    required TResult Function(ProductReceive productReceive) initialize,
    required TResult Function() submit,
    required TResult Function(ProductReceiveFormTransaction productReceiveForm)
        transactionCreate,
    required TResult Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)
        transactionEdit,
    required TResult Function(ProductReceiveDetail productReceive) productEdit,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productAdd,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productRelease,
    required TResult Function(
            ProductReceiveDetail productReceiveDetail, String reason)
        productReject,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productRemove,
    required TResult Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)
        productReceiveHeaderEdit,
  }) {
    return submit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReceive productReceive)? initialize,
    TResult? Function()? submit,
    TResult? Function(ProductReceiveFormTransaction productReceiveForm)?
        transactionCreate,
    TResult? Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)?
        transactionEdit,
    TResult? Function(ProductReceiveDetail productReceive)? productEdit,
    TResult? Function(ProductReceiveDetail productReceiveDetail)? productAdd,
    TResult? Function(ProductReceiveDetail productReceiveDetail)?
        productRelease,
    TResult? Function(ProductReceiveDetail productReceiveDetail, String reason)?
        productReject,
    TResult? Function(ProductReceiveDetail productReceiveDetail)? productRemove,
    TResult? Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)?
        productReceiveHeaderEdit,
  }) {
    return submit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReceive productReceive)? initialize,
    TResult Function()? submit,
    TResult Function(ProductReceiveFormTransaction productReceiveForm)?
        transactionCreate,
    TResult Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)?
        transactionEdit,
    TResult Function(ProductReceiveDetail productReceive)? productEdit,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productAdd,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productRelease,
    TResult Function(ProductReceiveDetail productReceiveDetail, String reason)?
        productReject,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productRemove,
    TResult Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)?
        productReceiveHeaderEdit,
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
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Submit value) submit,
    required TResult Function(_TransactionCreate value) transactionCreate,
    required TResult Function(_TransactionEdit value) transactionEdit,
    required TResult Function(_ProductEdit value) productEdit,
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_ProductRelease value) productRelease,
    required TResult Function(_ProductReject value) productReject,
    required TResult Function(_ProductRemove value) productRemove,
    required TResult Function(_ProductReceiveHeaderEdit value)
        productReceiveHeaderEdit,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_TransactionCreate value)? transactionCreate,
    TResult? Function(_TransactionEdit value)? transactionEdit,
    TResult? Function(_ProductEdit value)? productEdit,
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_ProductRelease value)? productRelease,
    TResult? Function(_ProductReject value)? productReject,
    TResult? Function(_ProductRemove value)? productRemove,
    TResult? Function(_ProductReceiveHeaderEdit value)?
        productReceiveHeaderEdit,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Submit value)? submit,
    TResult Function(_TransactionCreate value)? transactionCreate,
    TResult Function(_TransactionEdit value)? transactionEdit,
    TResult Function(_ProductEdit value)? productEdit,
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_ProductRelease value)? productRelease,
    TResult Function(_ProductReject value)? productReject,
    TResult Function(_ProductRemove value)? productRemove,
    TResult Function(_ProductReceiveHeaderEdit value)? productReceiveHeaderEdit,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class _Submit implements ProductReceiveEvent {
  const factory _Submit() = _$SubmitImpl;
}

/// @nodoc
abstract class _$$TransactionCreateImplCopyWith<$Res> {
  factory _$$TransactionCreateImplCopyWith(_$TransactionCreateImpl value,
          $Res Function(_$TransactionCreateImpl) then) =
      __$$TransactionCreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductReceiveFormTransaction productReceiveForm});
}

/// @nodoc
class __$$TransactionCreateImplCopyWithImpl<$Res>
    extends _$ProductReceiveEventCopyWithImpl<$Res, _$TransactionCreateImpl>
    implements _$$TransactionCreateImplCopyWith<$Res> {
  __$$TransactionCreateImplCopyWithImpl(_$TransactionCreateImpl _value,
      $Res Function(_$TransactionCreateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productReceiveForm = null,
  }) {
    return _then(_$TransactionCreateImpl(
      null == productReceiveForm
          ? _value.productReceiveForm
          : productReceiveForm // ignore: cast_nullable_to_non_nullable
              as ProductReceiveFormTransaction,
    ));
  }
}

/// @nodoc

class _$TransactionCreateImpl implements _TransactionCreate {
  const _$TransactionCreateImpl(this.productReceiveForm);

  @override
  final ProductReceiveFormTransaction productReceiveForm;

  @override
  String toString() {
    return 'ProductReceiveEvent.transactionCreate(productReceiveForm: $productReceiveForm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionCreateImpl &&
            (identical(other.productReceiveForm, productReceiveForm) ||
                other.productReceiveForm == productReceiveForm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productReceiveForm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionCreateImplCopyWith<_$TransactionCreateImpl> get copyWith =>
      __$$TransactionCreateImplCopyWithImpl<_$TransactionCreateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductReceive productReceive) initialize,
    required TResult Function() submit,
    required TResult Function(ProductReceiveFormTransaction productReceiveForm)
        transactionCreate,
    required TResult Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)
        transactionEdit,
    required TResult Function(ProductReceiveDetail productReceive) productEdit,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productAdd,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productRelease,
    required TResult Function(
            ProductReceiveDetail productReceiveDetail, String reason)
        productReject,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productRemove,
    required TResult Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)
        productReceiveHeaderEdit,
  }) {
    return transactionCreate(productReceiveForm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReceive productReceive)? initialize,
    TResult? Function()? submit,
    TResult? Function(ProductReceiveFormTransaction productReceiveForm)?
        transactionCreate,
    TResult? Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)?
        transactionEdit,
    TResult? Function(ProductReceiveDetail productReceive)? productEdit,
    TResult? Function(ProductReceiveDetail productReceiveDetail)? productAdd,
    TResult? Function(ProductReceiveDetail productReceiveDetail)?
        productRelease,
    TResult? Function(ProductReceiveDetail productReceiveDetail, String reason)?
        productReject,
    TResult? Function(ProductReceiveDetail productReceiveDetail)? productRemove,
    TResult? Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)?
        productReceiveHeaderEdit,
  }) {
    return transactionCreate?.call(productReceiveForm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReceive productReceive)? initialize,
    TResult Function()? submit,
    TResult Function(ProductReceiveFormTransaction productReceiveForm)?
        transactionCreate,
    TResult Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)?
        transactionEdit,
    TResult Function(ProductReceiveDetail productReceive)? productEdit,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productAdd,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productRelease,
    TResult Function(ProductReceiveDetail productReceiveDetail, String reason)?
        productReject,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productRemove,
    TResult Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)?
        productReceiveHeaderEdit,
    required TResult orElse(),
  }) {
    if (transactionCreate != null) {
      return transactionCreate(productReceiveForm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Submit value) submit,
    required TResult Function(_TransactionCreate value) transactionCreate,
    required TResult Function(_TransactionEdit value) transactionEdit,
    required TResult Function(_ProductEdit value) productEdit,
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_ProductRelease value) productRelease,
    required TResult Function(_ProductReject value) productReject,
    required TResult Function(_ProductRemove value) productRemove,
    required TResult Function(_ProductReceiveHeaderEdit value)
        productReceiveHeaderEdit,
  }) {
    return transactionCreate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_TransactionCreate value)? transactionCreate,
    TResult? Function(_TransactionEdit value)? transactionEdit,
    TResult? Function(_ProductEdit value)? productEdit,
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_ProductRelease value)? productRelease,
    TResult? Function(_ProductReject value)? productReject,
    TResult? Function(_ProductRemove value)? productRemove,
    TResult? Function(_ProductReceiveHeaderEdit value)?
        productReceiveHeaderEdit,
  }) {
    return transactionCreate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Submit value)? submit,
    TResult Function(_TransactionCreate value)? transactionCreate,
    TResult Function(_TransactionEdit value)? transactionEdit,
    TResult Function(_ProductEdit value)? productEdit,
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_ProductRelease value)? productRelease,
    TResult Function(_ProductReject value)? productReject,
    TResult Function(_ProductRemove value)? productRemove,
    TResult Function(_ProductReceiveHeaderEdit value)? productReceiveHeaderEdit,
    required TResult orElse(),
  }) {
    if (transactionCreate != null) {
      return transactionCreate(this);
    }
    return orElse();
  }
}

abstract class _TransactionCreate implements ProductReceiveEvent {
  const factory _TransactionCreate(
          final ProductReceiveFormTransaction productReceiveForm) =
      _$TransactionCreateImpl;

  ProductReceiveFormTransaction get productReceiveForm;
  @JsonKey(ignore: true)
  _$$TransactionCreateImplCopyWith<_$TransactionCreateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionEditImplCopyWith<$Res> {
  factory _$$TransactionEditImplCopyWith(_$TransactionEditImpl value,
          $Res Function(_$TransactionEditImpl) then) =
      __$$TransactionEditImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {ProductReceive productReceive,
      ProductReceiveFormTransaction productReceiveForm});

  $ProductReceiveCopyWith<$Res> get productReceive;
}

/// @nodoc
class __$$TransactionEditImplCopyWithImpl<$Res>
    extends _$ProductReceiveEventCopyWithImpl<$Res, _$TransactionEditImpl>
    implements _$$TransactionEditImplCopyWith<$Res> {
  __$$TransactionEditImplCopyWithImpl(
      _$TransactionEditImpl _value, $Res Function(_$TransactionEditImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productReceive = null,
    Object? productReceiveForm = null,
  }) {
    return _then(_$TransactionEditImpl(
      null == productReceive
          ? _value.productReceive
          : productReceive // ignore: cast_nullable_to_non_nullable
              as ProductReceive,
      null == productReceiveForm
          ? _value.productReceiveForm
          : productReceiveForm // ignore: cast_nullable_to_non_nullable
              as ProductReceiveFormTransaction,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductReceiveCopyWith<$Res> get productReceive {
    return $ProductReceiveCopyWith<$Res>(_value.productReceive, (value) {
      return _then(_value.copyWith(productReceive: value));
    });
  }
}

/// @nodoc

class _$TransactionEditImpl implements _TransactionEdit {
  const _$TransactionEditImpl(this.productReceive, this.productReceiveForm);

  @override
  final ProductReceive productReceive;
  @override
  final ProductReceiveFormTransaction productReceiveForm;

  @override
  String toString() {
    return 'ProductReceiveEvent.transactionEdit(productReceive: $productReceive, productReceiveForm: $productReceiveForm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionEditImpl &&
            (identical(other.productReceive, productReceive) ||
                other.productReceive == productReceive) &&
            (identical(other.productReceiveForm, productReceiveForm) ||
                other.productReceiveForm == productReceiveForm));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, productReceive, productReceiveForm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionEditImplCopyWith<_$TransactionEditImpl> get copyWith =>
      __$$TransactionEditImplCopyWithImpl<_$TransactionEditImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductReceive productReceive) initialize,
    required TResult Function() submit,
    required TResult Function(ProductReceiveFormTransaction productReceiveForm)
        transactionCreate,
    required TResult Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)
        transactionEdit,
    required TResult Function(ProductReceiveDetail productReceive) productEdit,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productAdd,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productRelease,
    required TResult Function(
            ProductReceiveDetail productReceiveDetail, String reason)
        productReject,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productRemove,
    required TResult Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)
        productReceiveHeaderEdit,
  }) {
    return transactionEdit(productReceive, productReceiveForm);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReceive productReceive)? initialize,
    TResult? Function()? submit,
    TResult? Function(ProductReceiveFormTransaction productReceiveForm)?
        transactionCreate,
    TResult? Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)?
        transactionEdit,
    TResult? Function(ProductReceiveDetail productReceive)? productEdit,
    TResult? Function(ProductReceiveDetail productReceiveDetail)? productAdd,
    TResult? Function(ProductReceiveDetail productReceiveDetail)?
        productRelease,
    TResult? Function(ProductReceiveDetail productReceiveDetail, String reason)?
        productReject,
    TResult? Function(ProductReceiveDetail productReceiveDetail)? productRemove,
    TResult? Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)?
        productReceiveHeaderEdit,
  }) {
    return transactionEdit?.call(productReceive, productReceiveForm);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReceive productReceive)? initialize,
    TResult Function()? submit,
    TResult Function(ProductReceiveFormTransaction productReceiveForm)?
        transactionCreate,
    TResult Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)?
        transactionEdit,
    TResult Function(ProductReceiveDetail productReceive)? productEdit,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productAdd,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productRelease,
    TResult Function(ProductReceiveDetail productReceiveDetail, String reason)?
        productReject,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productRemove,
    TResult Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)?
        productReceiveHeaderEdit,
    required TResult orElse(),
  }) {
    if (transactionEdit != null) {
      return transactionEdit(productReceive, productReceiveForm);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Submit value) submit,
    required TResult Function(_TransactionCreate value) transactionCreate,
    required TResult Function(_TransactionEdit value) transactionEdit,
    required TResult Function(_ProductEdit value) productEdit,
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_ProductRelease value) productRelease,
    required TResult Function(_ProductReject value) productReject,
    required TResult Function(_ProductRemove value) productRemove,
    required TResult Function(_ProductReceiveHeaderEdit value)
        productReceiveHeaderEdit,
  }) {
    return transactionEdit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_TransactionCreate value)? transactionCreate,
    TResult? Function(_TransactionEdit value)? transactionEdit,
    TResult? Function(_ProductEdit value)? productEdit,
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_ProductRelease value)? productRelease,
    TResult? Function(_ProductReject value)? productReject,
    TResult? Function(_ProductRemove value)? productRemove,
    TResult? Function(_ProductReceiveHeaderEdit value)?
        productReceiveHeaderEdit,
  }) {
    return transactionEdit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Submit value)? submit,
    TResult Function(_TransactionCreate value)? transactionCreate,
    TResult Function(_TransactionEdit value)? transactionEdit,
    TResult Function(_ProductEdit value)? productEdit,
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_ProductRelease value)? productRelease,
    TResult Function(_ProductReject value)? productReject,
    TResult Function(_ProductRemove value)? productRemove,
    TResult Function(_ProductReceiveHeaderEdit value)? productReceiveHeaderEdit,
    required TResult orElse(),
  }) {
    if (transactionEdit != null) {
      return transactionEdit(this);
    }
    return orElse();
  }
}

abstract class _TransactionEdit implements ProductReceiveEvent {
  const factory _TransactionEdit(final ProductReceive productReceive,
          final ProductReceiveFormTransaction productReceiveForm) =
      _$TransactionEditImpl;

  ProductReceive get productReceive;
  ProductReceiveFormTransaction get productReceiveForm;
  @JsonKey(ignore: true)
  _$$TransactionEditImplCopyWith<_$TransactionEditImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductEditImplCopyWith<$Res> {
  factory _$$ProductEditImplCopyWith(
          _$ProductEditImpl value, $Res Function(_$ProductEditImpl) then) =
      __$$ProductEditImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductReceiveDetail productReceive});

  $ProductReceiveDetailCopyWith<$Res> get productReceive;
}

/// @nodoc
class __$$ProductEditImplCopyWithImpl<$Res>
    extends _$ProductReceiveEventCopyWithImpl<$Res, _$ProductEditImpl>
    implements _$$ProductEditImplCopyWith<$Res> {
  __$$ProductEditImplCopyWithImpl(
      _$ProductEditImpl _value, $Res Function(_$ProductEditImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productReceive = null,
  }) {
    return _then(_$ProductEditImpl(
      null == productReceive
          ? _value.productReceive
          : productReceive // ignore: cast_nullable_to_non_nullable
              as ProductReceiveDetail,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductReceiveDetailCopyWith<$Res> get productReceive {
    return $ProductReceiveDetailCopyWith<$Res>(_value.productReceive, (value) {
      return _then(_value.copyWith(productReceive: value));
    });
  }
}

/// @nodoc

class _$ProductEditImpl implements _ProductEdit {
  const _$ProductEditImpl(this.productReceive);

  @override
  final ProductReceiveDetail productReceive;

  @override
  String toString() {
    return 'ProductReceiveEvent.productEdit(productReceive: $productReceive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductEditImpl &&
            (identical(other.productReceive, productReceive) ||
                other.productReceive == productReceive));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productReceive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductEditImplCopyWith<_$ProductEditImpl> get copyWith =>
      __$$ProductEditImplCopyWithImpl<_$ProductEditImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductReceive productReceive) initialize,
    required TResult Function() submit,
    required TResult Function(ProductReceiveFormTransaction productReceiveForm)
        transactionCreate,
    required TResult Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)
        transactionEdit,
    required TResult Function(ProductReceiveDetail productReceive) productEdit,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productAdd,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productRelease,
    required TResult Function(
            ProductReceiveDetail productReceiveDetail, String reason)
        productReject,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productRemove,
    required TResult Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)
        productReceiveHeaderEdit,
  }) {
    return productEdit(productReceive);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReceive productReceive)? initialize,
    TResult? Function()? submit,
    TResult? Function(ProductReceiveFormTransaction productReceiveForm)?
        transactionCreate,
    TResult? Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)?
        transactionEdit,
    TResult? Function(ProductReceiveDetail productReceive)? productEdit,
    TResult? Function(ProductReceiveDetail productReceiveDetail)? productAdd,
    TResult? Function(ProductReceiveDetail productReceiveDetail)?
        productRelease,
    TResult? Function(ProductReceiveDetail productReceiveDetail, String reason)?
        productReject,
    TResult? Function(ProductReceiveDetail productReceiveDetail)? productRemove,
    TResult? Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)?
        productReceiveHeaderEdit,
  }) {
    return productEdit?.call(productReceive);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReceive productReceive)? initialize,
    TResult Function()? submit,
    TResult Function(ProductReceiveFormTransaction productReceiveForm)?
        transactionCreate,
    TResult Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)?
        transactionEdit,
    TResult Function(ProductReceiveDetail productReceive)? productEdit,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productAdd,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productRelease,
    TResult Function(ProductReceiveDetail productReceiveDetail, String reason)?
        productReject,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productRemove,
    TResult Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)?
        productReceiveHeaderEdit,
    required TResult orElse(),
  }) {
    if (productEdit != null) {
      return productEdit(productReceive);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Submit value) submit,
    required TResult Function(_TransactionCreate value) transactionCreate,
    required TResult Function(_TransactionEdit value) transactionEdit,
    required TResult Function(_ProductEdit value) productEdit,
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_ProductRelease value) productRelease,
    required TResult Function(_ProductReject value) productReject,
    required TResult Function(_ProductRemove value) productRemove,
    required TResult Function(_ProductReceiveHeaderEdit value)
        productReceiveHeaderEdit,
  }) {
    return productEdit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_TransactionCreate value)? transactionCreate,
    TResult? Function(_TransactionEdit value)? transactionEdit,
    TResult? Function(_ProductEdit value)? productEdit,
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_ProductRelease value)? productRelease,
    TResult? Function(_ProductReject value)? productReject,
    TResult? Function(_ProductRemove value)? productRemove,
    TResult? Function(_ProductReceiveHeaderEdit value)?
        productReceiveHeaderEdit,
  }) {
    return productEdit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Submit value)? submit,
    TResult Function(_TransactionCreate value)? transactionCreate,
    TResult Function(_TransactionEdit value)? transactionEdit,
    TResult Function(_ProductEdit value)? productEdit,
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_ProductRelease value)? productRelease,
    TResult Function(_ProductReject value)? productReject,
    TResult Function(_ProductRemove value)? productRemove,
    TResult Function(_ProductReceiveHeaderEdit value)? productReceiveHeaderEdit,
    required TResult orElse(),
  }) {
    if (productEdit != null) {
      return productEdit(this);
    }
    return orElse();
  }
}

abstract class _ProductEdit implements ProductReceiveEvent {
  const factory _ProductEdit(final ProductReceiveDetail productReceive) =
      _$ProductEditImpl;

  ProductReceiveDetail get productReceive;
  @JsonKey(ignore: true)
  _$$ProductEditImplCopyWith<_$ProductEditImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductAddImplCopyWith<$Res> {
  factory _$$ProductAddImplCopyWith(
          _$ProductAddImpl value, $Res Function(_$ProductAddImpl) then) =
      __$$ProductAddImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductReceiveDetail productReceiveDetail});

  $ProductReceiveDetailCopyWith<$Res> get productReceiveDetail;
}

/// @nodoc
class __$$ProductAddImplCopyWithImpl<$Res>
    extends _$ProductReceiveEventCopyWithImpl<$Res, _$ProductAddImpl>
    implements _$$ProductAddImplCopyWith<$Res> {
  __$$ProductAddImplCopyWithImpl(
      _$ProductAddImpl _value, $Res Function(_$ProductAddImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productReceiveDetail = null,
  }) {
    return _then(_$ProductAddImpl(
      null == productReceiveDetail
          ? _value.productReceiveDetail
          : productReceiveDetail // ignore: cast_nullable_to_non_nullable
              as ProductReceiveDetail,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductReceiveDetailCopyWith<$Res> get productReceiveDetail {
    return $ProductReceiveDetailCopyWith<$Res>(_value.productReceiveDetail,
        (value) {
      return _then(_value.copyWith(productReceiveDetail: value));
    });
  }
}

/// @nodoc

class _$ProductAddImpl implements _ProductAdd {
  const _$ProductAddImpl(this.productReceiveDetail);

  @override
  final ProductReceiveDetail productReceiveDetail;

  @override
  String toString() {
    return 'ProductReceiveEvent.productAdd(productReceiveDetail: $productReceiveDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductAddImpl &&
            (identical(other.productReceiveDetail, productReceiveDetail) ||
                other.productReceiveDetail == productReceiveDetail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productReceiveDetail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductAddImplCopyWith<_$ProductAddImpl> get copyWith =>
      __$$ProductAddImplCopyWithImpl<_$ProductAddImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductReceive productReceive) initialize,
    required TResult Function() submit,
    required TResult Function(ProductReceiveFormTransaction productReceiveForm)
        transactionCreate,
    required TResult Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)
        transactionEdit,
    required TResult Function(ProductReceiveDetail productReceive) productEdit,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productAdd,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productRelease,
    required TResult Function(
            ProductReceiveDetail productReceiveDetail, String reason)
        productReject,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productRemove,
    required TResult Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)
        productReceiveHeaderEdit,
  }) {
    return productAdd(productReceiveDetail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReceive productReceive)? initialize,
    TResult? Function()? submit,
    TResult? Function(ProductReceiveFormTransaction productReceiveForm)?
        transactionCreate,
    TResult? Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)?
        transactionEdit,
    TResult? Function(ProductReceiveDetail productReceive)? productEdit,
    TResult? Function(ProductReceiveDetail productReceiveDetail)? productAdd,
    TResult? Function(ProductReceiveDetail productReceiveDetail)?
        productRelease,
    TResult? Function(ProductReceiveDetail productReceiveDetail, String reason)?
        productReject,
    TResult? Function(ProductReceiveDetail productReceiveDetail)? productRemove,
    TResult? Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)?
        productReceiveHeaderEdit,
  }) {
    return productAdd?.call(productReceiveDetail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReceive productReceive)? initialize,
    TResult Function()? submit,
    TResult Function(ProductReceiveFormTransaction productReceiveForm)?
        transactionCreate,
    TResult Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)?
        transactionEdit,
    TResult Function(ProductReceiveDetail productReceive)? productEdit,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productAdd,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productRelease,
    TResult Function(ProductReceiveDetail productReceiveDetail, String reason)?
        productReject,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productRemove,
    TResult Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)?
        productReceiveHeaderEdit,
    required TResult orElse(),
  }) {
    if (productAdd != null) {
      return productAdd(productReceiveDetail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Submit value) submit,
    required TResult Function(_TransactionCreate value) transactionCreate,
    required TResult Function(_TransactionEdit value) transactionEdit,
    required TResult Function(_ProductEdit value) productEdit,
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_ProductRelease value) productRelease,
    required TResult Function(_ProductReject value) productReject,
    required TResult Function(_ProductRemove value) productRemove,
    required TResult Function(_ProductReceiveHeaderEdit value)
        productReceiveHeaderEdit,
  }) {
    return productAdd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_TransactionCreate value)? transactionCreate,
    TResult? Function(_TransactionEdit value)? transactionEdit,
    TResult? Function(_ProductEdit value)? productEdit,
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_ProductRelease value)? productRelease,
    TResult? Function(_ProductReject value)? productReject,
    TResult? Function(_ProductRemove value)? productRemove,
    TResult? Function(_ProductReceiveHeaderEdit value)?
        productReceiveHeaderEdit,
  }) {
    return productAdd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Submit value)? submit,
    TResult Function(_TransactionCreate value)? transactionCreate,
    TResult Function(_TransactionEdit value)? transactionEdit,
    TResult Function(_ProductEdit value)? productEdit,
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_ProductRelease value)? productRelease,
    TResult Function(_ProductReject value)? productReject,
    TResult Function(_ProductRemove value)? productRemove,
    TResult Function(_ProductReceiveHeaderEdit value)? productReceiveHeaderEdit,
    required TResult orElse(),
  }) {
    if (productAdd != null) {
      return productAdd(this);
    }
    return orElse();
  }
}

abstract class _ProductAdd implements ProductReceiveEvent {
  const factory _ProductAdd(final ProductReceiveDetail productReceiveDetail) =
      _$ProductAddImpl;

  ProductReceiveDetail get productReceiveDetail;
  @JsonKey(ignore: true)
  _$$ProductAddImplCopyWith<_$ProductAddImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductReleaseImplCopyWith<$Res> {
  factory _$$ProductReleaseImplCopyWith(_$ProductReleaseImpl value,
          $Res Function(_$ProductReleaseImpl) then) =
      __$$ProductReleaseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductReceiveDetail productReceiveDetail});

  $ProductReceiveDetailCopyWith<$Res> get productReceiveDetail;
}

/// @nodoc
class __$$ProductReleaseImplCopyWithImpl<$Res>
    extends _$ProductReceiveEventCopyWithImpl<$Res, _$ProductReleaseImpl>
    implements _$$ProductReleaseImplCopyWith<$Res> {
  __$$ProductReleaseImplCopyWithImpl(
      _$ProductReleaseImpl _value, $Res Function(_$ProductReleaseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productReceiveDetail = null,
  }) {
    return _then(_$ProductReleaseImpl(
      null == productReceiveDetail
          ? _value.productReceiveDetail
          : productReceiveDetail // ignore: cast_nullable_to_non_nullable
              as ProductReceiveDetail,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductReceiveDetailCopyWith<$Res> get productReceiveDetail {
    return $ProductReceiveDetailCopyWith<$Res>(_value.productReceiveDetail,
        (value) {
      return _then(_value.copyWith(productReceiveDetail: value));
    });
  }
}

/// @nodoc

class _$ProductReleaseImpl implements _ProductRelease {
  const _$ProductReleaseImpl(this.productReceiveDetail);

  @override
  final ProductReceiveDetail productReceiveDetail;

  @override
  String toString() {
    return 'ProductReceiveEvent.productRelease(productReceiveDetail: $productReceiveDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductReleaseImpl &&
            (identical(other.productReceiveDetail, productReceiveDetail) ||
                other.productReceiveDetail == productReceiveDetail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productReceiveDetail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductReleaseImplCopyWith<_$ProductReleaseImpl> get copyWith =>
      __$$ProductReleaseImplCopyWithImpl<_$ProductReleaseImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductReceive productReceive) initialize,
    required TResult Function() submit,
    required TResult Function(ProductReceiveFormTransaction productReceiveForm)
        transactionCreate,
    required TResult Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)
        transactionEdit,
    required TResult Function(ProductReceiveDetail productReceive) productEdit,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productAdd,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productRelease,
    required TResult Function(
            ProductReceiveDetail productReceiveDetail, String reason)
        productReject,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productRemove,
    required TResult Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)
        productReceiveHeaderEdit,
  }) {
    return productRelease(productReceiveDetail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReceive productReceive)? initialize,
    TResult? Function()? submit,
    TResult? Function(ProductReceiveFormTransaction productReceiveForm)?
        transactionCreate,
    TResult? Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)?
        transactionEdit,
    TResult? Function(ProductReceiveDetail productReceive)? productEdit,
    TResult? Function(ProductReceiveDetail productReceiveDetail)? productAdd,
    TResult? Function(ProductReceiveDetail productReceiveDetail)?
        productRelease,
    TResult? Function(ProductReceiveDetail productReceiveDetail, String reason)?
        productReject,
    TResult? Function(ProductReceiveDetail productReceiveDetail)? productRemove,
    TResult? Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)?
        productReceiveHeaderEdit,
  }) {
    return productRelease?.call(productReceiveDetail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReceive productReceive)? initialize,
    TResult Function()? submit,
    TResult Function(ProductReceiveFormTransaction productReceiveForm)?
        transactionCreate,
    TResult Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)?
        transactionEdit,
    TResult Function(ProductReceiveDetail productReceive)? productEdit,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productAdd,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productRelease,
    TResult Function(ProductReceiveDetail productReceiveDetail, String reason)?
        productReject,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productRemove,
    TResult Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)?
        productReceiveHeaderEdit,
    required TResult orElse(),
  }) {
    if (productRelease != null) {
      return productRelease(productReceiveDetail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Submit value) submit,
    required TResult Function(_TransactionCreate value) transactionCreate,
    required TResult Function(_TransactionEdit value) transactionEdit,
    required TResult Function(_ProductEdit value) productEdit,
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_ProductRelease value) productRelease,
    required TResult Function(_ProductReject value) productReject,
    required TResult Function(_ProductRemove value) productRemove,
    required TResult Function(_ProductReceiveHeaderEdit value)
        productReceiveHeaderEdit,
  }) {
    return productRelease(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_TransactionCreate value)? transactionCreate,
    TResult? Function(_TransactionEdit value)? transactionEdit,
    TResult? Function(_ProductEdit value)? productEdit,
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_ProductRelease value)? productRelease,
    TResult? Function(_ProductReject value)? productReject,
    TResult? Function(_ProductRemove value)? productRemove,
    TResult? Function(_ProductReceiveHeaderEdit value)?
        productReceiveHeaderEdit,
  }) {
    return productRelease?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Submit value)? submit,
    TResult Function(_TransactionCreate value)? transactionCreate,
    TResult Function(_TransactionEdit value)? transactionEdit,
    TResult Function(_ProductEdit value)? productEdit,
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_ProductRelease value)? productRelease,
    TResult Function(_ProductReject value)? productReject,
    TResult Function(_ProductRemove value)? productRemove,
    TResult Function(_ProductReceiveHeaderEdit value)? productReceiveHeaderEdit,
    required TResult orElse(),
  }) {
    if (productRelease != null) {
      return productRelease(this);
    }
    return orElse();
  }
}

abstract class _ProductRelease implements ProductReceiveEvent {
  const factory _ProductRelease(
      final ProductReceiveDetail productReceiveDetail) = _$ProductReleaseImpl;

  ProductReceiveDetail get productReceiveDetail;
  @JsonKey(ignore: true)
  _$$ProductReleaseImplCopyWith<_$ProductReleaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductRejectImplCopyWith<$Res> {
  factory _$$ProductRejectImplCopyWith(
          _$ProductRejectImpl value, $Res Function(_$ProductRejectImpl) then) =
      __$$ProductRejectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductReceiveDetail productReceiveDetail, String reason});

  $ProductReceiveDetailCopyWith<$Res> get productReceiveDetail;
}

/// @nodoc
class __$$ProductRejectImplCopyWithImpl<$Res>
    extends _$ProductReceiveEventCopyWithImpl<$Res, _$ProductRejectImpl>
    implements _$$ProductRejectImplCopyWith<$Res> {
  __$$ProductRejectImplCopyWithImpl(
      _$ProductRejectImpl _value, $Res Function(_$ProductRejectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productReceiveDetail = null,
    Object? reason = null,
  }) {
    return _then(_$ProductRejectImpl(
      null == productReceiveDetail
          ? _value.productReceiveDetail
          : productReceiveDetail // ignore: cast_nullable_to_non_nullable
              as ProductReceiveDetail,
      null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductReceiveDetailCopyWith<$Res> get productReceiveDetail {
    return $ProductReceiveDetailCopyWith<$Res>(_value.productReceiveDetail,
        (value) {
      return _then(_value.copyWith(productReceiveDetail: value));
    });
  }
}

/// @nodoc

class _$ProductRejectImpl implements _ProductReject {
  const _$ProductRejectImpl(this.productReceiveDetail, this.reason);

  @override
  final ProductReceiveDetail productReceiveDetail;
  @override
  final String reason;

  @override
  String toString() {
    return 'ProductReceiveEvent.productReject(productReceiveDetail: $productReceiveDetail, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductRejectImpl &&
            (identical(other.productReceiveDetail, productReceiveDetail) ||
                other.productReceiveDetail == productReceiveDetail) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productReceiveDetail, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductRejectImplCopyWith<_$ProductRejectImpl> get copyWith =>
      __$$ProductRejectImplCopyWithImpl<_$ProductRejectImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductReceive productReceive) initialize,
    required TResult Function() submit,
    required TResult Function(ProductReceiveFormTransaction productReceiveForm)
        transactionCreate,
    required TResult Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)
        transactionEdit,
    required TResult Function(ProductReceiveDetail productReceive) productEdit,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productAdd,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productRelease,
    required TResult Function(
            ProductReceiveDetail productReceiveDetail, String reason)
        productReject,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productRemove,
    required TResult Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)
        productReceiveHeaderEdit,
  }) {
    return productReject(productReceiveDetail, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReceive productReceive)? initialize,
    TResult? Function()? submit,
    TResult? Function(ProductReceiveFormTransaction productReceiveForm)?
        transactionCreate,
    TResult? Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)?
        transactionEdit,
    TResult? Function(ProductReceiveDetail productReceive)? productEdit,
    TResult? Function(ProductReceiveDetail productReceiveDetail)? productAdd,
    TResult? Function(ProductReceiveDetail productReceiveDetail)?
        productRelease,
    TResult? Function(ProductReceiveDetail productReceiveDetail, String reason)?
        productReject,
    TResult? Function(ProductReceiveDetail productReceiveDetail)? productRemove,
    TResult? Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)?
        productReceiveHeaderEdit,
  }) {
    return productReject?.call(productReceiveDetail, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReceive productReceive)? initialize,
    TResult Function()? submit,
    TResult Function(ProductReceiveFormTransaction productReceiveForm)?
        transactionCreate,
    TResult Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)?
        transactionEdit,
    TResult Function(ProductReceiveDetail productReceive)? productEdit,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productAdd,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productRelease,
    TResult Function(ProductReceiveDetail productReceiveDetail, String reason)?
        productReject,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productRemove,
    TResult Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)?
        productReceiveHeaderEdit,
    required TResult orElse(),
  }) {
    if (productReject != null) {
      return productReject(productReceiveDetail, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Submit value) submit,
    required TResult Function(_TransactionCreate value) transactionCreate,
    required TResult Function(_TransactionEdit value) transactionEdit,
    required TResult Function(_ProductEdit value) productEdit,
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_ProductRelease value) productRelease,
    required TResult Function(_ProductReject value) productReject,
    required TResult Function(_ProductRemove value) productRemove,
    required TResult Function(_ProductReceiveHeaderEdit value)
        productReceiveHeaderEdit,
  }) {
    return productReject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_TransactionCreate value)? transactionCreate,
    TResult? Function(_TransactionEdit value)? transactionEdit,
    TResult? Function(_ProductEdit value)? productEdit,
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_ProductRelease value)? productRelease,
    TResult? Function(_ProductReject value)? productReject,
    TResult? Function(_ProductRemove value)? productRemove,
    TResult? Function(_ProductReceiveHeaderEdit value)?
        productReceiveHeaderEdit,
  }) {
    return productReject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Submit value)? submit,
    TResult Function(_TransactionCreate value)? transactionCreate,
    TResult Function(_TransactionEdit value)? transactionEdit,
    TResult Function(_ProductEdit value)? productEdit,
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_ProductRelease value)? productRelease,
    TResult Function(_ProductReject value)? productReject,
    TResult Function(_ProductRemove value)? productRemove,
    TResult Function(_ProductReceiveHeaderEdit value)? productReceiveHeaderEdit,
    required TResult orElse(),
  }) {
    if (productReject != null) {
      return productReject(this);
    }
    return orElse();
  }
}

abstract class _ProductReject implements ProductReceiveEvent {
  const factory _ProductReject(final ProductReceiveDetail productReceiveDetail,
      final String reason) = _$ProductRejectImpl;

  ProductReceiveDetail get productReceiveDetail;
  String get reason;
  @JsonKey(ignore: true)
  _$$ProductRejectImplCopyWith<_$ProductRejectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductRemoveImplCopyWith<$Res> {
  factory _$$ProductRemoveImplCopyWith(
          _$ProductRemoveImpl value, $Res Function(_$ProductRemoveImpl) then) =
      __$$ProductRemoveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProductReceiveDetail productReceiveDetail});

  $ProductReceiveDetailCopyWith<$Res> get productReceiveDetail;
}

/// @nodoc
class __$$ProductRemoveImplCopyWithImpl<$Res>
    extends _$ProductReceiveEventCopyWithImpl<$Res, _$ProductRemoveImpl>
    implements _$$ProductRemoveImplCopyWith<$Res> {
  __$$ProductRemoveImplCopyWithImpl(
      _$ProductRemoveImpl _value, $Res Function(_$ProductRemoveImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productReceiveDetail = null,
  }) {
    return _then(_$ProductRemoveImpl(
      null == productReceiveDetail
          ? _value.productReceiveDetail
          : productReceiveDetail // ignore: cast_nullable_to_non_nullable
              as ProductReceiveDetail,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductReceiveDetailCopyWith<$Res> get productReceiveDetail {
    return $ProductReceiveDetailCopyWith<$Res>(_value.productReceiveDetail,
        (value) {
      return _then(_value.copyWith(productReceiveDetail: value));
    });
  }
}

/// @nodoc

class _$ProductRemoveImpl implements _ProductRemove {
  const _$ProductRemoveImpl(this.productReceiveDetail);

  @override
  final ProductReceiveDetail productReceiveDetail;

  @override
  String toString() {
    return 'ProductReceiveEvent.productRemove(productReceiveDetail: $productReceiveDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductRemoveImpl &&
            (identical(other.productReceiveDetail, productReceiveDetail) ||
                other.productReceiveDetail == productReceiveDetail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productReceiveDetail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductRemoveImplCopyWith<_$ProductRemoveImpl> get copyWith =>
      __$$ProductRemoveImplCopyWithImpl<_$ProductRemoveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductReceive productReceive) initialize,
    required TResult Function() submit,
    required TResult Function(ProductReceiveFormTransaction productReceiveForm)
        transactionCreate,
    required TResult Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)
        transactionEdit,
    required TResult Function(ProductReceiveDetail productReceive) productEdit,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productAdd,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productRelease,
    required TResult Function(
            ProductReceiveDetail productReceiveDetail, String reason)
        productReject,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productRemove,
    required TResult Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)
        productReceiveHeaderEdit,
  }) {
    return productRemove(productReceiveDetail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReceive productReceive)? initialize,
    TResult? Function()? submit,
    TResult? Function(ProductReceiveFormTransaction productReceiveForm)?
        transactionCreate,
    TResult? Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)?
        transactionEdit,
    TResult? Function(ProductReceiveDetail productReceive)? productEdit,
    TResult? Function(ProductReceiveDetail productReceiveDetail)? productAdd,
    TResult? Function(ProductReceiveDetail productReceiveDetail)?
        productRelease,
    TResult? Function(ProductReceiveDetail productReceiveDetail, String reason)?
        productReject,
    TResult? Function(ProductReceiveDetail productReceiveDetail)? productRemove,
    TResult? Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)?
        productReceiveHeaderEdit,
  }) {
    return productRemove?.call(productReceiveDetail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReceive productReceive)? initialize,
    TResult Function()? submit,
    TResult Function(ProductReceiveFormTransaction productReceiveForm)?
        transactionCreate,
    TResult Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)?
        transactionEdit,
    TResult Function(ProductReceiveDetail productReceive)? productEdit,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productAdd,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productRelease,
    TResult Function(ProductReceiveDetail productReceiveDetail, String reason)?
        productReject,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productRemove,
    TResult Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)?
        productReceiveHeaderEdit,
    required TResult orElse(),
  }) {
    if (productRemove != null) {
      return productRemove(productReceiveDetail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Submit value) submit,
    required TResult Function(_TransactionCreate value) transactionCreate,
    required TResult Function(_TransactionEdit value) transactionEdit,
    required TResult Function(_ProductEdit value) productEdit,
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_ProductRelease value) productRelease,
    required TResult Function(_ProductReject value) productReject,
    required TResult Function(_ProductRemove value) productRemove,
    required TResult Function(_ProductReceiveHeaderEdit value)
        productReceiveHeaderEdit,
  }) {
    return productRemove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_TransactionCreate value)? transactionCreate,
    TResult? Function(_TransactionEdit value)? transactionEdit,
    TResult? Function(_ProductEdit value)? productEdit,
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_ProductRelease value)? productRelease,
    TResult? Function(_ProductReject value)? productReject,
    TResult? Function(_ProductRemove value)? productRemove,
    TResult? Function(_ProductReceiveHeaderEdit value)?
        productReceiveHeaderEdit,
  }) {
    return productRemove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Submit value)? submit,
    TResult Function(_TransactionCreate value)? transactionCreate,
    TResult Function(_TransactionEdit value)? transactionEdit,
    TResult Function(_ProductEdit value)? productEdit,
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_ProductRelease value)? productRelease,
    TResult Function(_ProductReject value)? productReject,
    TResult Function(_ProductRemove value)? productRemove,
    TResult Function(_ProductReceiveHeaderEdit value)? productReceiveHeaderEdit,
    required TResult orElse(),
  }) {
    if (productRemove != null) {
      return productRemove(this);
    }
    return orElse();
  }
}

abstract class _ProductRemove implements ProductReceiveEvent {
  const factory _ProductRemove(
      final ProductReceiveDetail productReceiveDetail) = _$ProductRemoveImpl;

  ProductReceiveDetail get productReceiveDetail;
  @JsonKey(ignore: true)
  _$$ProductRemoveImplCopyWith<_$ProductRemoveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductReceiveHeaderEditImplCopyWith<$Res> {
  factory _$$ProductReceiveHeaderEditImplCopyWith(
          _$ProductReceiveHeaderEditImpl value,
          $Res Function(_$ProductReceiveHeaderEditImpl) then) =
      __$$ProductReceiveHeaderEditImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {ProductReceive productReceive,
      String description,
      String? deliveryOrder,
      DateTime? deliveryOrderDate});

  $ProductReceiveCopyWith<$Res> get productReceive;
}

/// @nodoc
class __$$ProductReceiveHeaderEditImplCopyWithImpl<$Res>
    extends _$ProductReceiveEventCopyWithImpl<$Res,
        _$ProductReceiveHeaderEditImpl>
    implements _$$ProductReceiveHeaderEditImplCopyWith<$Res> {
  __$$ProductReceiveHeaderEditImplCopyWithImpl(
      _$ProductReceiveHeaderEditImpl _value,
      $Res Function(_$ProductReceiveHeaderEditImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productReceive = null,
    Object? description = null,
    Object? deliveryOrder = freezed,
    Object? deliveryOrderDate = freezed,
  }) {
    return _then(_$ProductReceiveHeaderEditImpl(
      productReceive: null == productReceive
          ? _value.productReceive
          : productReceive // ignore: cast_nullable_to_non_nullable
              as ProductReceive,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryOrder: freezed == deliveryOrder
          ? _value.deliveryOrder
          : deliveryOrder // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryOrderDate: freezed == deliveryOrderDate
          ? _value.deliveryOrderDate
          : deliveryOrderDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductReceiveCopyWith<$Res> get productReceive {
    return $ProductReceiveCopyWith<$Res>(_value.productReceive, (value) {
      return _then(_value.copyWith(productReceive: value));
    });
  }
}

/// @nodoc

class _$ProductReceiveHeaderEditImpl implements _ProductReceiveHeaderEdit {
  const _$ProductReceiveHeaderEditImpl(
      {required this.productReceive,
      required this.description,
      this.deliveryOrder,
      this.deliveryOrderDate});

  @override
  final ProductReceive productReceive;
  @override
  final String description;
  @override
  final String? deliveryOrder;
  @override
  final DateTime? deliveryOrderDate;

  @override
  String toString() {
    return 'ProductReceiveEvent.productReceiveHeaderEdit(productReceive: $productReceive, description: $description, deliveryOrder: $deliveryOrder, deliveryOrderDate: $deliveryOrderDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductReceiveHeaderEditImpl &&
            (identical(other.productReceive, productReceive) ||
                other.productReceive == productReceive) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.deliveryOrder, deliveryOrder) ||
                other.deliveryOrder == deliveryOrder) &&
            (identical(other.deliveryOrderDate, deliveryOrderDate) ||
                other.deliveryOrderDate == deliveryOrderDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productReceive, description,
      deliveryOrder, deliveryOrderDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductReceiveHeaderEditImplCopyWith<_$ProductReceiveHeaderEditImpl>
      get copyWith => __$$ProductReceiveHeaderEditImplCopyWithImpl<
          _$ProductReceiveHeaderEditImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(ProductReceive productReceive) initialize,
    required TResult Function() submit,
    required TResult Function(ProductReceiveFormTransaction productReceiveForm)
        transactionCreate,
    required TResult Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)
        transactionEdit,
    required TResult Function(ProductReceiveDetail productReceive) productEdit,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productAdd,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productRelease,
    required TResult Function(
            ProductReceiveDetail productReceiveDetail, String reason)
        productReject,
    required TResult Function(ProductReceiveDetail productReceiveDetail)
        productRemove,
    required TResult Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)
        productReceiveHeaderEdit,
  }) {
    return productReceiveHeaderEdit(
        productReceive, description, deliveryOrder, deliveryOrderDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(ProductReceive productReceive)? initialize,
    TResult? Function()? submit,
    TResult? Function(ProductReceiveFormTransaction productReceiveForm)?
        transactionCreate,
    TResult? Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)?
        transactionEdit,
    TResult? Function(ProductReceiveDetail productReceive)? productEdit,
    TResult? Function(ProductReceiveDetail productReceiveDetail)? productAdd,
    TResult? Function(ProductReceiveDetail productReceiveDetail)?
        productRelease,
    TResult? Function(ProductReceiveDetail productReceiveDetail, String reason)?
        productReject,
    TResult? Function(ProductReceiveDetail productReceiveDetail)? productRemove,
    TResult? Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)?
        productReceiveHeaderEdit,
  }) {
    return productReceiveHeaderEdit?.call(
        productReceive, description, deliveryOrder, deliveryOrderDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(ProductReceive productReceive)? initialize,
    TResult Function()? submit,
    TResult Function(ProductReceiveFormTransaction productReceiveForm)?
        transactionCreate,
    TResult Function(ProductReceive productReceive,
            ProductReceiveFormTransaction productReceiveForm)?
        transactionEdit,
    TResult Function(ProductReceiveDetail productReceive)? productEdit,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productAdd,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productRelease,
    TResult Function(ProductReceiveDetail productReceiveDetail, String reason)?
        productReject,
    TResult Function(ProductReceiveDetail productReceiveDetail)? productRemove,
    TResult Function(ProductReceive productReceive, String description,
            String? deliveryOrder, DateTime? deliveryOrderDate)?
        productReceiveHeaderEdit,
    required TResult orElse(),
  }) {
    if (productReceiveHeaderEdit != null) {
      return productReceiveHeaderEdit(
          productReceive, description, deliveryOrder, deliveryOrderDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Submit value) submit,
    required TResult Function(_TransactionCreate value) transactionCreate,
    required TResult Function(_TransactionEdit value) transactionEdit,
    required TResult Function(_ProductEdit value) productEdit,
    required TResult Function(_ProductAdd value) productAdd,
    required TResult Function(_ProductRelease value) productRelease,
    required TResult Function(_ProductReject value) productReject,
    required TResult Function(_ProductRemove value) productRemove,
    required TResult Function(_ProductReceiveHeaderEdit value)
        productReceiveHeaderEdit,
  }) {
    return productReceiveHeaderEdit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_TransactionCreate value)? transactionCreate,
    TResult? Function(_TransactionEdit value)? transactionEdit,
    TResult? Function(_ProductEdit value)? productEdit,
    TResult? Function(_ProductAdd value)? productAdd,
    TResult? Function(_ProductRelease value)? productRelease,
    TResult? Function(_ProductReject value)? productReject,
    TResult? Function(_ProductRemove value)? productRemove,
    TResult? Function(_ProductReceiveHeaderEdit value)?
        productReceiveHeaderEdit,
  }) {
    return productReceiveHeaderEdit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Submit value)? submit,
    TResult Function(_TransactionCreate value)? transactionCreate,
    TResult Function(_TransactionEdit value)? transactionEdit,
    TResult Function(_ProductEdit value)? productEdit,
    TResult Function(_ProductAdd value)? productAdd,
    TResult Function(_ProductRelease value)? productRelease,
    TResult Function(_ProductReject value)? productReject,
    TResult Function(_ProductRemove value)? productRemove,
    TResult Function(_ProductReceiveHeaderEdit value)? productReceiveHeaderEdit,
    required TResult orElse(),
  }) {
    if (productReceiveHeaderEdit != null) {
      return productReceiveHeaderEdit(this);
    }
    return orElse();
  }
}

abstract class _ProductReceiveHeaderEdit implements ProductReceiveEvent {
  const factory _ProductReceiveHeaderEdit(
      {required final ProductReceive productReceive,
      required final String description,
      final String? deliveryOrder,
      final DateTime? deliveryOrderDate}) = _$ProductReceiveHeaderEditImpl;

  ProductReceive get productReceive;
  String get description;
  String? get deliveryOrder;
  DateTime? get deliveryOrderDate;
  @JsonKey(ignore: true)
  _$$ProductReceiveHeaderEditImplCopyWith<_$ProductReceiveHeaderEditImpl>
      get copyWith => throw _privateConstructorUsedError;
}
