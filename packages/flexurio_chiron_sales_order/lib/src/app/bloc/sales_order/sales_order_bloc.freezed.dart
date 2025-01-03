// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SalesOrderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrderHeaderInitial? salesOrderHeaderInitial)
        initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrderHeaderInitial? salesOrderHeaderInitial)?
        initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrderHeaderInitial? salesOrderHeaderInitial)? initial,
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
abstract class $SalesOrderStateCopyWith<$Res> {
  factory $SalesOrderStateCopyWith(
          SalesOrderState value, $Res Function(SalesOrderState) then) =
      _$SalesOrderStateCopyWithImpl<$Res, SalesOrderState>;
}

/// @nodoc
class _$SalesOrderStateCopyWithImpl<$Res, $Val extends SalesOrderState>
    implements $SalesOrderStateCopyWith<$Res> {
  _$SalesOrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesOrderState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrderHeaderInitial? salesOrderHeaderInitial});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SalesOrderStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrderHeaderInitial = freezed,
  }) {
    return _then(_$InitialImpl(
      salesOrderHeaderInitial: freezed == salesOrderHeaderInitial
          ? _value.salesOrderHeaderInitial
          : salesOrderHeaderInitial // ignore: cast_nullable_to_non_nullable
              as SalesOrderHeaderInitial?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl({this.salesOrderHeaderInitial});

  @override
  final SalesOrderHeaderInitial? salesOrderHeaderInitial;

  @override
  String toString() {
    return 'SalesOrderState.initial(salesOrderHeaderInitial: $salesOrderHeaderInitial)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(
                    other.salesOrderHeaderInitial, salesOrderHeaderInitial) ||
                other.salesOrderHeaderInitial == salesOrderHeaderInitial));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrderHeaderInitial);

  /// Create a copy of SalesOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrderHeaderInitial? salesOrderHeaderInitial)
        initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return initial(salesOrderHeaderInitial);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrderHeaderInitial? salesOrderHeaderInitial)?
        initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call(salesOrderHeaderInitial);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrderHeaderInitial? salesOrderHeaderInitial)? initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(salesOrderHeaderInitial);
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

abstract class _Initial implements SalesOrderState {
  const factory _Initial(
      {final SalesOrderHeaderInitial? salesOrderHeaderInitial}) = _$InitialImpl;

  SalesOrderHeaderInitial? get salesOrderHeaderInitial;

  /// Create a copy of SalesOrderState
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
    extends _$SalesOrderStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'SalesOrderState.loading()';
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
    required TResult Function(SalesOrderHeaderInitial? salesOrderHeaderInitial)
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
    TResult? Function(SalesOrderHeaderInitial? salesOrderHeaderInitial)?
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
    TResult Function(SalesOrderHeaderInitial? salesOrderHeaderInitial)? initial,
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

abstract class _Loading implements SalesOrderState {
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
    extends _$SalesOrderStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'SalesOrderState.success()';
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
    required TResult Function(SalesOrderHeaderInitial? salesOrderHeaderInitial)
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
    TResult? Function(SalesOrderHeaderInitial? salesOrderHeaderInitial)?
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
    TResult Function(SalesOrderHeaderInitial? salesOrderHeaderInitial)? initial,
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

abstract class _Success implements SalesOrderState {
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
    extends _$SalesOrderStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderState
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
    return 'SalesOrderState.error(error: $error)';
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

  /// Create a copy of SalesOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrderHeaderInitial? salesOrderHeaderInitial)
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
    TResult? Function(SalesOrderHeaderInitial? salesOrderHeaderInitial)?
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
    TResult Function(SalesOrderHeaderInitial? salesOrderHeaderInitial)? initial,
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

abstract class _Error implements SalesOrderState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of SalesOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SalesOrderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)
        viewHistoryHeader,
    required TResult Function(String salesOrderId, String type,
            int termOfPayment, double? discountPercent)
        editAdditionalDiscount,
    required TResult Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)
        initialize,
    required TResult Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)
        create,
    required TResult Function(SalesOrder salesOrder) confirm,
    required TResult Function(SalesOrder salesOrder) undoConfirm,
    required TResult Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)
        uploadDataSalesOrder,
    required TResult Function(SalesOrder salesOrder) updateDeliveryOrder,
    required TResult Function(SalesOrder salesOrder) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)?
        viewHistoryHeader,
    TResult? Function(String salesOrderId, String type, int termOfPayment,
            double? discountPercent)?
        editAdditionalDiscount,
    TResult? Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)?
        initialize,
    TResult? Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)?
        create,
    TResult? Function(SalesOrder salesOrder)? confirm,
    TResult? Function(SalesOrder salesOrder)? undoConfirm,
    TResult? Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)?
        uploadDataSalesOrder,
    TResult? Function(SalesOrder salesOrder)? updateDeliveryOrder,
    TResult? Function(SalesOrder salesOrder)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)?
        viewHistoryHeader,
    TResult Function(String salesOrderId, String type, int termOfPayment,
            double? discountPercent)?
        editAdditionalDiscount,
    TResult Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)?
        initialize,
    TResult Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)?
        create,
    TResult Function(SalesOrder salesOrder)? confirm,
    TResult Function(SalesOrder salesOrder)? undoConfirm,
    TResult Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)?
        uploadDataSalesOrder,
    TResult Function(SalesOrder salesOrder)? updateDeliveryOrder,
    TResult Function(SalesOrder salesOrder)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ViewHistoryHeader value) viewHistoryHeader,
    required TResult Function(_EditAdditionalDiscount value)
        editAdditionalDiscount,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Create value) create,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_undoConfirm value) undoConfirm,
    required TResult Function(_UploadDataSalesOrder value) uploadDataSalesOrder,
    required TResult Function(_UpdateDeliveryOrder value) updateDeliveryOrder,
    required TResult Function(_Delete value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ViewHistoryHeader value)? viewHistoryHeader,
    TResult? Function(_EditAdditionalDiscount value)? editAdditionalDiscount,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Create value)? create,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_undoConfirm value)? undoConfirm,
    TResult? Function(_UploadDataSalesOrder value)? uploadDataSalesOrder,
    TResult? Function(_UpdateDeliveryOrder value)? updateDeliveryOrder,
    TResult? Function(_Delete value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ViewHistoryHeader value)? viewHistoryHeader,
    TResult Function(_EditAdditionalDiscount value)? editAdditionalDiscount,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Create value)? create,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_undoConfirm value)? undoConfirm,
    TResult Function(_UploadDataSalesOrder value)? uploadDataSalesOrder,
    TResult Function(_UpdateDeliveryOrder value)? updateDeliveryOrder,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrderEventCopyWith<$Res> {
  factory $SalesOrderEventCopyWith(
          SalesOrderEvent value, $Res Function(SalesOrderEvent) then) =
      _$SalesOrderEventCopyWithImpl<$Res, SalesOrderEvent>;
}

/// @nodoc
class _$SalesOrderEventCopyWithImpl<$Res, $Val extends SalesOrderEvent>
    implements $SalesOrderEventCopyWith<$Res> {
  _$SalesOrderEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ViewHistoryHeaderImplCopyWith<$Res> {
  factory _$$ViewHistoryHeaderImplCopyWith(_$ViewHistoryHeaderImpl value,
          $Res Function(_$ViewHistoryHeaderImpl) then) =
      __$$ViewHistoryHeaderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrder? salesOrderId, SalesOrderHistory? revisionNo});

  $SalesOrderCopyWith<$Res>? get salesOrderId;
  $SalesOrderHistoryCopyWith<$Res>? get revisionNo;
}

/// @nodoc
class __$$ViewHistoryHeaderImplCopyWithImpl<$Res>
    extends _$SalesOrderEventCopyWithImpl<$Res, _$ViewHistoryHeaderImpl>
    implements _$$ViewHistoryHeaderImplCopyWith<$Res> {
  __$$ViewHistoryHeaderImplCopyWithImpl(_$ViewHistoryHeaderImpl _value,
      $Res Function(_$ViewHistoryHeaderImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrderId = freezed,
    Object? revisionNo = freezed,
  }) {
    return _then(_$ViewHistoryHeaderImpl(
      salesOrderId: freezed == salesOrderId
          ? _value.salesOrderId
          : salesOrderId // ignore: cast_nullable_to_non_nullable
              as SalesOrder?,
      revisionNo: freezed == revisionNo
          ? _value.revisionNo
          : revisionNo // ignore: cast_nullable_to_non_nullable
              as SalesOrderHistory?,
    ));
  }

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SalesOrderCopyWith<$Res>? get salesOrderId {
    if (_value.salesOrderId == null) {
      return null;
    }

    return $SalesOrderCopyWith<$Res>(_value.salesOrderId!, (value) {
      return _then(_value.copyWith(salesOrderId: value));
    });
  }

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SalesOrderHistoryCopyWith<$Res>? get revisionNo {
    if (_value.revisionNo == null) {
      return null;
    }

    return $SalesOrderHistoryCopyWith<$Res>(_value.revisionNo!, (value) {
      return _then(_value.copyWith(revisionNo: value));
    });
  }
}

/// @nodoc

class _$ViewHistoryHeaderImpl implements _ViewHistoryHeader {
  const _$ViewHistoryHeaderImpl({this.salesOrderId, this.revisionNo});

  @override
  final SalesOrder? salesOrderId;
  @override
  final SalesOrderHistory? revisionNo;

  @override
  String toString() {
    return 'SalesOrderEvent.viewHistoryHeader(salesOrderId: $salesOrderId, revisionNo: $revisionNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewHistoryHeaderImpl &&
            (identical(other.salesOrderId, salesOrderId) ||
                other.salesOrderId == salesOrderId) &&
            (identical(other.revisionNo, revisionNo) ||
                other.revisionNo == revisionNo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrderId, revisionNo);

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewHistoryHeaderImplCopyWith<_$ViewHistoryHeaderImpl> get copyWith =>
      __$$ViewHistoryHeaderImplCopyWithImpl<_$ViewHistoryHeaderImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)
        viewHistoryHeader,
    required TResult Function(String salesOrderId, String type,
            int termOfPayment, double? discountPercent)
        editAdditionalDiscount,
    required TResult Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)
        initialize,
    required TResult Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)
        create,
    required TResult Function(SalesOrder salesOrder) confirm,
    required TResult Function(SalesOrder salesOrder) undoConfirm,
    required TResult Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)
        uploadDataSalesOrder,
    required TResult Function(SalesOrder salesOrder) updateDeliveryOrder,
    required TResult Function(SalesOrder salesOrder) delete,
  }) {
    return viewHistoryHeader(salesOrderId, revisionNo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)?
        viewHistoryHeader,
    TResult? Function(String salesOrderId, String type, int termOfPayment,
            double? discountPercent)?
        editAdditionalDiscount,
    TResult? Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)?
        initialize,
    TResult? Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)?
        create,
    TResult? Function(SalesOrder salesOrder)? confirm,
    TResult? Function(SalesOrder salesOrder)? undoConfirm,
    TResult? Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)?
        uploadDataSalesOrder,
    TResult? Function(SalesOrder salesOrder)? updateDeliveryOrder,
    TResult? Function(SalesOrder salesOrder)? delete,
  }) {
    return viewHistoryHeader?.call(salesOrderId, revisionNo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)?
        viewHistoryHeader,
    TResult Function(String salesOrderId, String type, int termOfPayment,
            double? discountPercent)?
        editAdditionalDiscount,
    TResult Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)?
        initialize,
    TResult Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)?
        create,
    TResult Function(SalesOrder salesOrder)? confirm,
    TResult Function(SalesOrder salesOrder)? undoConfirm,
    TResult Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)?
        uploadDataSalesOrder,
    TResult Function(SalesOrder salesOrder)? updateDeliveryOrder,
    TResult Function(SalesOrder salesOrder)? delete,
    required TResult orElse(),
  }) {
    if (viewHistoryHeader != null) {
      return viewHistoryHeader(salesOrderId, revisionNo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ViewHistoryHeader value) viewHistoryHeader,
    required TResult Function(_EditAdditionalDiscount value)
        editAdditionalDiscount,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Create value) create,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_undoConfirm value) undoConfirm,
    required TResult Function(_UploadDataSalesOrder value) uploadDataSalesOrder,
    required TResult Function(_UpdateDeliveryOrder value) updateDeliveryOrder,
    required TResult Function(_Delete value) delete,
  }) {
    return viewHistoryHeader(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ViewHistoryHeader value)? viewHistoryHeader,
    TResult? Function(_EditAdditionalDiscount value)? editAdditionalDiscount,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Create value)? create,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_undoConfirm value)? undoConfirm,
    TResult? Function(_UploadDataSalesOrder value)? uploadDataSalesOrder,
    TResult? Function(_UpdateDeliveryOrder value)? updateDeliveryOrder,
    TResult? Function(_Delete value)? delete,
  }) {
    return viewHistoryHeader?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ViewHistoryHeader value)? viewHistoryHeader,
    TResult Function(_EditAdditionalDiscount value)? editAdditionalDiscount,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Create value)? create,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_undoConfirm value)? undoConfirm,
    TResult Function(_UploadDataSalesOrder value)? uploadDataSalesOrder,
    TResult Function(_UpdateDeliveryOrder value)? updateDeliveryOrder,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (viewHistoryHeader != null) {
      return viewHistoryHeader(this);
    }
    return orElse();
  }
}

abstract class _ViewHistoryHeader implements SalesOrderEvent {
  const factory _ViewHistoryHeader(
      {final SalesOrder? salesOrderId,
      final SalesOrderHistory? revisionNo}) = _$ViewHistoryHeaderImpl;

  SalesOrder? get salesOrderId;
  SalesOrderHistory? get revisionNo;

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViewHistoryHeaderImplCopyWith<_$ViewHistoryHeaderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditAdditionalDiscountImplCopyWith<$Res> {
  factory _$$EditAdditionalDiscountImplCopyWith(
          _$EditAdditionalDiscountImpl value,
          $Res Function(_$EditAdditionalDiscountImpl) then) =
      __$$EditAdditionalDiscountImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String salesOrderId,
      String type,
      int termOfPayment,
      double? discountPercent});
}

/// @nodoc
class __$$EditAdditionalDiscountImplCopyWithImpl<$Res>
    extends _$SalesOrderEventCopyWithImpl<$Res, _$EditAdditionalDiscountImpl>
    implements _$$EditAdditionalDiscountImplCopyWith<$Res> {
  __$$EditAdditionalDiscountImplCopyWithImpl(
      _$EditAdditionalDiscountImpl _value,
      $Res Function(_$EditAdditionalDiscountImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrderId = null,
    Object? type = null,
    Object? termOfPayment = null,
    Object? discountPercent = freezed,
  }) {
    return _then(_$EditAdditionalDiscountImpl(
      salesOrderId: null == salesOrderId
          ? _value.salesOrderId
          : salesOrderId // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      termOfPayment: null == termOfPayment
          ? _value.termOfPayment
          : termOfPayment // ignore: cast_nullable_to_non_nullable
              as int,
      discountPercent: freezed == discountPercent
          ? _value.discountPercent
          : discountPercent // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$EditAdditionalDiscountImpl implements _EditAdditionalDiscount {
  const _$EditAdditionalDiscountImpl(
      {required this.salesOrderId,
      required this.type,
      required this.termOfPayment,
      required this.discountPercent});

  @override
  final String salesOrderId;
  @override
  final String type;
  @override
  final int termOfPayment;
  @override
  final double? discountPercent;

  @override
  String toString() {
    return 'SalesOrderEvent.editAdditionalDiscount(salesOrderId: $salesOrderId, type: $type, termOfPayment: $termOfPayment, discountPercent: $discountPercent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditAdditionalDiscountImpl &&
            (identical(other.salesOrderId, salesOrderId) ||
                other.salesOrderId == salesOrderId) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.termOfPayment, termOfPayment) ||
                other.termOfPayment == termOfPayment) &&
            (identical(other.discountPercent, discountPercent) ||
                other.discountPercent == discountPercent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, salesOrderId, type, termOfPayment, discountPercent);

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditAdditionalDiscountImplCopyWith<_$EditAdditionalDiscountImpl>
      get copyWith => __$$EditAdditionalDiscountImplCopyWithImpl<
          _$EditAdditionalDiscountImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)
        viewHistoryHeader,
    required TResult Function(String salesOrderId, String type,
            int termOfPayment, double? discountPercent)
        editAdditionalDiscount,
    required TResult Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)
        initialize,
    required TResult Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)
        create,
    required TResult Function(SalesOrder salesOrder) confirm,
    required TResult Function(SalesOrder salesOrder) undoConfirm,
    required TResult Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)
        uploadDataSalesOrder,
    required TResult Function(SalesOrder salesOrder) updateDeliveryOrder,
    required TResult Function(SalesOrder salesOrder) delete,
  }) {
    return editAdditionalDiscount(
        salesOrderId, type, termOfPayment, discountPercent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)?
        viewHistoryHeader,
    TResult? Function(String salesOrderId, String type, int termOfPayment,
            double? discountPercent)?
        editAdditionalDiscount,
    TResult? Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)?
        initialize,
    TResult? Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)?
        create,
    TResult? Function(SalesOrder salesOrder)? confirm,
    TResult? Function(SalesOrder salesOrder)? undoConfirm,
    TResult? Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)?
        uploadDataSalesOrder,
    TResult? Function(SalesOrder salesOrder)? updateDeliveryOrder,
    TResult? Function(SalesOrder salesOrder)? delete,
  }) {
    return editAdditionalDiscount?.call(
        salesOrderId, type, termOfPayment, discountPercent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)?
        viewHistoryHeader,
    TResult Function(String salesOrderId, String type, int termOfPayment,
            double? discountPercent)?
        editAdditionalDiscount,
    TResult Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)?
        initialize,
    TResult Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)?
        create,
    TResult Function(SalesOrder salesOrder)? confirm,
    TResult Function(SalesOrder salesOrder)? undoConfirm,
    TResult Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)?
        uploadDataSalesOrder,
    TResult Function(SalesOrder salesOrder)? updateDeliveryOrder,
    TResult Function(SalesOrder salesOrder)? delete,
    required TResult orElse(),
  }) {
    if (editAdditionalDiscount != null) {
      return editAdditionalDiscount(
          salesOrderId, type, termOfPayment, discountPercent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ViewHistoryHeader value) viewHistoryHeader,
    required TResult Function(_EditAdditionalDiscount value)
        editAdditionalDiscount,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Create value) create,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_undoConfirm value) undoConfirm,
    required TResult Function(_UploadDataSalesOrder value) uploadDataSalesOrder,
    required TResult Function(_UpdateDeliveryOrder value) updateDeliveryOrder,
    required TResult Function(_Delete value) delete,
  }) {
    return editAdditionalDiscount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ViewHistoryHeader value)? viewHistoryHeader,
    TResult? Function(_EditAdditionalDiscount value)? editAdditionalDiscount,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Create value)? create,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_undoConfirm value)? undoConfirm,
    TResult? Function(_UploadDataSalesOrder value)? uploadDataSalesOrder,
    TResult? Function(_UpdateDeliveryOrder value)? updateDeliveryOrder,
    TResult? Function(_Delete value)? delete,
  }) {
    return editAdditionalDiscount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ViewHistoryHeader value)? viewHistoryHeader,
    TResult Function(_EditAdditionalDiscount value)? editAdditionalDiscount,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Create value)? create,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_undoConfirm value)? undoConfirm,
    TResult Function(_UploadDataSalesOrder value)? uploadDataSalesOrder,
    TResult Function(_UpdateDeliveryOrder value)? updateDeliveryOrder,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (editAdditionalDiscount != null) {
      return editAdditionalDiscount(this);
    }
    return orElse();
  }
}

abstract class _EditAdditionalDiscount implements SalesOrderEvent {
  const factory _EditAdditionalDiscount(
      {required final String salesOrderId,
      required final String type,
      required final int termOfPayment,
      required final double? discountPercent}) = _$EditAdditionalDiscountImpl;

  String get salesOrderId;
  String get type;
  int get termOfPayment;
  double? get discountPercent;

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditAdditionalDiscountImplCopyWith<_$EditAdditionalDiscountImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrder? salesOrderId, SalesOrder? revisionNo});

  $SalesOrderCopyWith<$Res>? get salesOrderId;
  $SalesOrderCopyWith<$Res>? get revisionNo;
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$SalesOrderEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrderId = freezed,
    Object? revisionNo = freezed,
  }) {
    return _then(_$InitializeImpl(
      salesOrderId: freezed == salesOrderId
          ? _value.salesOrderId
          : salesOrderId // ignore: cast_nullable_to_non_nullable
              as SalesOrder?,
      revisionNo: freezed == revisionNo
          ? _value.revisionNo
          : revisionNo // ignore: cast_nullable_to_non_nullable
              as SalesOrder?,
    ));
  }

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SalesOrderCopyWith<$Res>? get salesOrderId {
    if (_value.salesOrderId == null) {
      return null;
    }

    return $SalesOrderCopyWith<$Res>(_value.salesOrderId!, (value) {
      return _then(_value.copyWith(salesOrderId: value));
    });
  }

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SalesOrderCopyWith<$Res>? get revisionNo {
    if (_value.revisionNo == null) {
      return null;
    }

    return $SalesOrderCopyWith<$Res>(_value.revisionNo!, (value) {
      return _then(_value.copyWith(revisionNo: value));
    });
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl({this.salesOrderId, this.revisionNo});

  @override
  final SalesOrder? salesOrderId;
  @override
  final SalesOrder? revisionNo;

  @override
  String toString() {
    return 'SalesOrderEvent.initialize(salesOrderId: $salesOrderId, revisionNo: $revisionNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.salesOrderId, salesOrderId) ||
                other.salesOrderId == salesOrderId) &&
            (identical(other.revisionNo, revisionNo) ||
                other.revisionNo == revisionNo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrderId, revisionNo);

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)
        viewHistoryHeader,
    required TResult Function(String salesOrderId, String type,
            int termOfPayment, double? discountPercent)
        editAdditionalDiscount,
    required TResult Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)
        initialize,
    required TResult Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)
        create,
    required TResult Function(SalesOrder salesOrder) confirm,
    required TResult Function(SalesOrder salesOrder) undoConfirm,
    required TResult Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)
        uploadDataSalesOrder,
    required TResult Function(SalesOrder salesOrder) updateDeliveryOrder,
    required TResult Function(SalesOrder salesOrder) delete,
  }) {
    return initialize(salesOrderId, revisionNo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)?
        viewHistoryHeader,
    TResult? Function(String salesOrderId, String type, int termOfPayment,
            double? discountPercent)?
        editAdditionalDiscount,
    TResult? Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)?
        initialize,
    TResult? Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)?
        create,
    TResult? Function(SalesOrder salesOrder)? confirm,
    TResult? Function(SalesOrder salesOrder)? undoConfirm,
    TResult? Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)?
        uploadDataSalesOrder,
    TResult? Function(SalesOrder salesOrder)? updateDeliveryOrder,
    TResult? Function(SalesOrder salesOrder)? delete,
  }) {
    return initialize?.call(salesOrderId, revisionNo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)?
        viewHistoryHeader,
    TResult Function(String salesOrderId, String type, int termOfPayment,
            double? discountPercent)?
        editAdditionalDiscount,
    TResult Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)?
        initialize,
    TResult Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)?
        create,
    TResult Function(SalesOrder salesOrder)? confirm,
    TResult Function(SalesOrder salesOrder)? undoConfirm,
    TResult Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)?
        uploadDataSalesOrder,
    TResult Function(SalesOrder salesOrder)? updateDeliveryOrder,
    TResult Function(SalesOrder salesOrder)? delete,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(salesOrderId, revisionNo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ViewHistoryHeader value) viewHistoryHeader,
    required TResult Function(_EditAdditionalDiscount value)
        editAdditionalDiscount,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Create value) create,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_undoConfirm value) undoConfirm,
    required TResult Function(_UploadDataSalesOrder value) uploadDataSalesOrder,
    required TResult Function(_UpdateDeliveryOrder value) updateDeliveryOrder,
    required TResult Function(_Delete value) delete,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ViewHistoryHeader value)? viewHistoryHeader,
    TResult? Function(_EditAdditionalDiscount value)? editAdditionalDiscount,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Create value)? create,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_undoConfirm value)? undoConfirm,
    TResult? Function(_UploadDataSalesOrder value)? uploadDataSalesOrder,
    TResult? Function(_UpdateDeliveryOrder value)? updateDeliveryOrder,
    TResult? Function(_Delete value)? delete,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ViewHistoryHeader value)? viewHistoryHeader,
    TResult Function(_EditAdditionalDiscount value)? editAdditionalDiscount,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Create value)? create,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_undoConfirm value)? undoConfirm,
    TResult Function(_UploadDataSalesOrder value)? uploadDataSalesOrder,
    TResult Function(_UpdateDeliveryOrder value)? updateDeliveryOrder,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements SalesOrderEvent {
  const factory _Initialize(
      {final SalesOrder? salesOrderId,
      final SalesOrder? revisionNo}) = _$InitializeImpl;

  SalesOrder? get salesOrderId;
  SalesOrder? get revisionNo;

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateImplCopyWith<$Res> {
  factory _$$CreateImplCopyWith(
          _$CreateImpl value, $Res Function(_$CreateImpl) then) =
      __$$CreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String transactionTypeId, List<CartItem> products, String orderTypeId});
}

/// @nodoc
class __$$CreateImplCopyWithImpl<$Res>
    extends _$SalesOrderEventCopyWithImpl<$Res, _$CreateImpl>
    implements _$$CreateImplCopyWith<$Res> {
  __$$CreateImplCopyWithImpl(
      _$CreateImpl _value, $Res Function(_$CreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionTypeId = null,
    Object? products = null,
    Object? orderTypeId = null,
  }) {
    return _then(_$CreateImpl(
      transactionTypeId: null == transactionTypeId
          ? _value.transactionTypeId
          : transactionTypeId // ignore: cast_nullable_to_non_nullable
              as String,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<CartItem>,
      orderTypeId: null == orderTypeId
          ? _value.orderTypeId
          : orderTypeId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CreateImpl implements _Create {
  const _$CreateImpl(
      {required this.transactionTypeId,
      required final List<CartItem> products,
      required this.orderTypeId})
      : _products = products;

  @override
  final String transactionTypeId;
  final List<CartItem> _products;
  @override
  List<CartItem> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final String orderTypeId;

  @override
  String toString() {
    return 'SalesOrderEvent.create(transactionTypeId: $transactionTypeId, products: $products, orderTypeId: $orderTypeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateImpl &&
            (identical(other.transactionTypeId, transactionTypeId) ||
                other.transactionTypeId == transactionTypeId) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.orderTypeId, orderTypeId) ||
                other.orderTypeId == orderTypeId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transactionTypeId,
      const DeepCollectionEquality().hash(_products), orderTypeId);

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      __$$CreateImplCopyWithImpl<_$CreateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)
        viewHistoryHeader,
    required TResult Function(String salesOrderId, String type,
            int termOfPayment, double? discountPercent)
        editAdditionalDiscount,
    required TResult Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)
        initialize,
    required TResult Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)
        create,
    required TResult Function(SalesOrder salesOrder) confirm,
    required TResult Function(SalesOrder salesOrder) undoConfirm,
    required TResult Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)
        uploadDataSalesOrder,
    required TResult Function(SalesOrder salesOrder) updateDeliveryOrder,
    required TResult Function(SalesOrder salesOrder) delete,
  }) {
    return create(transactionTypeId, products, orderTypeId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)?
        viewHistoryHeader,
    TResult? Function(String salesOrderId, String type, int termOfPayment,
            double? discountPercent)?
        editAdditionalDiscount,
    TResult? Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)?
        initialize,
    TResult? Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)?
        create,
    TResult? Function(SalesOrder salesOrder)? confirm,
    TResult? Function(SalesOrder salesOrder)? undoConfirm,
    TResult? Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)?
        uploadDataSalesOrder,
    TResult? Function(SalesOrder salesOrder)? updateDeliveryOrder,
    TResult? Function(SalesOrder salesOrder)? delete,
  }) {
    return create?.call(transactionTypeId, products, orderTypeId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)?
        viewHistoryHeader,
    TResult Function(String salesOrderId, String type, int termOfPayment,
            double? discountPercent)?
        editAdditionalDiscount,
    TResult Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)?
        initialize,
    TResult Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)?
        create,
    TResult Function(SalesOrder salesOrder)? confirm,
    TResult Function(SalesOrder salesOrder)? undoConfirm,
    TResult Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)?
        uploadDataSalesOrder,
    TResult Function(SalesOrder salesOrder)? updateDeliveryOrder,
    TResult Function(SalesOrder salesOrder)? delete,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(transactionTypeId, products, orderTypeId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ViewHistoryHeader value) viewHistoryHeader,
    required TResult Function(_EditAdditionalDiscount value)
        editAdditionalDiscount,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Create value) create,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_undoConfirm value) undoConfirm,
    required TResult Function(_UploadDataSalesOrder value) uploadDataSalesOrder,
    required TResult Function(_UpdateDeliveryOrder value) updateDeliveryOrder,
    required TResult Function(_Delete value) delete,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ViewHistoryHeader value)? viewHistoryHeader,
    TResult? Function(_EditAdditionalDiscount value)? editAdditionalDiscount,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Create value)? create,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_undoConfirm value)? undoConfirm,
    TResult? Function(_UploadDataSalesOrder value)? uploadDataSalesOrder,
    TResult? Function(_UpdateDeliveryOrder value)? updateDeliveryOrder,
    TResult? Function(_Delete value)? delete,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ViewHistoryHeader value)? viewHistoryHeader,
    TResult Function(_EditAdditionalDiscount value)? editAdditionalDiscount,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Create value)? create,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_undoConfirm value)? undoConfirm,
    TResult Function(_UploadDataSalesOrder value)? uploadDataSalesOrder,
    TResult Function(_UpdateDeliveryOrder value)? updateDeliveryOrder,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class _Create implements SalesOrderEvent {
  const factory _Create(
      {required final String transactionTypeId,
      required final List<CartItem> products,
      required final String orderTypeId}) = _$CreateImpl;

  String get transactionTypeId;
  List<CartItem> get products;
  String get orderTypeId;

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfirmImplCopyWith<$Res> {
  factory _$$ConfirmImplCopyWith(
          _$ConfirmImpl value, $Res Function(_$ConfirmImpl) then) =
      __$$ConfirmImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrder salesOrder});

  $SalesOrderCopyWith<$Res> get salesOrder;
}

/// @nodoc
class __$$ConfirmImplCopyWithImpl<$Res>
    extends _$SalesOrderEventCopyWithImpl<$Res, _$ConfirmImpl>
    implements _$$ConfirmImplCopyWith<$Res> {
  __$$ConfirmImplCopyWithImpl(
      _$ConfirmImpl _value, $Res Function(_$ConfirmImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrder = null,
  }) {
    return _then(_$ConfirmImpl(
      null == salesOrder
          ? _value.salesOrder
          : salesOrder // ignore: cast_nullable_to_non_nullable
              as SalesOrder,
    ));
  }

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SalesOrderCopyWith<$Res> get salesOrder {
    return $SalesOrderCopyWith<$Res>(_value.salesOrder, (value) {
      return _then(_value.copyWith(salesOrder: value));
    });
  }
}

/// @nodoc

class _$ConfirmImpl implements _Confirm {
  const _$ConfirmImpl(this.salesOrder);

  @override
  final SalesOrder salesOrder;

  @override
  String toString() {
    return 'SalesOrderEvent.confirm(salesOrder: $salesOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmImpl &&
            (identical(other.salesOrder, salesOrder) ||
                other.salesOrder == salesOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrder);

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmImplCopyWith<_$ConfirmImpl> get copyWith =>
      __$$ConfirmImplCopyWithImpl<_$ConfirmImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)
        viewHistoryHeader,
    required TResult Function(String salesOrderId, String type,
            int termOfPayment, double? discountPercent)
        editAdditionalDiscount,
    required TResult Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)
        initialize,
    required TResult Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)
        create,
    required TResult Function(SalesOrder salesOrder) confirm,
    required TResult Function(SalesOrder salesOrder) undoConfirm,
    required TResult Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)
        uploadDataSalesOrder,
    required TResult Function(SalesOrder salesOrder) updateDeliveryOrder,
    required TResult Function(SalesOrder salesOrder) delete,
  }) {
    return confirm(salesOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)?
        viewHistoryHeader,
    TResult? Function(String salesOrderId, String type, int termOfPayment,
            double? discountPercent)?
        editAdditionalDiscount,
    TResult? Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)?
        initialize,
    TResult? Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)?
        create,
    TResult? Function(SalesOrder salesOrder)? confirm,
    TResult? Function(SalesOrder salesOrder)? undoConfirm,
    TResult? Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)?
        uploadDataSalesOrder,
    TResult? Function(SalesOrder salesOrder)? updateDeliveryOrder,
    TResult? Function(SalesOrder salesOrder)? delete,
  }) {
    return confirm?.call(salesOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)?
        viewHistoryHeader,
    TResult Function(String salesOrderId, String type, int termOfPayment,
            double? discountPercent)?
        editAdditionalDiscount,
    TResult Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)?
        initialize,
    TResult Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)?
        create,
    TResult Function(SalesOrder salesOrder)? confirm,
    TResult Function(SalesOrder salesOrder)? undoConfirm,
    TResult Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)?
        uploadDataSalesOrder,
    TResult Function(SalesOrder salesOrder)? updateDeliveryOrder,
    TResult Function(SalesOrder salesOrder)? delete,
    required TResult orElse(),
  }) {
    if (confirm != null) {
      return confirm(salesOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ViewHistoryHeader value) viewHistoryHeader,
    required TResult Function(_EditAdditionalDiscount value)
        editAdditionalDiscount,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Create value) create,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_undoConfirm value) undoConfirm,
    required TResult Function(_UploadDataSalesOrder value) uploadDataSalesOrder,
    required TResult Function(_UpdateDeliveryOrder value) updateDeliveryOrder,
    required TResult Function(_Delete value) delete,
  }) {
    return confirm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ViewHistoryHeader value)? viewHistoryHeader,
    TResult? Function(_EditAdditionalDiscount value)? editAdditionalDiscount,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Create value)? create,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_undoConfirm value)? undoConfirm,
    TResult? Function(_UploadDataSalesOrder value)? uploadDataSalesOrder,
    TResult? Function(_UpdateDeliveryOrder value)? updateDeliveryOrder,
    TResult? Function(_Delete value)? delete,
  }) {
    return confirm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ViewHistoryHeader value)? viewHistoryHeader,
    TResult Function(_EditAdditionalDiscount value)? editAdditionalDiscount,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Create value)? create,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_undoConfirm value)? undoConfirm,
    TResult Function(_UploadDataSalesOrder value)? uploadDataSalesOrder,
    TResult Function(_UpdateDeliveryOrder value)? updateDeliveryOrder,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (confirm != null) {
      return confirm(this);
    }
    return orElse();
  }
}

abstract class _Confirm implements SalesOrderEvent {
  const factory _Confirm(final SalesOrder salesOrder) = _$ConfirmImpl;

  SalesOrder get salesOrder;

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfirmImplCopyWith<_$ConfirmImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$undoConfirmImplCopyWith<$Res> {
  factory _$$undoConfirmImplCopyWith(
          _$undoConfirmImpl value, $Res Function(_$undoConfirmImpl) then) =
      __$$undoConfirmImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrder salesOrder});

  $SalesOrderCopyWith<$Res> get salesOrder;
}

/// @nodoc
class __$$undoConfirmImplCopyWithImpl<$Res>
    extends _$SalesOrderEventCopyWithImpl<$Res, _$undoConfirmImpl>
    implements _$$undoConfirmImplCopyWith<$Res> {
  __$$undoConfirmImplCopyWithImpl(
      _$undoConfirmImpl _value, $Res Function(_$undoConfirmImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrder = null,
  }) {
    return _then(_$undoConfirmImpl(
      null == salesOrder
          ? _value.salesOrder
          : salesOrder // ignore: cast_nullable_to_non_nullable
              as SalesOrder,
    ));
  }

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SalesOrderCopyWith<$Res> get salesOrder {
    return $SalesOrderCopyWith<$Res>(_value.salesOrder, (value) {
      return _then(_value.copyWith(salesOrder: value));
    });
  }
}

/// @nodoc

class _$undoConfirmImpl implements _undoConfirm {
  const _$undoConfirmImpl(this.salesOrder);

  @override
  final SalesOrder salesOrder;

  @override
  String toString() {
    return 'SalesOrderEvent.undoConfirm(salesOrder: $salesOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$undoConfirmImpl &&
            (identical(other.salesOrder, salesOrder) ||
                other.salesOrder == salesOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrder);

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$undoConfirmImplCopyWith<_$undoConfirmImpl> get copyWith =>
      __$$undoConfirmImplCopyWithImpl<_$undoConfirmImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)
        viewHistoryHeader,
    required TResult Function(String salesOrderId, String type,
            int termOfPayment, double? discountPercent)
        editAdditionalDiscount,
    required TResult Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)
        initialize,
    required TResult Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)
        create,
    required TResult Function(SalesOrder salesOrder) confirm,
    required TResult Function(SalesOrder salesOrder) undoConfirm,
    required TResult Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)
        uploadDataSalesOrder,
    required TResult Function(SalesOrder salesOrder) updateDeliveryOrder,
    required TResult Function(SalesOrder salesOrder) delete,
  }) {
    return undoConfirm(salesOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)?
        viewHistoryHeader,
    TResult? Function(String salesOrderId, String type, int termOfPayment,
            double? discountPercent)?
        editAdditionalDiscount,
    TResult? Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)?
        initialize,
    TResult? Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)?
        create,
    TResult? Function(SalesOrder salesOrder)? confirm,
    TResult? Function(SalesOrder salesOrder)? undoConfirm,
    TResult? Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)?
        uploadDataSalesOrder,
    TResult? Function(SalesOrder salesOrder)? updateDeliveryOrder,
    TResult? Function(SalesOrder salesOrder)? delete,
  }) {
    return undoConfirm?.call(salesOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)?
        viewHistoryHeader,
    TResult Function(String salesOrderId, String type, int termOfPayment,
            double? discountPercent)?
        editAdditionalDiscount,
    TResult Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)?
        initialize,
    TResult Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)?
        create,
    TResult Function(SalesOrder salesOrder)? confirm,
    TResult Function(SalesOrder salesOrder)? undoConfirm,
    TResult Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)?
        uploadDataSalesOrder,
    TResult Function(SalesOrder salesOrder)? updateDeliveryOrder,
    TResult Function(SalesOrder salesOrder)? delete,
    required TResult orElse(),
  }) {
    if (undoConfirm != null) {
      return undoConfirm(salesOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ViewHistoryHeader value) viewHistoryHeader,
    required TResult Function(_EditAdditionalDiscount value)
        editAdditionalDiscount,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Create value) create,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_undoConfirm value) undoConfirm,
    required TResult Function(_UploadDataSalesOrder value) uploadDataSalesOrder,
    required TResult Function(_UpdateDeliveryOrder value) updateDeliveryOrder,
    required TResult Function(_Delete value) delete,
  }) {
    return undoConfirm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ViewHistoryHeader value)? viewHistoryHeader,
    TResult? Function(_EditAdditionalDiscount value)? editAdditionalDiscount,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Create value)? create,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_undoConfirm value)? undoConfirm,
    TResult? Function(_UploadDataSalesOrder value)? uploadDataSalesOrder,
    TResult? Function(_UpdateDeliveryOrder value)? updateDeliveryOrder,
    TResult? Function(_Delete value)? delete,
  }) {
    return undoConfirm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ViewHistoryHeader value)? viewHistoryHeader,
    TResult Function(_EditAdditionalDiscount value)? editAdditionalDiscount,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Create value)? create,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_undoConfirm value)? undoConfirm,
    TResult Function(_UploadDataSalesOrder value)? uploadDataSalesOrder,
    TResult Function(_UpdateDeliveryOrder value)? updateDeliveryOrder,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (undoConfirm != null) {
      return undoConfirm(this);
    }
    return orElse();
  }
}

abstract class _undoConfirm implements SalesOrderEvent {
  const factory _undoConfirm(final SalesOrder salesOrder) = _$undoConfirmImpl;

  SalesOrder get salesOrder;

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$undoConfirmImplCopyWith<_$undoConfirmImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadDataSalesOrderImplCopyWith<$Res> {
  factory _$$UploadDataSalesOrderImplCopyWith(_$UploadDataSalesOrderImpl value,
          $Res Function(_$UploadDataSalesOrderImpl) then) =
      __$$UploadDataSalesOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {SalesOrder salesOrder, String description, PlatformFile attachment});

  $SalesOrderCopyWith<$Res> get salesOrder;
}

/// @nodoc
class __$$UploadDataSalesOrderImplCopyWithImpl<$Res>
    extends _$SalesOrderEventCopyWithImpl<$Res, _$UploadDataSalesOrderImpl>
    implements _$$UploadDataSalesOrderImplCopyWith<$Res> {
  __$$UploadDataSalesOrderImplCopyWithImpl(_$UploadDataSalesOrderImpl _value,
      $Res Function(_$UploadDataSalesOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrder = null,
    Object? description = null,
    Object? attachment = null,
  }) {
    return _then(_$UploadDataSalesOrderImpl(
      null == salesOrder
          ? _value.salesOrder
          : salesOrder // ignore: cast_nullable_to_non_nullable
              as SalesOrder,
      null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      null == attachment
          ? _value.attachment
          : attachment // ignore: cast_nullable_to_non_nullable
              as PlatformFile,
    ));
  }

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SalesOrderCopyWith<$Res> get salesOrder {
    return $SalesOrderCopyWith<$Res>(_value.salesOrder, (value) {
      return _then(_value.copyWith(salesOrder: value));
    });
  }
}

/// @nodoc

class _$UploadDataSalesOrderImpl implements _UploadDataSalesOrder {
  const _$UploadDataSalesOrderImpl(
      this.salesOrder, this.description, this.attachment);

  @override
  final SalesOrder salesOrder;
  @override
  final String description;
  @override
  final PlatformFile attachment;

  @override
  String toString() {
    return 'SalesOrderEvent.uploadDataSalesOrder(salesOrder: $salesOrder, description: $description, attachment: $attachment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadDataSalesOrderImpl &&
            (identical(other.salesOrder, salesOrder) ||
                other.salesOrder == salesOrder) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.attachment, attachment) ||
                other.attachment == attachment));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, salesOrder, description, attachment);

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadDataSalesOrderImplCopyWith<_$UploadDataSalesOrderImpl>
      get copyWith =>
          __$$UploadDataSalesOrderImplCopyWithImpl<_$UploadDataSalesOrderImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)
        viewHistoryHeader,
    required TResult Function(String salesOrderId, String type,
            int termOfPayment, double? discountPercent)
        editAdditionalDiscount,
    required TResult Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)
        initialize,
    required TResult Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)
        create,
    required TResult Function(SalesOrder salesOrder) confirm,
    required TResult Function(SalesOrder salesOrder) undoConfirm,
    required TResult Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)
        uploadDataSalesOrder,
    required TResult Function(SalesOrder salesOrder) updateDeliveryOrder,
    required TResult Function(SalesOrder salesOrder) delete,
  }) {
    return uploadDataSalesOrder(salesOrder, description, attachment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)?
        viewHistoryHeader,
    TResult? Function(String salesOrderId, String type, int termOfPayment,
            double? discountPercent)?
        editAdditionalDiscount,
    TResult? Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)?
        initialize,
    TResult? Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)?
        create,
    TResult? Function(SalesOrder salesOrder)? confirm,
    TResult? Function(SalesOrder salesOrder)? undoConfirm,
    TResult? Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)?
        uploadDataSalesOrder,
    TResult? Function(SalesOrder salesOrder)? updateDeliveryOrder,
    TResult? Function(SalesOrder salesOrder)? delete,
  }) {
    return uploadDataSalesOrder?.call(salesOrder, description, attachment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)?
        viewHistoryHeader,
    TResult Function(String salesOrderId, String type, int termOfPayment,
            double? discountPercent)?
        editAdditionalDiscount,
    TResult Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)?
        initialize,
    TResult Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)?
        create,
    TResult Function(SalesOrder salesOrder)? confirm,
    TResult Function(SalesOrder salesOrder)? undoConfirm,
    TResult Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)?
        uploadDataSalesOrder,
    TResult Function(SalesOrder salesOrder)? updateDeliveryOrder,
    TResult Function(SalesOrder salesOrder)? delete,
    required TResult orElse(),
  }) {
    if (uploadDataSalesOrder != null) {
      return uploadDataSalesOrder(salesOrder, description, attachment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ViewHistoryHeader value) viewHistoryHeader,
    required TResult Function(_EditAdditionalDiscount value)
        editAdditionalDiscount,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Create value) create,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_undoConfirm value) undoConfirm,
    required TResult Function(_UploadDataSalesOrder value) uploadDataSalesOrder,
    required TResult Function(_UpdateDeliveryOrder value) updateDeliveryOrder,
    required TResult Function(_Delete value) delete,
  }) {
    return uploadDataSalesOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ViewHistoryHeader value)? viewHistoryHeader,
    TResult? Function(_EditAdditionalDiscount value)? editAdditionalDiscount,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Create value)? create,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_undoConfirm value)? undoConfirm,
    TResult? Function(_UploadDataSalesOrder value)? uploadDataSalesOrder,
    TResult? Function(_UpdateDeliveryOrder value)? updateDeliveryOrder,
    TResult? Function(_Delete value)? delete,
  }) {
    return uploadDataSalesOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ViewHistoryHeader value)? viewHistoryHeader,
    TResult Function(_EditAdditionalDiscount value)? editAdditionalDiscount,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Create value)? create,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_undoConfirm value)? undoConfirm,
    TResult Function(_UploadDataSalesOrder value)? uploadDataSalesOrder,
    TResult Function(_UpdateDeliveryOrder value)? updateDeliveryOrder,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (uploadDataSalesOrder != null) {
      return uploadDataSalesOrder(this);
    }
    return orElse();
  }
}

abstract class _UploadDataSalesOrder implements SalesOrderEvent {
  const factory _UploadDataSalesOrder(
      final SalesOrder salesOrder,
      final String description,
      final PlatformFile attachment) = _$UploadDataSalesOrderImpl;

  SalesOrder get salesOrder;
  String get description;
  PlatformFile get attachment;

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadDataSalesOrderImplCopyWith<_$UploadDataSalesOrderImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateDeliveryOrderImplCopyWith<$Res> {
  factory _$$UpdateDeliveryOrderImplCopyWith(_$UpdateDeliveryOrderImpl value,
          $Res Function(_$UpdateDeliveryOrderImpl) then) =
      __$$UpdateDeliveryOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrder salesOrder});

  $SalesOrderCopyWith<$Res> get salesOrder;
}

/// @nodoc
class __$$UpdateDeliveryOrderImplCopyWithImpl<$Res>
    extends _$SalesOrderEventCopyWithImpl<$Res, _$UpdateDeliveryOrderImpl>
    implements _$$UpdateDeliveryOrderImplCopyWith<$Res> {
  __$$UpdateDeliveryOrderImplCopyWithImpl(_$UpdateDeliveryOrderImpl _value,
      $Res Function(_$UpdateDeliveryOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrder = null,
  }) {
    return _then(_$UpdateDeliveryOrderImpl(
      null == salesOrder
          ? _value.salesOrder
          : salesOrder // ignore: cast_nullable_to_non_nullable
              as SalesOrder,
    ));
  }

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SalesOrderCopyWith<$Res> get salesOrder {
    return $SalesOrderCopyWith<$Res>(_value.salesOrder, (value) {
      return _then(_value.copyWith(salesOrder: value));
    });
  }
}

/// @nodoc

class _$UpdateDeliveryOrderImpl implements _UpdateDeliveryOrder {
  const _$UpdateDeliveryOrderImpl(this.salesOrder);

  @override
  final SalesOrder salesOrder;

  @override
  String toString() {
    return 'SalesOrderEvent.updateDeliveryOrder(salesOrder: $salesOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDeliveryOrderImpl &&
            (identical(other.salesOrder, salesOrder) ||
                other.salesOrder == salesOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrder);

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateDeliveryOrderImplCopyWith<_$UpdateDeliveryOrderImpl> get copyWith =>
      __$$UpdateDeliveryOrderImplCopyWithImpl<_$UpdateDeliveryOrderImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)
        viewHistoryHeader,
    required TResult Function(String salesOrderId, String type,
            int termOfPayment, double? discountPercent)
        editAdditionalDiscount,
    required TResult Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)
        initialize,
    required TResult Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)
        create,
    required TResult Function(SalesOrder salesOrder) confirm,
    required TResult Function(SalesOrder salesOrder) undoConfirm,
    required TResult Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)
        uploadDataSalesOrder,
    required TResult Function(SalesOrder salesOrder) updateDeliveryOrder,
    required TResult Function(SalesOrder salesOrder) delete,
  }) {
    return updateDeliveryOrder(salesOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)?
        viewHistoryHeader,
    TResult? Function(String salesOrderId, String type, int termOfPayment,
            double? discountPercent)?
        editAdditionalDiscount,
    TResult? Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)?
        initialize,
    TResult? Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)?
        create,
    TResult? Function(SalesOrder salesOrder)? confirm,
    TResult? Function(SalesOrder salesOrder)? undoConfirm,
    TResult? Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)?
        uploadDataSalesOrder,
    TResult? Function(SalesOrder salesOrder)? updateDeliveryOrder,
    TResult? Function(SalesOrder salesOrder)? delete,
  }) {
    return updateDeliveryOrder?.call(salesOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)?
        viewHistoryHeader,
    TResult Function(String salesOrderId, String type, int termOfPayment,
            double? discountPercent)?
        editAdditionalDiscount,
    TResult Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)?
        initialize,
    TResult Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)?
        create,
    TResult Function(SalesOrder salesOrder)? confirm,
    TResult Function(SalesOrder salesOrder)? undoConfirm,
    TResult Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)?
        uploadDataSalesOrder,
    TResult Function(SalesOrder salesOrder)? updateDeliveryOrder,
    TResult Function(SalesOrder salesOrder)? delete,
    required TResult orElse(),
  }) {
    if (updateDeliveryOrder != null) {
      return updateDeliveryOrder(salesOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ViewHistoryHeader value) viewHistoryHeader,
    required TResult Function(_EditAdditionalDiscount value)
        editAdditionalDiscount,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Create value) create,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_undoConfirm value) undoConfirm,
    required TResult Function(_UploadDataSalesOrder value) uploadDataSalesOrder,
    required TResult Function(_UpdateDeliveryOrder value) updateDeliveryOrder,
    required TResult Function(_Delete value) delete,
  }) {
    return updateDeliveryOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ViewHistoryHeader value)? viewHistoryHeader,
    TResult? Function(_EditAdditionalDiscount value)? editAdditionalDiscount,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Create value)? create,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_undoConfirm value)? undoConfirm,
    TResult? Function(_UploadDataSalesOrder value)? uploadDataSalesOrder,
    TResult? Function(_UpdateDeliveryOrder value)? updateDeliveryOrder,
    TResult? Function(_Delete value)? delete,
  }) {
    return updateDeliveryOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ViewHistoryHeader value)? viewHistoryHeader,
    TResult Function(_EditAdditionalDiscount value)? editAdditionalDiscount,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Create value)? create,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_undoConfirm value)? undoConfirm,
    TResult Function(_UploadDataSalesOrder value)? uploadDataSalesOrder,
    TResult Function(_UpdateDeliveryOrder value)? updateDeliveryOrder,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (updateDeliveryOrder != null) {
      return updateDeliveryOrder(this);
    }
    return orElse();
  }
}

abstract class _UpdateDeliveryOrder implements SalesOrderEvent {
  const factory _UpdateDeliveryOrder(final SalesOrder salesOrder) =
      _$UpdateDeliveryOrderImpl;

  SalesOrder get salesOrder;

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateDeliveryOrderImplCopyWith<_$UpdateDeliveryOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrder salesOrder});

  $SalesOrderCopyWith<$Res> get salesOrder;
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$SalesOrderEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrder = null,
  }) {
    return _then(_$DeleteImpl(
      null == salesOrder
          ? _value.salesOrder
          : salesOrder // ignore: cast_nullable_to_non_nullable
              as SalesOrder,
    ));
  }

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SalesOrderCopyWith<$Res> get salesOrder {
    return $SalesOrderCopyWith<$Res>(_value.salesOrder, (value) {
      return _then(_value.copyWith(salesOrder: value));
    });
  }
}

/// @nodoc

class _$DeleteImpl implements _Delete {
  const _$DeleteImpl(this.salesOrder);

  @override
  final SalesOrder salesOrder;

  @override
  String toString() {
    return 'SalesOrderEvent.delete(salesOrder: $salesOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteImpl &&
            (identical(other.salesOrder, salesOrder) ||
                other.salesOrder == salesOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrder);

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      __$$DeleteImplCopyWithImpl<_$DeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)
        viewHistoryHeader,
    required TResult Function(String salesOrderId, String type,
            int termOfPayment, double? discountPercent)
        editAdditionalDiscount,
    required TResult Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)
        initialize,
    required TResult Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)
        create,
    required TResult Function(SalesOrder salesOrder) confirm,
    required TResult Function(SalesOrder salesOrder) undoConfirm,
    required TResult Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)
        uploadDataSalesOrder,
    required TResult Function(SalesOrder salesOrder) updateDeliveryOrder,
    required TResult Function(SalesOrder salesOrder) delete,
  }) {
    return delete(salesOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)?
        viewHistoryHeader,
    TResult? Function(String salesOrderId, String type, int termOfPayment,
            double? discountPercent)?
        editAdditionalDiscount,
    TResult? Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)?
        initialize,
    TResult? Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)?
        create,
    TResult? Function(SalesOrder salesOrder)? confirm,
    TResult? Function(SalesOrder salesOrder)? undoConfirm,
    TResult? Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)?
        uploadDataSalesOrder,
    TResult? Function(SalesOrder salesOrder)? updateDeliveryOrder,
    TResult? Function(SalesOrder salesOrder)? delete,
  }) {
    return delete?.call(salesOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrder? salesOrderId, SalesOrderHistory? revisionNo)?
        viewHistoryHeader,
    TResult Function(String salesOrderId, String type, int termOfPayment,
            double? discountPercent)?
        editAdditionalDiscount,
    TResult Function(SalesOrder? salesOrderId, SalesOrder? revisionNo)?
        initialize,
    TResult Function(String transactionTypeId, List<CartItem> products,
            String orderTypeId)?
        create,
    TResult Function(SalesOrder salesOrder)? confirm,
    TResult Function(SalesOrder salesOrder)? undoConfirm,
    TResult Function(
            SalesOrder salesOrder, String description, PlatformFile attachment)?
        uploadDataSalesOrder,
    TResult Function(SalesOrder salesOrder)? updateDeliveryOrder,
    TResult Function(SalesOrder salesOrder)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(salesOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ViewHistoryHeader value) viewHistoryHeader,
    required TResult Function(_EditAdditionalDiscount value)
        editAdditionalDiscount,
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Create value) create,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_undoConfirm value) undoConfirm,
    required TResult Function(_UploadDataSalesOrder value) uploadDataSalesOrder,
    required TResult Function(_UpdateDeliveryOrder value) updateDeliveryOrder,
    required TResult Function(_Delete value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ViewHistoryHeader value)? viewHistoryHeader,
    TResult? Function(_EditAdditionalDiscount value)? editAdditionalDiscount,
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Create value)? create,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_undoConfirm value)? undoConfirm,
    TResult? Function(_UploadDataSalesOrder value)? uploadDataSalesOrder,
    TResult? Function(_UpdateDeliveryOrder value)? updateDeliveryOrder,
    TResult? Function(_Delete value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ViewHistoryHeader value)? viewHistoryHeader,
    TResult Function(_EditAdditionalDiscount value)? editAdditionalDiscount,
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Create value)? create,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_undoConfirm value)? undoConfirm,
    TResult Function(_UploadDataSalesOrder value)? uploadDataSalesOrder,
    TResult Function(_UpdateDeliveryOrder value)? updateDeliveryOrder,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements SalesOrderEvent {
  const factory _Delete(final SalesOrder salesOrder) = _$DeleteImpl;

  SalesOrder get salesOrder;

  /// Create a copy of SalesOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
