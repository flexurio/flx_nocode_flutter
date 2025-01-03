// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_order_print_invoice_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SalesOrderPrintInvoiceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrderHeaderInitial? salesOrderHeaderInitial)
        initial,
    required TResult Function() loading,
    required TResult Function(String taxInvoiceNumber) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrderHeaderInitial? salesOrderHeaderInitial)?
        initial,
    TResult? Function()? loading,
    TResult? Function(String taxInvoiceNumber)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrderHeaderInitial? salesOrderHeaderInitial)? initial,
    TResult Function()? loading,
    TResult Function(String taxInvoiceNumber)? success,
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
abstract class $SalesOrderPrintInvoiceStateCopyWith<$Res> {
  factory $SalesOrderPrintInvoiceStateCopyWith(
          SalesOrderPrintInvoiceState value,
          $Res Function(SalesOrderPrintInvoiceState) then) =
      _$SalesOrderPrintInvoiceStateCopyWithImpl<$Res,
          SalesOrderPrintInvoiceState>;
}

/// @nodoc
class _$SalesOrderPrintInvoiceStateCopyWithImpl<$Res,
        $Val extends SalesOrderPrintInvoiceState>
    implements $SalesOrderPrintInvoiceStateCopyWith<$Res> {
  _$SalesOrderPrintInvoiceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesOrderPrintInvoiceState
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
    extends _$SalesOrderPrintInvoiceStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderPrintInvoiceState
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
    return 'SalesOrderPrintInvoiceState.initial(salesOrderHeaderInitial: $salesOrderHeaderInitial)';
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

  /// Create a copy of SalesOrderPrintInvoiceState
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
    required TResult Function(String taxInvoiceNumber) success,
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
    TResult? Function(String taxInvoiceNumber)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call(salesOrderHeaderInitial);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrderHeaderInitial? salesOrderHeaderInitial)? initial,
    TResult Function()? loading,
    TResult Function(String taxInvoiceNumber)? success,
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

abstract class _Initial implements SalesOrderPrintInvoiceState {
  const factory _Initial(
      {final SalesOrderHeaderInitial? salesOrderHeaderInitial}) = _$InitialImpl;

  SalesOrderHeaderInitial? get salesOrderHeaderInitial;

  /// Create a copy of SalesOrderPrintInvoiceState
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
    extends _$SalesOrderPrintInvoiceStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderPrintInvoiceState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'SalesOrderPrintInvoiceState.loading()';
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
    required TResult Function(String taxInvoiceNumber) success,
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
    TResult? Function(String taxInvoiceNumber)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrderHeaderInitial? salesOrderHeaderInitial)? initial,
    TResult Function()? loading,
    TResult Function(String taxInvoiceNumber)? success,
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

abstract class _Loading implements SalesOrderPrintInvoiceState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String taxInvoiceNumber});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$SalesOrderPrintInvoiceStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderPrintInvoiceState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? taxInvoiceNumber = null,
  }) {
    return _then(_$SuccessImpl(
      null == taxInvoiceNumber
          ? _value.taxInvoiceNumber
          : taxInvoiceNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.taxInvoiceNumber);

  @override
  final String taxInvoiceNumber;

  @override
  String toString() {
    return 'SalesOrderPrintInvoiceState.success(taxInvoiceNumber: $taxInvoiceNumber)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.taxInvoiceNumber, taxInvoiceNumber) ||
                other.taxInvoiceNumber == taxInvoiceNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, taxInvoiceNumber);

  /// Create a copy of SalesOrderPrintInvoiceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrderHeaderInitial? salesOrderHeaderInitial)
        initial,
    required TResult Function() loading,
    required TResult Function(String taxInvoiceNumber) success,
    required TResult Function(String error) error,
  }) {
    return success(taxInvoiceNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrderHeaderInitial? salesOrderHeaderInitial)?
        initial,
    TResult? Function()? loading,
    TResult? Function(String taxInvoiceNumber)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(taxInvoiceNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrderHeaderInitial? salesOrderHeaderInitial)? initial,
    TResult Function()? loading,
    TResult Function(String taxInvoiceNumber)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(taxInvoiceNumber);
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

abstract class _Success implements SalesOrderPrintInvoiceState {
  const factory _Success(final String taxInvoiceNumber) = _$SuccessImpl;

  String get taxInvoiceNumber;

  /// Create a copy of SalesOrderPrintInvoiceState
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
    extends _$SalesOrderPrintInvoiceStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderPrintInvoiceState
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
    return 'SalesOrderPrintInvoiceState.error(error: $error)';
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

  /// Create a copy of SalesOrderPrintInvoiceState
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
    required TResult Function(String taxInvoiceNumber) success,
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
    TResult? Function(String taxInvoiceNumber)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrderHeaderInitial? salesOrderHeaderInitial)? initial,
    TResult Function()? loading,
    TResult Function(String taxInvoiceNumber)? success,
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

abstract class _Error implements SalesOrderPrintInvoiceState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of SalesOrderPrintInvoiceState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SalesOrderPrintInvoiceEvent {
  SalesOrder get salesOrder => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrder salesOrder) printInvoice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrder salesOrder)? printInvoice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrder salesOrder)? printInvoice,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PrintInvoice value) printInvoice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PrintInvoice value)? printInvoice,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PrintInvoice value)? printInvoice,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of SalesOrderPrintInvoiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SalesOrderPrintInvoiceEventCopyWith<SalesOrderPrintInvoiceEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrderPrintInvoiceEventCopyWith<$Res> {
  factory $SalesOrderPrintInvoiceEventCopyWith(
          SalesOrderPrintInvoiceEvent value,
          $Res Function(SalesOrderPrintInvoiceEvent) then) =
      _$SalesOrderPrintInvoiceEventCopyWithImpl<$Res,
          SalesOrderPrintInvoiceEvent>;
  @useResult
  $Res call({SalesOrder salesOrder});

  $SalesOrderCopyWith<$Res> get salesOrder;
}

/// @nodoc
class _$SalesOrderPrintInvoiceEventCopyWithImpl<$Res,
        $Val extends SalesOrderPrintInvoiceEvent>
    implements $SalesOrderPrintInvoiceEventCopyWith<$Res> {
  _$SalesOrderPrintInvoiceEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesOrderPrintInvoiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrder = null,
  }) {
    return _then(_value.copyWith(
      salesOrder: null == salesOrder
          ? _value.salesOrder
          : salesOrder // ignore: cast_nullable_to_non_nullable
              as SalesOrder,
    ) as $Val);
  }

  /// Create a copy of SalesOrderPrintInvoiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SalesOrderCopyWith<$Res> get salesOrder {
    return $SalesOrderCopyWith<$Res>(_value.salesOrder, (value) {
      return _then(_value.copyWith(salesOrder: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PrintInvoiceImplCopyWith<$Res>
    implements $SalesOrderPrintInvoiceEventCopyWith<$Res> {
  factory _$$PrintInvoiceImplCopyWith(
          _$PrintInvoiceImpl value, $Res Function(_$PrintInvoiceImpl) then) =
      __$$PrintInvoiceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SalesOrder salesOrder});

  @override
  $SalesOrderCopyWith<$Res> get salesOrder;
}

/// @nodoc
class __$$PrintInvoiceImplCopyWithImpl<$Res>
    extends _$SalesOrderPrintInvoiceEventCopyWithImpl<$Res, _$PrintInvoiceImpl>
    implements _$$PrintInvoiceImplCopyWith<$Res> {
  __$$PrintInvoiceImplCopyWithImpl(
      _$PrintInvoiceImpl _value, $Res Function(_$PrintInvoiceImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderPrintInvoiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrder = null,
  }) {
    return _then(_$PrintInvoiceImpl(
      null == salesOrder
          ? _value.salesOrder
          : salesOrder // ignore: cast_nullable_to_non_nullable
              as SalesOrder,
    ));
  }
}

/// @nodoc

class _$PrintInvoiceImpl implements _PrintInvoice {
  const _$PrintInvoiceImpl(this.salesOrder);

  @override
  final SalesOrder salesOrder;

  @override
  String toString() {
    return 'SalesOrderPrintInvoiceEvent.printInvoice(salesOrder: $salesOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PrintInvoiceImpl &&
            (identical(other.salesOrder, salesOrder) ||
                other.salesOrder == salesOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrder);

  /// Create a copy of SalesOrderPrintInvoiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PrintInvoiceImplCopyWith<_$PrintInvoiceImpl> get copyWith =>
      __$$PrintInvoiceImplCopyWithImpl<_$PrintInvoiceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrder salesOrder) printInvoice,
  }) {
    return printInvoice(salesOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrder salesOrder)? printInvoice,
  }) {
    return printInvoice?.call(salesOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrder salesOrder)? printInvoice,
    required TResult orElse(),
  }) {
    if (printInvoice != null) {
      return printInvoice(salesOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PrintInvoice value) printInvoice,
  }) {
    return printInvoice(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PrintInvoice value)? printInvoice,
  }) {
    return printInvoice?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PrintInvoice value)? printInvoice,
    required TResult orElse(),
  }) {
    if (printInvoice != null) {
      return printInvoice(this);
    }
    return orElse();
  }
}

abstract class _PrintInvoice implements SalesOrderPrintInvoiceEvent {
  const factory _PrintInvoice(final SalesOrder salesOrder) = _$PrintInvoiceImpl;

  @override
  SalesOrder get salesOrder;

  /// Create a copy of SalesOrderPrintInvoiceEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PrintInvoiceImplCopyWith<_$PrintInvoiceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
