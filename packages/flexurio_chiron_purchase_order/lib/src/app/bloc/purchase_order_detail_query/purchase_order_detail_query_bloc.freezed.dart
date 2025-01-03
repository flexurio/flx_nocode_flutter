// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_order_detail_query_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PurchaseOrderDetailQueryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PurchaseOrderDetail> purchaseOrderDetails)
        loaded,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PurchaseOrderDetail> purchaseOrderDetails)? loaded,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PurchaseOrderDetail> purchaseOrderDetails)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseOrderDetailQueryStateCopyWith<$Res> {
  factory $PurchaseOrderDetailQueryStateCopyWith(
          PurchaseOrderDetailQueryState value,
          $Res Function(PurchaseOrderDetailQueryState) then) =
      _$PurchaseOrderDetailQueryStateCopyWithImpl<$Res,
          PurchaseOrderDetailQueryState>;
}

/// @nodoc
class _$PurchaseOrderDetailQueryStateCopyWithImpl<$Res,
        $Val extends PurchaseOrderDetailQueryState>
    implements $PurchaseOrderDetailQueryStateCopyWith<$Res> {
  _$PurchaseOrderDetailQueryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseOrderDetailQueryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PurchaseOrderDetailQueryStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderDetailQueryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PurchaseOrderDetailQueryState.initial()';
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
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PurchaseOrderDetail> purchaseOrderDetails)
        loaded,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PurchaseOrderDetail> purchaseOrderDetails)? loaded,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PurchaseOrderDetail> purchaseOrderDetails)? loaded,
    TResult Function(String error)? error,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PurchaseOrderDetailQueryState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$PurchaseOrderDetailQueryStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderDetailQueryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'PurchaseOrderDetailQueryState.loading()';
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
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PurchaseOrderDetail> purchaseOrderDetails)
        loaded,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PurchaseOrderDetail> purchaseOrderDetails)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PurchaseOrderDetail> purchaseOrderDetails)? loaded,
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
    required TResult Function(_Success value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PurchaseOrderDetailQueryState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PurchaseOrderDetail> purchaseOrderDetails});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$PurchaseOrderDetailQueryStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderDetailQueryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseOrderDetails = null,
  }) {
    return _then(_$SuccessImpl(
      null == purchaseOrderDetails
          ? _value._purchaseOrderDetails
          : purchaseOrderDetails // ignore: cast_nullable_to_non_nullable
              as List<PurchaseOrderDetail>,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(final List<PurchaseOrderDetail> purchaseOrderDetails)
      : _purchaseOrderDetails = purchaseOrderDetails;

  final List<PurchaseOrderDetail> _purchaseOrderDetails;
  @override
  List<PurchaseOrderDetail> get purchaseOrderDetails {
    if (_purchaseOrderDetails is EqualUnmodifiableListView)
      return _purchaseOrderDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_purchaseOrderDetails);
  }

  @override
  String toString() {
    return 'PurchaseOrderDetailQueryState.loaded(purchaseOrderDetails: $purchaseOrderDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._purchaseOrderDetails, _purchaseOrderDetails));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_purchaseOrderDetails));

  /// Create a copy of PurchaseOrderDetailQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PurchaseOrderDetail> purchaseOrderDetails)
        loaded,
    required TResult Function(String error) error,
  }) {
    return loaded(purchaseOrderDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PurchaseOrderDetail> purchaseOrderDetails)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call(purchaseOrderDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PurchaseOrderDetail> purchaseOrderDetails)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(purchaseOrderDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Success implements PurchaseOrderDetailQueryState {
  const factory _Success(final List<PurchaseOrderDetail> purchaseOrderDetails) =
      _$SuccessImpl;

  List<PurchaseOrderDetail> get purchaseOrderDetails;

  /// Create a copy of PurchaseOrderDetailQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$PurchaseOrderDetailQueryStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderDetailQueryState
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
    return 'PurchaseOrderDetailQueryState.error(error: $error)';
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

  /// Create a copy of PurchaseOrderDetailQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<PurchaseOrderDetail> purchaseOrderDetails)
        loaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<PurchaseOrderDetail> purchaseOrderDetails)? loaded,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<PurchaseOrderDetail> purchaseOrderDetails)? loaded,
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
    required TResult Function(_Success value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements PurchaseOrderDetailQueryState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of PurchaseOrderDetailQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PurchaseOrderDetailQueryEvent {
  PurchaseOrder? get purchaseOrder => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PurchaseOrder purchaseOrder, String? materialGroupId)
        fetch,
    required TResult Function(
            Material? material,
            Product? product,
            List<Material>? materials,
            List<Product>? products,
            PurchaseOrder? purchaseOrder)
        fetchAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseOrder purchaseOrder, String? materialGroupId)?
        fetch,
    TResult? Function(
            Material? material,
            Product? product,
            List<Material>? materials,
            List<Product>? products,
            PurchaseOrder? purchaseOrder)?
        fetchAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseOrder purchaseOrder, String? materialGroupId)?
        fetch,
    TResult Function(
            Material? material,
            Product? product,
            List<Material>? materials,
            List<Product>? products,
            PurchaseOrder? purchaseOrder)?
        fetchAll,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchAll value) fetchAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchAll value)? fetchAll,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchAll value)? fetchAll,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PurchaseOrderDetailQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseOrderDetailQueryEventCopyWith<PurchaseOrderDetailQueryEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseOrderDetailQueryEventCopyWith<$Res> {
  factory $PurchaseOrderDetailQueryEventCopyWith(
          PurchaseOrderDetailQueryEvent value,
          $Res Function(PurchaseOrderDetailQueryEvent) then) =
      _$PurchaseOrderDetailQueryEventCopyWithImpl<$Res,
          PurchaseOrderDetailQueryEvent>;
  @useResult
  $Res call({PurchaseOrder purchaseOrder});

  $PurchaseOrderCopyWith<$Res>? get purchaseOrder;
}

/// @nodoc
class _$PurchaseOrderDetailQueryEventCopyWithImpl<$Res,
        $Val extends PurchaseOrderDetailQueryEvent>
    implements $PurchaseOrderDetailQueryEventCopyWith<$Res> {
  _$PurchaseOrderDetailQueryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseOrderDetailQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseOrder = null,
  }) {
    return _then(_value.copyWith(
      purchaseOrder: null == purchaseOrder
          ? _value.purchaseOrder!
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
    ) as $Val);
  }

  /// Create a copy of PurchaseOrderDetailQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PurchaseOrderCopyWith<$Res>? get purchaseOrder {
    if (_value.purchaseOrder == null) {
      return null;
    }

    return $PurchaseOrderCopyWith<$Res>(_value.purchaseOrder!, (value) {
      return _then(_value.copyWith(purchaseOrder: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res>
    implements $PurchaseOrderDetailQueryEventCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PurchaseOrder purchaseOrder, String? materialGroupId});

  @override
  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$PurchaseOrderDetailQueryEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderDetailQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseOrder = null,
    Object? materialGroupId = freezed,
  }) {
    return _then(_$FetchImpl(
      purchaseOrder: null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
      materialGroupId: freezed == materialGroupId
          ? _value.materialGroupId
          : materialGroupId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of PurchaseOrderDetailQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PurchaseOrderCopyWith<$Res> get purchaseOrder {
    return $PurchaseOrderCopyWith<$Res>(_value.purchaseOrder, (value) {
      return _then(_value.copyWith(purchaseOrder: value));
    });
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl({required this.purchaseOrder, this.materialGroupId});

  @override
  final PurchaseOrder purchaseOrder;
  @override
  final String? materialGroupId;

  @override
  String toString() {
    return 'PurchaseOrderDetailQueryEvent.fetch(purchaseOrder: $purchaseOrder, materialGroupId: $materialGroupId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder) &&
            (identical(other.materialGroupId, materialGroupId) ||
                other.materialGroupId == materialGroupId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, purchaseOrder, materialGroupId);

  /// Create a copy of PurchaseOrderDetailQueryEvent
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
            PurchaseOrder purchaseOrder, String? materialGroupId)
        fetch,
    required TResult Function(
            Material? material,
            Product? product,
            List<Material>? materials,
            List<Product>? products,
            PurchaseOrder? purchaseOrder)
        fetchAll,
  }) {
    return fetch(purchaseOrder, materialGroupId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseOrder purchaseOrder, String? materialGroupId)?
        fetch,
    TResult? Function(
            Material? material,
            Product? product,
            List<Material>? materials,
            List<Product>? products,
            PurchaseOrder? purchaseOrder)?
        fetchAll,
  }) {
    return fetch?.call(purchaseOrder, materialGroupId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseOrder purchaseOrder, String? materialGroupId)?
        fetch,
    TResult Function(
            Material? material,
            Product? product,
            List<Material>? materials,
            List<Product>? products,
            PurchaseOrder? purchaseOrder)?
        fetchAll,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(purchaseOrder, materialGroupId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchAll value) fetchAll,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchAll value)? fetchAll,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchAll value)? fetchAll,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements PurchaseOrderDetailQueryEvent {
  const factory _Fetch(
      {required final PurchaseOrder purchaseOrder,
      final String? materialGroupId}) = _$FetchImpl;

  @override
  PurchaseOrder get purchaseOrder;
  String? get materialGroupId;

  /// Create a copy of PurchaseOrderDetailQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchAllImplCopyWith<$Res>
    implements $PurchaseOrderDetailQueryEventCopyWith<$Res> {
  factory _$$FetchAllImplCopyWith(
          _$FetchAllImpl value, $Res Function(_$FetchAllImpl) then) =
      __$$FetchAllImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Material? material,
      Product? product,
      List<Material>? materials,
      List<Product>? products,
      PurchaseOrder? purchaseOrder});

  $MaterialCopyWith<$Res>? get material;
  $ProductCopyWith<$Res>? get product;
  @override
  $PurchaseOrderCopyWith<$Res>? get purchaseOrder;
}

/// @nodoc
class __$$FetchAllImplCopyWithImpl<$Res>
    extends _$PurchaseOrderDetailQueryEventCopyWithImpl<$Res, _$FetchAllImpl>
    implements _$$FetchAllImplCopyWith<$Res> {
  __$$FetchAllImplCopyWithImpl(
      _$FetchAllImpl _value, $Res Function(_$FetchAllImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderDetailQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? material = freezed,
    Object? product = freezed,
    Object? materials = freezed,
    Object? products = freezed,
    Object? purchaseOrder = freezed,
  }) {
    return _then(_$FetchAllImpl(
      material: freezed == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material?,
      product: freezed == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product?,
      materials: freezed == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<Material>?,
      products: freezed == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>?,
      purchaseOrder: freezed == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder?,
    ));
  }

  /// Create a copy of PurchaseOrderDetailQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialCopyWith<$Res>? get material {
    if (_value.material == null) {
      return null;
    }

    return $MaterialCopyWith<$Res>(_value.material!, (value) {
      return _then(_value.copyWith(material: value));
    });
  }

  /// Create a copy of PurchaseOrderDetailQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc

class _$FetchAllImpl implements _FetchAll {
  const _$FetchAllImpl(
      {this.material,
      this.product,
      final List<Material>? materials,
      final List<Product>? products,
      this.purchaseOrder})
      : _materials = materials,
        _products = products;

  @override
  final Material? material;
  @override
  final Product? product;
  final List<Material>? _materials;
  @override
  List<Material>? get materials {
    final value = _materials;
    if (value == null) return null;
    if (_materials is EqualUnmodifiableListView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Product>? _products;
  @override
  List<Product>? get products {
    final value = _products;
    if (value == null) return null;
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final PurchaseOrder? purchaseOrder;

  @override
  String toString() {
    return 'PurchaseOrderDetailQueryEvent.fetchAll(material: $material, product: $product, materials: $materials, products: $products, purchaseOrder: $purchaseOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAllImpl &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.product, product) || other.product == product) &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      material,
      product,
      const DeepCollectionEquality().hash(_materials),
      const DeepCollectionEquality().hash(_products),
      purchaseOrder);

  /// Create a copy of PurchaseOrderDetailQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchAllImplCopyWith<_$FetchAllImpl> get copyWith =>
      __$$FetchAllImplCopyWithImpl<_$FetchAllImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PurchaseOrder purchaseOrder, String? materialGroupId)
        fetch,
    required TResult Function(
            Material? material,
            Product? product,
            List<Material>? materials,
            List<Product>? products,
            PurchaseOrder? purchaseOrder)
        fetchAll,
  }) {
    return fetchAll(material, product, materials, products, purchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseOrder purchaseOrder, String? materialGroupId)?
        fetch,
    TResult? Function(
            Material? material,
            Product? product,
            List<Material>? materials,
            List<Product>? products,
            PurchaseOrder? purchaseOrder)?
        fetchAll,
  }) {
    return fetchAll?.call(
        material, product, materials, products, purchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseOrder purchaseOrder, String? materialGroupId)?
        fetch,
    TResult Function(
            Material? material,
            Product? product,
            List<Material>? materials,
            List<Product>? products,
            PurchaseOrder? purchaseOrder)?
        fetchAll,
    required TResult orElse(),
  }) {
    if (fetchAll != null) {
      return fetchAll(material, product, materials, products, purchaseOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchAll value) fetchAll,
  }) {
    return fetchAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchAll value)? fetchAll,
  }) {
    return fetchAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchAll value)? fetchAll,
    required TResult orElse(),
  }) {
    if (fetchAll != null) {
      return fetchAll(this);
    }
    return orElse();
  }
}

abstract class _FetchAll implements PurchaseOrderDetailQueryEvent {
  const factory _FetchAll(
      {final Material? material,
      final Product? product,
      final List<Material>? materials,
      final List<Product>? products,
      final PurchaseOrder? purchaseOrder}) = _$FetchAllImpl;

  Material? get material;
  Product? get product;
  List<Material>? get materials;
  List<Product>? get products;
  @override
  PurchaseOrder? get purchaseOrder;

  /// Create a copy of PurchaseOrderDetailQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchAllImplCopyWith<_$FetchAllImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
