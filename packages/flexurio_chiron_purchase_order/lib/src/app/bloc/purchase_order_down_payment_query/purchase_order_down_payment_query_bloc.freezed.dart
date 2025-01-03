// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_order_down_payment_query_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PurchaseOrderDownPaymentQueryEvent {
  PageOptions<PurchaseOrderDownPayment>? get pageOptions =>
      throw _privateConstructorUsedError;
  String? get purchaseOrderId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PageOptions<PurchaseOrderDownPayment>? pageOptions,
            String? purchaseOrderId)
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PageOptions<PurchaseOrderDownPayment>? pageOptions,
            String? purchaseOrderId)?
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PageOptions<PurchaseOrderDownPayment>? pageOptions,
            String? purchaseOrderId)?
        fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PurchaseOrderDownPaymentQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseOrderDownPaymentQueryEventCopyWith<
          PurchaseOrderDownPaymentQueryEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseOrderDownPaymentQueryEventCopyWith<$Res> {
  factory $PurchaseOrderDownPaymentQueryEventCopyWith(
          PurchaseOrderDownPaymentQueryEvent value,
          $Res Function(PurchaseOrderDownPaymentQueryEvent) then) =
      _$PurchaseOrderDownPaymentQueryEventCopyWithImpl<$Res,
          PurchaseOrderDownPaymentQueryEvent>;
  @useResult
  $Res call(
      {PageOptions<PurchaseOrderDownPayment>? pageOptions,
      String? purchaseOrderId});
}

/// @nodoc
class _$PurchaseOrderDownPaymentQueryEventCopyWithImpl<$Res,
        $Val extends PurchaseOrderDownPaymentQueryEvent>
    implements $PurchaseOrderDownPaymentQueryEventCopyWith<$Res> {
  _$PurchaseOrderDownPaymentQueryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseOrderDownPaymentQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageOptions = freezed,
    Object? purchaseOrderId = freezed,
  }) {
    return _then(_value.copyWith(
      pageOptions: freezed == pageOptions
          ? _value.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<PurchaseOrderDownPayment>?,
      purchaseOrderId: freezed == purchaseOrderId
          ? _value.purchaseOrderId
          : purchaseOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res>
    implements $PurchaseOrderDownPaymentQueryEventCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PageOptions<PurchaseOrderDownPayment>? pageOptions,
      String? purchaseOrderId});
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$PurchaseOrderDownPaymentQueryEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderDownPaymentQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageOptions = freezed,
    Object? purchaseOrderId = freezed,
  }) {
    return _then(_$FetchImpl(
      pageOptions: freezed == pageOptions
          ? _value.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<PurchaseOrderDownPayment>?,
      purchaseOrderId: freezed == purchaseOrderId
          ? _value.purchaseOrderId
          : purchaseOrderId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl({this.pageOptions, this.purchaseOrderId});

  @override
  final PageOptions<PurchaseOrderDownPayment>? pageOptions;
  @override
  final String? purchaseOrderId;

  @override
  String toString() {
    return 'PurchaseOrderDownPaymentQueryEvent.fetch(pageOptions: $pageOptions, purchaseOrderId: $purchaseOrderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.pageOptions, pageOptions) ||
                other.pageOptions == pageOptions) &&
            (identical(other.purchaseOrderId, purchaseOrderId) ||
                other.purchaseOrderId == purchaseOrderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageOptions, purchaseOrderId);

  /// Create a copy of PurchaseOrderDownPaymentQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PageOptions<PurchaseOrderDownPayment>? pageOptions,
            String? purchaseOrderId)
        fetch,
  }) {
    return fetch(pageOptions, purchaseOrderId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PageOptions<PurchaseOrderDownPayment>? pageOptions,
            String? purchaseOrderId)?
        fetch,
  }) {
    return fetch?.call(pageOptions, purchaseOrderId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PageOptions<PurchaseOrderDownPayment>? pageOptions,
            String? purchaseOrderId)?
        fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(pageOptions, purchaseOrderId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements PurchaseOrderDownPaymentQueryEvent {
  const factory _Fetch(
      {final PageOptions<PurchaseOrderDownPayment>? pageOptions,
      final String? purchaseOrderId}) = _$FetchImpl;

  @override
  PageOptions<PurchaseOrderDownPayment>? get pageOptions;
  @override
  String? get purchaseOrderId;

  /// Create a copy of PurchaseOrderDownPaymentQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PurchaseOrderDownPaymentQueryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function() initial,
    required TResult Function(
            PageOptions<PurchaseOrderDownPayment> purchaseOrder)
        loaded,
    required TResult Function(PageOptions<PurchaseOrderDownPayment> pageOptions)
        loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(PageOptions<PurchaseOrderDownPayment> purchaseOrder)?
        loaded,
    TResult? Function(PageOptions<PurchaseOrderDownPayment> pageOptions)?
        loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(PageOptions<PurchaseOrderDownPayment> purchaseOrder)?
        loaded,
    TResult Function(PageOptions<PurchaseOrderDownPayment> pageOptions)?
        loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) loaded,
    required TResult Function(_Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? loaded,
    TResult? Function(_Loading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? loaded,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseOrderDownPaymentQueryStateCopyWith<$Res> {
  factory $PurchaseOrderDownPaymentQueryStateCopyWith(
          PurchaseOrderDownPaymentQueryState value,
          $Res Function(PurchaseOrderDownPaymentQueryState) then) =
      _$PurchaseOrderDownPaymentQueryStateCopyWithImpl<$Res,
          PurchaseOrderDownPaymentQueryState>;
}

/// @nodoc
class _$PurchaseOrderDownPaymentQueryStateCopyWithImpl<$Res,
        $Val extends PurchaseOrderDownPaymentQueryState>
    implements $PurchaseOrderDownPaymentQueryStateCopyWith<$Res> {
  _$PurchaseOrderDownPaymentQueryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseOrderDownPaymentQueryState
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
    extends _$PurchaseOrderDownPaymentQueryStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderDownPaymentQueryState
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
    return 'PurchaseOrderDownPaymentQueryState.error(error: $error)';
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

  /// Create a copy of PurchaseOrderDownPaymentQueryState
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
    required TResult Function() initial,
    required TResult Function(
            PageOptions<PurchaseOrderDownPayment> purchaseOrder)
        loaded,
    required TResult Function(PageOptions<PurchaseOrderDownPayment> pageOptions)
        loading,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(PageOptions<PurchaseOrderDownPayment> purchaseOrder)?
        loaded,
    TResult? Function(PageOptions<PurchaseOrderDownPayment> pageOptions)?
        loading,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(PageOptions<PurchaseOrderDownPayment> purchaseOrder)?
        loaded,
    TResult Function(PageOptions<PurchaseOrderDownPayment> pageOptions)?
        loading,
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
    required TResult Function(_Success value) loaded,
    required TResult Function(_Loading value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? loaded,
    TResult? Function(_Loading value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? loaded,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements PurchaseOrderDownPaymentQueryState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of PurchaseOrderDownPaymentQueryState
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
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PurchaseOrderDownPaymentQueryStateCopyWithImpl<$Res,
        _$InitialImpl> implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderDownPaymentQueryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PurchaseOrderDownPaymentQueryState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function() initial,
    required TResult Function(
            PageOptions<PurchaseOrderDownPayment> purchaseOrder)
        loaded,
    required TResult Function(PageOptions<PurchaseOrderDownPayment> pageOptions)
        loading,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(PageOptions<PurchaseOrderDownPayment> purchaseOrder)?
        loaded,
    TResult? Function(PageOptions<PurchaseOrderDownPayment> pageOptions)?
        loading,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(PageOptions<PurchaseOrderDownPayment> purchaseOrder)?
        loaded,
    TResult Function(PageOptions<PurchaseOrderDownPayment> pageOptions)?
        loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) loaded,
    required TResult Function(_Loading value) loading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? loaded,
    TResult? Function(_Loading value)? loading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? loaded,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PurchaseOrderDownPaymentQueryState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PageOptions<PurchaseOrderDownPayment> purchaseOrder});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$PurchaseOrderDownPaymentQueryStateCopyWithImpl<$Res,
        _$SuccessImpl> implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderDownPaymentQueryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseOrder = null,
  }) {
    return _then(_$SuccessImpl(
      null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PageOptions<PurchaseOrderDownPayment>,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.purchaseOrder);

  @override
  final PageOptions<PurchaseOrderDownPayment> purchaseOrder;

  @override
  String toString() {
    return 'PurchaseOrderDownPaymentQueryState.loaded(purchaseOrder: $purchaseOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, purchaseOrder);

  /// Create a copy of PurchaseOrderDownPaymentQueryState
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
    required TResult Function() initial,
    required TResult Function(
            PageOptions<PurchaseOrderDownPayment> purchaseOrder)
        loaded,
    required TResult Function(PageOptions<PurchaseOrderDownPayment> pageOptions)
        loading,
  }) {
    return loaded(purchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(PageOptions<PurchaseOrderDownPayment> purchaseOrder)?
        loaded,
    TResult? Function(PageOptions<PurchaseOrderDownPayment> pageOptions)?
        loading,
  }) {
    return loaded?.call(purchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(PageOptions<PurchaseOrderDownPayment> purchaseOrder)?
        loaded,
    TResult Function(PageOptions<PurchaseOrderDownPayment> pageOptions)?
        loading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(purchaseOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) loaded,
    required TResult Function(_Loading value) loading,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? loaded,
    TResult? Function(_Loading value)? loading,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? loaded,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Success implements PurchaseOrderDownPaymentQueryState {
  const factory _Success(
          final PageOptions<PurchaseOrderDownPayment> purchaseOrder) =
      _$SuccessImpl;

  PageOptions<PurchaseOrderDownPayment> get purchaseOrder;

  /// Create a copy of PurchaseOrderDownPaymentQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PageOptions<PurchaseOrderDownPayment> pageOptions});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$PurchaseOrderDownPaymentQueryStateCopyWithImpl<$Res,
        _$LoadingImpl> implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderDownPaymentQueryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageOptions = null,
  }) {
    return _then(_$LoadingImpl(
      null == pageOptions
          ? _value.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<PurchaseOrderDownPayment>,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(this.pageOptions);

  @override
  final PageOptions<PurchaseOrderDownPayment> pageOptions;

  @override
  String toString() {
    return 'PurchaseOrderDownPaymentQueryState.loading(pageOptions: $pageOptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadingImpl &&
            (identical(other.pageOptions, pageOptions) ||
                other.pageOptions == pageOptions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageOptions);

  /// Create a copy of PurchaseOrderDownPaymentQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function() initial,
    required TResult Function(
            PageOptions<PurchaseOrderDownPayment> purchaseOrder)
        loaded,
    required TResult Function(PageOptions<PurchaseOrderDownPayment> pageOptions)
        loading,
  }) {
    return loading(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(PageOptions<PurchaseOrderDownPayment> purchaseOrder)?
        loaded,
    TResult? Function(PageOptions<PurchaseOrderDownPayment> pageOptions)?
        loading,
  }) {
    return loading?.call(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(PageOptions<PurchaseOrderDownPayment> purchaseOrder)?
        loaded,
    TResult Function(PageOptions<PurchaseOrderDownPayment> pageOptions)?
        loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(pageOptions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) loaded,
    required TResult Function(_Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? loaded,
    TResult? Function(_Loading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? loaded,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PurchaseOrderDownPaymentQueryState {
  const factory _Loading(
      final PageOptions<PurchaseOrderDownPayment> pageOptions) = _$LoadingImpl;

  PageOptions<PurchaseOrderDownPayment> get pageOptions;

  /// Create a copy of PurchaseOrderDownPaymentQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
