// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'petty_cash_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PettyCashState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            List<PurchaseOrderDetail>? details,
            PettyCashType? pettyCashType)
        initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseOrder? purchaseOrder, VehicleRent? vehicleRent,
            List<PurchaseOrderDetail>? details, PettyCashType? pettyCashType)?
        initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseOrder? purchaseOrder, VehicleRent? vehicleRent,
            List<PurchaseOrderDetail>? details, PettyCashType? pettyCashType)?
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
abstract class $PettyCashStateCopyWith<$Res> {
  factory $PettyCashStateCopyWith(
          PettyCashState value, $Res Function(PettyCashState) then) =
      _$PettyCashStateCopyWithImpl<$Res, PettyCashState>;
}

/// @nodoc
class _$PettyCashStateCopyWithImpl<$Res, $Val extends PettyCashState>
    implements $PettyCashStateCopyWith<$Res> {
  _$PettyCashStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PettyCashState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PurchaseOrder? purchaseOrder,
      VehicleRent? vehicleRent,
      List<PurchaseOrderDetail>? details,
      PettyCashType? pettyCashType});

  $PurchaseOrderCopyWith<$Res>? get purchaseOrder;
  $VehicleRentCopyWith<$Res>? get vehicleRent;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PettyCashStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PettyCashState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseOrder = freezed,
    Object? vehicleRent = freezed,
    Object? details = freezed,
    Object? pettyCashType = freezed,
  }) {
    return _then(_$InitialImpl(
      purchaseOrder: freezed == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder?,
      vehicleRent: freezed == vehicleRent
          ? _value.vehicleRent
          : vehicleRent // ignore: cast_nullable_to_non_nullable
              as VehicleRent?,
      details: freezed == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<PurchaseOrderDetail>?,
      pettyCashType: freezed == pettyCashType
          ? _value.pettyCashType
          : pettyCashType // ignore: cast_nullable_to_non_nullable
              as PettyCashType?,
    ));
  }

  /// Create a copy of PettyCashState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PurchaseOrderCopyWith<$Res>? get purchaseOrder {
    if (_value.purchaseOrder == null) {
      return null;
    }

    return $PurchaseOrderCopyWith<$Res>(_value.purchaseOrder!, (value) {
      return _then(_value.copyWith(purchaseOrder: value));
    });
  }

  /// Create a copy of PettyCashState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VehicleRentCopyWith<$Res>? get vehicleRent {
    if (_value.vehicleRent == null) {
      return null;
    }

    return $VehicleRentCopyWith<$Res>(_value.vehicleRent!, (value) {
      return _then(_value.copyWith(vehicleRent: value));
    });
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.purchaseOrder,
      this.vehicleRent,
      final List<PurchaseOrderDetail>? details,
      this.pettyCashType})
      : _details = details;

  @override
  final PurchaseOrder? purchaseOrder;
  @override
  final VehicleRent? vehicleRent;
  final List<PurchaseOrderDetail>? _details;
  @override
  List<PurchaseOrderDetail>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final PettyCashType? pettyCashType;

  @override
  String toString() {
    return 'PettyCashState.initial(purchaseOrder: $purchaseOrder, vehicleRent: $vehicleRent, details: $details, pettyCashType: $pettyCashType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder) &&
            (identical(other.vehicleRent, vehicleRent) ||
                other.vehicleRent == vehicleRent) &&
            const DeepCollectionEquality().equals(other._details, _details) &&
            (identical(other.pettyCashType, pettyCashType) ||
                other.pettyCashType == pettyCashType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, purchaseOrder, vehicleRent,
      const DeepCollectionEquality().hash(_details), pettyCashType);

  /// Create a copy of PettyCashState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            List<PurchaseOrderDetail>? details,
            PettyCashType? pettyCashType)
        initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return initial(purchaseOrder, vehicleRent, details, pettyCashType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseOrder? purchaseOrder, VehicleRent? vehicleRent,
            List<PurchaseOrderDetail>? details, PettyCashType? pettyCashType)?
        initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call(purchaseOrder, vehicleRent, details, pettyCashType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseOrder? purchaseOrder, VehicleRent? vehicleRent,
            List<PurchaseOrderDetail>? details, PettyCashType? pettyCashType)?
        initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(purchaseOrder, vehicleRent, details, pettyCashType);
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

abstract class _Initial implements PettyCashState {
  const factory _Initial(
      {final PurchaseOrder? purchaseOrder,
      final VehicleRent? vehicleRent,
      final List<PurchaseOrderDetail>? details,
      final PettyCashType? pettyCashType}) = _$InitialImpl;

  PurchaseOrder? get purchaseOrder;
  VehicleRent? get vehicleRent;
  List<PurchaseOrderDetail>? get details;
  PettyCashType? get pettyCashType;

  /// Create a copy of PettyCashState
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
    extends _$PettyCashStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PettyCashState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'PettyCashState.loading()';
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
    required TResult Function(
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            List<PurchaseOrderDetail>? details,
            PettyCashType? pettyCashType)
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
    TResult? Function(PurchaseOrder? purchaseOrder, VehicleRent? vehicleRent,
            List<PurchaseOrderDetail>? details, PettyCashType? pettyCashType)?
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
    TResult Function(PurchaseOrder? purchaseOrder, VehicleRent? vehicleRent,
            List<PurchaseOrderDetail>? details, PettyCashType? pettyCashType)?
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

abstract class _Loading implements PettyCashState {
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
    extends _$PettyCashStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of PettyCashState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'PettyCashState.success()';
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
    required TResult Function(
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            List<PurchaseOrderDetail>? details,
            PettyCashType? pettyCashType)
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
    TResult? Function(PurchaseOrder? purchaseOrder, VehicleRent? vehicleRent,
            List<PurchaseOrderDetail>? details, PettyCashType? pettyCashType)?
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
    TResult Function(PurchaseOrder? purchaseOrder, VehicleRent? vehicleRent,
            List<PurchaseOrderDetail>? details, PettyCashType? pettyCashType)?
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

abstract class _Success implements PettyCashState {
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
    extends _$PettyCashStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of PettyCashState
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
    return 'PettyCashState.error(error: $error)';
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

  /// Create a copy of PettyCashState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            List<PurchaseOrderDetail>? details,
            PettyCashType? pettyCashType)
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
    TResult? Function(PurchaseOrder? purchaseOrder, VehicleRent? vehicleRent,
            List<PurchaseOrderDetail>? details, PettyCashType? pettyCashType)?
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
    TResult Function(PurchaseOrder? purchaseOrder, VehicleRent? vehicleRent,
            List<PurchaseOrderDetail>? details, PettyCashType? pettyCashType)?
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

abstract class _Error implements PettyCashState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of PettyCashState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PettyCashEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PettyCash pettyCash) initialize,
    required TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)
        createStep1FormType,
    required TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)
        createStep2FormDetails,
    required TResult Function() submit,
    required TResult Function() submitVehicleRent,
    required TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)
        realization,
    required TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)
        close,
    required TResult Function(PettyCash pettyCash, String recipient)
        approveManager,
    required TResult Function(PettyCash pettyCash, String reason) rejectManager,
    required TResult Function(PettyCash pettyCash) approveAccounting,
    required TResult Function(PettyCash pettyCash, String reason)
        rejectAccounting,
    required TResult Function(PettyCash pettyCash) approveFinance,
    required TResult Function(PettyCash pettyCash, String reason) rejectFinance,
    required TResult Function(PettyCash pettyCash) documentReceive,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PettyCash pettyCash)? initialize,
    TResult? Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult? Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult? Function()? submit,
    TResult? Function()? submitVehicleRent,
    TResult? Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult? Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult? Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult? Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult? Function(PettyCash pettyCash)? approveAccounting,
    TResult? Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult? Function(PettyCash pettyCash)? approveFinance,
    TResult? Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult? Function(PettyCash pettyCash)? documentReceive,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PettyCash pettyCash)? initialize,
    TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult Function()? submit,
    TResult Function()? submitVehicleRent,
    TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult Function(PettyCash pettyCash)? approveAccounting,
    TResult Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult Function(PettyCash pettyCash)? approveFinance,
    TResult Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult Function(PettyCash pettyCash)? documentReceive,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateStep1FormMaterialRequest value)
        createStep1FormType,
    required TResult Function(_CreateStep2FormDetails value)
        createStep2FormDetails,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitVehicleRent value) submitVehicleRent,
    required TResult Function(_Realization value) realization,
    required TResult Function(_Close value) close,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveAccounting value) approveAccounting,
    required TResult Function(_RejectAccounting value) rejectAccounting,
    required TResult Function(_ApproveFinance value) approveFinance,
    required TResult Function(_RejectFinance value) rejectFinance,
    required TResult Function(_DocumentReceive value) documentReceive,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult? Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult? Function(_Realization value)? realization,
    TResult? Function(_Close value)? close,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveAccounting value)? approveAccounting,
    TResult? Function(_RejectAccounting value)? rejectAccounting,
    TResult? Function(_ApproveFinance value)? approveFinance,
    TResult? Function(_RejectFinance value)? rejectFinance,
    TResult? Function(_DocumentReceive value)? documentReceive,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult Function(_Realization value)? realization,
    TResult Function(_Close value)? close,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveAccounting value)? approveAccounting,
    TResult Function(_RejectAccounting value)? rejectAccounting,
    TResult Function(_ApproveFinance value)? approveFinance,
    TResult Function(_RejectFinance value)? rejectFinance,
    TResult Function(_DocumentReceive value)? documentReceive,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PettyCashEventCopyWith<$Res> {
  factory $PettyCashEventCopyWith(
          PettyCashEvent value, $Res Function(PettyCashEvent) then) =
      _$PettyCashEventCopyWithImpl<$Res, PettyCashEvent>;
}

/// @nodoc
class _$PettyCashEventCopyWithImpl<$Res, $Val extends PettyCashEvent>
    implements $PettyCashEventCopyWith<$Res> {
  _$PettyCashEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PettyCash pettyCash});

  $PettyCashCopyWith<$Res> get pettyCash;
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$PettyCashEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pettyCash = null,
  }) {
    return _then(_$InitializeImpl(
      null == pettyCash
          ? _value.pettyCash
          : pettyCash // ignore: cast_nullable_to_non_nullable
              as PettyCash,
    ));
  }

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PettyCashCopyWith<$Res> get pettyCash {
    return $PettyCashCopyWith<$Res>(_value.pettyCash, (value) {
      return _then(_value.copyWith(pettyCash: value));
    });
  }
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl(this.pettyCash);

  @override
  final PettyCash pettyCash;

  @override
  String toString() {
    return 'PettyCashEvent.initialize(pettyCash: $pettyCash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.pettyCash, pettyCash) ||
                other.pettyCash == pettyCash));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pettyCash);

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PettyCash pettyCash) initialize,
    required TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)
        createStep1FormType,
    required TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)
        createStep2FormDetails,
    required TResult Function() submit,
    required TResult Function() submitVehicleRent,
    required TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)
        realization,
    required TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)
        close,
    required TResult Function(PettyCash pettyCash, String recipient)
        approveManager,
    required TResult Function(PettyCash pettyCash, String reason) rejectManager,
    required TResult Function(PettyCash pettyCash) approveAccounting,
    required TResult Function(PettyCash pettyCash, String reason)
        rejectAccounting,
    required TResult Function(PettyCash pettyCash) approveFinance,
    required TResult Function(PettyCash pettyCash, String reason) rejectFinance,
    required TResult Function(PettyCash pettyCash) documentReceive,
  }) {
    return initialize(pettyCash);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PettyCash pettyCash)? initialize,
    TResult? Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult? Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult? Function()? submit,
    TResult? Function()? submitVehicleRent,
    TResult? Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult? Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult? Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult? Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult? Function(PettyCash pettyCash)? approveAccounting,
    TResult? Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult? Function(PettyCash pettyCash)? approveFinance,
    TResult? Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult? Function(PettyCash pettyCash)? documentReceive,
  }) {
    return initialize?.call(pettyCash);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PettyCash pettyCash)? initialize,
    TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult Function()? submit,
    TResult Function()? submitVehicleRent,
    TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult Function(PettyCash pettyCash)? approveAccounting,
    TResult Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult Function(PettyCash pettyCash)? approveFinance,
    TResult Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult Function(PettyCash pettyCash)? documentReceive,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(pettyCash);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateStep1FormMaterialRequest value)
        createStep1FormType,
    required TResult Function(_CreateStep2FormDetails value)
        createStep2FormDetails,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitVehicleRent value) submitVehicleRent,
    required TResult Function(_Realization value) realization,
    required TResult Function(_Close value) close,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveAccounting value) approveAccounting,
    required TResult Function(_RejectAccounting value) rejectAccounting,
    required TResult Function(_ApproveFinance value) approveFinance,
    required TResult Function(_RejectFinance value) rejectFinance,
    required TResult Function(_DocumentReceive value) documentReceive,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult? Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult? Function(_Realization value)? realization,
    TResult? Function(_Close value)? close,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveAccounting value)? approveAccounting,
    TResult? Function(_RejectAccounting value)? rejectAccounting,
    TResult? Function(_ApproveFinance value)? approveFinance,
    TResult? Function(_RejectFinance value)? rejectFinance,
    TResult? Function(_DocumentReceive value)? documentReceive,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult Function(_Realization value)? realization,
    TResult Function(_Close value)? close,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveAccounting value)? approveAccounting,
    TResult Function(_RejectAccounting value)? rejectAccounting,
    TResult Function(_ApproveFinance value)? approveFinance,
    TResult Function(_RejectFinance value)? rejectFinance,
    TResult Function(_DocumentReceive value)? documentReceive,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements PettyCashEvent {
  const factory _Initialize(final PettyCash pettyCash) = _$InitializeImpl;

  PettyCash get pettyCash;

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateStep1FormMaterialRequestImplCopyWith<$Res> {
  factory _$$CreateStep1FormMaterialRequestImplCopyWith(
          _$CreateStep1FormMaterialRequestImpl value,
          $Res Function(_$CreateStep1FormMaterialRequestImpl) then) =
      __$$CreateStep1FormMaterialRequestImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {MaterialRequest? materialRequest,
      PurchaseOrder? purchaseOrder,
      VehicleRent? vehicleRent,
      PettyCashType pettyCashType});

  $MaterialRequestCopyWith<$Res>? get materialRequest;
  $PurchaseOrderCopyWith<$Res>? get purchaseOrder;
  $VehicleRentCopyWith<$Res>? get vehicleRent;
}

/// @nodoc
class __$$CreateStep1FormMaterialRequestImplCopyWithImpl<$Res>
    extends _$PettyCashEventCopyWithImpl<$Res,
        _$CreateStep1FormMaterialRequestImpl>
    implements _$$CreateStep1FormMaterialRequestImplCopyWith<$Res> {
  __$$CreateStep1FormMaterialRequestImplCopyWithImpl(
      _$CreateStep1FormMaterialRequestImpl _value,
      $Res Function(_$CreateStep1FormMaterialRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materialRequest = freezed,
    Object? purchaseOrder = freezed,
    Object? vehicleRent = freezed,
    Object? pettyCashType = null,
  }) {
    return _then(_$CreateStep1FormMaterialRequestImpl(
      freezed == materialRequest
          ? _value.materialRequest
          : materialRequest // ignore: cast_nullable_to_non_nullable
              as MaterialRequest?,
      freezed == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder?,
      freezed == vehicleRent
          ? _value.vehicleRent
          : vehicleRent // ignore: cast_nullable_to_non_nullable
              as VehicleRent?,
      null == pettyCashType
          ? _value.pettyCashType
          : pettyCashType // ignore: cast_nullable_to_non_nullable
              as PettyCashType,
    ));
  }

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialRequestCopyWith<$Res>? get materialRequest {
    if (_value.materialRequest == null) {
      return null;
    }

    return $MaterialRequestCopyWith<$Res>(_value.materialRequest!, (value) {
      return _then(_value.copyWith(materialRequest: value));
    });
  }

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PurchaseOrderCopyWith<$Res>? get purchaseOrder {
    if (_value.purchaseOrder == null) {
      return null;
    }

    return $PurchaseOrderCopyWith<$Res>(_value.purchaseOrder!, (value) {
      return _then(_value.copyWith(purchaseOrder: value));
    });
  }

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VehicleRentCopyWith<$Res>? get vehicleRent {
    if (_value.vehicleRent == null) {
      return null;
    }

    return $VehicleRentCopyWith<$Res>(_value.vehicleRent!, (value) {
      return _then(_value.copyWith(vehicleRent: value));
    });
  }
}

/// @nodoc

class _$CreateStep1FormMaterialRequestImpl
    implements _CreateStep1FormMaterialRequest {
  const _$CreateStep1FormMaterialRequestImpl(this.materialRequest,
      this.purchaseOrder, this.vehicleRent, this.pettyCashType);

  @override
  final MaterialRequest? materialRequest;
  @override
  final PurchaseOrder? purchaseOrder;
  @override
  final VehicleRent? vehicleRent;
  @override
  final PettyCashType pettyCashType;

  @override
  String toString() {
    return 'PettyCashEvent.createStep1FormType(materialRequest: $materialRequest, purchaseOrder: $purchaseOrder, vehicleRent: $vehicleRent, pettyCashType: $pettyCashType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateStep1FormMaterialRequestImpl &&
            (identical(other.materialRequest, materialRequest) ||
                other.materialRequest == materialRequest) &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder) &&
            (identical(other.vehicleRent, vehicleRent) ||
                other.vehicleRent == vehicleRent) &&
            (identical(other.pettyCashType, pettyCashType) ||
                other.pettyCashType == pettyCashType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, materialRequest, purchaseOrder, vehicleRent, pettyCashType);

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateStep1FormMaterialRequestImplCopyWith<
          _$CreateStep1FormMaterialRequestImpl>
      get copyWith => __$$CreateStep1FormMaterialRequestImplCopyWithImpl<
          _$CreateStep1FormMaterialRequestImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PettyCash pettyCash) initialize,
    required TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)
        createStep1FormType,
    required TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)
        createStep2FormDetails,
    required TResult Function() submit,
    required TResult Function() submitVehicleRent,
    required TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)
        realization,
    required TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)
        close,
    required TResult Function(PettyCash pettyCash, String recipient)
        approveManager,
    required TResult Function(PettyCash pettyCash, String reason) rejectManager,
    required TResult Function(PettyCash pettyCash) approveAccounting,
    required TResult Function(PettyCash pettyCash, String reason)
        rejectAccounting,
    required TResult Function(PettyCash pettyCash) approveFinance,
    required TResult Function(PettyCash pettyCash, String reason) rejectFinance,
    required TResult Function(PettyCash pettyCash) documentReceive,
  }) {
    return createStep1FormType(
        materialRequest, purchaseOrder, vehicleRent, pettyCashType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PettyCash pettyCash)? initialize,
    TResult? Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult? Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult? Function()? submit,
    TResult? Function()? submitVehicleRent,
    TResult? Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult? Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult? Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult? Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult? Function(PettyCash pettyCash)? approveAccounting,
    TResult? Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult? Function(PettyCash pettyCash)? approveFinance,
    TResult? Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult? Function(PettyCash pettyCash)? documentReceive,
  }) {
    return createStep1FormType?.call(
        materialRequest, purchaseOrder, vehicleRent, pettyCashType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PettyCash pettyCash)? initialize,
    TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult Function()? submit,
    TResult Function()? submitVehicleRent,
    TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult Function(PettyCash pettyCash)? approveAccounting,
    TResult Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult Function(PettyCash pettyCash)? approveFinance,
    TResult Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult Function(PettyCash pettyCash)? documentReceive,
    required TResult orElse(),
  }) {
    if (createStep1FormType != null) {
      return createStep1FormType(
          materialRequest, purchaseOrder, vehicleRent, pettyCashType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateStep1FormMaterialRequest value)
        createStep1FormType,
    required TResult Function(_CreateStep2FormDetails value)
        createStep2FormDetails,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitVehicleRent value) submitVehicleRent,
    required TResult Function(_Realization value) realization,
    required TResult Function(_Close value) close,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveAccounting value) approveAccounting,
    required TResult Function(_RejectAccounting value) rejectAccounting,
    required TResult Function(_ApproveFinance value) approveFinance,
    required TResult Function(_RejectFinance value) rejectFinance,
    required TResult Function(_DocumentReceive value) documentReceive,
  }) {
    return createStep1FormType(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult? Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult? Function(_Realization value)? realization,
    TResult? Function(_Close value)? close,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveAccounting value)? approveAccounting,
    TResult? Function(_RejectAccounting value)? rejectAccounting,
    TResult? Function(_ApproveFinance value)? approveFinance,
    TResult? Function(_RejectFinance value)? rejectFinance,
    TResult? Function(_DocumentReceive value)? documentReceive,
  }) {
    return createStep1FormType?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult Function(_Realization value)? realization,
    TResult Function(_Close value)? close,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveAccounting value)? approveAccounting,
    TResult Function(_RejectAccounting value)? rejectAccounting,
    TResult Function(_ApproveFinance value)? approveFinance,
    TResult Function(_RejectFinance value)? rejectFinance,
    TResult Function(_DocumentReceive value)? documentReceive,
    required TResult orElse(),
  }) {
    if (createStep1FormType != null) {
      return createStep1FormType(this);
    }
    return orElse();
  }
}

abstract class _CreateStep1FormMaterialRequest implements PettyCashEvent {
  const factory _CreateStep1FormMaterialRequest(
      final MaterialRequest? materialRequest,
      final PurchaseOrder? purchaseOrder,
      final VehicleRent? vehicleRent,
      final PettyCashType pettyCashType) = _$CreateStep1FormMaterialRequestImpl;

  MaterialRequest? get materialRequest;
  PurchaseOrder? get purchaseOrder;
  VehicleRent? get vehicleRent;
  PettyCashType get pettyCashType;

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateStep1FormMaterialRequestImplCopyWith<
          _$CreateStep1FormMaterialRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateStep2FormDetailsImplCopyWith<$Res> {
  factory _$$CreateStep2FormDetailsImplCopyWith(
          _$CreateStep2FormDetailsImpl value,
          $Res Function(_$CreateStep2FormDetailsImpl) then) =
      __$$CreateStep2FormDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PurchaseOrderDetail> details, double vehicleRentAmount});
}

/// @nodoc
class __$$CreateStep2FormDetailsImplCopyWithImpl<$Res>
    extends _$PettyCashEventCopyWithImpl<$Res, _$CreateStep2FormDetailsImpl>
    implements _$$CreateStep2FormDetailsImplCopyWith<$Res> {
  __$$CreateStep2FormDetailsImplCopyWithImpl(
      _$CreateStep2FormDetailsImpl _value,
      $Res Function(_$CreateStep2FormDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? details = null,
    Object? vehicleRentAmount = null,
  }) {
    return _then(_$CreateStep2FormDetailsImpl(
      null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<PurchaseOrderDetail>,
      null == vehicleRentAmount
          ? _value.vehicleRentAmount
          : vehicleRentAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$CreateStep2FormDetailsImpl implements _CreateStep2FormDetails {
  const _$CreateStep2FormDetailsImpl(
      final List<PurchaseOrderDetail> details, this.vehicleRentAmount)
      : _details = details;

  final List<PurchaseOrderDetail> _details;
  @override
  List<PurchaseOrderDetail> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  final double vehicleRentAmount;

  @override
  String toString() {
    return 'PettyCashEvent.createStep2FormDetails(details: $details, vehicleRentAmount: $vehicleRentAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateStep2FormDetailsImpl &&
            const DeepCollectionEquality().equals(other._details, _details) &&
            (identical(other.vehicleRentAmount, vehicleRentAmount) ||
                other.vehicleRentAmount == vehicleRentAmount));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_details), vehicleRentAmount);

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateStep2FormDetailsImplCopyWith<_$CreateStep2FormDetailsImpl>
      get copyWith => __$$CreateStep2FormDetailsImplCopyWithImpl<
          _$CreateStep2FormDetailsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PettyCash pettyCash) initialize,
    required TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)
        createStep1FormType,
    required TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)
        createStep2FormDetails,
    required TResult Function() submit,
    required TResult Function() submitVehicleRent,
    required TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)
        realization,
    required TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)
        close,
    required TResult Function(PettyCash pettyCash, String recipient)
        approveManager,
    required TResult Function(PettyCash pettyCash, String reason) rejectManager,
    required TResult Function(PettyCash pettyCash) approveAccounting,
    required TResult Function(PettyCash pettyCash, String reason)
        rejectAccounting,
    required TResult Function(PettyCash pettyCash) approveFinance,
    required TResult Function(PettyCash pettyCash, String reason) rejectFinance,
    required TResult Function(PettyCash pettyCash) documentReceive,
  }) {
    return createStep2FormDetails(details, vehicleRentAmount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PettyCash pettyCash)? initialize,
    TResult? Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult? Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult? Function()? submit,
    TResult? Function()? submitVehicleRent,
    TResult? Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult? Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult? Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult? Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult? Function(PettyCash pettyCash)? approveAccounting,
    TResult? Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult? Function(PettyCash pettyCash)? approveFinance,
    TResult? Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult? Function(PettyCash pettyCash)? documentReceive,
  }) {
    return createStep2FormDetails?.call(details, vehicleRentAmount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PettyCash pettyCash)? initialize,
    TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult Function()? submit,
    TResult Function()? submitVehicleRent,
    TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult Function(PettyCash pettyCash)? approveAccounting,
    TResult Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult Function(PettyCash pettyCash)? approveFinance,
    TResult Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult Function(PettyCash pettyCash)? documentReceive,
    required TResult orElse(),
  }) {
    if (createStep2FormDetails != null) {
      return createStep2FormDetails(details, vehicleRentAmount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateStep1FormMaterialRequest value)
        createStep1FormType,
    required TResult Function(_CreateStep2FormDetails value)
        createStep2FormDetails,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitVehicleRent value) submitVehicleRent,
    required TResult Function(_Realization value) realization,
    required TResult Function(_Close value) close,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveAccounting value) approveAccounting,
    required TResult Function(_RejectAccounting value) rejectAccounting,
    required TResult Function(_ApproveFinance value) approveFinance,
    required TResult Function(_RejectFinance value) rejectFinance,
    required TResult Function(_DocumentReceive value) documentReceive,
  }) {
    return createStep2FormDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult? Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult? Function(_Realization value)? realization,
    TResult? Function(_Close value)? close,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveAccounting value)? approveAccounting,
    TResult? Function(_RejectAccounting value)? rejectAccounting,
    TResult? Function(_ApproveFinance value)? approveFinance,
    TResult? Function(_RejectFinance value)? rejectFinance,
    TResult? Function(_DocumentReceive value)? documentReceive,
  }) {
    return createStep2FormDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult Function(_Realization value)? realization,
    TResult Function(_Close value)? close,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveAccounting value)? approveAccounting,
    TResult Function(_RejectAccounting value)? rejectAccounting,
    TResult Function(_ApproveFinance value)? approveFinance,
    TResult Function(_RejectFinance value)? rejectFinance,
    TResult Function(_DocumentReceive value)? documentReceive,
    required TResult orElse(),
  }) {
    if (createStep2FormDetails != null) {
      return createStep2FormDetails(this);
    }
    return orElse();
  }
}

abstract class _CreateStep2FormDetails implements PettyCashEvent {
  const factory _CreateStep2FormDetails(final List<PurchaseOrderDetail> details,
      final double vehicleRentAmount) = _$CreateStep2FormDetailsImpl;

  List<PurchaseOrderDetail> get details;
  double get vehicleRentAmount;

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateStep2FormDetailsImplCopyWith<_$CreateStep2FormDetailsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitImplCopyWith<$Res> {
  factory _$$SubmitImplCopyWith(
          _$SubmitImpl value, $Res Function(_$SubmitImpl) then) =
      __$$SubmitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubmitImplCopyWithImpl<$Res>
    extends _$PettyCashEventCopyWithImpl<$Res, _$SubmitImpl>
    implements _$$SubmitImplCopyWith<$Res> {
  __$$SubmitImplCopyWithImpl(
      _$SubmitImpl _value, $Res Function(_$SubmitImpl) _then)
      : super(_value, _then);

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SubmitImpl implements _Submit {
  const _$SubmitImpl();

  @override
  String toString() {
    return 'PettyCashEvent.submit()';
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
    required TResult Function(PettyCash pettyCash) initialize,
    required TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)
        createStep1FormType,
    required TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)
        createStep2FormDetails,
    required TResult Function() submit,
    required TResult Function() submitVehicleRent,
    required TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)
        realization,
    required TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)
        close,
    required TResult Function(PettyCash pettyCash, String recipient)
        approveManager,
    required TResult Function(PettyCash pettyCash, String reason) rejectManager,
    required TResult Function(PettyCash pettyCash) approveAccounting,
    required TResult Function(PettyCash pettyCash, String reason)
        rejectAccounting,
    required TResult Function(PettyCash pettyCash) approveFinance,
    required TResult Function(PettyCash pettyCash, String reason) rejectFinance,
    required TResult Function(PettyCash pettyCash) documentReceive,
  }) {
    return submit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PettyCash pettyCash)? initialize,
    TResult? Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult? Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult? Function()? submit,
    TResult? Function()? submitVehicleRent,
    TResult? Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult? Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult? Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult? Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult? Function(PettyCash pettyCash)? approveAccounting,
    TResult? Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult? Function(PettyCash pettyCash)? approveFinance,
    TResult? Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult? Function(PettyCash pettyCash)? documentReceive,
  }) {
    return submit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PettyCash pettyCash)? initialize,
    TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult Function()? submit,
    TResult Function()? submitVehicleRent,
    TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult Function(PettyCash pettyCash)? approveAccounting,
    TResult Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult Function(PettyCash pettyCash)? approveFinance,
    TResult Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult Function(PettyCash pettyCash)? documentReceive,
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
    required TResult Function(_CreateStep1FormMaterialRequest value)
        createStep1FormType,
    required TResult Function(_CreateStep2FormDetails value)
        createStep2FormDetails,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitVehicleRent value) submitVehicleRent,
    required TResult Function(_Realization value) realization,
    required TResult Function(_Close value) close,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveAccounting value) approveAccounting,
    required TResult Function(_RejectAccounting value) rejectAccounting,
    required TResult Function(_ApproveFinance value) approveFinance,
    required TResult Function(_RejectFinance value) rejectFinance,
    required TResult Function(_DocumentReceive value) documentReceive,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult? Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult? Function(_Realization value)? realization,
    TResult? Function(_Close value)? close,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveAccounting value)? approveAccounting,
    TResult? Function(_RejectAccounting value)? rejectAccounting,
    TResult? Function(_ApproveFinance value)? approveFinance,
    TResult? Function(_RejectFinance value)? rejectFinance,
    TResult? Function(_DocumentReceive value)? documentReceive,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult Function(_Realization value)? realization,
    TResult Function(_Close value)? close,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveAccounting value)? approveAccounting,
    TResult Function(_RejectAccounting value)? rejectAccounting,
    TResult Function(_ApproveFinance value)? approveFinance,
    TResult Function(_RejectFinance value)? rejectFinance,
    TResult Function(_DocumentReceive value)? documentReceive,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class _Submit implements PettyCashEvent {
  const factory _Submit() = _$SubmitImpl;
}

/// @nodoc
abstract class _$$SubmitVehicleRentImplCopyWith<$Res> {
  factory _$$SubmitVehicleRentImplCopyWith(_$SubmitVehicleRentImpl value,
          $Res Function(_$SubmitVehicleRentImpl) then) =
      __$$SubmitVehicleRentImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SubmitVehicleRentImplCopyWithImpl<$Res>
    extends _$PettyCashEventCopyWithImpl<$Res, _$SubmitVehicleRentImpl>
    implements _$$SubmitVehicleRentImplCopyWith<$Res> {
  __$$SubmitVehicleRentImplCopyWithImpl(_$SubmitVehicleRentImpl _value,
      $Res Function(_$SubmitVehicleRentImpl) _then)
      : super(_value, _then);

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SubmitVehicleRentImpl implements _SubmitVehicleRent {
  const _$SubmitVehicleRentImpl();

  @override
  String toString() {
    return 'PettyCashEvent.submitVehicleRent()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SubmitVehicleRentImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PettyCash pettyCash) initialize,
    required TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)
        createStep1FormType,
    required TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)
        createStep2FormDetails,
    required TResult Function() submit,
    required TResult Function() submitVehicleRent,
    required TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)
        realization,
    required TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)
        close,
    required TResult Function(PettyCash pettyCash, String recipient)
        approveManager,
    required TResult Function(PettyCash pettyCash, String reason) rejectManager,
    required TResult Function(PettyCash pettyCash) approveAccounting,
    required TResult Function(PettyCash pettyCash, String reason)
        rejectAccounting,
    required TResult Function(PettyCash pettyCash) approveFinance,
    required TResult Function(PettyCash pettyCash, String reason) rejectFinance,
    required TResult Function(PettyCash pettyCash) documentReceive,
  }) {
    return submitVehicleRent();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PettyCash pettyCash)? initialize,
    TResult? Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult? Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult? Function()? submit,
    TResult? Function()? submitVehicleRent,
    TResult? Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult? Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult? Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult? Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult? Function(PettyCash pettyCash)? approveAccounting,
    TResult? Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult? Function(PettyCash pettyCash)? approveFinance,
    TResult? Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult? Function(PettyCash pettyCash)? documentReceive,
  }) {
    return submitVehicleRent?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PettyCash pettyCash)? initialize,
    TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult Function()? submit,
    TResult Function()? submitVehicleRent,
    TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult Function(PettyCash pettyCash)? approveAccounting,
    TResult Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult Function(PettyCash pettyCash)? approveFinance,
    TResult Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult Function(PettyCash pettyCash)? documentReceive,
    required TResult orElse(),
  }) {
    if (submitVehicleRent != null) {
      return submitVehicleRent();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateStep1FormMaterialRequest value)
        createStep1FormType,
    required TResult Function(_CreateStep2FormDetails value)
        createStep2FormDetails,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitVehicleRent value) submitVehicleRent,
    required TResult Function(_Realization value) realization,
    required TResult Function(_Close value) close,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveAccounting value) approveAccounting,
    required TResult Function(_RejectAccounting value) rejectAccounting,
    required TResult Function(_ApproveFinance value) approveFinance,
    required TResult Function(_RejectFinance value) rejectFinance,
    required TResult Function(_DocumentReceive value) documentReceive,
  }) {
    return submitVehicleRent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult? Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult? Function(_Realization value)? realization,
    TResult? Function(_Close value)? close,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveAccounting value)? approveAccounting,
    TResult? Function(_RejectAccounting value)? rejectAccounting,
    TResult? Function(_ApproveFinance value)? approveFinance,
    TResult? Function(_RejectFinance value)? rejectFinance,
    TResult? Function(_DocumentReceive value)? documentReceive,
  }) {
    return submitVehicleRent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult Function(_Realization value)? realization,
    TResult Function(_Close value)? close,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveAccounting value)? approveAccounting,
    TResult Function(_RejectAccounting value)? rejectAccounting,
    TResult Function(_ApproveFinance value)? approveFinance,
    TResult Function(_RejectFinance value)? rejectFinance,
    TResult Function(_DocumentReceive value)? documentReceive,
    required TResult orElse(),
  }) {
    if (submitVehicleRent != null) {
      return submitVehicleRent(this);
    }
    return orElse();
  }
}

abstract class _SubmitVehicleRent implements PettyCashEvent {
  const factory _SubmitVehicleRent() = _$SubmitVehicleRentImpl;
}

/// @nodoc
abstract class _$$RealizationImplCopyWith<$Res> {
  factory _$$RealizationImplCopyWith(
          _$RealizationImpl value, $Res Function(_$RealizationImpl) then) =
      __$$RealizationImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PettyCash pettyCash,
      List<PettyCashDetail> details,
      Ppn ppn,
      Supplier supplier,
      double pphAmount,
      double discountAmount,
      double shippingCost,
      String recipient,
      double rounding,
      String? description});

  $PettyCashCopyWith<$Res> get pettyCash;
  $SupplierCopyWith<$Res> get supplier;
}

/// @nodoc
class __$$RealizationImplCopyWithImpl<$Res>
    extends _$PettyCashEventCopyWithImpl<$Res, _$RealizationImpl>
    implements _$$RealizationImplCopyWith<$Res> {
  __$$RealizationImplCopyWithImpl(
      _$RealizationImpl _value, $Res Function(_$RealizationImpl) _then)
      : super(_value, _then);

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pettyCash = null,
    Object? details = null,
    Object? ppn = null,
    Object? supplier = null,
    Object? pphAmount = null,
    Object? discountAmount = null,
    Object? shippingCost = null,
    Object? recipient = null,
    Object? rounding = null,
    Object? description = freezed,
  }) {
    return _then(_$RealizationImpl(
      pettyCash: null == pettyCash
          ? _value.pettyCash
          : pettyCash // ignore: cast_nullable_to_non_nullable
              as PettyCash,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<PettyCashDetail>,
      ppn: null == ppn
          ? _value.ppn
          : ppn // ignore: cast_nullable_to_non_nullable
              as Ppn,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier,
      pphAmount: null == pphAmount
          ? _value.pphAmount
          : pphAmount // ignore: cast_nullable_to_non_nullable
              as double,
      discountAmount: null == discountAmount
          ? _value.discountAmount
          : discountAmount // ignore: cast_nullable_to_non_nullable
              as double,
      shippingCost: null == shippingCost
          ? _value.shippingCost
          : shippingCost // ignore: cast_nullable_to_non_nullable
              as double,
      recipient: null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
      rounding: null == rounding
          ? _value.rounding
          : rounding // ignore: cast_nullable_to_non_nullable
              as double,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PettyCashCopyWith<$Res> get pettyCash {
    return $PettyCashCopyWith<$Res>(_value.pettyCash, (value) {
      return _then(_value.copyWith(pettyCash: value));
    });
  }

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SupplierCopyWith<$Res> get supplier {
    return $SupplierCopyWith<$Res>(_value.supplier, (value) {
      return _then(_value.copyWith(supplier: value));
    });
  }
}

/// @nodoc

class _$RealizationImpl implements _Realization {
  const _$RealizationImpl(
      {required this.pettyCash,
      required final List<PettyCashDetail> details,
      required this.ppn,
      required this.supplier,
      required this.pphAmount,
      required this.discountAmount,
      required this.shippingCost,
      required this.recipient,
      required this.rounding,
      required this.description})
      : _details = details;

  @override
  final PettyCash pettyCash;
  final List<PettyCashDetail> _details;
  @override
  List<PettyCashDetail> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  final Ppn ppn;
  @override
  final Supplier supplier;
  @override
  final double pphAmount;
  @override
  final double discountAmount;
  @override
  final double shippingCost;
  @override
  final String recipient;
  @override
  final double rounding;
  @override
  final String? description;

  @override
  String toString() {
    return 'PettyCashEvent.realization(pettyCash: $pettyCash, details: $details, ppn: $ppn, supplier: $supplier, pphAmount: $pphAmount, discountAmount: $discountAmount, shippingCost: $shippingCost, recipient: $recipient, rounding: $rounding, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RealizationImpl &&
            (identical(other.pettyCash, pettyCash) ||
                other.pettyCash == pettyCash) &&
            const DeepCollectionEquality().equals(other._details, _details) &&
            (identical(other.ppn, ppn) || other.ppn == ppn) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.pphAmount, pphAmount) ||
                other.pphAmount == pphAmount) &&
            (identical(other.discountAmount, discountAmount) ||
                other.discountAmount == discountAmount) &&
            (identical(other.shippingCost, shippingCost) ||
                other.shippingCost == shippingCost) &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient) &&
            (identical(other.rounding, rounding) ||
                other.rounding == rounding) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      pettyCash,
      const DeepCollectionEquality().hash(_details),
      ppn,
      supplier,
      pphAmount,
      discountAmount,
      shippingCost,
      recipient,
      rounding,
      description);

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RealizationImplCopyWith<_$RealizationImpl> get copyWith =>
      __$$RealizationImplCopyWithImpl<_$RealizationImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PettyCash pettyCash) initialize,
    required TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)
        createStep1FormType,
    required TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)
        createStep2FormDetails,
    required TResult Function() submit,
    required TResult Function() submitVehicleRent,
    required TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)
        realization,
    required TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)
        close,
    required TResult Function(PettyCash pettyCash, String recipient)
        approveManager,
    required TResult Function(PettyCash pettyCash, String reason) rejectManager,
    required TResult Function(PettyCash pettyCash) approveAccounting,
    required TResult Function(PettyCash pettyCash, String reason)
        rejectAccounting,
    required TResult Function(PettyCash pettyCash) approveFinance,
    required TResult Function(PettyCash pettyCash, String reason) rejectFinance,
    required TResult Function(PettyCash pettyCash) documentReceive,
  }) {
    return realization(pettyCash, details, ppn, supplier, pphAmount,
        discountAmount, shippingCost, recipient, rounding, description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PettyCash pettyCash)? initialize,
    TResult? Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult? Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult? Function()? submit,
    TResult? Function()? submitVehicleRent,
    TResult? Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult? Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult? Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult? Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult? Function(PettyCash pettyCash)? approveAccounting,
    TResult? Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult? Function(PettyCash pettyCash)? approveFinance,
    TResult? Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult? Function(PettyCash pettyCash)? documentReceive,
  }) {
    return realization?.call(pettyCash, details, ppn, supplier, pphAmount,
        discountAmount, shippingCost, recipient, rounding, description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PettyCash pettyCash)? initialize,
    TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult Function()? submit,
    TResult Function()? submitVehicleRent,
    TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult Function(PettyCash pettyCash)? approveAccounting,
    TResult Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult Function(PettyCash pettyCash)? approveFinance,
    TResult Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult Function(PettyCash pettyCash)? documentReceive,
    required TResult orElse(),
  }) {
    if (realization != null) {
      return realization(pettyCash, details, ppn, supplier, pphAmount,
          discountAmount, shippingCost, recipient, rounding, description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateStep1FormMaterialRequest value)
        createStep1FormType,
    required TResult Function(_CreateStep2FormDetails value)
        createStep2FormDetails,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitVehicleRent value) submitVehicleRent,
    required TResult Function(_Realization value) realization,
    required TResult Function(_Close value) close,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveAccounting value) approveAccounting,
    required TResult Function(_RejectAccounting value) rejectAccounting,
    required TResult Function(_ApproveFinance value) approveFinance,
    required TResult Function(_RejectFinance value) rejectFinance,
    required TResult Function(_DocumentReceive value) documentReceive,
  }) {
    return realization(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult? Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult? Function(_Realization value)? realization,
    TResult? Function(_Close value)? close,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveAccounting value)? approveAccounting,
    TResult? Function(_RejectAccounting value)? rejectAccounting,
    TResult? Function(_ApproveFinance value)? approveFinance,
    TResult? Function(_RejectFinance value)? rejectFinance,
    TResult? Function(_DocumentReceive value)? documentReceive,
  }) {
    return realization?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult Function(_Realization value)? realization,
    TResult Function(_Close value)? close,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveAccounting value)? approveAccounting,
    TResult Function(_RejectAccounting value)? rejectAccounting,
    TResult Function(_ApproveFinance value)? approveFinance,
    TResult Function(_RejectFinance value)? rejectFinance,
    TResult Function(_DocumentReceive value)? documentReceive,
    required TResult orElse(),
  }) {
    if (realization != null) {
      return realization(this);
    }
    return orElse();
  }
}

abstract class _Realization implements PettyCashEvent {
  const factory _Realization(
      {required final PettyCash pettyCash,
      required final List<PettyCashDetail> details,
      required final Ppn ppn,
      required final Supplier supplier,
      required final double pphAmount,
      required final double discountAmount,
      required final double shippingCost,
      required final String recipient,
      required final double rounding,
      required final String? description}) = _$RealizationImpl;

  PettyCash get pettyCash;
  List<PettyCashDetail> get details;
  Ppn get ppn;
  Supplier get supplier;
  double get pphAmount;
  double get discountAmount;
  double get shippingCost;
  String get recipient;
  double get rounding;
  String? get description;

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RealizationImplCopyWith<_$RealizationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CloseImplCopyWith<$Res> {
  factory _$$CloseImplCopyWith(
          _$CloseImpl value, $Res Function(_$CloseImpl) then) =
      __$$CloseImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PettyCash pettyCash,
      Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
      Map<PettyCashDetail, BudgetType> budgetTypes,
      Map<PettyCashDetail, TextEditingController> descriptions,
      Map<String, TextEditingController> headerDescriptions,
      Map<String, ChartOfAccountNumber> headerChartOfAccounts,
      Map<String, BudgetType?> headerBudgetType,
      Map<String, double> headerAmount});

  $PettyCashCopyWith<$Res> get pettyCash;
}

/// @nodoc
class __$$CloseImplCopyWithImpl<$Res>
    extends _$PettyCashEventCopyWithImpl<$Res, _$CloseImpl>
    implements _$$CloseImplCopyWith<$Res> {
  __$$CloseImplCopyWithImpl(
      _$CloseImpl _value, $Res Function(_$CloseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pettyCash = null,
    Object? chartOfAccounts = null,
    Object? budgetTypes = null,
    Object? descriptions = null,
    Object? headerDescriptions = null,
    Object? headerChartOfAccounts = null,
    Object? headerBudgetType = null,
    Object? headerAmount = null,
  }) {
    return _then(_$CloseImpl(
      pettyCash: null == pettyCash
          ? _value.pettyCash
          : pettyCash // ignore: cast_nullable_to_non_nullable
              as PettyCash,
      chartOfAccounts: null == chartOfAccounts
          ? _value._chartOfAccounts
          : chartOfAccounts // ignore: cast_nullable_to_non_nullable
              as Map<PettyCashDetail, ChartOfAccountNumber>,
      budgetTypes: null == budgetTypes
          ? _value._budgetTypes
          : budgetTypes // ignore: cast_nullable_to_non_nullable
              as Map<PettyCashDetail, BudgetType>,
      descriptions: null == descriptions
          ? _value._descriptions
          : descriptions // ignore: cast_nullable_to_non_nullable
              as Map<PettyCashDetail, TextEditingController>,
      headerDescriptions: null == headerDescriptions
          ? _value._headerDescriptions
          : headerDescriptions // ignore: cast_nullable_to_non_nullable
              as Map<String, TextEditingController>,
      headerChartOfAccounts: null == headerChartOfAccounts
          ? _value._headerChartOfAccounts
          : headerChartOfAccounts // ignore: cast_nullable_to_non_nullable
              as Map<String, ChartOfAccountNumber>,
      headerBudgetType: null == headerBudgetType
          ? _value._headerBudgetType
          : headerBudgetType // ignore: cast_nullable_to_non_nullable
              as Map<String, BudgetType?>,
      headerAmount: null == headerAmount
          ? _value._headerAmount
          : headerAmount // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PettyCashCopyWith<$Res> get pettyCash {
    return $PettyCashCopyWith<$Res>(_value.pettyCash, (value) {
      return _then(_value.copyWith(pettyCash: value));
    });
  }
}

/// @nodoc

class _$CloseImpl implements _Close {
  const _$CloseImpl(
      {required this.pettyCash,
      required final Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
      required final Map<PettyCashDetail, BudgetType> budgetTypes,
      required final Map<PettyCashDetail, TextEditingController> descriptions,
      required final Map<String, TextEditingController> headerDescriptions,
      required final Map<String, ChartOfAccountNumber> headerChartOfAccounts,
      required final Map<String, BudgetType?> headerBudgetType,
      required final Map<String, double> headerAmount})
      : _chartOfAccounts = chartOfAccounts,
        _budgetTypes = budgetTypes,
        _descriptions = descriptions,
        _headerDescriptions = headerDescriptions,
        _headerChartOfAccounts = headerChartOfAccounts,
        _headerBudgetType = headerBudgetType,
        _headerAmount = headerAmount;

  @override
  final PettyCash pettyCash;
  final Map<PettyCashDetail, ChartOfAccountNumber> _chartOfAccounts;
  @override
  Map<PettyCashDetail, ChartOfAccountNumber> get chartOfAccounts {
    if (_chartOfAccounts is EqualUnmodifiableMapView) return _chartOfAccounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_chartOfAccounts);
  }

  final Map<PettyCashDetail, BudgetType> _budgetTypes;
  @override
  Map<PettyCashDetail, BudgetType> get budgetTypes {
    if (_budgetTypes is EqualUnmodifiableMapView) return _budgetTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_budgetTypes);
  }

  final Map<PettyCashDetail, TextEditingController> _descriptions;
  @override
  Map<PettyCashDetail, TextEditingController> get descriptions {
    if (_descriptions is EqualUnmodifiableMapView) return _descriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_descriptions);
  }

  final Map<String, TextEditingController> _headerDescriptions;
  @override
  Map<String, TextEditingController> get headerDescriptions {
    if (_headerDescriptions is EqualUnmodifiableMapView)
      return _headerDescriptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_headerDescriptions);
  }

  final Map<String, ChartOfAccountNumber> _headerChartOfAccounts;
  @override
  Map<String, ChartOfAccountNumber> get headerChartOfAccounts {
    if (_headerChartOfAccounts is EqualUnmodifiableMapView)
      return _headerChartOfAccounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_headerChartOfAccounts);
  }

  final Map<String, BudgetType?> _headerBudgetType;
  @override
  Map<String, BudgetType?> get headerBudgetType {
    if (_headerBudgetType is EqualUnmodifiableMapView) return _headerBudgetType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_headerBudgetType);
  }

  final Map<String, double> _headerAmount;
  @override
  Map<String, double> get headerAmount {
    if (_headerAmount is EqualUnmodifiableMapView) return _headerAmount;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_headerAmount);
  }

  @override
  String toString() {
    return 'PettyCashEvent.close(pettyCash: $pettyCash, chartOfAccounts: $chartOfAccounts, budgetTypes: $budgetTypes, descriptions: $descriptions, headerDescriptions: $headerDescriptions, headerChartOfAccounts: $headerChartOfAccounts, headerBudgetType: $headerBudgetType, headerAmount: $headerAmount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CloseImpl &&
            (identical(other.pettyCash, pettyCash) ||
                other.pettyCash == pettyCash) &&
            const DeepCollectionEquality()
                .equals(other._chartOfAccounts, _chartOfAccounts) &&
            const DeepCollectionEquality()
                .equals(other._budgetTypes, _budgetTypes) &&
            const DeepCollectionEquality()
                .equals(other._descriptions, _descriptions) &&
            const DeepCollectionEquality()
                .equals(other._headerDescriptions, _headerDescriptions) &&
            const DeepCollectionEquality()
                .equals(other._headerChartOfAccounts, _headerChartOfAccounts) &&
            const DeepCollectionEquality()
                .equals(other._headerBudgetType, _headerBudgetType) &&
            const DeepCollectionEquality()
                .equals(other._headerAmount, _headerAmount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      pettyCash,
      const DeepCollectionEquality().hash(_chartOfAccounts),
      const DeepCollectionEquality().hash(_budgetTypes),
      const DeepCollectionEquality().hash(_descriptions),
      const DeepCollectionEquality().hash(_headerDescriptions),
      const DeepCollectionEquality().hash(_headerChartOfAccounts),
      const DeepCollectionEquality().hash(_headerBudgetType),
      const DeepCollectionEquality().hash(_headerAmount));

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CloseImplCopyWith<_$CloseImpl> get copyWith =>
      __$$CloseImplCopyWithImpl<_$CloseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PettyCash pettyCash) initialize,
    required TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)
        createStep1FormType,
    required TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)
        createStep2FormDetails,
    required TResult Function() submit,
    required TResult Function() submitVehicleRent,
    required TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)
        realization,
    required TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)
        close,
    required TResult Function(PettyCash pettyCash, String recipient)
        approveManager,
    required TResult Function(PettyCash pettyCash, String reason) rejectManager,
    required TResult Function(PettyCash pettyCash) approveAccounting,
    required TResult Function(PettyCash pettyCash, String reason)
        rejectAccounting,
    required TResult Function(PettyCash pettyCash) approveFinance,
    required TResult Function(PettyCash pettyCash, String reason) rejectFinance,
    required TResult Function(PettyCash pettyCash) documentReceive,
  }) {
    return close(
        pettyCash,
        chartOfAccounts,
        budgetTypes,
        descriptions,
        headerDescriptions,
        headerChartOfAccounts,
        headerBudgetType,
        headerAmount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PettyCash pettyCash)? initialize,
    TResult? Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult? Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult? Function()? submit,
    TResult? Function()? submitVehicleRent,
    TResult? Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult? Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult? Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult? Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult? Function(PettyCash pettyCash)? approveAccounting,
    TResult? Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult? Function(PettyCash pettyCash)? approveFinance,
    TResult? Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult? Function(PettyCash pettyCash)? documentReceive,
  }) {
    return close?.call(
        pettyCash,
        chartOfAccounts,
        budgetTypes,
        descriptions,
        headerDescriptions,
        headerChartOfAccounts,
        headerBudgetType,
        headerAmount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PettyCash pettyCash)? initialize,
    TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult Function()? submit,
    TResult Function()? submitVehicleRent,
    TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult Function(PettyCash pettyCash)? approveAccounting,
    TResult Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult Function(PettyCash pettyCash)? approveFinance,
    TResult Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult Function(PettyCash pettyCash)? documentReceive,
    required TResult orElse(),
  }) {
    if (close != null) {
      return close(
          pettyCash,
          chartOfAccounts,
          budgetTypes,
          descriptions,
          headerDescriptions,
          headerChartOfAccounts,
          headerBudgetType,
          headerAmount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateStep1FormMaterialRequest value)
        createStep1FormType,
    required TResult Function(_CreateStep2FormDetails value)
        createStep2FormDetails,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitVehicleRent value) submitVehicleRent,
    required TResult Function(_Realization value) realization,
    required TResult Function(_Close value) close,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveAccounting value) approveAccounting,
    required TResult Function(_RejectAccounting value) rejectAccounting,
    required TResult Function(_ApproveFinance value) approveFinance,
    required TResult Function(_RejectFinance value) rejectFinance,
    required TResult Function(_DocumentReceive value) documentReceive,
  }) {
    return close(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult? Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult? Function(_Realization value)? realization,
    TResult? Function(_Close value)? close,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveAccounting value)? approveAccounting,
    TResult? Function(_RejectAccounting value)? rejectAccounting,
    TResult? Function(_ApproveFinance value)? approveFinance,
    TResult? Function(_RejectFinance value)? rejectFinance,
    TResult? Function(_DocumentReceive value)? documentReceive,
  }) {
    return close?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult Function(_Realization value)? realization,
    TResult Function(_Close value)? close,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveAccounting value)? approveAccounting,
    TResult Function(_RejectAccounting value)? rejectAccounting,
    TResult Function(_ApproveFinance value)? approveFinance,
    TResult Function(_RejectFinance value)? rejectFinance,
    TResult Function(_DocumentReceive value)? documentReceive,
    required TResult orElse(),
  }) {
    if (close != null) {
      return close(this);
    }
    return orElse();
  }
}

abstract class _Close implements PettyCashEvent {
  const factory _Close(
      {required final PettyCash pettyCash,
      required final Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
      required final Map<PettyCashDetail, BudgetType> budgetTypes,
      required final Map<PettyCashDetail, TextEditingController> descriptions,
      required final Map<String, TextEditingController> headerDescriptions,
      required final Map<String, ChartOfAccountNumber> headerChartOfAccounts,
      required final Map<String, BudgetType?> headerBudgetType,
      required final Map<String, double> headerAmount}) = _$CloseImpl;

  PettyCash get pettyCash;
  Map<PettyCashDetail, ChartOfAccountNumber> get chartOfAccounts;
  Map<PettyCashDetail, BudgetType> get budgetTypes;
  Map<PettyCashDetail, TextEditingController> get descriptions;
  Map<String, TextEditingController> get headerDescriptions;
  Map<String, ChartOfAccountNumber> get headerChartOfAccounts;
  Map<String, BudgetType?> get headerBudgetType;
  Map<String, double> get headerAmount;

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CloseImplCopyWith<_$CloseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApproveManagerImplCopyWith<$Res> {
  factory _$$ApproveManagerImplCopyWith(_$ApproveManagerImpl value,
          $Res Function(_$ApproveManagerImpl) then) =
      __$$ApproveManagerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PettyCash pettyCash, String recipient});

  $PettyCashCopyWith<$Res> get pettyCash;
}

/// @nodoc
class __$$ApproveManagerImplCopyWithImpl<$Res>
    extends _$PettyCashEventCopyWithImpl<$Res, _$ApproveManagerImpl>
    implements _$$ApproveManagerImplCopyWith<$Res> {
  __$$ApproveManagerImplCopyWithImpl(
      _$ApproveManagerImpl _value, $Res Function(_$ApproveManagerImpl) _then)
      : super(_value, _then);

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pettyCash = null,
    Object? recipient = null,
  }) {
    return _then(_$ApproveManagerImpl(
      null == pettyCash
          ? _value.pettyCash
          : pettyCash // ignore: cast_nullable_to_non_nullable
              as PettyCash,
      null == recipient
          ? _value.recipient
          : recipient // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PettyCashCopyWith<$Res> get pettyCash {
    return $PettyCashCopyWith<$Res>(_value.pettyCash, (value) {
      return _then(_value.copyWith(pettyCash: value));
    });
  }
}

/// @nodoc

class _$ApproveManagerImpl implements _ApproveManager {
  const _$ApproveManagerImpl(this.pettyCash, this.recipient);

  @override
  final PettyCash pettyCash;
  @override
  final String recipient;

  @override
  String toString() {
    return 'PettyCashEvent.approveManager(pettyCash: $pettyCash, recipient: $recipient)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveManagerImpl &&
            (identical(other.pettyCash, pettyCash) ||
                other.pettyCash == pettyCash) &&
            (identical(other.recipient, recipient) ||
                other.recipient == recipient));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pettyCash, recipient);

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveManagerImplCopyWith<_$ApproveManagerImpl> get copyWith =>
      __$$ApproveManagerImplCopyWithImpl<_$ApproveManagerImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PettyCash pettyCash) initialize,
    required TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)
        createStep1FormType,
    required TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)
        createStep2FormDetails,
    required TResult Function() submit,
    required TResult Function() submitVehicleRent,
    required TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)
        realization,
    required TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)
        close,
    required TResult Function(PettyCash pettyCash, String recipient)
        approveManager,
    required TResult Function(PettyCash pettyCash, String reason) rejectManager,
    required TResult Function(PettyCash pettyCash) approveAccounting,
    required TResult Function(PettyCash pettyCash, String reason)
        rejectAccounting,
    required TResult Function(PettyCash pettyCash) approveFinance,
    required TResult Function(PettyCash pettyCash, String reason) rejectFinance,
    required TResult Function(PettyCash pettyCash) documentReceive,
  }) {
    return approveManager(pettyCash, recipient);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PettyCash pettyCash)? initialize,
    TResult? Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult? Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult? Function()? submit,
    TResult? Function()? submitVehicleRent,
    TResult? Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult? Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult? Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult? Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult? Function(PettyCash pettyCash)? approveAccounting,
    TResult? Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult? Function(PettyCash pettyCash)? approveFinance,
    TResult? Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult? Function(PettyCash pettyCash)? documentReceive,
  }) {
    return approveManager?.call(pettyCash, recipient);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PettyCash pettyCash)? initialize,
    TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult Function()? submit,
    TResult Function()? submitVehicleRent,
    TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult Function(PettyCash pettyCash)? approveAccounting,
    TResult Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult Function(PettyCash pettyCash)? approveFinance,
    TResult Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult Function(PettyCash pettyCash)? documentReceive,
    required TResult orElse(),
  }) {
    if (approveManager != null) {
      return approveManager(pettyCash, recipient);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateStep1FormMaterialRequest value)
        createStep1FormType,
    required TResult Function(_CreateStep2FormDetails value)
        createStep2FormDetails,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitVehicleRent value) submitVehicleRent,
    required TResult Function(_Realization value) realization,
    required TResult Function(_Close value) close,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveAccounting value) approveAccounting,
    required TResult Function(_RejectAccounting value) rejectAccounting,
    required TResult Function(_ApproveFinance value) approveFinance,
    required TResult Function(_RejectFinance value) rejectFinance,
    required TResult Function(_DocumentReceive value) documentReceive,
  }) {
    return approveManager(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult? Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult? Function(_Realization value)? realization,
    TResult? Function(_Close value)? close,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveAccounting value)? approveAccounting,
    TResult? Function(_RejectAccounting value)? rejectAccounting,
    TResult? Function(_ApproveFinance value)? approveFinance,
    TResult? Function(_RejectFinance value)? rejectFinance,
    TResult? Function(_DocumentReceive value)? documentReceive,
  }) {
    return approveManager?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult Function(_Realization value)? realization,
    TResult Function(_Close value)? close,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveAccounting value)? approveAccounting,
    TResult Function(_RejectAccounting value)? rejectAccounting,
    TResult Function(_ApproveFinance value)? approveFinance,
    TResult Function(_RejectFinance value)? rejectFinance,
    TResult Function(_DocumentReceive value)? documentReceive,
    required TResult orElse(),
  }) {
    if (approveManager != null) {
      return approveManager(this);
    }
    return orElse();
  }
}

abstract class _ApproveManager implements PettyCashEvent {
  const factory _ApproveManager(
      final PettyCash pettyCash, final String recipient) = _$ApproveManagerImpl;

  PettyCash get pettyCash;
  String get recipient;

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApproveManagerImplCopyWith<_$ApproveManagerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RejectManagerImplCopyWith<$Res> {
  factory _$$RejectManagerImplCopyWith(
          _$RejectManagerImpl value, $Res Function(_$RejectManagerImpl) then) =
      __$$RejectManagerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PettyCash pettyCash, String reason});

  $PettyCashCopyWith<$Res> get pettyCash;
}

/// @nodoc
class __$$RejectManagerImplCopyWithImpl<$Res>
    extends _$PettyCashEventCopyWithImpl<$Res, _$RejectManagerImpl>
    implements _$$RejectManagerImplCopyWith<$Res> {
  __$$RejectManagerImplCopyWithImpl(
      _$RejectManagerImpl _value, $Res Function(_$RejectManagerImpl) _then)
      : super(_value, _then);

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pettyCash = null,
    Object? reason = null,
  }) {
    return _then(_$RejectManagerImpl(
      null == pettyCash
          ? _value.pettyCash
          : pettyCash // ignore: cast_nullable_to_non_nullable
              as PettyCash,
      null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PettyCashCopyWith<$Res> get pettyCash {
    return $PettyCashCopyWith<$Res>(_value.pettyCash, (value) {
      return _then(_value.copyWith(pettyCash: value));
    });
  }
}

/// @nodoc

class _$RejectManagerImpl implements _RejectManager {
  const _$RejectManagerImpl(this.pettyCash, this.reason);

  @override
  final PettyCash pettyCash;
  @override
  final String reason;

  @override
  String toString() {
    return 'PettyCashEvent.rejectManager(pettyCash: $pettyCash, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectManagerImpl &&
            (identical(other.pettyCash, pettyCash) ||
                other.pettyCash == pettyCash) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pettyCash, reason);

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectManagerImplCopyWith<_$RejectManagerImpl> get copyWith =>
      __$$RejectManagerImplCopyWithImpl<_$RejectManagerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PettyCash pettyCash) initialize,
    required TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)
        createStep1FormType,
    required TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)
        createStep2FormDetails,
    required TResult Function() submit,
    required TResult Function() submitVehicleRent,
    required TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)
        realization,
    required TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)
        close,
    required TResult Function(PettyCash pettyCash, String recipient)
        approveManager,
    required TResult Function(PettyCash pettyCash, String reason) rejectManager,
    required TResult Function(PettyCash pettyCash) approveAccounting,
    required TResult Function(PettyCash pettyCash, String reason)
        rejectAccounting,
    required TResult Function(PettyCash pettyCash) approveFinance,
    required TResult Function(PettyCash pettyCash, String reason) rejectFinance,
    required TResult Function(PettyCash pettyCash) documentReceive,
  }) {
    return rejectManager(pettyCash, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PettyCash pettyCash)? initialize,
    TResult? Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult? Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult? Function()? submit,
    TResult? Function()? submitVehicleRent,
    TResult? Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult? Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult? Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult? Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult? Function(PettyCash pettyCash)? approveAccounting,
    TResult? Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult? Function(PettyCash pettyCash)? approveFinance,
    TResult? Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult? Function(PettyCash pettyCash)? documentReceive,
  }) {
    return rejectManager?.call(pettyCash, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PettyCash pettyCash)? initialize,
    TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult Function()? submit,
    TResult Function()? submitVehicleRent,
    TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult Function(PettyCash pettyCash)? approveAccounting,
    TResult Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult Function(PettyCash pettyCash)? approveFinance,
    TResult Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult Function(PettyCash pettyCash)? documentReceive,
    required TResult orElse(),
  }) {
    if (rejectManager != null) {
      return rejectManager(pettyCash, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateStep1FormMaterialRequest value)
        createStep1FormType,
    required TResult Function(_CreateStep2FormDetails value)
        createStep2FormDetails,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitVehicleRent value) submitVehicleRent,
    required TResult Function(_Realization value) realization,
    required TResult Function(_Close value) close,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveAccounting value) approveAccounting,
    required TResult Function(_RejectAccounting value) rejectAccounting,
    required TResult Function(_ApproveFinance value) approveFinance,
    required TResult Function(_RejectFinance value) rejectFinance,
    required TResult Function(_DocumentReceive value) documentReceive,
  }) {
    return rejectManager(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult? Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult? Function(_Realization value)? realization,
    TResult? Function(_Close value)? close,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveAccounting value)? approveAccounting,
    TResult? Function(_RejectAccounting value)? rejectAccounting,
    TResult? Function(_ApproveFinance value)? approveFinance,
    TResult? Function(_RejectFinance value)? rejectFinance,
    TResult? Function(_DocumentReceive value)? documentReceive,
  }) {
    return rejectManager?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult Function(_Realization value)? realization,
    TResult Function(_Close value)? close,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveAccounting value)? approveAccounting,
    TResult Function(_RejectAccounting value)? rejectAccounting,
    TResult Function(_ApproveFinance value)? approveFinance,
    TResult Function(_RejectFinance value)? rejectFinance,
    TResult Function(_DocumentReceive value)? documentReceive,
    required TResult orElse(),
  }) {
    if (rejectManager != null) {
      return rejectManager(this);
    }
    return orElse();
  }
}

abstract class _RejectManager implements PettyCashEvent {
  const factory _RejectManager(final PettyCash pettyCash, final String reason) =
      _$RejectManagerImpl;

  PettyCash get pettyCash;
  String get reason;

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RejectManagerImplCopyWith<_$RejectManagerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApproveAccountingImplCopyWith<$Res> {
  factory _$$ApproveAccountingImplCopyWith(_$ApproveAccountingImpl value,
          $Res Function(_$ApproveAccountingImpl) then) =
      __$$ApproveAccountingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PettyCash pettyCash});

  $PettyCashCopyWith<$Res> get pettyCash;
}

/// @nodoc
class __$$ApproveAccountingImplCopyWithImpl<$Res>
    extends _$PettyCashEventCopyWithImpl<$Res, _$ApproveAccountingImpl>
    implements _$$ApproveAccountingImplCopyWith<$Res> {
  __$$ApproveAccountingImplCopyWithImpl(_$ApproveAccountingImpl _value,
      $Res Function(_$ApproveAccountingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pettyCash = null,
  }) {
    return _then(_$ApproveAccountingImpl(
      null == pettyCash
          ? _value.pettyCash
          : pettyCash // ignore: cast_nullable_to_non_nullable
              as PettyCash,
    ));
  }

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PettyCashCopyWith<$Res> get pettyCash {
    return $PettyCashCopyWith<$Res>(_value.pettyCash, (value) {
      return _then(_value.copyWith(pettyCash: value));
    });
  }
}

/// @nodoc

class _$ApproveAccountingImpl implements _ApproveAccounting {
  const _$ApproveAccountingImpl(this.pettyCash);

  @override
  final PettyCash pettyCash;

  @override
  String toString() {
    return 'PettyCashEvent.approveAccounting(pettyCash: $pettyCash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveAccountingImpl &&
            (identical(other.pettyCash, pettyCash) ||
                other.pettyCash == pettyCash));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pettyCash);

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveAccountingImplCopyWith<_$ApproveAccountingImpl> get copyWith =>
      __$$ApproveAccountingImplCopyWithImpl<_$ApproveAccountingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PettyCash pettyCash) initialize,
    required TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)
        createStep1FormType,
    required TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)
        createStep2FormDetails,
    required TResult Function() submit,
    required TResult Function() submitVehicleRent,
    required TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)
        realization,
    required TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)
        close,
    required TResult Function(PettyCash pettyCash, String recipient)
        approveManager,
    required TResult Function(PettyCash pettyCash, String reason) rejectManager,
    required TResult Function(PettyCash pettyCash) approveAccounting,
    required TResult Function(PettyCash pettyCash, String reason)
        rejectAccounting,
    required TResult Function(PettyCash pettyCash) approveFinance,
    required TResult Function(PettyCash pettyCash, String reason) rejectFinance,
    required TResult Function(PettyCash pettyCash) documentReceive,
  }) {
    return approveAccounting(pettyCash);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PettyCash pettyCash)? initialize,
    TResult? Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult? Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult? Function()? submit,
    TResult? Function()? submitVehicleRent,
    TResult? Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult? Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult? Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult? Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult? Function(PettyCash pettyCash)? approveAccounting,
    TResult? Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult? Function(PettyCash pettyCash)? approveFinance,
    TResult? Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult? Function(PettyCash pettyCash)? documentReceive,
  }) {
    return approveAccounting?.call(pettyCash);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PettyCash pettyCash)? initialize,
    TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult Function()? submit,
    TResult Function()? submitVehicleRent,
    TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult Function(PettyCash pettyCash)? approveAccounting,
    TResult Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult Function(PettyCash pettyCash)? approveFinance,
    TResult Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult Function(PettyCash pettyCash)? documentReceive,
    required TResult orElse(),
  }) {
    if (approveAccounting != null) {
      return approveAccounting(pettyCash);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateStep1FormMaterialRequest value)
        createStep1FormType,
    required TResult Function(_CreateStep2FormDetails value)
        createStep2FormDetails,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitVehicleRent value) submitVehicleRent,
    required TResult Function(_Realization value) realization,
    required TResult Function(_Close value) close,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveAccounting value) approveAccounting,
    required TResult Function(_RejectAccounting value) rejectAccounting,
    required TResult Function(_ApproveFinance value) approveFinance,
    required TResult Function(_RejectFinance value) rejectFinance,
    required TResult Function(_DocumentReceive value) documentReceive,
  }) {
    return approveAccounting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult? Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult? Function(_Realization value)? realization,
    TResult? Function(_Close value)? close,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveAccounting value)? approveAccounting,
    TResult? Function(_RejectAccounting value)? rejectAccounting,
    TResult? Function(_ApproveFinance value)? approveFinance,
    TResult? Function(_RejectFinance value)? rejectFinance,
    TResult? Function(_DocumentReceive value)? documentReceive,
  }) {
    return approveAccounting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult Function(_Realization value)? realization,
    TResult Function(_Close value)? close,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveAccounting value)? approveAccounting,
    TResult Function(_RejectAccounting value)? rejectAccounting,
    TResult Function(_ApproveFinance value)? approveFinance,
    TResult Function(_RejectFinance value)? rejectFinance,
    TResult Function(_DocumentReceive value)? documentReceive,
    required TResult orElse(),
  }) {
    if (approveAccounting != null) {
      return approveAccounting(this);
    }
    return orElse();
  }
}

abstract class _ApproveAccounting implements PettyCashEvent {
  const factory _ApproveAccounting(final PettyCash pettyCash) =
      _$ApproveAccountingImpl;

  PettyCash get pettyCash;

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApproveAccountingImplCopyWith<_$ApproveAccountingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RejectAccountingImplCopyWith<$Res> {
  factory _$$RejectAccountingImplCopyWith(_$RejectAccountingImpl value,
          $Res Function(_$RejectAccountingImpl) then) =
      __$$RejectAccountingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PettyCash pettyCash, String reason});

  $PettyCashCopyWith<$Res> get pettyCash;
}

/// @nodoc
class __$$RejectAccountingImplCopyWithImpl<$Res>
    extends _$PettyCashEventCopyWithImpl<$Res, _$RejectAccountingImpl>
    implements _$$RejectAccountingImplCopyWith<$Res> {
  __$$RejectAccountingImplCopyWithImpl(_$RejectAccountingImpl _value,
      $Res Function(_$RejectAccountingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pettyCash = null,
    Object? reason = null,
  }) {
    return _then(_$RejectAccountingImpl(
      null == pettyCash
          ? _value.pettyCash
          : pettyCash // ignore: cast_nullable_to_non_nullable
              as PettyCash,
      null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PettyCashCopyWith<$Res> get pettyCash {
    return $PettyCashCopyWith<$Res>(_value.pettyCash, (value) {
      return _then(_value.copyWith(pettyCash: value));
    });
  }
}

/// @nodoc

class _$RejectAccountingImpl implements _RejectAccounting {
  const _$RejectAccountingImpl(this.pettyCash, this.reason);

  @override
  final PettyCash pettyCash;
  @override
  final String reason;

  @override
  String toString() {
    return 'PettyCashEvent.rejectAccounting(pettyCash: $pettyCash, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectAccountingImpl &&
            (identical(other.pettyCash, pettyCash) ||
                other.pettyCash == pettyCash) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pettyCash, reason);

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectAccountingImplCopyWith<_$RejectAccountingImpl> get copyWith =>
      __$$RejectAccountingImplCopyWithImpl<_$RejectAccountingImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PettyCash pettyCash) initialize,
    required TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)
        createStep1FormType,
    required TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)
        createStep2FormDetails,
    required TResult Function() submit,
    required TResult Function() submitVehicleRent,
    required TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)
        realization,
    required TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)
        close,
    required TResult Function(PettyCash pettyCash, String recipient)
        approveManager,
    required TResult Function(PettyCash pettyCash, String reason) rejectManager,
    required TResult Function(PettyCash pettyCash) approveAccounting,
    required TResult Function(PettyCash pettyCash, String reason)
        rejectAccounting,
    required TResult Function(PettyCash pettyCash) approveFinance,
    required TResult Function(PettyCash pettyCash, String reason) rejectFinance,
    required TResult Function(PettyCash pettyCash) documentReceive,
  }) {
    return rejectAccounting(pettyCash, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PettyCash pettyCash)? initialize,
    TResult? Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult? Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult? Function()? submit,
    TResult? Function()? submitVehicleRent,
    TResult? Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult? Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult? Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult? Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult? Function(PettyCash pettyCash)? approveAccounting,
    TResult? Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult? Function(PettyCash pettyCash)? approveFinance,
    TResult? Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult? Function(PettyCash pettyCash)? documentReceive,
  }) {
    return rejectAccounting?.call(pettyCash, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PettyCash pettyCash)? initialize,
    TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult Function()? submit,
    TResult Function()? submitVehicleRent,
    TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult Function(PettyCash pettyCash)? approveAccounting,
    TResult Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult Function(PettyCash pettyCash)? approveFinance,
    TResult Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult Function(PettyCash pettyCash)? documentReceive,
    required TResult orElse(),
  }) {
    if (rejectAccounting != null) {
      return rejectAccounting(pettyCash, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateStep1FormMaterialRequest value)
        createStep1FormType,
    required TResult Function(_CreateStep2FormDetails value)
        createStep2FormDetails,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitVehicleRent value) submitVehicleRent,
    required TResult Function(_Realization value) realization,
    required TResult Function(_Close value) close,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveAccounting value) approveAccounting,
    required TResult Function(_RejectAccounting value) rejectAccounting,
    required TResult Function(_ApproveFinance value) approveFinance,
    required TResult Function(_RejectFinance value) rejectFinance,
    required TResult Function(_DocumentReceive value) documentReceive,
  }) {
    return rejectAccounting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult? Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult? Function(_Realization value)? realization,
    TResult? Function(_Close value)? close,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveAccounting value)? approveAccounting,
    TResult? Function(_RejectAccounting value)? rejectAccounting,
    TResult? Function(_ApproveFinance value)? approveFinance,
    TResult? Function(_RejectFinance value)? rejectFinance,
    TResult? Function(_DocumentReceive value)? documentReceive,
  }) {
    return rejectAccounting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult Function(_Realization value)? realization,
    TResult Function(_Close value)? close,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveAccounting value)? approveAccounting,
    TResult Function(_RejectAccounting value)? rejectAccounting,
    TResult Function(_ApproveFinance value)? approveFinance,
    TResult Function(_RejectFinance value)? rejectFinance,
    TResult Function(_DocumentReceive value)? documentReceive,
    required TResult orElse(),
  }) {
    if (rejectAccounting != null) {
      return rejectAccounting(this);
    }
    return orElse();
  }
}

abstract class _RejectAccounting implements PettyCashEvent {
  const factory _RejectAccounting(
      final PettyCash pettyCash, final String reason) = _$RejectAccountingImpl;

  PettyCash get pettyCash;
  String get reason;

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RejectAccountingImplCopyWith<_$RejectAccountingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApproveFinanceImplCopyWith<$Res> {
  factory _$$ApproveFinanceImplCopyWith(_$ApproveFinanceImpl value,
          $Res Function(_$ApproveFinanceImpl) then) =
      __$$ApproveFinanceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PettyCash pettyCash});

  $PettyCashCopyWith<$Res> get pettyCash;
}

/// @nodoc
class __$$ApproveFinanceImplCopyWithImpl<$Res>
    extends _$PettyCashEventCopyWithImpl<$Res, _$ApproveFinanceImpl>
    implements _$$ApproveFinanceImplCopyWith<$Res> {
  __$$ApproveFinanceImplCopyWithImpl(
      _$ApproveFinanceImpl _value, $Res Function(_$ApproveFinanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pettyCash = null,
  }) {
    return _then(_$ApproveFinanceImpl(
      null == pettyCash
          ? _value.pettyCash
          : pettyCash // ignore: cast_nullable_to_non_nullable
              as PettyCash,
    ));
  }

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PettyCashCopyWith<$Res> get pettyCash {
    return $PettyCashCopyWith<$Res>(_value.pettyCash, (value) {
      return _then(_value.copyWith(pettyCash: value));
    });
  }
}

/// @nodoc

class _$ApproveFinanceImpl implements _ApproveFinance {
  const _$ApproveFinanceImpl(this.pettyCash);

  @override
  final PettyCash pettyCash;

  @override
  String toString() {
    return 'PettyCashEvent.approveFinance(pettyCash: $pettyCash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveFinanceImpl &&
            (identical(other.pettyCash, pettyCash) ||
                other.pettyCash == pettyCash));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pettyCash);

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveFinanceImplCopyWith<_$ApproveFinanceImpl> get copyWith =>
      __$$ApproveFinanceImplCopyWithImpl<_$ApproveFinanceImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PettyCash pettyCash) initialize,
    required TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)
        createStep1FormType,
    required TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)
        createStep2FormDetails,
    required TResult Function() submit,
    required TResult Function() submitVehicleRent,
    required TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)
        realization,
    required TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)
        close,
    required TResult Function(PettyCash pettyCash, String recipient)
        approveManager,
    required TResult Function(PettyCash pettyCash, String reason) rejectManager,
    required TResult Function(PettyCash pettyCash) approveAccounting,
    required TResult Function(PettyCash pettyCash, String reason)
        rejectAccounting,
    required TResult Function(PettyCash pettyCash) approveFinance,
    required TResult Function(PettyCash pettyCash, String reason) rejectFinance,
    required TResult Function(PettyCash pettyCash) documentReceive,
  }) {
    return approveFinance(pettyCash);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PettyCash pettyCash)? initialize,
    TResult? Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult? Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult? Function()? submit,
    TResult? Function()? submitVehicleRent,
    TResult? Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult? Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult? Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult? Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult? Function(PettyCash pettyCash)? approveAccounting,
    TResult? Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult? Function(PettyCash pettyCash)? approveFinance,
    TResult? Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult? Function(PettyCash pettyCash)? documentReceive,
  }) {
    return approveFinance?.call(pettyCash);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PettyCash pettyCash)? initialize,
    TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult Function()? submit,
    TResult Function()? submitVehicleRent,
    TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult Function(PettyCash pettyCash)? approveAccounting,
    TResult Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult Function(PettyCash pettyCash)? approveFinance,
    TResult Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult Function(PettyCash pettyCash)? documentReceive,
    required TResult orElse(),
  }) {
    if (approveFinance != null) {
      return approveFinance(pettyCash);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateStep1FormMaterialRequest value)
        createStep1FormType,
    required TResult Function(_CreateStep2FormDetails value)
        createStep2FormDetails,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitVehicleRent value) submitVehicleRent,
    required TResult Function(_Realization value) realization,
    required TResult Function(_Close value) close,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveAccounting value) approveAccounting,
    required TResult Function(_RejectAccounting value) rejectAccounting,
    required TResult Function(_ApproveFinance value) approveFinance,
    required TResult Function(_RejectFinance value) rejectFinance,
    required TResult Function(_DocumentReceive value) documentReceive,
  }) {
    return approveFinance(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult? Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult? Function(_Realization value)? realization,
    TResult? Function(_Close value)? close,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveAccounting value)? approveAccounting,
    TResult? Function(_RejectAccounting value)? rejectAccounting,
    TResult? Function(_ApproveFinance value)? approveFinance,
    TResult? Function(_RejectFinance value)? rejectFinance,
    TResult? Function(_DocumentReceive value)? documentReceive,
  }) {
    return approveFinance?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult Function(_Realization value)? realization,
    TResult Function(_Close value)? close,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveAccounting value)? approveAccounting,
    TResult Function(_RejectAccounting value)? rejectAccounting,
    TResult Function(_ApproveFinance value)? approveFinance,
    TResult Function(_RejectFinance value)? rejectFinance,
    TResult Function(_DocumentReceive value)? documentReceive,
    required TResult orElse(),
  }) {
    if (approveFinance != null) {
      return approveFinance(this);
    }
    return orElse();
  }
}

abstract class _ApproveFinance implements PettyCashEvent {
  const factory _ApproveFinance(final PettyCash pettyCash) =
      _$ApproveFinanceImpl;

  PettyCash get pettyCash;

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApproveFinanceImplCopyWith<_$ApproveFinanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RejectFinanceImplCopyWith<$Res> {
  factory _$$RejectFinanceImplCopyWith(
          _$RejectFinanceImpl value, $Res Function(_$RejectFinanceImpl) then) =
      __$$RejectFinanceImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PettyCash pettyCash, String reason});

  $PettyCashCopyWith<$Res> get pettyCash;
}

/// @nodoc
class __$$RejectFinanceImplCopyWithImpl<$Res>
    extends _$PettyCashEventCopyWithImpl<$Res, _$RejectFinanceImpl>
    implements _$$RejectFinanceImplCopyWith<$Res> {
  __$$RejectFinanceImplCopyWithImpl(
      _$RejectFinanceImpl _value, $Res Function(_$RejectFinanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pettyCash = null,
    Object? reason = null,
  }) {
    return _then(_$RejectFinanceImpl(
      null == pettyCash
          ? _value.pettyCash
          : pettyCash // ignore: cast_nullable_to_non_nullable
              as PettyCash,
      null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PettyCashCopyWith<$Res> get pettyCash {
    return $PettyCashCopyWith<$Res>(_value.pettyCash, (value) {
      return _then(_value.copyWith(pettyCash: value));
    });
  }
}

/// @nodoc

class _$RejectFinanceImpl implements _RejectFinance {
  const _$RejectFinanceImpl(this.pettyCash, this.reason);

  @override
  final PettyCash pettyCash;
  @override
  final String reason;

  @override
  String toString() {
    return 'PettyCashEvent.rejectFinance(pettyCash: $pettyCash, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectFinanceImpl &&
            (identical(other.pettyCash, pettyCash) ||
                other.pettyCash == pettyCash) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pettyCash, reason);

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectFinanceImplCopyWith<_$RejectFinanceImpl> get copyWith =>
      __$$RejectFinanceImplCopyWithImpl<_$RejectFinanceImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PettyCash pettyCash) initialize,
    required TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)
        createStep1FormType,
    required TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)
        createStep2FormDetails,
    required TResult Function() submit,
    required TResult Function() submitVehicleRent,
    required TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)
        realization,
    required TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)
        close,
    required TResult Function(PettyCash pettyCash, String recipient)
        approveManager,
    required TResult Function(PettyCash pettyCash, String reason) rejectManager,
    required TResult Function(PettyCash pettyCash) approveAccounting,
    required TResult Function(PettyCash pettyCash, String reason)
        rejectAccounting,
    required TResult Function(PettyCash pettyCash) approveFinance,
    required TResult Function(PettyCash pettyCash, String reason) rejectFinance,
    required TResult Function(PettyCash pettyCash) documentReceive,
  }) {
    return rejectFinance(pettyCash, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PettyCash pettyCash)? initialize,
    TResult? Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult? Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult? Function()? submit,
    TResult? Function()? submitVehicleRent,
    TResult? Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult? Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult? Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult? Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult? Function(PettyCash pettyCash)? approveAccounting,
    TResult? Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult? Function(PettyCash pettyCash)? approveFinance,
    TResult? Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult? Function(PettyCash pettyCash)? documentReceive,
  }) {
    return rejectFinance?.call(pettyCash, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PettyCash pettyCash)? initialize,
    TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult Function()? submit,
    TResult Function()? submitVehicleRent,
    TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult Function(PettyCash pettyCash)? approveAccounting,
    TResult Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult Function(PettyCash pettyCash)? approveFinance,
    TResult Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult Function(PettyCash pettyCash)? documentReceive,
    required TResult orElse(),
  }) {
    if (rejectFinance != null) {
      return rejectFinance(pettyCash, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateStep1FormMaterialRequest value)
        createStep1FormType,
    required TResult Function(_CreateStep2FormDetails value)
        createStep2FormDetails,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitVehicleRent value) submitVehicleRent,
    required TResult Function(_Realization value) realization,
    required TResult Function(_Close value) close,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveAccounting value) approveAccounting,
    required TResult Function(_RejectAccounting value) rejectAccounting,
    required TResult Function(_ApproveFinance value) approveFinance,
    required TResult Function(_RejectFinance value) rejectFinance,
    required TResult Function(_DocumentReceive value) documentReceive,
  }) {
    return rejectFinance(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult? Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult? Function(_Realization value)? realization,
    TResult? Function(_Close value)? close,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveAccounting value)? approveAccounting,
    TResult? Function(_RejectAccounting value)? rejectAccounting,
    TResult? Function(_ApproveFinance value)? approveFinance,
    TResult? Function(_RejectFinance value)? rejectFinance,
    TResult? Function(_DocumentReceive value)? documentReceive,
  }) {
    return rejectFinance?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult Function(_Realization value)? realization,
    TResult Function(_Close value)? close,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveAccounting value)? approveAccounting,
    TResult Function(_RejectAccounting value)? rejectAccounting,
    TResult Function(_ApproveFinance value)? approveFinance,
    TResult Function(_RejectFinance value)? rejectFinance,
    TResult Function(_DocumentReceive value)? documentReceive,
    required TResult orElse(),
  }) {
    if (rejectFinance != null) {
      return rejectFinance(this);
    }
    return orElse();
  }
}

abstract class _RejectFinance implements PettyCashEvent {
  const factory _RejectFinance(final PettyCash pettyCash, final String reason) =
      _$RejectFinanceImpl;

  PettyCash get pettyCash;
  String get reason;

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RejectFinanceImplCopyWith<_$RejectFinanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DocumentReceiveImplCopyWith<$Res> {
  factory _$$DocumentReceiveImplCopyWith(_$DocumentReceiveImpl value,
          $Res Function(_$DocumentReceiveImpl) then) =
      __$$DocumentReceiveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PettyCash pettyCash});

  $PettyCashCopyWith<$Res> get pettyCash;
}

/// @nodoc
class __$$DocumentReceiveImplCopyWithImpl<$Res>
    extends _$PettyCashEventCopyWithImpl<$Res, _$DocumentReceiveImpl>
    implements _$$DocumentReceiveImplCopyWith<$Res> {
  __$$DocumentReceiveImplCopyWithImpl(
      _$DocumentReceiveImpl _value, $Res Function(_$DocumentReceiveImpl) _then)
      : super(_value, _then);

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pettyCash = null,
  }) {
    return _then(_$DocumentReceiveImpl(
      null == pettyCash
          ? _value.pettyCash
          : pettyCash // ignore: cast_nullable_to_non_nullable
              as PettyCash,
    ));
  }

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PettyCashCopyWith<$Res> get pettyCash {
    return $PettyCashCopyWith<$Res>(_value.pettyCash, (value) {
      return _then(_value.copyWith(pettyCash: value));
    });
  }
}

/// @nodoc

class _$DocumentReceiveImpl implements _DocumentReceive {
  const _$DocumentReceiveImpl(this.pettyCash);

  @override
  final PettyCash pettyCash;

  @override
  String toString() {
    return 'PettyCashEvent.documentReceive(pettyCash: $pettyCash)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentReceiveImpl &&
            (identical(other.pettyCash, pettyCash) ||
                other.pettyCash == pettyCash));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pettyCash);

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentReceiveImplCopyWith<_$DocumentReceiveImpl> get copyWith =>
      __$$DocumentReceiveImplCopyWithImpl<_$DocumentReceiveImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PettyCash pettyCash) initialize,
    required TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)
        createStep1FormType,
    required TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)
        createStep2FormDetails,
    required TResult Function() submit,
    required TResult Function() submitVehicleRent,
    required TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)
        realization,
    required TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)
        close,
    required TResult Function(PettyCash pettyCash, String recipient)
        approveManager,
    required TResult Function(PettyCash pettyCash, String reason) rejectManager,
    required TResult Function(PettyCash pettyCash) approveAccounting,
    required TResult Function(PettyCash pettyCash, String reason)
        rejectAccounting,
    required TResult Function(PettyCash pettyCash) approveFinance,
    required TResult Function(PettyCash pettyCash, String reason) rejectFinance,
    required TResult Function(PettyCash pettyCash) documentReceive,
  }) {
    return documentReceive(pettyCash);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PettyCash pettyCash)? initialize,
    TResult? Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult? Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult? Function()? submit,
    TResult? Function()? submitVehicleRent,
    TResult? Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult? Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult? Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult? Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult? Function(PettyCash pettyCash)? approveAccounting,
    TResult? Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult? Function(PettyCash pettyCash)? approveFinance,
    TResult? Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult? Function(PettyCash pettyCash)? documentReceive,
  }) {
    return documentReceive?.call(pettyCash);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PettyCash pettyCash)? initialize,
    TResult Function(
            MaterialRequest? materialRequest,
            PurchaseOrder? purchaseOrder,
            VehicleRent? vehicleRent,
            PettyCashType pettyCashType)?
        createStep1FormType,
    TResult Function(
            List<PurchaseOrderDetail> details, double vehicleRentAmount)?
        createStep2FormDetails,
    TResult Function()? submit,
    TResult Function()? submitVehicleRent,
    TResult Function(
            PettyCash pettyCash,
            List<PettyCashDetail> details,
            Ppn ppn,
            Supplier supplier,
            double pphAmount,
            double discountAmount,
            double shippingCost,
            String recipient,
            double rounding,
            String? description)?
        realization,
    TResult Function(
            PettyCash pettyCash,
            Map<PettyCashDetail, ChartOfAccountNumber> chartOfAccounts,
            Map<PettyCashDetail, BudgetType> budgetTypes,
            Map<PettyCashDetail, TextEditingController> descriptions,
            Map<String, TextEditingController> headerDescriptions,
            Map<String, ChartOfAccountNumber> headerChartOfAccounts,
            Map<String, BudgetType?> headerBudgetType,
            Map<String, double> headerAmount)?
        close,
    TResult Function(PettyCash pettyCash, String recipient)? approveManager,
    TResult Function(PettyCash pettyCash, String reason)? rejectManager,
    TResult Function(PettyCash pettyCash)? approveAccounting,
    TResult Function(PettyCash pettyCash, String reason)? rejectAccounting,
    TResult Function(PettyCash pettyCash)? approveFinance,
    TResult Function(PettyCash pettyCash, String reason)? rejectFinance,
    TResult Function(PettyCash pettyCash)? documentReceive,
    required TResult orElse(),
  }) {
    if (documentReceive != null) {
      return documentReceive(pettyCash);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_CreateStep1FormMaterialRequest value)
        createStep1FormType,
    required TResult Function(_CreateStep2FormDetails value)
        createStep2FormDetails,
    required TResult Function(_Submit value) submit,
    required TResult Function(_SubmitVehicleRent value) submitVehicleRent,
    required TResult Function(_Realization value) realization,
    required TResult Function(_Close value) close,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveAccounting value) approveAccounting,
    required TResult Function(_RejectAccounting value) rejectAccounting,
    required TResult Function(_ApproveFinance value) approveFinance,
    required TResult Function(_RejectFinance value) rejectFinance,
    required TResult Function(_DocumentReceive value) documentReceive,
  }) {
    return documentReceive(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult? Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult? Function(_Realization value)? realization,
    TResult? Function(_Close value)? close,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveAccounting value)? approveAccounting,
    TResult? Function(_RejectAccounting value)? rejectAccounting,
    TResult? Function(_ApproveFinance value)? approveFinance,
    TResult? Function(_RejectFinance value)? rejectFinance,
    TResult? Function(_DocumentReceive value)? documentReceive,
  }) {
    return documentReceive?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_CreateStep1FormMaterialRequest value)?
        createStep1FormType,
    TResult Function(_CreateStep2FormDetails value)? createStep2FormDetails,
    TResult Function(_Submit value)? submit,
    TResult Function(_SubmitVehicleRent value)? submitVehicleRent,
    TResult Function(_Realization value)? realization,
    TResult Function(_Close value)? close,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveAccounting value)? approveAccounting,
    TResult Function(_RejectAccounting value)? rejectAccounting,
    TResult Function(_ApproveFinance value)? approveFinance,
    TResult Function(_RejectFinance value)? rejectFinance,
    TResult Function(_DocumentReceive value)? documentReceive,
    required TResult orElse(),
  }) {
    if (documentReceive != null) {
      return documentReceive(this);
    }
    return orElse();
  }
}

abstract class _DocumentReceive implements PettyCashEvent {
  const factory _DocumentReceive(final PettyCash pettyCash) =
      _$DocumentReceiveImpl;

  PettyCash get pettyCash;

  /// Create a copy of PettyCashEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentReceiveImplCopyWith<_$DocumentReceiveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
