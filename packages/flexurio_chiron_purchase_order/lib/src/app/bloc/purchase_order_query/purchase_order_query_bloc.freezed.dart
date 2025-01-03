// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_order_query_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PurchaseOrderQueryEvent {
  PageOptions<PurchaseOrder>? get pageOptions =>
      throw _privateConstructorUsedError;
  List<PurchaseOrderStatus>? get status => throw _privateConstructorUsedError;
  List<String>? get materialGroupId => throw _privateConstructorUsedError;
  PurchaseOrderPaymentType? get paymentType =>
      throw _privateConstructorUsedError;
  double? get downPaymentGreaterThan => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PageOptions<PurchaseOrder>? pageOptions,
            List<PurchaseOrderStatus>? status,
            List<String>? materialGroupId,
            PurchaseOrderPaymentType? paymentType,
            double? downPaymentGreaterThan)
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PageOptions<PurchaseOrder>? pageOptions,
            List<PurchaseOrderStatus>? status,
            List<String>? materialGroupId,
            PurchaseOrderPaymentType? paymentType,
            double? downPaymentGreaterThan)?
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PageOptions<PurchaseOrder>? pageOptions,
            List<PurchaseOrderStatus>? status,
            List<String>? materialGroupId,
            PurchaseOrderPaymentType? paymentType,
            double? downPaymentGreaterThan)?
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

  /// Create a copy of PurchaseOrderQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseOrderQueryEventCopyWith<PurchaseOrderQueryEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseOrderQueryEventCopyWith<$Res> {
  factory $PurchaseOrderQueryEventCopyWith(PurchaseOrderQueryEvent value,
          $Res Function(PurchaseOrderQueryEvent) then) =
      _$PurchaseOrderQueryEventCopyWithImpl<$Res, PurchaseOrderQueryEvent>;
  @useResult
  $Res call(
      {PageOptions<PurchaseOrder>? pageOptions,
      List<PurchaseOrderStatus>? status,
      List<String>? materialGroupId,
      PurchaseOrderPaymentType? paymentType,
      double? downPaymentGreaterThan});
}

/// @nodoc
class _$PurchaseOrderQueryEventCopyWithImpl<$Res,
        $Val extends PurchaseOrderQueryEvent>
    implements $PurchaseOrderQueryEventCopyWith<$Res> {
  _$PurchaseOrderQueryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseOrderQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageOptions = freezed,
    Object? status = freezed,
    Object? materialGroupId = freezed,
    Object? paymentType = freezed,
    Object? downPaymentGreaterThan = freezed,
  }) {
    return _then(_value.copyWith(
      pageOptions: freezed == pageOptions
          ? _value.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<PurchaseOrder>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as List<PurchaseOrderStatus>?,
      materialGroupId: freezed == materialGroupId
          ? _value.materialGroupId
          : materialGroupId // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      paymentType: freezed == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as PurchaseOrderPaymentType?,
      downPaymentGreaterThan: freezed == downPaymentGreaterThan
          ? _value.downPaymentGreaterThan
          : downPaymentGreaterThan // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res>
    implements $PurchaseOrderQueryEventCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PageOptions<PurchaseOrder>? pageOptions,
      List<PurchaseOrderStatus>? status,
      List<String>? materialGroupId,
      PurchaseOrderPaymentType? paymentType,
      double? downPaymentGreaterThan});
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$PurchaseOrderQueryEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageOptions = freezed,
    Object? status = freezed,
    Object? materialGroupId = freezed,
    Object? paymentType = freezed,
    Object? downPaymentGreaterThan = freezed,
  }) {
    return _then(_$FetchImpl(
      pageOptions: freezed == pageOptions
          ? _value.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<PurchaseOrder>?,
      status: freezed == status
          ? _value._status
          : status // ignore: cast_nullable_to_non_nullable
              as List<PurchaseOrderStatus>?,
      materialGroupId: freezed == materialGroupId
          ? _value._materialGroupId
          : materialGroupId // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      paymentType: freezed == paymentType
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as PurchaseOrderPaymentType?,
      downPaymentGreaterThan: freezed == downPaymentGreaterThan
          ? _value.downPaymentGreaterThan
          : downPaymentGreaterThan // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl(
      {this.pageOptions,
      final List<PurchaseOrderStatus>? status,
      final List<String>? materialGroupId,
      this.paymentType,
      this.downPaymentGreaterThan})
      : _status = status,
        _materialGroupId = materialGroupId;

  @override
  final PageOptions<PurchaseOrder>? pageOptions;
  final List<PurchaseOrderStatus>? _status;
  @override
  List<PurchaseOrderStatus>? get status {
    final value = _status;
    if (value == null) return null;
    if (_status is EqualUnmodifiableListView) return _status;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _materialGroupId;
  @override
  List<String>? get materialGroupId {
    final value = _materialGroupId;
    if (value == null) return null;
    if (_materialGroupId is EqualUnmodifiableListView) return _materialGroupId;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final PurchaseOrderPaymentType? paymentType;
  @override
  final double? downPaymentGreaterThan;

  @override
  String toString() {
    return 'PurchaseOrderQueryEvent.fetch(pageOptions: $pageOptions, status: $status, materialGroupId: $materialGroupId, paymentType: $paymentType, downPaymentGreaterThan: $downPaymentGreaterThan)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.pageOptions, pageOptions) ||
                other.pageOptions == pageOptions) &&
            const DeepCollectionEquality().equals(other._status, _status) &&
            const DeepCollectionEquality()
                .equals(other._materialGroupId, _materialGroupId) &&
            (identical(other.paymentType, paymentType) ||
                other.paymentType == paymentType) &&
            (identical(other.downPaymentGreaterThan, downPaymentGreaterThan) ||
                other.downPaymentGreaterThan == downPaymentGreaterThan));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      pageOptions,
      const DeepCollectionEquality().hash(_status),
      const DeepCollectionEquality().hash(_materialGroupId),
      paymentType,
      downPaymentGreaterThan);

  /// Create a copy of PurchaseOrderQueryEvent
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
            PageOptions<PurchaseOrder>? pageOptions,
            List<PurchaseOrderStatus>? status,
            List<String>? materialGroupId,
            PurchaseOrderPaymentType? paymentType,
            double? downPaymentGreaterThan)
        fetch,
  }) {
    return fetch(pageOptions, status, materialGroupId, paymentType,
        downPaymentGreaterThan);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PageOptions<PurchaseOrder>? pageOptions,
            List<PurchaseOrderStatus>? status,
            List<String>? materialGroupId,
            PurchaseOrderPaymentType? paymentType,
            double? downPaymentGreaterThan)?
        fetch,
  }) {
    return fetch?.call(pageOptions, status, materialGroupId, paymentType,
        downPaymentGreaterThan);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PageOptions<PurchaseOrder>? pageOptions,
            List<PurchaseOrderStatus>? status,
            List<String>? materialGroupId,
            PurchaseOrderPaymentType? paymentType,
            double? downPaymentGreaterThan)?
        fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(pageOptions, status, materialGroupId, paymentType,
          downPaymentGreaterThan);
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

abstract class _Fetch implements PurchaseOrderQueryEvent {
  const factory _Fetch(
      {final PageOptions<PurchaseOrder>? pageOptions,
      final List<PurchaseOrderStatus>? status,
      final List<String>? materialGroupId,
      final PurchaseOrderPaymentType? paymentType,
      final double? downPaymentGreaterThan}) = _$FetchImpl;

  @override
  PageOptions<PurchaseOrder>? get pageOptions;
  @override
  List<PurchaseOrderStatus>? get status;
  @override
  List<String>? get materialGroupId;
  @override
  PurchaseOrderPaymentType? get paymentType;
  @override
  double? get downPaymentGreaterThan;

  /// Create a copy of PurchaseOrderQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PurchaseOrderQueryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function() initial,
    required TResult Function(PageOptions<PurchaseOrder> purchaseOrder) loaded,
    required TResult Function(PageOptions<PurchaseOrder> pageOptions) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(PageOptions<PurchaseOrder> purchaseOrder)? loaded,
    TResult? Function(PageOptions<PurchaseOrder> pageOptions)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(PageOptions<PurchaseOrder> purchaseOrder)? loaded,
    TResult Function(PageOptions<PurchaseOrder> pageOptions)? loading,
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
abstract class $PurchaseOrderQueryStateCopyWith<$Res> {
  factory $PurchaseOrderQueryStateCopyWith(PurchaseOrderQueryState value,
          $Res Function(PurchaseOrderQueryState) then) =
      _$PurchaseOrderQueryStateCopyWithImpl<$Res, PurchaseOrderQueryState>;
}

/// @nodoc
class _$PurchaseOrderQueryStateCopyWithImpl<$Res,
        $Val extends PurchaseOrderQueryState>
    implements $PurchaseOrderQueryStateCopyWith<$Res> {
  _$PurchaseOrderQueryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseOrderQueryState
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
    extends _$PurchaseOrderQueryStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderQueryState
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
    return 'PurchaseOrderQueryState.error(error: $error)';
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

  /// Create a copy of PurchaseOrderQueryState
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
    required TResult Function(PageOptions<PurchaseOrder> purchaseOrder) loaded,
    required TResult Function(PageOptions<PurchaseOrder> pageOptions) loading,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(PageOptions<PurchaseOrder> purchaseOrder)? loaded,
    TResult? Function(PageOptions<PurchaseOrder> pageOptions)? loading,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(PageOptions<PurchaseOrder> purchaseOrder)? loaded,
    TResult Function(PageOptions<PurchaseOrder> pageOptions)? loading,
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

abstract class _Error implements PurchaseOrderQueryState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of PurchaseOrderQueryState
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
    extends _$PurchaseOrderQueryStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderQueryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PurchaseOrderQueryState.initial()';
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
    required TResult Function(PageOptions<PurchaseOrder> purchaseOrder) loaded,
    required TResult Function(PageOptions<PurchaseOrder> pageOptions) loading,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(PageOptions<PurchaseOrder> purchaseOrder)? loaded,
    TResult? Function(PageOptions<PurchaseOrder> pageOptions)? loading,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(PageOptions<PurchaseOrder> purchaseOrder)? loaded,
    TResult Function(PageOptions<PurchaseOrder> pageOptions)? loading,
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

abstract class _Initial implements PurchaseOrderQueryState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PageOptions<PurchaseOrder> purchaseOrder});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$PurchaseOrderQueryStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderQueryState
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
              as PageOptions<PurchaseOrder>,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.purchaseOrder);

  @override
  final PageOptions<PurchaseOrder> purchaseOrder;

  @override
  String toString() {
    return 'PurchaseOrderQueryState.loaded(purchaseOrder: $purchaseOrder)';
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

  /// Create a copy of PurchaseOrderQueryState
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
    required TResult Function(PageOptions<PurchaseOrder> purchaseOrder) loaded,
    required TResult Function(PageOptions<PurchaseOrder> pageOptions) loading,
  }) {
    return loaded(purchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(PageOptions<PurchaseOrder> purchaseOrder)? loaded,
    TResult? Function(PageOptions<PurchaseOrder> pageOptions)? loading,
  }) {
    return loaded?.call(purchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(PageOptions<PurchaseOrder> purchaseOrder)? loaded,
    TResult Function(PageOptions<PurchaseOrder> pageOptions)? loading,
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

abstract class _Success implements PurchaseOrderQueryState {
  const factory _Success(final PageOptions<PurchaseOrder> purchaseOrder) =
      _$SuccessImpl;

  PageOptions<PurchaseOrder> get purchaseOrder;

  /// Create a copy of PurchaseOrderQueryState
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
  $Res call({PageOptions<PurchaseOrder> pageOptions});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$PurchaseOrderQueryStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderQueryState
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
              as PageOptions<PurchaseOrder>,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(this.pageOptions);

  @override
  final PageOptions<PurchaseOrder> pageOptions;

  @override
  String toString() {
    return 'PurchaseOrderQueryState.loading(pageOptions: $pageOptions)';
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

  /// Create a copy of PurchaseOrderQueryState
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
    required TResult Function(PageOptions<PurchaseOrder> purchaseOrder) loaded,
    required TResult Function(PageOptions<PurchaseOrder> pageOptions) loading,
  }) {
    return loading(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(PageOptions<PurchaseOrder> purchaseOrder)? loaded,
    TResult? Function(PageOptions<PurchaseOrder> pageOptions)? loading,
  }) {
    return loading?.call(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(PageOptions<PurchaseOrder> purchaseOrder)? loaded,
    TResult Function(PageOptions<PurchaseOrder> pageOptions)? loading,
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

abstract class _Loading implements PurchaseOrderQueryState {
  const factory _Loading(final PageOptions<PurchaseOrder> pageOptions) =
      _$LoadingImpl;

  PageOptions<PurchaseOrder> get pageOptions;

  /// Create a copy of PurchaseOrderQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
