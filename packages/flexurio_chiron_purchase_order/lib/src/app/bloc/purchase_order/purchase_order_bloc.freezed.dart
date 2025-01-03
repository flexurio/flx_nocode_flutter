// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_order_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PurchaseOrderState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PurchaseOrderFormSupplier? purchaseOrderFormSupplier,
            List<PurchaseOrderDetail>? materials,
            PurchaseOrderFormDiscount? purchaseOrderFormDiscount)
        initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PurchaseOrderFormSupplier? purchaseOrderFormSupplier,
            List<PurchaseOrderDetail>? materials,
            PurchaseOrderFormDiscount? purchaseOrderFormDiscount)?
        initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PurchaseOrderFormSupplier? purchaseOrderFormSupplier,
            List<PurchaseOrderDetail>? materials,
            PurchaseOrderFormDiscount? purchaseOrderFormDiscount)?
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
abstract class $PurchaseOrderStateCopyWith<$Res> {
  factory $PurchaseOrderStateCopyWith(
          PurchaseOrderState value, $Res Function(PurchaseOrderState) then) =
      _$PurchaseOrderStateCopyWithImpl<$Res, PurchaseOrderState>;
}

/// @nodoc
class _$PurchaseOrderStateCopyWithImpl<$Res, $Val extends PurchaseOrderState>
    implements $PurchaseOrderStateCopyWith<$Res> {
  _$PurchaseOrderStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseOrderState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PurchaseOrderFormSupplier? purchaseOrderFormSupplier,
      List<PurchaseOrderDetail>? materials,
      PurchaseOrderFormDiscount? purchaseOrderFormDiscount});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PurchaseOrderStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseOrderFormSupplier = freezed,
    Object? materials = freezed,
    Object? purchaseOrderFormDiscount = freezed,
  }) {
    return _then(_$InitialImpl(
      purchaseOrderFormSupplier: freezed == purchaseOrderFormSupplier
          ? _value.purchaseOrderFormSupplier
          : purchaseOrderFormSupplier // ignore: cast_nullable_to_non_nullable
              as PurchaseOrderFormSupplier?,
      materials: freezed == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<PurchaseOrderDetail>?,
      purchaseOrderFormDiscount: freezed == purchaseOrderFormDiscount
          ? _value.purchaseOrderFormDiscount
          : purchaseOrderFormDiscount // ignore: cast_nullable_to_non_nullable
              as PurchaseOrderFormDiscount?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.purchaseOrderFormSupplier,
      final List<PurchaseOrderDetail>? materials,
      this.purchaseOrderFormDiscount})
      : _materials = materials;

  @override
  final PurchaseOrderFormSupplier? purchaseOrderFormSupplier;
  final List<PurchaseOrderDetail>? _materials;
  @override
  List<PurchaseOrderDetail>? get materials {
    final value = _materials;
    if (value == null) return null;
    if (_materials is EqualUnmodifiableListView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final PurchaseOrderFormDiscount? purchaseOrderFormDiscount;

  @override
  String toString() {
    return 'PurchaseOrderState.initial(purchaseOrderFormSupplier: $purchaseOrderFormSupplier, materials: $materials, purchaseOrderFormDiscount: $purchaseOrderFormDiscount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.purchaseOrderFormSupplier,
                    purchaseOrderFormSupplier) ||
                other.purchaseOrderFormSupplier == purchaseOrderFormSupplier) &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials) &&
            (identical(other.purchaseOrderFormDiscount,
                    purchaseOrderFormDiscount) ||
                other.purchaseOrderFormDiscount == purchaseOrderFormDiscount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      purchaseOrderFormSupplier,
      const DeepCollectionEquality().hash(_materials),
      purchaseOrderFormDiscount);

  /// Create a copy of PurchaseOrderState
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
            PurchaseOrderFormSupplier? purchaseOrderFormSupplier,
            List<PurchaseOrderDetail>? materials,
            PurchaseOrderFormDiscount? purchaseOrderFormDiscount)
        initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return initial(
        purchaseOrderFormSupplier, materials, purchaseOrderFormDiscount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PurchaseOrderFormSupplier? purchaseOrderFormSupplier,
            List<PurchaseOrderDetail>? materials,
            PurchaseOrderFormDiscount? purchaseOrderFormDiscount)?
        initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call(
        purchaseOrderFormSupplier, materials, purchaseOrderFormDiscount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PurchaseOrderFormSupplier? purchaseOrderFormSupplier,
            List<PurchaseOrderDetail>? materials,
            PurchaseOrderFormDiscount? purchaseOrderFormDiscount)?
        initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(
          purchaseOrderFormSupplier, materials, purchaseOrderFormDiscount);
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

abstract class _Initial implements PurchaseOrderState {
  const factory _Initial(
          {final PurchaseOrderFormSupplier? purchaseOrderFormSupplier,
          final List<PurchaseOrderDetail>? materials,
          final PurchaseOrderFormDiscount? purchaseOrderFormDiscount}) =
      _$InitialImpl;

  PurchaseOrderFormSupplier? get purchaseOrderFormSupplier;
  List<PurchaseOrderDetail>? get materials;
  PurchaseOrderFormDiscount? get purchaseOrderFormDiscount;

  /// Create a copy of PurchaseOrderState
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
    extends _$PurchaseOrderStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'PurchaseOrderState.loading()';
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
            PurchaseOrderFormSupplier? purchaseOrderFormSupplier,
            List<PurchaseOrderDetail>? materials,
            PurchaseOrderFormDiscount? purchaseOrderFormDiscount)
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
    TResult? Function(
            PurchaseOrderFormSupplier? purchaseOrderFormSupplier,
            List<PurchaseOrderDetail>? materials,
            PurchaseOrderFormDiscount? purchaseOrderFormDiscount)?
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
    TResult Function(
            PurchaseOrderFormSupplier? purchaseOrderFormSupplier,
            List<PurchaseOrderDetail>? materials,
            PurchaseOrderFormDiscount? purchaseOrderFormDiscount)?
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

abstract class _Loading implements PurchaseOrderState {
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
    extends _$PurchaseOrderStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'PurchaseOrderState.success()';
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
            PurchaseOrderFormSupplier? purchaseOrderFormSupplier,
            List<PurchaseOrderDetail>? materials,
            PurchaseOrderFormDiscount? purchaseOrderFormDiscount)
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
    TResult? Function(
            PurchaseOrderFormSupplier? purchaseOrderFormSupplier,
            List<PurchaseOrderDetail>? materials,
            PurchaseOrderFormDiscount? purchaseOrderFormDiscount)?
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
    TResult Function(
            PurchaseOrderFormSupplier? purchaseOrderFormSupplier,
            List<PurchaseOrderDetail>? materials,
            PurchaseOrderFormDiscount? purchaseOrderFormDiscount)?
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

abstract class _Success implements PurchaseOrderState {
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
    extends _$PurchaseOrderStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderState
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
    return 'PurchaseOrderState.error(error: $error)';
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

  /// Create a copy of PurchaseOrderState
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
            PurchaseOrderFormSupplier? purchaseOrderFormSupplier,
            List<PurchaseOrderDetail>? materials,
            PurchaseOrderFormDiscount? purchaseOrderFormDiscount)
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
    TResult? Function(
            PurchaseOrderFormSupplier? purchaseOrderFormSupplier,
            List<PurchaseOrderDetail>? materials,
            PurchaseOrderFormDiscount? purchaseOrderFormDiscount)?
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
    TResult Function(
            PurchaseOrderFormSupplier? purchaseOrderFormSupplier,
            List<PurchaseOrderDetail>? materials,
            PurchaseOrderFormDiscount? purchaseOrderFormDiscount)?
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

abstract class _Error implements PurchaseOrderState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of PurchaseOrderState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PurchaseOrderEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseOrder purchaseOrder) initialize,
    required TResult Function(PurchaseOrderHistory purchaseOrderHistory)
        viewHistory,
    required TResult Function(
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        createFormSupplier,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        editFormSupplier,
    required TResult Function(List<PurchaseOrderDetail> materials)
        createFormMaterial,
    required TResult Function(
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        createFormDiscount,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        editFormDiscount,
    required TResult Function() submit,
    required TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)
        editDetails,
    required TResult Function(PurchaseOrder purchaseOrder) delete,
    required TResult Function(PurchaseOrder purchaseOrder) confirm,
    required TResult Function(PurchaseOrder purchaseOrder) undoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder) accountingConfirm,
    required TResult Function(PurchaseOrder purchaseOrder)
        accountingUndoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder, String reason)
        accountingReject,
    required TResult Function(PurchaseOrder purchaseOrder) close,
    required TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)
        uploadDocument,
    required TResult Function(PurchaseOrderDocument document) documentDelete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseOrder purchaseOrder)? initialize,
    TResult? Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult? Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult? Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult? Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult? Function()? submit,
    TResult? Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult? Function(PurchaseOrder purchaseOrder)? delete,
    TResult? Function(PurchaseOrder purchaseOrder)? confirm,
    TResult? Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult? Function(PurchaseOrder purchaseOrder)? close,
    TResult? Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult? Function(PurchaseOrderDocument document)? documentDelete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseOrder purchaseOrder)? initialize,
    TResult Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult Function()? submit,
    TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult Function(PurchaseOrder purchaseOrder)? delete,
    TResult Function(PurchaseOrder purchaseOrder)? confirm,
    TResult Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult Function(PurchaseOrder purchaseOrder)? close,
    TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult Function(PurchaseOrderDocument document)? documentDelete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ViewHistory value) viewHistory,
    required TResult Function(_CreateFormSupplier value) createFormSupplier,
    required TResult Function(_EditFormSupplier value) editFormSupplier,
    required TResult Function(_CreateFormMaterial value) createFormMaterial,
    required TResult Function(_CreateFormDiscount value) createFormDiscount,
    required TResult Function(_EditFormDiscount value) editFormDiscount,
    required TResult Function(_Submit value) submit,
    required TResult Function(_EditDetails value) editDetails,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_UndoConfirm value) undoConfirm,
    required TResult Function(_AccountingConfirm value) accountingConfirm,
    required TResult Function(_AccountingUndoConfirm value)
        accountingUndoConfirm,
    required TResult Function(_AccountingReject value) accountingReject,
    required TResult Function(_Close value) close,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ViewHistory value)? viewHistory,
    TResult? Function(_CreateFormSupplier value)? createFormSupplier,
    TResult? Function(_EditFormSupplier value)? editFormSupplier,
    TResult? Function(_CreateFormMaterial value)? createFormMaterial,
    TResult? Function(_CreateFormDiscount value)? createFormDiscount,
    TResult? Function(_EditFormDiscount value)? editFormDiscount,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_EditDetails value)? editDetails,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_UndoConfirm value)? undoConfirm,
    TResult? Function(_AccountingConfirm value)? accountingConfirm,
    TResult? Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult? Function(_AccountingReject value)? accountingReject,
    TResult? Function(_Close value)? close,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ViewHistory value)? viewHistory,
    TResult Function(_CreateFormSupplier value)? createFormSupplier,
    TResult Function(_EditFormSupplier value)? editFormSupplier,
    TResult Function(_CreateFormMaterial value)? createFormMaterial,
    TResult Function(_CreateFormDiscount value)? createFormDiscount,
    TResult Function(_EditFormDiscount value)? editFormDiscount,
    TResult Function(_Submit value)? submit,
    TResult Function(_EditDetails value)? editDetails,
    TResult Function(_Delete value)? delete,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_UndoConfirm value)? undoConfirm,
    TResult Function(_AccountingConfirm value)? accountingConfirm,
    TResult Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult Function(_AccountingReject value)? accountingReject,
    TResult Function(_Close value)? close,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseOrderEventCopyWith<$Res> {
  factory $PurchaseOrderEventCopyWith(
          PurchaseOrderEvent value, $Res Function(PurchaseOrderEvent) then) =
      _$PurchaseOrderEventCopyWithImpl<$Res, PurchaseOrderEvent>;
}

/// @nodoc
class _$PurchaseOrderEventCopyWithImpl<$Res, $Val extends PurchaseOrderEvent>
    implements $PurchaseOrderEventCopyWith<$Res> {
  _$PurchaseOrderEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PurchaseOrder purchaseOrder});

  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$PurchaseOrderEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseOrder = null,
  }) {
    return _then(_$InitializeImpl(
      null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
    ));
  }

  /// Create a copy of PurchaseOrderEvent
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

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl(this.purchaseOrder);

  @override
  final PurchaseOrder purchaseOrder;

  @override
  String toString() {
    return 'PurchaseOrderEvent.initialize(purchaseOrder: $purchaseOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializeImpl &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, purchaseOrder);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      __$$InitializeImplCopyWithImpl<_$InitializeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseOrder purchaseOrder) initialize,
    required TResult Function(PurchaseOrderHistory purchaseOrderHistory)
        viewHistory,
    required TResult Function(
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        createFormSupplier,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        editFormSupplier,
    required TResult Function(List<PurchaseOrderDetail> materials)
        createFormMaterial,
    required TResult Function(
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        createFormDiscount,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        editFormDiscount,
    required TResult Function() submit,
    required TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)
        editDetails,
    required TResult Function(PurchaseOrder purchaseOrder) delete,
    required TResult Function(PurchaseOrder purchaseOrder) confirm,
    required TResult Function(PurchaseOrder purchaseOrder) undoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder) accountingConfirm,
    required TResult Function(PurchaseOrder purchaseOrder)
        accountingUndoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder, String reason)
        accountingReject,
    required TResult Function(PurchaseOrder purchaseOrder) close,
    required TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)
        uploadDocument,
    required TResult Function(PurchaseOrderDocument document) documentDelete,
  }) {
    return initialize(purchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseOrder purchaseOrder)? initialize,
    TResult? Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult? Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult? Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult? Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult? Function()? submit,
    TResult? Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult? Function(PurchaseOrder purchaseOrder)? delete,
    TResult? Function(PurchaseOrder purchaseOrder)? confirm,
    TResult? Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult? Function(PurchaseOrder purchaseOrder)? close,
    TResult? Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult? Function(PurchaseOrderDocument document)? documentDelete,
  }) {
    return initialize?.call(purchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseOrder purchaseOrder)? initialize,
    TResult Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult Function()? submit,
    TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult Function(PurchaseOrder purchaseOrder)? delete,
    TResult Function(PurchaseOrder purchaseOrder)? confirm,
    TResult Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult Function(PurchaseOrder purchaseOrder)? close,
    TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult Function(PurchaseOrderDocument document)? documentDelete,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(purchaseOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ViewHistory value) viewHistory,
    required TResult Function(_CreateFormSupplier value) createFormSupplier,
    required TResult Function(_EditFormSupplier value) editFormSupplier,
    required TResult Function(_CreateFormMaterial value) createFormMaterial,
    required TResult Function(_CreateFormDiscount value) createFormDiscount,
    required TResult Function(_EditFormDiscount value) editFormDiscount,
    required TResult Function(_Submit value) submit,
    required TResult Function(_EditDetails value) editDetails,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_UndoConfirm value) undoConfirm,
    required TResult Function(_AccountingConfirm value) accountingConfirm,
    required TResult Function(_AccountingUndoConfirm value)
        accountingUndoConfirm,
    required TResult Function(_AccountingReject value) accountingReject,
    required TResult Function(_Close value) close,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ViewHistory value)? viewHistory,
    TResult? Function(_CreateFormSupplier value)? createFormSupplier,
    TResult? Function(_EditFormSupplier value)? editFormSupplier,
    TResult? Function(_CreateFormMaterial value)? createFormMaterial,
    TResult? Function(_CreateFormDiscount value)? createFormDiscount,
    TResult? Function(_EditFormDiscount value)? editFormDiscount,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_EditDetails value)? editDetails,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_UndoConfirm value)? undoConfirm,
    TResult? Function(_AccountingConfirm value)? accountingConfirm,
    TResult? Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult? Function(_AccountingReject value)? accountingReject,
    TResult? Function(_Close value)? close,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ViewHistory value)? viewHistory,
    TResult Function(_CreateFormSupplier value)? createFormSupplier,
    TResult Function(_EditFormSupplier value)? editFormSupplier,
    TResult Function(_CreateFormMaterial value)? createFormMaterial,
    TResult Function(_CreateFormDiscount value)? createFormDiscount,
    TResult Function(_EditFormDiscount value)? editFormDiscount,
    TResult Function(_Submit value)? submit,
    TResult Function(_EditDetails value)? editDetails,
    TResult Function(_Delete value)? delete,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_UndoConfirm value)? undoConfirm,
    TResult Function(_AccountingConfirm value)? accountingConfirm,
    TResult Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult Function(_AccountingReject value)? accountingReject,
    TResult Function(_Close value)? close,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements PurchaseOrderEvent {
  const factory _Initialize(final PurchaseOrder purchaseOrder) =
      _$InitializeImpl;

  PurchaseOrder get purchaseOrder;

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitializeImplCopyWith<_$InitializeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ViewHistoryImplCopyWith<$Res> {
  factory _$$ViewHistoryImplCopyWith(
          _$ViewHistoryImpl value, $Res Function(_$ViewHistoryImpl) then) =
      __$$ViewHistoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PurchaseOrderHistory purchaseOrderHistory});

  $PurchaseOrderHistoryCopyWith<$Res> get purchaseOrderHistory;
}

/// @nodoc
class __$$ViewHistoryImplCopyWithImpl<$Res>
    extends _$PurchaseOrderEventCopyWithImpl<$Res, _$ViewHistoryImpl>
    implements _$$ViewHistoryImplCopyWith<$Res> {
  __$$ViewHistoryImplCopyWithImpl(
      _$ViewHistoryImpl _value, $Res Function(_$ViewHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseOrderHistory = null,
  }) {
    return _then(_$ViewHistoryImpl(
      null == purchaseOrderHistory
          ? _value.purchaseOrderHistory
          : purchaseOrderHistory // ignore: cast_nullable_to_non_nullable
              as PurchaseOrderHistory,
    ));
  }

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PurchaseOrderHistoryCopyWith<$Res> get purchaseOrderHistory {
    return $PurchaseOrderHistoryCopyWith<$Res>(_value.purchaseOrderHistory,
        (value) {
      return _then(_value.copyWith(purchaseOrderHistory: value));
    });
  }
}

/// @nodoc

class _$ViewHistoryImpl implements _ViewHistory {
  const _$ViewHistoryImpl(this.purchaseOrderHistory);

  @override
  final PurchaseOrderHistory purchaseOrderHistory;

  @override
  String toString() {
    return 'PurchaseOrderEvent.viewHistory(purchaseOrderHistory: $purchaseOrderHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ViewHistoryImpl &&
            (identical(other.purchaseOrderHistory, purchaseOrderHistory) ||
                other.purchaseOrderHistory == purchaseOrderHistory));
  }

  @override
  int get hashCode => Object.hash(runtimeType, purchaseOrderHistory);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ViewHistoryImplCopyWith<_$ViewHistoryImpl> get copyWith =>
      __$$ViewHistoryImplCopyWithImpl<_$ViewHistoryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseOrder purchaseOrder) initialize,
    required TResult Function(PurchaseOrderHistory purchaseOrderHistory)
        viewHistory,
    required TResult Function(
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        createFormSupplier,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        editFormSupplier,
    required TResult Function(List<PurchaseOrderDetail> materials)
        createFormMaterial,
    required TResult Function(
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        createFormDiscount,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        editFormDiscount,
    required TResult Function() submit,
    required TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)
        editDetails,
    required TResult Function(PurchaseOrder purchaseOrder) delete,
    required TResult Function(PurchaseOrder purchaseOrder) confirm,
    required TResult Function(PurchaseOrder purchaseOrder) undoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder) accountingConfirm,
    required TResult Function(PurchaseOrder purchaseOrder)
        accountingUndoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder, String reason)
        accountingReject,
    required TResult Function(PurchaseOrder purchaseOrder) close,
    required TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)
        uploadDocument,
    required TResult Function(PurchaseOrderDocument document) documentDelete,
  }) {
    return viewHistory(purchaseOrderHistory);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseOrder purchaseOrder)? initialize,
    TResult? Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult? Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult? Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult? Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult? Function()? submit,
    TResult? Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult? Function(PurchaseOrder purchaseOrder)? delete,
    TResult? Function(PurchaseOrder purchaseOrder)? confirm,
    TResult? Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult? Function(PurchaseOrder purchaseOrder)? close,
    TResult? Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult? Function(PurchaseOrderDocument document)? documentDelete,
  }) {
    return viewHistory?.call(purchaseOrderHistory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseOrder purchaseOrder)? initialize,
    TResult Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult Function()? submit,
    TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult Function(PurchaseOrder purchaseOrder)? delete,
    TResult Function(PurchaseOrder purchaseOrder)? confirm,
    TResult Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult Function(PurchaseOrder purchaseOrder)? close,
    TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult Function(PurchaseOrderDocument document)? documentDelete,
    required TResult orElse(),
  }) {
    if (viewHistory != null) {
      return viewHistory(purchaseOrderHistory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ViewHistory value) viewHistory,
    required TResult Function(_CreateFormSupplier value) createFormSupplier,
    required TResult Function(_EditFormSupplier value) editFormSupplier,
    required TResult Function(_CreateFormMaterial value) createFormMaterial,
    required TResult Function(_CreateFormDiscount value) createFormDiscount,
    required TResult Function(_EditFormDiscount value) editFormDiscount,
    required TResult Function(_Submit value) submit,
    required TResult Function(_EditDetails value) editDetails,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_UndoConfirm value) undoConfirm,
    required TResult Function(_AccountingConfirm value) accountingConfirm,
    required TResult Function(_AccountingUndoConfirm value)
        accountingUndoConfirm,
    required TResult Function(_AccountingReject value) accountingReject,
    required TResult Function(_Close value) close,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) {
    return viewHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ViewHistory value)? viewHistory,
    TResult? Function(_CreateFormSupplier value)? createFormSupplier,
    TResult? Function(_EditFormSupplier value)? editFormSupplier,
    TResult? Function(_CreateFormMaterial value)? createFormMaterial,
    TResult? Function(_CreateFormDiscount value)? createFormDiscount,
    TResult? Function(_EditFormDiscount value)? editFormDiscount,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_EditDetails value)? editDetails,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_UndoConfirm value)? undoConfirm,
    TResult? Function(_AccountingConfirm value)? accountingConfirm,
    TResult? Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult? Function(_AccountingReject value)? accountingReject,
    TResult? Function(_Close value)? close,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) {
    return viewHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ViewHistory value)? viewHistory,
    TResult Function(_CreateFormSupplier value)? createFormSupplier,
    TResult Function(_EditFormSupplier value)? editFormSupplier,
    TResult Function(_CreateFormMaterial value)? createFormMaterial,
    TResult Function(_CreateFormDiscount value)? createFormDiscount,
    TResult Function(_EditFormDiscount value)? editFormDiscount,
    TResult Function(_Submit value)? submit,
    TResult Function(_EditDetails value)? editDetails,
    TResult Function(_Delete value)? delete,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_UndoConfirm value)? undoConfirm,
    TResult Function(_AccountingConfirm value)? accountingConfirm,
    TResult Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult Function(_AccountingReject value)? accountingReject,
    TResult Function(_Close value)? close,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) {
    if (viewHistory != null) {
      return viewHistory(this);
    }
    return orElse();
  }
}

abstract class _ViewHistory implements PurchaseOrderEvent {
  const factory _ViewHistory(final PurchaseOrderHistory purchaseOrderHistory) =
      _$ViewHistoryImpl;

  PurchaseOrderHistory get purchaseOrderHistory;

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ViewHistoryImplCopyWith<_$ViewHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateFormSupplierImplCopyWith<$Res> {
  factory _$$CreateFormSupplierImplCopyWith(_$CreateFormSupplierImpl value,
          $Res Function(_$CreateFormSupplierImpl) then) =
      __$$CreateFormSupplierImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PurchaseOrderFormSupplier purchaseOrderFormSupplier});
}

/// @nodoc
class __$$CreateFormSupplierImplCopyWithImpl<$Res>
    extends _$PurchaseOrderEventCopyWithImpl<$Res, _$CreateFormSupplierImpl>
    implements _$$CreateFormSupplierImplCopyWith<$Res> {
  __$$CreateFormSupplierImplCopyWithImpl(_$CreateFormSupplierImpl _value,
      $Res Function(_$CreateFormSupplierImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseOrderFormSupplier = null,
  }) {
    return _then(_$CreateFormSupplierImpl(
      null == purchaseOrderFormSupplier
          ? _value.purchaseOrderFormSupplier
          : purchaseOrderFormSupplier // ignore: cast_nullable_to_non_nullable
              as PurchaseOrderFormSupplier,
    ));
  }
}

/// @nodoc

class _$CreateFormSupplierImpl implements _CreateFormSupplier {
  const _$CreateFormSupplierImpl(this.purchaseOrderFormSupplier);

  @override
  final PurchaseOrderFormSupplier purchaseOrderFormSupplier;

  @override
  String toString() {
    return 'PurchaseOrderEvent.createFormSupplier(purchaseOrderFormSupplier: $purchaseOrderFormSupplier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFormSupplierImpl &&
            (identical(other.purchaseOrderFormSupplier,
                    purchaseOrderFormSupplier) ||
                other.purchaseOrderFormSupplier == purchaseOrderFormSupplier));
  }

  @override
  int get hashCode => Object.hash(runtimeType, purchaseOrderFormSupplier);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFormSupplierImplCopyWith<_$CreateFormSupplierImpl> get copyWith =>
      __$$CreateFormSupplierImplCopyWithImpl<_$CreateFormSupplierImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseOrder purchaseOrder) initialize,
    required TResult Function(PurchaseOrderHistory purchaseOrderHistory)
        viewHistory,
    required TResult Function(
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        createFormSupplier,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        editFormSupplier,
    required TResult Function(List<PurchaseOrderDetail> materials)
        createFormMaterial,
    required TResult Function(
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        createFormDiscount,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        editFormDiscount,
    required TResult Function() submit,
    required TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)
        editDetails,
    required TResult Function(PurchaseOrder purchaseOrder) delete,
    required TResult Function(PurchaseOrder purchaseOrder) confirm,
    required TResult Function(PurchaseOrder purchaseOrder) undoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder) accountingConfirm,
    required TResult Function(PurchaseOrder purchaseOrder)
        accountingUndoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder, String reason)
        accountingReject,
    required TResult Function(PurchaseOrder purchaseOrder) close,
    required TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)
        uploadDocument,
    required TResult Function(PurchaseOrderDocument document) documentDelete,
  }) {
    return createFormSupplier(purchaseOrderFormSupplier);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseOrder purchaseOrder)? initialize,
    TResult? Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult? Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult? Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult? Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult? Function()? submit,
    TResult? Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult? Function(PurchaseOrder purchaseOrder)? delete,
    TResult? Function(PurchaseOrder purchaseOrder)? confirm,
    TResult? Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult? Function(PurchaseOrder purchaseOrder)? close,
    TResult? Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult? Function(PurchaseOrderDocument document)? documentDelete,
  }) {
    return createFormSupplier?.call(purchaseOrderFormSupplier);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseOrder purchaseOrder)? initialize,
    TResult Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult Function()? submit,
    TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult Function(PurchaseOrder purchaseOrder)? delete,
    TResult Function(PurchaseOrder purchaseOrder)? confirm,
    TResult Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult Function(PurchaseOrder purchaseOrder)? close,
    TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult Function(PurchaseOrderDocument document)? documentDelete,
    required TResult orElse(),
  }) {
    if (createFormSupplier != null) {
      return createFormSupplier(purchaseOrderFormSupplier);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ViewHistory value) viewHistory,
    required TResult Function(_CreateFormSupplier value) createFormSupplier,
    required TResult Function(_EditFormSupplier value) editFormSupplier,
    required TResult Function(_CreateFormMaterial value) createFormMaterial,
    required TResult Function(_CreateFormDiscount value) createFormDiscount,
    required TResult Function(_EditFormDiscount value) editFormDiscount,
    required TResult Function(_Submit value) submit,
    required TResult Function(_EditDetails value) editDetails,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_UndoConfirm value) undoConfirm,
    required TResult Function(_AccountingConfirm value) accountingConfirm,
    required TResult Function(_AccountingUndoConfirm value)
        accountingUndoConfirm,
    required TResult Function(_AccountingReject value) accountingReject,
    required TResult Function(_Close value) close,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) {
    return createFormSupplier(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ViewHistory value)? viewHistory,
    TResult? Function(_CreateFormSupplier value)? createFormSupplier,
    TResult? Function(_EditFormSupplier value)? editFormSupplier,
    TResult? Function(_CreateFormMaterial value)? createFormMaterial,
    TResult? Function(_CreateFormDiscount value)? createFormDiscount,
    TResult? Function(_EditFormDiscount value)? editFormDiscount,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_EditDetails value)? editDetails,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_UndoConfirm value)? undoConfirm,
    TResult? Function(_AccountingConfirm value)? accountingConfirm,
    TResult? Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult? Function(_AccountingReject value)? accountingReject,
    TResult? Function(_Close value)? close,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) {
    return createFormSupplier?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ViewHistory value)? viewHistory,
    TResult Function(_CreateFormSupplier value)? createFormSupplier,
    TResult Function(_EditFormSupplier value)? editFormSupplier,
    TResult Function(_CreateFormMaterial value)? createFormMaterial,
    TResult Function(_CreateFormDiscount value)? createFormDiscount,
    TResult Function(_EditFormDiscount value)? editFormDiscount,
    TResult Function(_Submit value)? submit,
    TResult Function(_EditDetails value)? editDetails,
    TResult Function(_Delete value)? delete,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_UndoConfirm value)? undoConfirm,
    TResult Function(_AccountingConfirm value)? accountingConfirm,
    TResult Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult Function(_AccountingReject value)? accountingReject,
    TResult Function(_Close value)? close,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) {
    if (createFormSupplier != null) {
      return createFormSupplier(this);
    }
    return orElse();
  }
}

abstract class _CreateFormSupplier implements PurchaseOrderEvent {
  const factory _CreateFormSupplier(
          final PurchaseOrderFormSupplier purchaseOrderFormSupplier) =
      _$CreateFormSupplierImpl;

  PurchaseOrderFormSupplier get purchaseOrderFormSupplier;

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFormSupplierImplCopyWith<_$CreateFormSupplierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditFormSupplierImplCopyWith<$Res> {
  factory _$$EditFormSupplierImplCopyWith(_$EditFormSupplierImpl value,
          $Res Function(_$EditFormSupplierImpl) then) =
      __$$EditFormSupplierImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PurchaseOrder purchaseOrder,
      PurchaseOrderFormSupplier purchaseOrderFormSupplier});

  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
}

/// @nodoc
class __$$EditFormSupplierImplCopyWithImpl<$Res>
    extends _$PurchaseOrderEventCopyWithImpl<$Res, _$EditFormSupplierImpl>
    implements _$$EditFormSupplierImplCopyWith<$Res> {
  __$$EditFormSupplierImplCopyWithImpl(_$EditFormSupplierImpl _value,
      $Res Function(_$EditFormSupplierImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseOrder = null,
    Object? purchaseOrderFormSupplier = null,
  }) {
    return _then(_$EditFormSupplierImpl(
      null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
      null == purchaseOrderFormSupplier
          ? _value.purchaseOrderFormSupplier
          : purchaseOrderFormSupplier // ignore: cast_nullable_to_non_nullable
              as PurchaseOrderFormSupplier,
    ));
  }

  /// Create a copy of PurchaseOrderEvent
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

class _$EditFormSupplierImpl implements _EditFormSupplier {
  const _$EditFormSupplierImpl(
      this.purchaseOrder, this.purchaseOrderFormSupplier);

  @override
  final PurchaseOrder purchaseOrder;
  @override
  final PurchaseOrderFormSupplier purchaseOrderFormSupplier;

  @override
  String toString() {
    return 'PurchaseOrderEvent.editFormSupplier(purchaseOrder: $purchaseOrder, purchaseOrderFormSupplier: $purchaseOrderFormSupplier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditFormSupplierImpl &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder) &&
            (identical(other.purchaseOrderFormSupplier,
                    purchaseOrderFormSupplier) ||
                other.purchaseOrderFormSupplier == purchaseOrderFormSupplier));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, purchaseOrder, purchaseOrderFormSupplier);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditFormSupplierImplCopyWith<_$EditFormSupplierImpl> get copyWith =>
      __$$EditFormSupplierImplCopyWithImpl<_$EditFormSupplierImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseOrder purchaseOrder) initialize,
    required TResult Function(PurchaseOrderHistory purchaseOrderHistory)
        viewHistory,
    required TResult Function(
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        createFormSupplier,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        editFormSupplier,
    required TResult Function(List<PurchaseOrderDetail> materials)
        createFormMaterial,
    required TResult Function(
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        createFormDiscount,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        editFormDiscount,
    required TResult Function() submit,
    required TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)
        editDetails,
    required TResult Function(PurchaseOrder purchaseOrder) delete,
    required TResult Function(PurchaseOrder purchaseOrder) confirm,
    required TResult Function(PurchaseOrder purchaseOrder) undoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder) accountingConfirm,
    required TResult Function(PurchaseOrder purchaseOrder)
        accountingUndoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder, String reason)
        accountingReject,
    required TResult Function(PurchaseOrder purchaseOrder) close,
    required TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)
        uploadDocument,
    required TResult Function(PurchaseOrderDocument document) documentDelete,
  }) {
    return editFormSupplier(purchaseOrder, purchaseOrderFormSupplier);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseOrder purchaseOrder)? initialize,
    TResult? Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult? Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult? Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult? Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult? Function()? submit,
    TResult? Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult? Function(PurchaseOrder purchaseOrder)? delete,
    TResult? Function(PurchaseOrder purchaseOrder)? confirm,
    TResult? Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult? Function(PurchaseOrder purchaseOrder)? close,
    TResult? Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult? Function(PurchaseOrderDocument document)? documentDelete,
  }) {
    return editFormSupplier?.call(purchaseOrder, purchaseOrderFormSupplier);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseOrder purchaseOrder)? initialize,
    TResult Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult Function()? submit,
    TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult Function(PurchaseOrder purchaseOrder)? delete,
    TResult Function(PurchaseOrder purchaseOrder)? confirm,
    TResult Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult Function(PurchaseOrder purchaseOrder)? close,
    TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult Function(PurchaseOrderDocument document)? documentDelete,
    required TResult orElse(),
  }) {
    if (editFormSupplier != null) {
      return editFormSupplier(purchaseOrder, purchaseOrderFormSupplier);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ViewHistory value) viewHistory,
    required TResult Function(_CreateFormSupplier value) createFormSupplier,
    required TResult Function(_EditFormSupplier value) editFormSupplier,
    required TResult Function(_CreateFormMaterial value) createFormMaterial,
    required TResult Function(_CreateFormDiscount value) createFormDiscount,
    required TResult Function(_EditFormDiscount value) editFormDiscount,
    required TResult Function(_Submit value) submit,
    required TResult Function(_EditDetails value) editDetails,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_UndoConfirm value) undoConfirm,
    required TResult Function(_AccountingConfirm value) accountingConfirm,
    required TResult Function(_AccountingUndoConfirm value)
        accountingUndoConfirm,
    required TResult Function(_AccountingReject value) accountingReject,
    required TResult Function(_Close value) close,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) {
    return editFormSupplier(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ViewHistory value)? viewHistory,
    TResult? Function(_CreateFormSupplier value)? createFormSupplier,
    TResult? Function(_EditFormSupplier value)? editFormSupplier,
    TResult? Function(_CreateFormMaterial value)? createFormMaterial,
    TResult? Function(_CreateFormDiscount value)? createFormDiscount,
    TResult? Function(_EditFormDiscount value)? editFormDiscount,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_EditDetails value)? editDetails,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_UndoConfirm value)? undoConfirm,
    TResult? Function(_AccountingConfirm value)? accountingConfirm,
    TResult? Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult? Function(_AccountingReject value)? accountingReject,
    TResult? Function(_Close value)? close,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) {
    return editFormSupplier?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ViewHistory value)? viewHistory,
    TResult Function(_CreateFormSupplier value)? createFormSupplier,
    TResult Function(_EditFormSupplier value)? editFormSupplier,
    TResult Function(_CreateFormMaterial value)? createFormMaterial,
    TResult Function(_CreateFormDiscount value)? createFormDiscount,
    TResult Function(_EditFormDiscount value)? editFormDiscount,
    TResult Function(_Submit value)? submit,
    TResult Function(_EditDetails value)? editDetails,
    TResult Function(_Delete value)? delete,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_UndoConfirm value)? undoConfirm,
    TResult Function(_AccountingConfirm value)? accountingConfirm,
    TResult Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult Function(_AccountingReject value)? accountingReject,
    TResult Function(_Close value)? close,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) {
    if (editFormSupplier != null) {
      return editFormSupplier(this);
    }
    return orElse();
  }
}

abstract class _EditFormSupplier implements PurchaseOrderEvent {
  const factory _EditFormSupplier(final PurchaseOrder purchaseOrder,
          final PurchaseOrderFormSupplier purchaseOrderFormSupplier) =
      _$EditFormSupplierImpl;

  PurchaseOrder get purchaseOrder;
  PurchaseOrderFormSupplier get purchaseOrderFormSupplier;

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditFormSupplierImplCopyWith<_$EditFormSupplierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateFormMaterialImplCopyWith<$Res> {
  factory _$$CreateFormMaterialImplCopyWith(_$CreateFormMaterialImpl value,
          $Res Function(_$CreateFormMaterialImpl) then) =
      __$$CreateFormMaterialImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<PurchaseOrderDetail> materials});
}

/// @nodoc
class __$$CreateFormMaterialImplCopyWithImpl<$Res>
    extends _$PurchaseOrderEventCopyWithImpl<$Res, _$CreateFormMaterialImpl>
    implements _$$CreateFormMaterialImplCopyWith<$Res> {
  __$$CreateFormMaterialImplCopyWithImpl(_$CreateFormMaterialImpl _value,
      $Res Function(_$CreateFormMaterialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? materials = null,
  }) {
    return _then(_$CreateFormMaterialImpl(
      null == materials
          ? _value._materials
          : materials // ignore: cast_nullable_to_non_nullable
              as List<PurchaseOrderDetail>,
    ));
  }
}

/// @nodoc

class _$CreateFormMaterialImpl implements _CreateFormMaterial {
  const _$CreateFormMaterialImpl(final List<PurchaseOrderDetail> materials)
      : _materials = materials;

  final List<PurchaseOrderDetail> _materials;
  @override
  List<PurchaseOrderDetail> get materials {
    if (_materials is EqualUnmodifiableListView) return _materials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_materials);
  }

  @override
  String toString() {
    return 'PurchaseOrderEvent.createFormMaterial(materials: $materials)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFormMaterialImpl &&
            const DeepCollectionEquality()
                .equals(other._materials, _materials));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_materials));

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFormMaterialImplCopyWith<_$CreateFormMaterialImpl> get copyWith =>
      __$$CreateFormMaterialImplCopyWithImpl<_$CreateFormMaterialImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseOrder purchaseOrder) initialize,
    required TResult Function(PurchaseOrderHistory purchaseOrderHistory)
        viewHistory,
    required TResult Function(
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        createFormSupplier,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        editFormSupplier,
    required TResult Function(List<PurchaseOrderDetail> materials)
        createFormMaterial,
    required TResult Function(
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        createFormDiscount,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        editFormDiscount,
    required TResult Function() submit,
    required TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)
        editDetails,
    required TResult Function(PurchaseOrder purchaseOrder) delete,
    required TResult Function(PurchaseOrder purchaseOrder) confirm,
    required TResult Function(PurchaseOrder purchaseOrder) undoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder) accountingConfirm,
    required TResult Function(PurchaseOrder purchaseOrder)
        accountingUndoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder, String reason)
        accountingReject,
    required TResult Function(PurchaseOrder purchaseOrder) close,
    required TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)
        uploadDocument,
    required TResult Function(PurchaseOrderDocument document) documentDelete,
  }) {
    return createFormMaterial(materials);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseOrder purchaseOrder)? initialize,
    TResult? Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult? Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult? Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult? Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult? Function()? submit,
    TResult? Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult? Function(PurchaseOrder purchaseOrder)? delete,
    TResult? Function(PurchaseOrder purchaseOrder)? confirm,
    TResult? Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult? Function(PurchaseOrder purchaseOrder)? close,
    TResult? Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult? Function(PurchaseOrderDocument document)? documentDelete,
  }) {
    return createFormMaterial?.call(materials);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseOrder purchaseOrder)? initialize,
    TResult Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult Function()? submit,
    TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult Function(PurchaseOrder purchaseOrder)? delete,
    TResult Function(PurchaseOrder purchaseOrder)? confirm,
    TResult Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult Function(PurchaseOrder purchaseOrder)? close,
    TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult Function(PurchaseOrderDocument document)? documentDelete,
    required TResult orElse(),
  }) {
    if (createFormMaterial != null) {
      return createFormMaterial(materials);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ViewHistory value) viewHistory,
    required TResult Function(_CreateFormSupplier value) createFormSupplier,
    required TResult Function(_EditFormSupplier value) editFormSupplier,
    required TResult Function(_CreateFormMaterial value) createFormMaterial,
    required TResult Function(_CreateFormDiscount value) createFormDiscount,
    required TResult Function(_EditFormDiscount value) editFormDiscount,
    required TResult Function(_Submit value) submit,
    required TResult Function(_EditDetails value) editDetails,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_UndoConfirm value) undoConfirm,
    required TResult Function(_AccountingConfirm value) accountingConfirm,
    required TResult Function(_AccountingUndoConfirm value)
        accountingUndoConfirm,
    required TResult Function(_AccountingReject value) accountingReject,
    required TResult Function(_Close value) close,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) {
    return createFormMaterial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ViewHistory value)? viewHistory,
    TResult? Function(_CreateFormSupplier value)? createFormSupplier,
    TResult? Function(_EditFormSupplier value)? editFormSupplier,
    TResult? Function(_CreateFormMaterial value)? createFormMaterial,
    TResult? Function(_CreateFormDiscount value)? createFormDiscount,
    TResult? Function(_EditFormDiscount value)? editFormDiscount,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_EditDetails value)? editDetails,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_UndoConfirm value)? undoConfirm,
    TResult? Function(_AccountingConfirm value)? accountingConfirm,
    TResult? Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult? Function(_AccountingReject value)? accountingReject,
    TResult? Function(_Close value)? close,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) {
    return createFormMaterial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ViewHistory value)? viewHistory,
    TResult Function(_CreateFormSupplier value)? createFormSupplier,
    TResult Function(_EditFormSupplier value)? editFormSupplier,
    TResult Function(_CreateFormMaterial value)? createFormMaterial,
    TResult Function(_CreateFormDiscount value)? createFormDiscount,
    TResult Function(_EditFormDiscount value)? editFormDiscount,
    TResult Function(_Submit value)? submit,
    TResult Function(_EditDetails value)? editDetails,
    TResult Function(_Delete value)? delete,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_UndoConfirm value)? undoConfirm,
    TResult Function(_AccountingConfirm value)? accountingConfirm,
    TResult Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult Function(_AccountingReject value)? accountingReject,
    TResult Function(_Close value)? close,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) {
    if (createFormMaterial != null) {
      return createFormMaterial(this);
    }
    return orElse();
  }
}

abstract class _CreateFormMaterial implements PurchaseOrderEvent {
  const factory _CreateFormMaterial(final List<PurchaseOrderDetail> materials) =
      _$CreateFormMaterialImpl;

  List<PurchaseOrderDetail> get materials;

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFormMaterialImplCopyWith<_$CreateFormMaterialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateFormDiscountImplCopyWith<$Res> {
  factory _$$CreateFormDiscountImplCopyWith(_$CreateFormDiscountImpl value,
          $Res Function(_$CreateFormDiscountImpl) then) =
      __$$CreateFormDiscountImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PurchaseOrderFormDiscount purchaseOrderFormDiscount});
}

/// @nodoc
class __$$CreateFormDiscountImplCopyWithImpl<$Res>
    extends _$PurchaseOrderEventCopyWithImpl<$Res, _$CreateFormDiscountImpl>
    implements _$$CreateFormDiscountImplCopyWith<$Res> {
  __$$CreateFormDiscountImplCopyWithImpl(_$CreateFormDiscountImpl _value,
      $Res Function(_$CreateFormDiscountImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseOrderFormDiscount = null,
  }) {
    return _then(_$CreateFormDiscountImpl(
      null == purchaseOrderFormDiscount
          ? _value.purchaseOrderFormDiscount
          : purchaseOrderFormDiscount // ignore: cast_nullable_to_non_nullable
              as PurchaseOrderFormDiscount,
    ));
  }
}

/// @nodoc

class _$CreateFormDiscountImpl implements _CreateFormDiscount {
  const _$CreateFormDiscountImpl(this.purchaseOrderFormDiscount);

  @override
  final PurchaseOrderFormDiscount purchaseOrderFormDiscount;

  @override
  String toString() {
    return 'PurchaseOrderEvent.createFormDiscount(purchaseOrderFormDiscount: $purchaseOrderFormDiscount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateFormDiscountImpl &&
            (identical(other.purchaseOrderFormDiscount,
                    purchaseOrderFormDiscount) ||
                other.purchaseOrderFormDiscount == purchaseOrderFormDiscount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, purchaseOrderFormDiscount);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateFormDiscountImplCopyWith<_$CreateFormDiscountImpl> get copyWith =>
      __$$CreateFormDiscountImplCopyWithImpl<_$CreateFormDiscountImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseOrder purchaseOrder) initialize,
    required TResult Function(PurchaseOrderHistory purchaseOrderHistory)
        viewHistory,
    required TResult Function(
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        createFormSupplier,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        editFormSupplier,
    required TResult Function(List<PurchaseOrderDetail> materials)
        createFormMaterial,
    required TResult Function(
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        createFormDiscount,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        editFormDiscount,
    required TResult Function() submit,
    required TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)
        editDetails,
    required TResult Function(PurchaseOrder purchaseOrder) delete,
    required TResult Function(PurchaseOrder purchaseOrder) confirm,
    required TResult Function(PurchaseOrder purchaseOrder) undoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder) accountingConfirm,
    required TResult Function(PurchaseOrder purchaseOrder)
        accountingUndoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder, String reason)
        accountingReject,
    required TResult Function(PurchaseOrder purchaseOrder) close,
    required TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)
        uploadDocument,
    required TResult Function(PurchaseOrderDocument document) documentDelete,
  }) {
    return createFormDiscount(purchaseOrderFormDiscount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseOrder purchaseOrder)? initialize,
    TResult? Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult? Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult? Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult? Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult? Function()? submit,
    TResult? Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult? Function(PurchaseOrder purchaseOrder)? delete,
    TResult? Function(PurchaseOrder purchaseOrder)? confirm,
    TResult? Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult? Function(PurchaseOrder purchaseOrder)? close,
    TResult? Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult? Function(PurchaseOrderDocument document)? documentDelete,
  }) {
    return createFormDiscount?.call(purchaseOrderFormDiscount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseOrder purchaseOrder)? initialize,
    TResult Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult Function()? submit,
    TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult Function(PurchaseOrder purchaseOrder)? delete,
    TResult Function(PurchaseOrder purchaseOrder)? confirm,
    TResult Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult Function(PurchaseOrder purchaseOrder)? close,
    TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult Function(PurchaseOrderDocument document)? documentDelete,
    required TResult orElse(),
  }) {
    if (createFormDiscount != null) {
      return createFormDiscount(purchaseOrderFormDiscount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ViewHistory value) viewHistory,
    required TResult Function(_CreateFormSupplier value) createFormSupplier,
    required TResult Function(_EditFormSupplier value) editFormSupplier,
    required TResult Function(_CreateFormMaterial value) createFormMaterial,
    required TResult Function(_CreateFormDiscount value) createFormDiscount,
    required TResult Function(_EditFormDiscount value) editFormDiscount,
    required TResult Function(_Submit value) submit,
    required TResult Function(_EditDetails value) editDetails,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_UndoConfirm value) undoConfirm,
    required TResult Function(_AccountingConfirm value) accountingConfirm,
    required TResult Function(_AccountingUndoConfirm value)
        accountingUndoConfirm,
    required TResult Function(_AccountingReject value) accountingReject,
    required TResult Function(_Close value) close,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) {
    return createFormDiscount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ViewHistory value)? viewHistory,
    TResult? Function(_CreateFormSupplier value)? createFormSupplier,
    TResult? Function(_EditFormSupplier value)? editFormSupplier,
    TResult? Function(_CreateFormMaterial value)? createFormMaterial,
    TResult? Function(_CreateFormDiscount value)? createFormDiscount,
    TResult? Function(_EditFormDiscount value)? editFormDiscount,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_EditDetails value)? editDetails,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_UndoConfirm value)? undoConfirm,
    TResult? Function(_AccountingConfirm value)? accountingConfirm,
    TResult? Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult? Function(_AccountingReject value)? accountingReject,
    TResult? Function(_Close value)? close,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) {
    return createFormDiscount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ViewHistory value)? viewHistory,
    TResult Function(_CreateFormSupplier value)? createFormSupplier,
    TResult Function(_EditFormSupplier value)? editFormSupplier,
    TResult Function(_CreateFormMaterial value)? createFormMaterial,
    TResult Function(_CreateFormDiscount value)? createFormDiscount,
    TResult Function(_EditFormDiscount value)? editFormDiscount,
    TResult Function(_Submit value)? submit,
    TResult Function(_EditDetails value)? editDetails,
    TResult Function(_Delete value)? delete,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_UndoConfirm value)? undoConfirm,
    TResult Function(_AccountingConfirm value)? accountingConfirm,
    TResult Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult Function(_AccountingReject value)? accountingReject,
    TResult Function(_Close value)? close,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) {
    if (createFormDiscount != null) {
      return createFormDiscount(this);
    }
    return orElse();
  }
}

abstract class _CreateFormDiscount implements PurchaseOrderEvent {
  const factory _CreateFormDiscount(
          final PurchaseOrderFormDiscount purchaseOrderFormDiscount) =
      _$CreateFormDiscountImpl;

  PurchaseOrderFormDiscount get purchaseOrderFormDiscount;

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateFormDiscountImplCopyWith<_$CreateFormDiscountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditFormDiscountImplCopyWith<$Res> {
  factory _$$EditFormDiscountImplCopyWith(_$EditFormDiscountImpl value,
          $Res Function(_$EditFormDiscountImpl) then) =
      __$$EditFormDiscountImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PurchaseOrder purchaseOrder,
      PurchaseOrderFormDiscount purchaseOrderFormDiscount});

  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
}

/// @nodoc
class __$$EditFormDiscountImplCopyWithImpl<$Res>
    extends _$PurchaseOrderEventCopyWithImpl<$Res, _$EditFormDiscountImpl>
    implements _$$EditFormDiscountImplCopyWith<$Res> {
  __$$EditFormDiscountImplCopyWithImpl(_$EditFormDiscountImpl _value,
      $Res Function(_$EditFormDiscountImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseOrder = null,
    Object? purchaseOrderFormDiscount = null,
  }) {
    return _then(_$EditFormDiscountImpl(
      null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
      null == purchaseOrderFormDiscount
          ? _value.purchaseOrderFormDiscount
          : purchaseOrderFormDiscount // ignore: cast_nullable_to_non_nullable
              as PurchaseOrderFormDiscount,
    ));
  }

  /// Create a copy of PurchaseOrderEvent
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

class _$EditFormDiscountImpl implements _EditFormDiscount {
  const _$EditFormDiscountImpl(
      this.purchaseOrder, this.purchaseOrderFormDiscount);

  @override
  final PurchaseOrder purchaseOrder;
  @override
  final PurchaseOrderFormDiscount purchaseOrderFormDiscount;

  @override
  String toString() {
    return 'PurchaseOrderEvent.editFormDiscount(purchaseOrder: $purchaseOrder, purchaseOrderFormDiscount: $purchaseOrderFormDiscount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditFormDiscountImpl &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder) &&
            (identical(other.purchaseOrderFormDiscount,
                    purchaseOrderFormDiscount) ||
                other.purchaseOrderFormDiscount == purchaseOrderFormDiscount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, purchaseOrder, purchaseOrderFormDiscount);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditFormDiscountImplCopyWith<_$EditFormDiscountImpl> get copyWith =>
      __$$EditFormDiscountImplCopyWithImpl<_$EditFormDiscountImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseOrder purchaseOrder) initialize,
    required TResult Function(PurchaseOrderHistory purchaseOrderHistory)
        viewHistory,
    required TResult Function(
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        createFormSupplier,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        editFormSupplier,
    required TResult Function(List<PurchaseOrderDetail> materials)
        createFormMaterial,
    required TResult Function(
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        createFormDiscount,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        editFormDiscount,
    required TResult Function() submit,
    required TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)
        editDetails,
    required TResult Function(PurchaseOrder purchaseOrder) delete,
    required TResult Function(PurchaseOrder purchaseOrder) confirm,
    required TResult Function(PurchaseOrder purchaseOrder) undoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder) accountingConfirm,
    required TResult Function(PurchaseOrder purchaseOrder)
        accountingUndoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder, String reason)
        accountingReject,
    required TResult Function(PurchaseOrder purchaseOrder) close,
    required TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)
        uploadDocument,
    required TResult Function(PurchaseOrderDocument document) documentDelete,
  }) {
    return editFormDiscount(purchaseOrder, purchaseOrderFormDiscount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseOrder purchaseOrder)? initialize,
    TResult? Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult? Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult? Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult? Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult? Function()? submit,
    TResult? Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult? Function(PurchaseOrder purchaseOrder)? delete,
    TResult? Function(PurchaseOrder purchaseOrder)? confirm,
    TResult? Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult? Function(PurchaseOrder purchaseOrder)? close,
    TResult? Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult? Function(PurchaseOrderDocument document)? documentDelete,
  }) {
    return editFormDiscount?.call(purchaseOrder, purchaseOrderFormDiscount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseOrder purchaseOrder)? initialize,
    TResult Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult Function()? submit,
    TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult Function(PurchaseOrder purchaseOrder)? delete,
    TResult Function(PurchaseOrder purchaseOrder)? confirm,
    TResult Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult Function(PurchaseOrder purchaseOrder)? close,
    TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult Function(PurchaseOrderDocument document)? documentDelete,
    required TResult orElse(),
  }) {
    if (editFormDiscount != null) {
      return editFormDiscount(purchaseOrder, purchaseOrderFormDiscount);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ViewHistory value) viewHistory,
    required TResult Function(_CreateFormSupplier value) createFormSupplier,
    required TResult Function(_EditFormSupplier value) editFormSupplier,
    required TResult Function(_CreateFormMaterial value) createFormMaterial,
    required TResult Function(_CreateFormDiscount value) createFormDiscount,
    required TResult Function(_EditFormDiscount value) editFormDiscount,
    required TResult Function(_Submit value) submit,
    required TResult Function(_EditDetails value) editDetails,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_UndoConfirm value) undoConfirm,
    required TResult Function(_AccountingConfirm value) accountingConfirm,
    required TResult Function(_AccountingUndoConfirm value)
        accountingUndoConfirm,
    required TResult Function(_AccountingReject value) accountingReject,
    required TResult Function(_Close value) close,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) {
    return editFormDiscount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ViewHistory value)? viewHistory,
    TResult? Function(_CreateFormSupplier value)? createFormSupplier,
    TResult? Function(_EditFormSupplier value)? editFormSupplier,
    TResult? Function(_CreateFormMaterial value)? createFormMaterial,
    TResult? Function(_CreateFormDiscount value)? createFormDiscount,
    TResult? Function(_EditFormDiscount value)? editFormDiscount,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_EditDetails value)? editDetails,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_UndoConfirm value)? undoConfirm,
    TResult? Function(_AccountingConfirm value)? accountingConfirm,
    TResult? Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult? Function(_AccountingReject value)? accountingReject,
    TResult? Function(_Close value)? close,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) {
    return editFormDiscount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ViewHistory value)? viewHistory,
    TResult Function(_CreateFormSupplier value)? createFormSupplier,
    TResult Function(_EditFormSupplier value)? editFormSupplier,
    TResult Function(_CreateFormMaterial value)? createFormMaterial,
    TResult Function(_CreateFormDiscount value)? createFormDiscount,
    TResult Function(_EditFormDiscount value)? editFormDiscount,
    TResult Function(_Submit value)? submit,
    TResult Function(_EditDetails value)? editDetails,
    TResult Function(_Delete value)? delete,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_UndoConfirm value)? undoConfirm,
    TResult Function(_AccountingConfirm value)? accountingConfirm,
    TResult Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult Function(_AccountingReject value)? accountingReject,
    TResult Function(_Close value)? close,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) {
    if (editFormDiscount != null) {
      return editFormDiscount(this);
    }
    return orElse();
  }
}

abstract class _EditFormDiscount implements PurchaseOrderEvent {
  const factory _EditFormDiscount(final PurchaseOrder purchaseOrder,
          final PurchaseOrderFormDiscount purchaseOrderFormDiscount) =
      _$EditFormDiscountImpl;

  PurchaseOrder get purchaseOrder;
  PurchaseOrderFormDiscount get purchaseOrderFormDiscount;

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditFormDiscountImplCopyWith<_$EditFormDiscountImpl> get copyWith =>
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
    extends _$PurchaseOrderEventCopyWithImpl<$Res, _$SubmitImpl>
    implements _$$SubmitImplCopyWith<$Res> {
  __$$SubmitImplCopyWithImpl(
      _$SubmitImpl _value, $Res Function(_$SubmitImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SubmitImpl implements _Submit {
  const _$SubmitImpl();

  @override
  String toString() {
    return 'PurchaseOrderEvent.submit()';
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
    required TResult Function(PurchaseOrder purchaseOrder) initialize,
    required TResult Function(PurchaseOrderHistory purchaseOrderHistory)
        viewHistory,
    required TResult Function(
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        createFormSupplier,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        editFormSupplier,
    required TResult Function(List<PurchaseOrderDetail> materials)
        createFormMaterial,
    required TResult Function(
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        createFormDiscount,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        editFormDiscount,
    required TResult Function() submit,
    required TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)
        editDetails,
    required TResult Function(PurchaseOrder purchaseOrder) delete,
    required TResult Function(PurchaseOrder purchaseOrder) confirm,
    required TResult Function(PurchaseOrder purchaseOrder) undoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder) accountingConfirm,
    required TResult Function(PurchaseOrder purchaseOrder)
        accountingUndoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder, String reason)
        accountingReject,
    required TResult Function(PurchaseOrder purchaseOrder) close,
    required TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)
        uploadDocument,
    required TResult Function(PurchaseOrderDocument document) documentDelete,
  }) {
    return submit();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseOrder purchaseOrder)? initialize,
    TResult? Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult? Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult? Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult? Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult? Function()? submit,
    TResult? Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult? Function(PurchaseOrder purchaseOrder)? delete,
    TResult? Function(PurchaseOrder purchaseOrder)? confirm,
    TResult? Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult? Function(PurchaseOrder purchaseOrder)? close,
    TResult? Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult? Function(PurchaseOrderDocument document)? documentDelete,
  }) {
    return submit?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseOrder purchaseOrder)? initialize,
    TResult Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult Function()? submit,
    TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult Function(PurchaseOrder purchaseOrder)? delete,
    TResult Function(PurchaseOrder purchaseOrder)? confirm,
    TResult Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult Function(PurchaseOrder purchaseOrder)? close,
    TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult Function(PurchaseOrderDocument document)? documentDelete,
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
    required TResult Function(_ViewHistory value) viewHistory,
    required TResult Function(_CreateFormSupplier value) createFormSupplier,
    required TResult Function(_EditFormSupplier value) editFormSupplier,
    required TResult Function(_CreateFormMaterial value) createFormMaterial,
    required TResult Function(_CreateFormDiscount value) createFormDiscount,
    required TResult Function(_EditFormDiscount value) editFormDiscount,
    required TResult Function(_Submit value) submit,
    required TResult Function(_EditDetails value) editDetails,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_UndoConfirm value) undoConfirm,
    required TResult Function(_AccountingConfirm value) accountingConfirm,
    required TResult Function(_AccountingUndoConfirm value)
        accountingUndoConfirm,
    required TResult Function(_AccountingReject value) accountingReject,
    required TResult Function(_Close value) close,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) {
    return submit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ViewHistory value)? viewHistory,
    TResult? Function(_CreateFormSupplier value)? createFormSupplier,
    TResult? Function(_EditFormSupplier value)? editFormSupplier,
    TResult? Function(_CreateFormMaterial value)? createFormMaterial,
    TResult? Function(_CreateFormDiscount value)? createFormDiscount,
    TResult? Function(_EditFormDiscount value)? editFormDiscount,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_EditDetails value)? editDetails,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_UndoConfirm value)? undoConfirm,
    TResult? Function(_AccountingConfirm value)? accountingConfirm,
    TResult? Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult? Function(_AccountingReject value)? accountingReject,
    TResult? Function(_Close value)? close,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) {
    return submit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ViewHistory value)? viewHistory,
    TResult Function(_CreateFormSupplier value)? createFormSupplier,
    TResult Function(_EditFormSupplier value)? editFormSupplier,
    TResult Function(_CreateFormMaterial value)? createFormMaterial,
    TResult Function(_CreateFormDiscount value)? createFormDiscount,
    TResult Function(_EditFormDiscount value)? editFormDiscount,
    TResult Function(_Submit value)? submit,
    TResult Function(_EditDetails value)? editDetails,
    TResult Function(_Delete value)? delete,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_UndoConfirm value)? undoConfirm,
    TResult Function(_AccountingConfirm value)? accountingConfirm,
    TResult Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult Function(_AccountingReject value)? accountingReject,
    TResult Function(_Close value)? close,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) {
    if (submit != null) {
      return submit(this);
    }
    return orElse();
  }
}

abstract class _Submit implements PurchaseOrderEvent {
  const factory _Submit() = _$SubmitImpl;
}

/// @nodoc
abstract class _$$EditDetailsImplCopyWith<$Res> {
  factory _$$EditDetailsImplCopyWith(
          _$EditDetailsImpl value, $Res Function(_$EditDetailsImpl) then) =
      __$$EditDetailsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details});

  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
}

/// @nodoc
class __$$EditDetailsImplCopyWithImpl<$Res>
    extends _$PurchaseOrderEventCopyWithImpl<$Res, _$EditDetailsImpl>
    implements _$$EditDetailsImplCopyWith<$Res> {
  __$$EditDetailsImplCopyWithImpl(
      _$EditDetailsImpl _value, $Res Function(_$EditDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseOrder = null,
    Object? details = null,
  }) {
    return _then(_$EditDetailsImpl(
      purchaseOrder: null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
      details: null == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<PurchaseOrderDetail>,
    ));
  }

  /// Create a copy of PurchaseOrderEvent
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

class _$EditDetailsImpl implements _EditDetails {
  const _$EditDetailsImpl(
      {required this.purchaseOrder,
      required final List<PurchaseOrderDetail> details})
      : _details = details;

  @override
  final PurchaseOrder purchaseOrder;
  final List<PurchaseOrderDetail> _details;
  @override
  List<PurchaseOrderDetail> get details {
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_details);
  }

  @override
  String toString() {
    return 'PurchaseOrderEvent.editDetails(purchaseOrder: $purchaseOrder, details: $details)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditDetailsImpl &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @override
  int get hashCode => Object.hash(runtimeType, purchaseOrder,
      const DeepCollectionEquality().hash(_details));

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditDetailsImplCopyWith<_$EditDetailsImpl> get copyWith =>
      __$$EditDetailsImplCopyWithImpl<_$EditDetailsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseOrder purchaseOrder) initialize,
    required TResult Function(PurchaseOrderHistory purchaseOrderHistory)
        viewHistory,
    required TResult Function(
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        createFormSupplier,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        editFormSupplier,
    required TResult Function(List<PurchaseOrderDetail> materials)
        createFormMaterial,
    required TResult Function(
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        createFormDiscount,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        editFormDiscount,
    required TResult Function() submit,
    required TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)
        editDetails,
    required TResult Function(PurchaseOrder purchaseOrder) delete,
    required TResult Function(PurchaseOrder purchaseOrder) confirm,
    required TResult Function(PurchaseOrder purchaseOrder) undoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder) accountingConfirm,
    required TResult Function(PurchaseOrder purchaseOrder)
        accountingUndoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder, String reason)
        accountingReject,
    required TResult Function(PurchaseOrder purchaseOrder) close,
    required TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)
        uploadDocument,
    required TResult Function(PurchaseOrderDocument document) documentDelete,
  }) {
    return editDetails(purchaseOrder, details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseOrder purchaseOrder)? initialize,
    TResult? Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult? Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult? Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult? Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult? Function()? submit,
    TResult? Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult? Function(PurchaseOrder purchaseOrder)? delete,
    TResult? Function(PurchaseOrder purchaseOrder)? confirm,
    TResult? Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult? Function(PurchaseOrder purchaseOrder)? close,
    TResult? Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult? Function(PurchaseOrderDocument document)? documentDelete,
  }) {
    return editDetails?.call(purchaseOrder, details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseOrder purchaseOrder)? initialize,
    TResult Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult Function()? submit,
    TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult Function(PurchaseOrder purchaseOrder)? delete,
    TResult Function(PurchaseOrder purchaseOrder)? confirm,
    TResult Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult Function(PurchaseOrder purchaseOrder)? close,
    TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult Function(PurchaseOrderDocument document)? documentDelete,
    required TResult orElse(),
  }) {
    if (editDetails != null) {
      return editDetails(purchaseOrder, details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ViewHistory value) viewHistory,
    required TResult Function(_CreateFormSupplier value) createFormSupplier,
    required TResult Function(_EditFormSupplier value) editFormSupplier,
    required TResult Function(_CreateFormMaterial value) createFormMaterial,
    required TResult Function(_CreateFormDiscount value) createFormDiscount,
    required TResult Function(_EditFormDiscount value) editFormDiscount,
    required TResult Function(_Submit value) submit,
    required TResult Function(_EditDetails value) editDetails,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_UndoConfirm value) undoConfirm,
    required TResult Function(_AccountingConfirm value) accountingConfirm,
    required TResult Function(_AccountingUndoConfirm value)
        accountingUndoConfirm,
    required TResult Function(_AccountingReject value) accountingReject,
    required TResult Function(_Close value) close,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) {
    return editDetails(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ViewHistory value)? viewHistory,
    TResult? Function(_CreateFormSupplier value)? createFormSupplier,
    TResult? Function(_EditFormSupplier value)? editFormSupplier,
    TResult? Function(_CreateFormMaterial value)? createFormMaterial,
    TResult? Function(_CreateFormDiscount value)? createFormDiscount,
    TResult? Function(_EditFormDiscount value)? editFormDiscount,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_EditDetails value)? editDetails,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_UndoConfirm value)? undoConfirm,
    TResult? Function(_AccountingConfirm value)? accountingConfirm,
    TResult? Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult? Function(_AccountingReject value)? accountingReject,
    TResult? Function(_Close value)? close,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) {
    return editDetails?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ViewHistory value)? viewHistory,
    TResult Function(_CreateFormSupplier value)? createFormSupplier,
    TResult Function(_EditFormSupplier value)? editFormSupplier,
    TResult Function(_CreateFormMaterial value)? createFormMaterial,
    TResult Function(_CreateFormDiscount value)? createFormDiscount,
    TResult Function(_EditFormDiscount value)? editFormDiscount,
    TResult Function(_Submit value)? submit,
    TResult Function(_EditDetails value)? editDetails,
    TResult Function(_Delete value)? delete,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_UndoConfirm value)? undoConfirm,
    TResult Function(_AccountingConfirm value)? accountingConfirm,
    TResult Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult Function(_AccountingReject value)? accountingReject,
    TResult Function(_Close value)? close,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) {
    if (editDetails != null) {
      return editDetails(this);
    }
    return orElse();
  }
}

abstract class _EditDetails implements PurchaseOrderEvent {
  const factory _EditDetails(
      {required final PurchaseOrder purchaseOrder,
      required final List<PurchaseOrderDetail> details}) = _$EditDetailsImpl;

  PurchaseOrder get purchaseOrder;
  List<PurchaseOrderDetail> get details;

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditDetailsImplCopyWith<_$EditDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PurchaseOrder purchaseOrder});

  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$PurchaseOrderEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseOrder = null,
  }) {
    return _then(_$DeleteImpl(
      null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
    ));
  }

  /// Create a copy of PurchaseOrderEvent
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

class _$DeleteImpl implements _Delete {
  const _$DeleteImpl(this.purchaseOrder);

  @override
  final PurchaseOrder purchaseOrder;

  @override
  String toString() {
    return 'PurchaseOrderEvent.delete(purchaseOrder: $purchaseOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteImpl &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, purchaseOrder);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      __$$DeleteImplCopyWithImpl<_$DeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseOrder purchaseOrder) initialize,
    required TResult Function(PurchaseOrderHistory purchaseOrderHistory)
        viewHistory,
    required TResult Function(
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        createFormSupplier,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        editFormSupplier,
    required TResult Function(List<PurchaseOrderDetail> materials)
        createFormMaterial,
    required TResult Function(
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        createFormDiscount,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        editFormDiscount,
    required TResult Function() submit,
    required TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)
        editDetails,
    required TResult Function(PurchaseOrder purchaseOrder) delete,
    required TResult Function(PurchaseOrder purchaseOrder) confirm,
    required TResult Function(PurchaseOrder purchaseOrder) undoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder) accountingConfirm,
    required TResult Function(PurchaseOrder purchaseOrder)
        accountingUndoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder, String reason)
        accountingReject,
    required TResult Function(PurchaseOrder purchaseOrder) close,
    required TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)
        uploadDocument,
    required TResult Function(PurchaseOrderDocument document) documentDelete,
  }) {
    return delete(purchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseOrder purchaseOrder)? initialize,
    TResult? Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult? Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult? Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult? Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult? Function()? submit,
    TResult? Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult? Function(PurchaseOrder purchaseOrder)? delete,
    TResult? Function(PurchaseOrder purchaseOrder)? confirm,
    TResult? Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult? Function(PurchaseOrder purchaseOrder)? close,
    TResult? Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult? Function(PurchaseOrderDocument document)? documentDelete,
  }) {
    return delete?.call(purchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseOrder purchaseOrder)? initialize,
    TResult Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult Function()? submit,
    TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult Function(PurchaseOrder purchaseOrder)? delete,
    TResult Function(PurchaseOrder purchaseOrder)? confirm,
    TResult Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult Function(PurchaseOrder purchaseOrder)? close,
    TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult Function(PurchaseOrderDocument document)? documentDelete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(purchaseOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ViewHistory value) viewHistory,
    required TResult Function(_CreateFormSupplier value) createFormSupplier,
    required TResult Function(_EditFormSupplier value) editFormSupplier,
    required TResult Function(_CreateFormMaterial value) createFormMaterial,
    required TResult Function(_CreateFormDiscount value) createFormDiscount,
    required TResult Function(_EditFormDiscount value) editFormDiscount,
    required TResult Function(_Submit value) submit,
    required TResult Function(_EditDetails value) editDetails,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_UndoConfirm value) undoConfirm,
    required TResult Function(_AccountingConfirm value) accountingConfirm,
    required TResult Function(_AccountingUndoConfirm value)
        accountingUndoConfirm,
    required TResult Function(_AccountingReject value) accountingReject,
    required TResult Function(_Close value) close,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ViewHistory value)? viewHistory,
    TResult? Function(_CreateFormSupplier value)? createFormSupplier,
    TResult? Function(_EditFormSupplier value)? editFormSupplier,
    TResult? Function(_CreateFormMaterial value)? createFormMaterial,
    TResult? Function(_CreateFormDiscount value)? createFormDiscount,
    TResult? Function(_EditFormDiscount value)? editFormDiscount,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_EditDetails value)? editDetails,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_UndoConfirm value)? undoConfirm,
    TResult? Function(_AccountingConfirm value)? accountingConfirm,
    TResult? Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult? Function(_AccountingReject value)? accountingReject,
    TResult? Function(_Close value)? close,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ViewHistory value)? viewHistory,
    TResult Function(_CreateFormSupplier value)? createFormSupplier,
    TResult Function(_EditFormSupplier value)? editFormSupplier,
    TResult Function(_CreateFormMaterial value)? createFormMaterial,
    TResult Function(_CreateFormDiscount value)? createFormDiscount,
    TResult Function(_EditFormDiscount value)? editFormDiscount,
    TResult Function(_Submit value)? submit,
    TResult Function(_EditDetails value)? editDetails,
    TResult Function(_Delete value)? delete,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_UndoConfirm value)? undoConfirm,
    TResult Function(_AccountingConfirm value)? accountingConfirm,
    TResult Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult Function(_AccountingReject value)? accountingReject,
    TResult Function(_Close value)? close,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements PurchaseOrderEvent {
  const factory _Delete(final PurchaseOrder purchaseOrder) = _$DeleteImpl;

  PurchaseOrder get purchaseOrder;

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ConfirmImplCopyWith<$Res> {
  factory _$$ConfirmImplCopyWith(
          _$ConfirmImpl value, $Res Function(_$ConfirmImpl) then) =
      __$$ConfirmImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PurchaseOrder purchaseOrder});

  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
}

/// @nodoc
class __$$ConfirmImplCopyWithImpl<$Res>
    extends _$PurchaseOrderEventCopyWithImpl<$Res, _$ConfirmImpl>
    implements _$$ConfirmImplCopyWith<$Res> {
  __$$ConfirmImplCopyWithImpl(
      _$ConfirmImpl _value, $Res Function(_$ConfirmImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseOrder = null,
  }) {
    return _then(_$ConfirmImpl(
      null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
    ));
  }

  /// Create a copy of PurchaseOrderEvent
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

class _$ConfirmImpl implements _Confirm {
  const _$ConfirmImpl(this.purchaseOrder);

  @override
  final PurchaseOrder purchaseOrder;

  @override
  String toString() {
    return 'PurchaseOrderEvent.confirm(purchaseOrder: $purchaseOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConfirmImpl &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, purchaseOrder);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConfirmImplCopyWith<_$ConfirmImpl> get copyWith =>
      __$$ConfirmImplCopyWithImpl<_$ConfirmImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseOrder purchaseOrder) initialize,
    required TResult Function(PurchaseOrderHistory purchaseOrderHistory)
        viewHistory,
    required TResult Function(
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        createFormSupplier,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        editFormSupplier,
    required TResult Function(List<PurchaseOrderDetail> materials)
        createFormMaterial,
    required TResult Function(
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        createFormDiscount,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        editFormDiscount,
    required TResult Function() submit,
    required TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)
        editDetails,
    required TResult Function(PurchaseOrder purchaseOrder) delete,
    required TResult Function(PurchaseOrder purchaseOrder) confirm,
    required TResult Function(PurchaseOrder purchaseOrder) undoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder) accountingConfirm,
    required TResult Function(PurchaseOrder purchaseOrder)
        accountingUndoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder, String reason)
        accountingReject,
    required TResult Function(PurchaseOrder purchaseOrder) close,
    required TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)
        uploadDocument,
    required TResult Function(PurchaseOrderDocument document) documentDelete,
  }) {
    return confirm(purchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseOrder purchaseOrder)? initialize,
    TResult? Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult? Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult? Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult? Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult? Function()? submit,
    TResult? Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult? Function(PurchaseOrder purchaseOrder)? delete,
    TResult? Function(PurchaseOrder purchaseOrder)? confirm,
    TResult? Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult? Function(PurchaseOrder purchaseOrder)? close,
    TResult? Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult? Function(PurchaseOrderDocument document)? documentDelete,
  }) {
    return confirm?.call(purchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseOrder purchaseOrder)? initialize,
    TResult Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult Function()? submit,
    TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult Function(PurchaseOrder purchaseOrder)? delete,
    TResult Function(PurchaseOrder purchaseOrder)? confirm,
    TResult Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult Function(PurchaseOrder purchaseOrder)? close,
    TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult Function(PurchaseOrderDocument document)? documentDelete,
    required TResult orElse(),
  }) {
    if (confirm != null) {
      return confirm(purchaseOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ViewHistory value) viewHistory,
    required TResult Function(_CreateFormSupplier value) createFormSupplier,
    required TResult Function(_EditFormSupplier value) editFormSupplier,
    required TResult Function(_CreateFormMaterial value) createFormMaterial,
    required TResult Function(_CreateFormDiscount value) createFormDiscount,
    required TResult Function(_EditFormDiscount value) editFormDiscount,
    required TResult Function(_Submit value) submit,
    required TResult Function(_EditDetails value) editDetails,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_UndoConfirm value) undoConfirm,
    required TResult Function(_AccountingConfirm value) accountingConfirm,
    required TResult Function(_AccountingUndoConfirm value)
        accountingUndoConfirm,
    required TResult Function(_AccountingReject value) accountingReject,
    required TResult Function(_Close value) close,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) {
    return confirm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ViewHistory value)? viewHistory,
    TResult? Function(_CreateFormSupplier value)? createFormSupplier,
    TResult? Function(_EditFormSupplier value)? editFormSupplier,
    TResult? Function(_CreateFormMaterial value)? createFormMaterial,
    TResult? Function(_CreateFormDiscount value)? createFormDiscount,
    TResult? Function(_EditFormDiscount value)? editFormDiscount,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_EditDetails value)? editDetails,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_UndoConfirm value)? undoConfirm,
    TResult? Function(_AccountingConfirm value)? accountingConfirm,
    TResult? Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult? Function(_AccountingReject value)? accountingReject,
    TResult? Function(_Close value)? close,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) {
    return confirm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ViewHistory value)? viewHistory,
    TResult Function(_CreateFormSupplier value)? createFormSupplier,
    TResult Function(_EditFormSupplier value)? editFormSupplier,
    TResult Function(_CreateFormMaterial value)? createFormMaterial,
    TResult Function(_CreateFormDiscount value)? createFormDiscount,
    TResult Function(_EditFormDiscount value)? editFormDiscount,
    TResult Function(_Submit value)? submit,
    TResult Function(_EditDetails value)? editDetails,
    TResult Function(_Delete value)? delete,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_UndoConfirm value)? undoConfirm,
    TResult Function(_AccountingConfirm value)? accountingConfirm,
    TResult Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult Function(_AccountingReject value)? accountingReject,
    TResult Function(_Close value)? close,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) {
    if (confirm != null) {
      return confirm(this);
    }
    return orElse();
  }
}

abstract class _Confirm implements PurchaseOrderEvent {
  const factory _Confirm(final PurchaseOrder purchaseOrder) = _$ConfirmImpl;

  PurchaseOrder get purchaseOrder;

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConfirmImplCopyWith<_$ConfirmImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UndoConfirmImplCopyWith<$Res> {
  factory _$$UndoConfirmImplCopyWith(
          _$UndoConfirmImpl value, $Res Function(_$UndoConfirmImpl) then) =
      __$$UndoConfirmImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PurchaseOrder purchaseOrder});

  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
}

/// @nodoc
class __$$UndoConfirmImplCopyWithImpl<$Res>
    extends _$PurchaseOrderEventCopyWithImpl<$Res, _$UndoConfirmImpl>
    implements _$$UndoConfirmImplCopyWith<$Res> {
  __$$UndoConfirmImplCopyWithImpl(
      _$UndoConfirmImpl _value, $Res Function(_$UndoConfirmImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseOrder = null,
  }) {
    return _then(_$UndoConfirmImpl(
      null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
    ));
  }

  /// Create a copy of PurchaseOrderEvent
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

class _$UndoConfirmImpl implements _UndoConfirm {
  const _$UndoConfirmImpl(this.purchaseOrder);

  @override
  final PurchaseOrder purchaseOrder;

  @override
  String toString() {
    return 'PurchaseOrderEvent.undoConfirm(purchaseOrder: $purchaseOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UndoConfirmImpl &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, purchaseOrder);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UndoConfirmImplCopyWith<_$UndoConfirmImpl> get copyWith =>
      __$$UndoConfirmImplCopyWithImpl<_$UndoConfirmImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseOrder purchaseOrder) initialize,
    required TResult Function(PurchaseOrderHistory purchaseOrderHistory)
        viewHistory,
    required TResult Function(
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        createFormSupplier,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        editFormSupplier,
    required TResult Function(List<PurchaseOrderDetail> materials)
        createFormMaterial,
    required TResult Function(
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        createFormDiscount,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        editFormDiscount,
    required TResult Function() submit,
    required TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)
        editDetails,
    required TResult Function(PurchaseOrder purchaseOrder) delete,
    required TResult Function(PurchaseOrder purchaseOrder) confirm,
    required TResult Function(PurchaseOrder purchaseOrder) undoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder) accountingConfirm,
    required TResult Function(PurchaseOrder purchaseOrder)
        accountingUndoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder, String reason)
        accountingReject,
    required TResult Function(PurchaseOrder purchaseOrder) close,
    required TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)
        uploadDocument,
    required TResult Function(PurchaseOrderDocument document) documentDelete,
  }) {
    return undoConfirm(purchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseOrder purchaseOrder)? initialize,
    TResult? Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult? Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult? Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult? Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult? Function()? submit,
    TResult? Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult? Function(PurchaseOrder purchaseOrder)? delete,
    TResult? Function(PurchaseOrder purchaseOrder)? confirm,
    TResult? Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult? Function(PurchaseOrder purchaseOrder)? close,
    TResult? Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult? Function(PurchaseOrderDocument document)? documentDelete,
  }) {
    return undoConfirm?.call(purchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseOrder purchaseOrder)? initialize,
    TResult Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult Function()? submit,
    TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult Function(PurchaseOrder purchaseOrder)? delete,
    TResult Function(PurchaseOrder purchaseOrder)? confirm,
    TResult Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult Function(PurchaseOrder purchaseOrder)? close,
    TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult Function(PurchaseOrderDocument document)? documentDelete,
    required TResult orElse(),
  }) {
    if (undoConfirm != null) {
      return undoConfirm(purchaseOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ViewHistory value) viewHistory,
    required TResult Function(_CreateFormSupplier value) createFormSupplier,
    required TResult Function(_EditFormSupplier value) editFormSupplier,
    required TResult Function(_CreateFormMaterial value) createFormMaterial,
    required TResult Function(_CreateFormDiscount value) createFormDiscount,
    required TResult Function(_EditFormDiscount value) editFormDiscount,
    required TResult Function(_Submit value) submit,
    required TResult Function(_EditDetails value) editDetails,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_UndoConfirm value) undoConfirm,
    required TResult Function(_AccountingConfirm value) accountingConfirm,
    required TResult Function(_AccountingUndoConfirm value)
        accountingUndoConfirm,
    required TResult Function(_AccountingReject value) accountingReject,
    required TResult Function(_Close value) close,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) {
    return undoConfirm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ViewHistory value)? viewHistory,
    TResult? Function(_CreateFormSupplier value)? createFormSupplier,
    TResult? Function(_EditFormSupplier value)? editFormSupplier,
    TResult? Function(_CreateFormMaterial value)? createFormMaterial,
    TResult? Function(_CreateFormDiscount value)? createFormDiscount,
    TResult? Function(_EditFormDiscount value)? editFormDiscount,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_EditDetails value)? editDetails,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_UndoConfirm value)? undoConfirm,
    TResult? Function(_AccountingConfirm value)? accountingConfirm,
    TResult? Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult? Function(_AccountingReject value)? accountingReject,
    TResult? Function(_Close value)? close,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) {
    return undoConfirm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ViewHistory value)? viewHistory,
    TResult Function(_CreateFormSupplier value)? createFormSupplier,
    TResult Function(_EditFormSupplier value)? editFormSupplier,
    TResult Function(_CreateFormMaterial value)? createFormMaterial,
    TResult Function(_CreateFormDiscount value)? createFormDiscount,
    TResult Function(_EditFormDiscount value)? editFormDiscount,
    TResult Function(_Submit value)? submit,
    TResult Function(_EditDetails value)? editDetails,
    TResult Function(_Delete value)? delete,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_UndoConfirm value)? undoConfirm,
    TResult Function(_AccountingConfirm value)? accountingConfirm,
    TResult Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult Function(_AccountingReject value)? accountingReject,
    TResult Function(_Close value)? close,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) {
    if (undoConfirm != null) {
      return undoConfirm(this);
    }
    return orElse();
  }
}

abstract class _UndoConfirm implements PurchaseOrderEvent {
  const factory _UndoConfirm(final PurchaseOrder purchaseOrder) =
      _$UndoConfirmImpl;

  PurchaseOrder get purchaseOrder;

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UndoConfirmImplCopyWith<_$UndoConfirmImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountingConfirmImplCopyWith<$Res> {
  factory _$$AccountingConfirmImplCopyWith(_$AccountingConfirmImpl value,
          $Res Function(_$AccountingConfirmImpl) then) =
      __$$AccountingConfirmImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PurchaseOrder purchaseOrder});

  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
}

/// @nodoc
class __$$AccountingConfirmImplCopyWithImpl<$Res>
    extends _$PurchaseOrderEventCopyWithImpl<$Res, _$AccountingConfirmImpl>
    implements _$$AccountingConfirmImplCopyWith<$Res> {
  __$$AccountingConfirmImplCopyWithImpl(_$AccountingConfirmImpl _value,
      $Res Function(_$AccountingConfirmImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseOrder = null,
  }) {
    return _then(_$AccountingConfirmImpl(
      null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
    ));
  }

  /// Create a copy of PurchaseOrderEvent
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

class _$AccountingConfirmImpl implements _AccountingConfirm {
  const _$AccountingConfirmImpl(this.purchaseOrder);

  @override
  final PurchaseOrder purchaseOrder;

  @override
  String toString() {
    return 'PurchaseOrderEvent.accountingConfirm(purchaseOrder: $purchaseOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountingConfirmImpl &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, purchaseOrder);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountingConfirmImplCopyWith<_$AccountingConfirmImpl> get copyWith =>
      __$$AccountingConfirmImplCopyWithImpl<_$AccountingConfirmImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseOrder purchaseOrder) initialize,
    required TResult Function(PurchaseOrderHistory purchaseOrderHistory)
        viewHistory,
    required TResult Function(
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        createFormSupplier,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        editFormSupplier,
    required TResult Function(List<PurchaseOrderDetail> materials)
        createFormMaterial,
    required TResult Function(
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        createFormDiscount,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        editFormDiscount,
    required TResult Function() submit,
    required TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)
        editDetails,
    required TResult Function(PurchaseOrder purchaseOrder) delete,
    required TResult Function(PurchaseOrder purchaseOrder) confirm,
    required TResult Function(PurchaseOrder purchaseOrder) undoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder) accountingConfirm,
    required TResult Function(PurchaseOrder purchaseOrder)
        accountingUndoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder, String reason)
        accountingReject,
    required TResult Function(PurchaseOrder purchaseOrder) close,
    required TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)
        uploadDocument,
    required TResult Function(PurchaseOrderDocument document) documentDelete,
  }) {
    return accountingConfirm(purchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseOrder purchaseOrder)? initialize,
    TResult? Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult? Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult? Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult? Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult? Function()? submit,
    TResult? Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult? Function(PurchaseOrder purchaseOrder)? delete,
    TResult? Function(PurchaseOrder purchaseOrder)? confirm,
    TResult? Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult? Function(PurchaseOrder purchaseOrder)? close,
    TResult? Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult? Function(PurchaseOrderDocument document)? documentDelete,
  }) {
    return accountingConfirm?.call(purchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseOrder purchaseOrder)? initialize,
    TResult Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult Function()? submit,
    TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult Function(PurchaseOrder purchaseOrder)? delete,
    TResult Function(PurchaseOrder purchaseOrder)? confirm,
    TResult Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult Function(PurchaseOrder purchaseOrder)? close,
    TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult Function(PurchaseOrderDocument document)? documentDelete,
    required TResult orElse(),
  }) {
    if (accountingConfirm != null) {
      return accountingConfirm(purchaseOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ViewHistory value) viewHistory,
    required TResult Function(_CreateFormSupplier value) createFormSupplier,
    required TResult Function(_EditFormSupplier value) editFormSupplier,
    required TResult Function(_CreateFormMaterial value) createFormMaterial,
    required TResult Function(_CreateFormDiscount value) createFormDiscount,
    required TResult Function(_EditFormDiscount value) editFormDiscount,
    required TResult Function(_Submit value) submit,
    required TResult Function(_EditDetails value) editDetails,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_UndoConfirm value) undoConfirm,
    required TResult Function(_AccountingConfirm value) accountingConfirm,
    required TResult Function(_AccountingUndoConfirm value)
        accountingUndoConfirm,
    required TResult Function(_AccountingReject value) accountingReject,
    required TResult Function(_Close value) close,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) {
    return accountingConfirm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ViewHistory value)? viewHistory,
    TResult? Function(_CreateFormSupplier value)? createFormSupplier,
    TResult? Function(_EditFormSupplier value)? editFormSupplier,
    TResult? Function(_CreateFormMaterial value)? createFormMaterial,
    TResult? Function(_CreateFormDiscount value)? createFormDiscount,
    TResult? Function(_EditFormDiscount value)? editFormDiscount,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_EditDetails value)? editDetails,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_UndoConfirm value)? undoConfirm,
    TResult? Function(_AccountingConfirm value)? accountingConfirm,
    TResult? Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult? Function(_AccountingReject value)? accountingReject,
    TResult? Function(_Close value)? close,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) {
    return accountingConfirm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ViewHistory value)? viewHistory,
    TResult Function(_CreateFormSupplier value)? createFormSupplier,
    TResult Function(_EditFormSupplier value)? editFormSupplier,
    TResult Function(_CreateFormMaterial value)? createFormMaterial,
    TResult Function(_CreateFormDiscount value)? createFormDiscount,
    TResult Function(_EditFormDiscount value)? editFormDiscount,
    TResult Function(_Submit value)? submit,
    TResult Function(_EditDetails value)? editDetails,
    TResult Function(_Delete value)? delete,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_UndoConfirm value)? undoConfirm,
    TResult Function(_AccountingConfirm value)? accountingConfirm,
    TResult Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult Function(_AccountingReject value)? accountingReject,
    TResult Function(_Close value)? close,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) {
    if (accountingConfirm != null) {
      return accountingConfirm(this);
    }
    return orElse();
  }
}

abstract class _AccountingConfirm implements PurchaseOrderEvent {
  const factory _AccountingConfirm(final PurchaseOrder purchaseOrder) =
      _$AccountingConfirmImpl;

  PurchaseOrder get purchaseOrder;

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountingConfirmImplCopyWith<_$AccountingConfirmImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountingUndoConfirmImplCopyWith<$Res> {
  factory _$$AccountingUndoConfirmImplCopyWith(
          _$AccountingUndoConfirmImpl value,
          $Res Function(_$AccountingUndoConfirmImpl) then) =
      __$$AccountingUndoConfirmImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PurchaseOrder purchaseOrder});

  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
}

/// @nodoc
class __$$AccountingUndoConfirmImplCopyWithImpl<$Res>
    extends _$PurchaseOrderEventCopyWithImpl<$Res, _$AccountingUndoConfirmImpl>
    implements _$$AccountingUndoConfirmImplCopyWith<$Res> {
  __$$AccountingUndoConfirmImplCopyWithImpl(_$AccountingUndoConfirmImpl _value,
      $Res Function(_$AccountingUndoConfirmImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseOrder = null,
  }) {
    return _then(_$AccountingUndoConfirmImpl(
      null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
    ));
  }

  /// Create a copy of PurchaseOrderEvent
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

class _$AccountingUndoConfirmImpl implements _AccountingUndoConfirm {
  const _$AccountingUndoConfirmImpl(this.purchaseOrder);

  @override
  final PurchaseOrder purchaseOrder;

  @override
  String toString() {
    return 'PurchaseOrderEvent.accountingUndoConfirm(purchaseOrder: $purchaseOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountingUndoConfirmImpl &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, purchaseOrder);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountingUndoConfirmImplCopyWith<_$AccountingUndoConfirmImpl>
      get copyWith => __$$AccountingUndoConfirmImplCopyWithImpl<
          _$AccountingUndoConfirmImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseOrder purchaseOrder) initialize,
    required TResult Function(PurchaseOrderHistory purchaseOrderHistory)
        viewHistory,
    required TResult Function(
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        createFormSupplier,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        editFormSupplier,
    required TResult Function(List<PurchaseOrderDetail> materials)
        createFormMaterial,
    required TResult Function(
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        createFormDiscount,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        editFormDiscount,
    required TResult Function() submit,
    required TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)
        editDetails,
    required TResult Function(PurchaseOrder purchaseOrder) delete,
    required TResult Function(PurchaseOrder purchaseOrder) confirm,
    required TResult Function(PurchaseOrder purchaseOrder) undoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder) accountingConfirm,
    required TResult Function(PurchaseOrder purchaseOrder)
        accountingUndoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder, String reason)
        accountingReject,
    required TResult Function(PurchaseOrder purchaseOrder) close,
    required TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)
        uploadDocument,
    required TResult Function(PurchaseOrderDocument document) documentDelete,
  }) {
    return accountingUndoConfirm(purchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseOrder purchaseOrder)? initialize,
    TResult? Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult? Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult? Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult? Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult? Function()? submit,
    TResult? Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult? Function(PurchaseOrder purchaseOrder)? delete,
    TResult? Function(PurchaseOrder purchaseOrder)? confirm,
    TResult? Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult? Function(PurchaseOrder purchaseOrder)? close,
    TResult? Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult? Function(PurchaseOrderDocument document)? documentDelete,
  }) {
    return accountingUndoConfirm?.call(purchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseOrder purchaseOrder)? initialize,
    TResult Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult Function()? submit,
    TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult Function(PurchaseOrder purchaseOrder)? delete,
    TResult Function(PurchaseOrder purchaseOrder)? confirm,
    TResult Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult Function(PurchaseOrder purchaseOrder)? close,
    TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult Function(PurchaseOrderDocument document)? documentDelete,
    required TResult orElse(),
  }) {
    if (accountingUndoConfirm != null) {
      return accountingUndoConfirm(purchaseOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ViewHistory value) viewHistory,
    required TResult Function(_CreateFormSupplier value) createFormSupplier,
    required TResult Function(_EditFormSupplier value) editFormSupplier,
    required TResult Function(_CreateFormMaterial value) createFormMaterial,
    required TResult Function(_CreateFormDiscount value) createFormDiscount,
    required TResult Function(_EditFormDiscount value) editFormDiscount,
    required TResult Function(_Submit value) submit,
    required TResult Function(_EditDetails value) editDetails,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_UndoConfirm value) undoConfirm,
    required TResult Function(_AccountingConfirm value) accountingConfirm,
    required TResult Function(_AccountingUndoConfirm value)
        accountingUndoConfirm,
    required TResult Function(_AccountingReject value) accountingReject,
    required TResult Function(_Close value) close,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) {
    return accountingUndoConfirm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ViewHistory value)? viewHistory,
    TResult? Function(_CreateFormSupplier value)? createFormSupplier,
    TResult? Function(_EditFormSupplier value)? editFormSupplier,
    TResult? Function(_CreateFormMaterial value)? createFormMaterial,
    TResult? Function(_CreateFormDiscount value)? createFormDiscount,
    TResult? Function(_EditFormDiscount value)? editFormDiscount,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_EditDetails value)? editDetails,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_UndoConfirm value)? undoConfirm,
    TResult? Function(_AccountingConfirm value)? accountingConfirm,
    TResult? Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult? Function(_AccountingReject value)? accountingReject,
    TResult? Function(_Close value)? close,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) {
    return accountingUndoConfirm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ViewHistory value)? viewHistory,
    TResult Function(_CreateFormSupplier value)? createFormSupplier,
    TResult Function(_EditFormSupplier value)? editFormSupplier,
    TResult Function(_CreateFormMaterial value)? createFormMaterial,
    TResult Function(_CreateFormDiscount value)? createFormDiscount,
    TResult Function(_EditFormDiscount value)? editFormDiscount,
    TResult Function(_Submit value)? submit,
    TResult Function(_EditDetails value)? editDetails,
    TResult Function(_Delete value)? delete,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_UndoConfirm value)? undoConfirm,
    TResult Function(_AccountingConfirm value)? accountingConfirm,
    TResult Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult Function(_AccountingReject value)? accountingReject,
    TResult Function(_Close value)? close,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) {
    if (accountingUndoConfirm != null) {
      return accountingUndoConfirm(this);
    }
    return orElse();
  }
}

abstract class _AccountingUndoConfirm implements PurchaseOrderEvent {
  const factory _AccountingUndoConfirm(final PurchaseOrder purchaseOrder) =
      _$AccountingUndoConfirmImpl;

  PurchaseOrder get purchaseOrder;

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountingUndoConfirmImplCopyWith<_$AccountingUndoConfirmImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AccountingRejectImplCopyWith<$Res> {
  factory _$$AccountingRejectImplCopyWith(_$AccountingRejectImpl value,
          $Res Function(_$AccountingRejectImpl) then) =
      __$$AccountingRejectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PurchaseOrder purchaseOrder, String reason});

  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
}

/// @nodoc
class __$$AccountingRejectImplCopyWithImpl<$Res>
    extends _$PurchaseOrderEventCopyWithImpl<$Res, _$AccountingRejectImpl>
    implements _$$AccountingRejectImplCopyWith<$Res> {
  __$$AccountingRejectImplCopyWithImpl(_$AccountingRejectImpl _value,
      $Res Function(_$AccountingRejectImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseOrder = null,
    Object? reason = null,
  }) {
    return _then(_$AccountingRejectImpl(
      null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
      null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of PurchaseOrderEvent
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

class _$AccountingRejectImpl implements _AccountingReject {
  const _$AccountingRejectImpl(this.purchaseOrder, this.reason);

  @override
  final PurchaseOrder purchaseOrder;
  @override
  final String reason;

  @override
  String toString() {
    return 'PurchaseOrderEvent.accountingReject(purchaseOrder: $purchaseOrder, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccountingRejectImpl &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, purchaseOrder, reason);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AccountingRejectImplCopyWith<_$AccountingRejectImpl> get copyWith =>
      __$$AccountingRejectImplCopyWithImpl<_$AccountingRejectImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseOrder purchaseOrder) initialize,
    required TResult Function(PurchaseOrderHistory purchaseOrderHistory)
        viewHistory,
    required TResult Function(
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        createFormSupplier,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        editFormSupplier,
    required TResult Function(List<PurchaseOrderDetail> materials)
        createFormMaterial,
    required TResult Function(
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        createFormDiscount,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        editFormDiscount,
    required TResult Function() submit,
    required TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)
        editDetails,
    required TResult Function(PurchaseOrder purchaseOrder) delete,
    required TResult Function(PurchaseOrder purchaseOrder) confirm,
    required TResult Function(PurchaseOrder purchaseOrder) undoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder) accountingConfirm,
    required TResult Function(PurchaseOrder purchaseOrder)
        accountingUndoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder, String reason)
        accountingReject,
    required TResult Function(PurchaseOrder purchaseOrder) close,
    required TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)
        uploadDocument,
    required TResult Function(PurchaseOrderDocument document) documentDelete,
  }) {
    return accountingReject(purchaseOrder, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseOrder purchaseOrder)? initialize,
    TResult? Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult? Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult? Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult? Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult? Function()? submit,
    TResult? Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult? Function(PurchaseOrder purchaseOrder)? delete,
    TResult? Function(PurchaseOrder purchaseOrder)? confirm,
    TResult? Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult? Function(PurchaseOrder purchaseOrder)? close,
    TResult? Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult? Function(PurchaseOrderDocument document)? documentDelete,
  }) {
    return accountingReject?.call(purchaseOrder, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseOrder purchaseOrder)? initialize,
    TResult Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult Function()? submit,
    TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult Function(PurchaseOrder purchaseOrder)? delete,
    TResult Function(PurchaseOrder purchaseOrder)? confirm,
    TResult Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult Function(PurchaseOrder purchaseOrder)? close,
    TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult Function(PurchaseOrderDocument document)? documentDelete,
    required TResult orElse(),
  }) {
    if (accountingReject != null) {
      return accountingReject(purchaseOrder, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ViewHistory value) viewHistory,
    required TResult Function(_CreateFormSupplier value) createFormSupplier,
    required TResult Function(_EditFormSupplier value) editFormSupplier,
    required TResult Function(_CreateFormMaterial value) createFormMaterial,
    required TResult Function(_CreateFormDiscount value) createFormDiscount,
    required TResult Function(_EditFormDiscount value) editFormDiscount,
    required TResult Function(_Submit value) submit,
    required TResult Function(_EditDetails value) editDetails,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_UndoConfirm value) undoConfirm,
    required TResult Function(_AccountingConfirm value) accountingConfirm,
    required TResult Function(_AccountingUndoConfirm value)
        accountingUndoConfirm,
    required TResult Function(_AccountingReject value) accountingReject,
    required TResult Function(_Close value) close,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) {
    return accountingReject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ViewHistory value)? viewHistory,
    TResult? Function(_CreateFormSupplier value)? createFormSupplier,
    TResult? Function(_EditFormSupplier value)? editFormSupplier,
    TResult? Function(_CreateFormMaterial value)? createFormMaterial,
    TResult? Function(_CreateFormDiscount value)? createFormDiscount,
    TResult? Function(_EditFormDiscount value)? editFormDiscount,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_EditDetails value)? editDetails,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_UndoConfirm value)? undoConfirm,
    TResult? Function(_AccountingConfirm value)? accountingConfirm,
    TResult? Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult? Function(_AccountingReject value)? accountingReject,
    TResult? Function(_Close value)? close,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) {
    return accountingReject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ViewHistory value)? viewHistory,
    TResult Function(_CreateFormSupplier value)? createFormSupplier,
    TResult Function(_EditFormSupplier value)? editFormSupplier,
    TResult Function(_CreateFormMaterial value)? createFormMaterial,
    TResult Function(_CreateFormDiscount value)? createFormDiscount,
    TResult Function(_EditFormDiscount value)? editFormDiscount,
    TResult Function(_Submit value)? submit,
    TResult Function(_EditDetails value)? editDetails,
    TResult Function(_Delete value)? delete,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_UndoConfirm value)? undoConfirm,
    TResult Function(_AccountingConfirm value)? accountingConfirm,
    TResult Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult Function(_AccountingReject value)? accountingReject,
    TResult Function(_Close value)? close,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) {
    if (accountingReject != null) {
      return accountingReject(this);
    }
    return orElse();
  }
}

abstract class _AccountingReject implements PurchaseOrderEvent {
  const factory _AccountingReject(
          final PurchaseOrder purchaseOrder, final String reason) =
      _$AccountingRejectImpl;

  PurchaseOrder get purchaseOrder;
  String get reason;

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AccountingRejectImplCopyWith<_$AccountingRejectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CloseImplCopyWith<$Res> {
  factory _$$CloseImplCopyWith(
          _$CloseImpl value, $Res Function(_$CloseImpl) then) =
      __$$CloseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PurchaseOrder purchaseOrder});

  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
}

/// @nodoc
class __$$CloseImplCopyWithImpl<$Res>
    extends _$PurchaseOrderEventCopyWithImpl<$Res, _$CloseImpl>
    implements _$$CloseImplCopyWith<$Res> {
  __$$CloseImplCopyWithImpl(
      _$CloseImpl _value, $Res Function(_$CloseImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseOrder = null,
  }) {
    return _then(_$CloseImpl(
      null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
    ));
  }

  /// Create a copy of PurchaseOrderEvent
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

class _$CloseImpl implements _Close {
  const _$CloseImpl(this.purchaseOrder);

  @override
  final PurchaseOrder purchaseOrder;

  @override
  String toString() {
    return 'PurchaseOrderEvent.close(purchaseOrder: $purchaseOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CloseImpl &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, purchaseOrder);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CloseImplCopyWith<_$CloseImpl> get copyWith =>
      __$$CloseImplCopyWithImpl<_$CloseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseOrder purchaseOrder) initialize,
    required TResult Function(PurchaseOrderHistory purchaseOrderHistory)
        viewHistory,
    required TResult Function(
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        createFormSupplier,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        editFormSupplier,
    required TResult Function(List<PurchaseOrderDetail> materials)
        createFormMaterial,
    required TResult Function(
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        createFormDiscount,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        editFormDiscount,
    required TResult Function() submit,
    required TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)
        editDetails,
    required TResult Function(PurchaseOrder purchaseOrder) delete,
    required TResult Function(PurchaseOrder purchaseOrder) confirm,
    required TResult Function(PurchaseOrder purchaseOrder) undoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder) accountingConfirm,
    required TResult Function(PurchaseOrder purchaseOrder)
        accountingUndoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder, String reason)
        accountingReject,
    required TResult Function(PurchaseOrder purchaseOrder) close,
    required TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)
        uploadDocument,
    required TResult Function(PurchaseOrderDocument document) documentDelete,
  }) {
    return close(purchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseOrder purchaseOrder)? initialize,
    TResult? Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult? Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult? Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult? Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult? Function()? submit,
    TResult? Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult? Function(PurchaseOrder purchaseOrder)? delete,
    TResult? Function(PurchaseOrder purchaseOrder)? confirm,
    TResult? Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult? Function(PurchaseOrder purchaseOrder)? close,
    TResult? Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult? Function(PurchaseOrderDocument document)? documentDelete,
  }) {
    return close?.call(purchaseOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseOrder purchaseOrder)? initialize,
    TResult Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult Function()? submit,
    TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult Function(PurchaseOrder purchaseOrder)? delete,
    TResult Function(PurchaseOrder purchaseOrder)? confirm,
    TResult Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult Function(PurchaseOrder purchaseOrder)? close,
    TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult Function(PurchaseOrderDocument document)? documentDelete,
    required TResult orElse(),
  }) {
    if (close != null) {
      return close(purchaseOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ViewHistory value) viewHistory,
    required TResult Function(_CreateFormSupplier value) createFormSupplier,
    required TResult Function(_EditFormSupplier value) editFormSupplier,
    required TResult Function(_CreateFormMaterial value) createFormMaterial,
    required TResult Function(_CreateFormDiscount value) createFormDiscount,
    required TResult Function(_EditFormDiscount value) editFormDiscount,
    required TResult Function(_Submit value) submit,
    required TResult Function(_EditDetails value) editDetails,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_UndoConfirm value) undoConfirm,
    required TResult Function(_AccountingConfirm value) accountingConfirm,
    required TResult Function(_AccountingUndoConfirm value)
        accountingUndoConfirm,
    required TResult Function(_AccountingReject value) accountingReject,
    required TResult Function(_Close value) close,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) {
    return close(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ViewHistory value)? viewHistory,
    TResult? Function(_CreateFormSupplier value)? createFormSupplier,
    TResult? Function(_EditFormSupplier value)? editFormSupplier,
    TResult? Function(_CreateFormMaterial value)? createFormMaterial,
    TResult? Function(_CreateFormDiscount value)? createFormDiscount,
    TResult? Function(_EditFormDiscount value)? editFormDiscount,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_EditDetails value)? editDetails,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_UndoConfirm value)? undoConfirm,
    TResult? Function(_AccountingConfirm value)? accountingConfirm,
    TResult? Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult? Function(_AccountingReject value)? accountingReject,
    TResult? Function(_Close value)? close,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) {
    return close?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ViewHistory value)? viewHistory,
    TResult Function(_CreateFormSupplier value)? createFormSupplier,
    TResult Function(_EditFormSupplier value)? editFormSupplier,
    TResult Function(_CreateFormMaterial value)? createFormMaterial,
    TResult Function(_CreateFormDiscount value)? createFormDiscount,
    TResult Function(_EditFormDiscount value)? editFormDiscount,
    TResult Function(_Submit value)? submit,
    TResult Function(_EditDetails value)? editDetails,
    TResult Function(_Delete value)? delete,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_UndoConfirm value)? undoConfirm,
    TResult Function(_AccountingConfirm value)? accountingConfirm,
    TResult Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult Function(_AccountingReject value)? accountingReject,
    TResult Function(_Close value)? close,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) {
    if (close != null) {
      return close(this);
    }
    return orElse();
  }
}

abstract class _Close implements PurchaseOrderEvent {
  const factory _Close(final PurchaseOrder purchaseOrder) = _$CloseImpl;

  PurchaseOrder get purchaseOrder;

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CloseImplCopyWith<_$CloseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UploadDocumentImplCopyWith<$Res> {
  factory _$$UploadDocumentImplCopyWith(_$UploadDocumentImpl value,
          $Res Function(_$UploadDocumentImpl) then) =
      __$$UploadDocumentImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PlatformFile file, PurchaseOrder purchaseOrder, String description});

  $PurchaseOrderCopyWith<$Res> get purchaseOrder;
}

/// @nodoc
class __$$UploadDocumentImplCopyWithImpl<$Res>
    extends _$PurchaseOrderEventCopyWithImpl<$Res, _$UploadDocumentImpl>
    implements _$$UploadDocumentImplCopyWith<$Res> {
  __$$UploadDocumentImplCopyWithImpl(
      _$UploadDocumentImpl _value, $Res Function(_$UploadDocumentImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? file = null,
    Object? purchaseOrder = null,
    Object? description = null,
  }) {
    return _then(_$UploadDocumentImpl(
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as PlatformFile,
      purchaseOrder: null == purchaseOrder
          ? _value.purchaseOrder
          : purchaseOrder // ignore: cast_nullable_to_non_nullable
              as PurchaseOrder,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of PurchaseOrderEvent
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

class _$UploadDocumentImpl implements _UploadDocument {
  const _$UploadDocumentImpl(
      {required this.file,
      required this.purchaseOrder,
      required this.description});

  @override
  final PlatformFile file;
  @override
  final PurchaseOrder purchaseOrder;
  @override
  final String description;

  @override
  String toString() {
    return 'PurchaseOrderEvent.uploadDocument(file: $file, purchaseOrder: $purchaseOrder, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadDocumentImpl &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.purchaseOrder, purchaseOrder) ||
                other.purchaseOrder == purchaseOrder) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, file, purchaseOrder, description);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadDocumentImplCopyWith<_$UploadDocumentImpl> get copyWith =>
      __$$UploadDocumentImplCopyWithImpl<_$UploadDocumentImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseOrder purchaseOrder) initialize,
    required TResult Function(PurchaseOrderHistory purchaseOrderHistory)
        viewHistory,
    required TResult Function(
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        createFormSupplier,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        editFormSupplier,
    required TResult Function(List<PurchaseOrderDetail> materials)
        createFormMaterial,
    required TResult Function(
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        createFormDiscount,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        editFormDiscount,
    required TResult Function() submit,
    required TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)
        editDetails,
    required TResult Function(PurchaseOrder purchaseOrder) delete,
    required TResult Function(PurchaseOrder purchaseOrder) confirm,
    required TResult Function(PurchaseOrder purchaseOrder) undoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder) accountingConfirm,
    required TResult Function(PurchaseOrder purchaseOrder)
        accountingUndoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder, String reason)
        accountingReject,
    required TResult Function(PurchaseOrder purchaseOrder) close,
    required TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)
        uploadDocument,
    required TResult Function(PurchaseOrderDocument document) documentDelete,
  }) {
    return uploadDocument(file, purchaseOrder, description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseOrder purchaseOrder)? initialize,
    TResult? Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult? Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult? Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult? Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult? Function()? submit,
    TResult? Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult? Function(PurchaseOrder purchaseOrder)? delete,
    TResult? Function(PurchaseOrder purchaseOrder)? confirm,
    TResult? Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult? Function(PurchaseOrder purchaseOrder)? close,
    TResult? Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult? Function(PurchaseOrderDocument document)? documentDelete,
  }) {
    return uploadDocument?.call(file, purchaseOrder, description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseOrder purchaseOrder)? initialize,
    TResult Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult Function()? submit,
    TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult Function(PurchaseOrder purchaseOrder)? delete,
    TResult Function(PurchaseOrder purchaseOrder)? confirm,
    TResult Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult Function(PurchaseOrder purchaseOrder)? close,
    TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult Function(PurchaseOrderDocument document)? documentDelete,
    required TResult orElse(),
  }) {
    if (uploadDocument != null) {
      return uploadDocument(file, purchaseOrder, description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ViewHistory value) viewHistory,
    required TResult Function(_CreateFormSupplier value) createFormSupplier,
    required TResult Function(_EditFormSupplier value) editFormSupplier,
    required TResult Function(_CreateFormMaterial value) createFormMaterial,
    required TResult Function(_CreateFormDiscount value) createFormDiscount,
    required TResult Function(_EditFormDiscount value) editFormDiscount,
    required TResult Function(_Submit value) submit,
    required TResult Function(_EditDetails value) editDetails,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_UndoConfirm value) undoConfirm,
    required TResult Function(_AccountingConfirm value) accountingConfirm,
    required TResult Function(_AccountingUndoConfirm value)
        accountingUndoConfirm,
    required TResult Function(_AccountingReject value) accountingReject,
    required TResult Function(_Close value) close,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) {
    return uploadDocument(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ViewHistory value)? viewHistory,
    TResult? Function(_CreateFormSupplier value)? createFormSupplier,
    TResult? Function(_EditFormSupplier value)? editFormSupplier,
    TResult? Function(_CreateFormMaterial value)? createFormMaterial,
    TResult? Function(_CreateFormDiscount value)? createFormDiscount,
    TResult? Function(_EditFormDiscount value)? editFormDiscount,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_EditDetails value)? editDetails,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_UndoConfirm value)? undoConfirm,
    TResult? Function(_AccountingConfirm value)? accountingConfirm,
    TResult? Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult? Function(_AccountingReject value)? accountingReject,
    TResult? Function(_Close value)? close,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) {
    return uploadDocument?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ViewHistory value)? viewHistory,
    TResult Function(_CreateFormSupplier value)? createFormSupplier,
    TResult Function(_EditFormSupplier value)? editFormSupplier,
    TResult Function(_CreateFormMaterial value)? createFormMaterial,
    TResult Function(_CreateFormDiscount value)? createFormDiscount,
    TResult Function(_EditFormDiscount value)? editFormDiscount,
    TResult Function(_Submit value)? submit,
    TResult Function(_EditDetails value)? editDetails,
    TResult Function(_Delete value)? delete,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_UndoConfirm value)? undoConfirm,
    TResult Function(_AccountingConfirm value)? accountingConfirm,
    TResult Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult Function(_AccountingReject value)? accountingReject,
    TResult Function(_Close value)? close,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) {
    if (uploadDocument != null) {
      return uploadDocument(this);
    }
    return orElse();
  }
}

abstract class _UploadDocument implements PurchaseOrderEvent {
  const factory _UploadDocument(
      {required final PlatformFile file,
      required final PurchaseOrder purchaseOrder,
      required final String description}) = _$UploadDocumentImpl;

  PlatformFile get file;
  PurchaseOrder get purchaseOrder;
  String get description;

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadDocumentImplCopyWith<_$UploadDocumentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DocumentDeleteImplCopyWith<$Res> {
  factory _$$DocumentDeleteImplCopyWith(_$DocumentDeleteImpl value,
          $Res Function(_$DocumentDeleteImpl) then) =
      __$$DocumentDeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PurchaseOrderDocument document});

  $PurchaseOrderDocumentCopyWith<$Res> get document;
}

/// @nodoc
class __$$DocumentDeleteImplCopyWithImpl<$Res>
    extends _$PurchaseOrderEventCopyWithImpl<$Res, _$DocumentDeleteImpl>
    implements _$$DocumentDeleteImplCopyWith<$Res> {
  __$$DocumentDeleteImplCopyWithImpl(
      _$DocumentDeleteImpl _value, $Res Function(_$DocumentDeleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? document = null,
  }) {
    return _then(_$DocumentDeleteImpl(
      document: null == document
          ? _value.document
          : document // ignore: cast_nullable_to_non_nullable
              as PurchaseOrderDocument,
    ));
  }

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PurchaseOrderDocumentCopyWith<$Res> get document {
    return $PurchaseOrderDocumentCopyWith<$Res>(_value.document, (value) {
      return _then(_value.copyWith(document: value));
    });
  }
}

/// @nodoc

class _$DocumentDeleteImpl implements _DocumentDelete {
  const _$DocumentDeleteImpl({required this.document});

  @override
  final PurchaseOrderDocument document;

  @override
  String toString() {
    return 'PurchaseOrderEvent.documentDelete(document: $document)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DocumentDeleteImpl &&
            (identical(other.document, document) ||
                other.document == document));
  }

  @override
  int get hashCode => Object.hash(runtimeType, document);

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DocumentDeleteImplCopyWith<_$DocumentDeleteImpl> get copyWith =>
      __$$DocumentDeleteImplCopyWithImpl<_$DocumentDeleteImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(PurchaseOrder purchaseOrder) initialize,
    required TResult Function(PurchaseOrderHistory purchaseOrderHistory)
        viewHistory,
    required TResult Function(
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        createFormSupplier,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)
        editFormSupplier,
    required TResult Function(List<PurchaseOrderDetail> materials)
        createFormMaterial,
    required TResult Function(
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        createFormDiscount,
    required TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)
        editFormDiscount,
    required TResult Function() submit,
    required TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)
        editDetails,
    required TResult Function(PurchaseOrder purchaseOrder) delete,
    required TResult Function(PurchaseOrder purchaseOrder) confirm,
    required TResult Function(PurchaseOrder purchaseOrder) undoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder) accountingConfirm,
    required TResult Function(PurchaseOrder purchaseOrder)
        accountingUndoConfirm,
    required TResult Function(PurchaseOrder purchaseOrder, String reason)
        accountingReject,
    required TResult Function(PurchaseOrder purchaseOrder) close,
    required TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)
        uploadDocument,
    required TResult Function(PurchaseOrderDocument document) documentDelete,
  }) {
    return documentDelete(document);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(PurchaseOrder purchaseOrder)? initialize,
    TResult? Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult? Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult? Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult? Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult? Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult? Function()? submit,
    TResult? Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult? Function(PurchaseOrder purchaseOrder)? delete,
    TResult? Function(PurchaseOrder purchaseOrder)? confirm,
    TResult? Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult? Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult? Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult? Function(PurchaseOrder purchaseOrder)? close,
    TResult? Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult? Function(PurchaseOrderDocument document)? documentDelete,
  }) {
    return documentDelete?.call(document);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(PurchaseOrder purchaseOrder)? initialize,
    TResult Function(PurchaseOrderHistory purchaseOrderHistory)? viewHistory,
    TResult Function(PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        createFormSupplier,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormSupplier purchaseOrderFormSupplier)?
        editFormSupplier,
    TResult Function(List<PurchaseOrderDetail> materials)? createFormMaterial,
    TResult Function(PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        createFormDiscount,
    TResult Function(PurchaseOrder purchaseOrder,
            PurchaseOrderFormDiscount purchaseOrderFormDiscount)?
        editFormDiscount,
    TResult Function()? submit,
    TResult Function(
            PurchaseOrder purchaseOrder, List<PurchaseOrderDetail> details)?
        editDetails,
    TResult Function(PurchaseOrder purchaseOrder)? delete,
    TResult Function(PurchaseOrder purchaseOrder)? confirm,
    TResult Function(PurchaseOrder purchaseOrder)? undoConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingConfirm,
    TResult Function(PurchaseOrder purchaseOrder)? accountingUndoConfirm,
    TResult Function(PurchaseOrder purchaseOrder, String reason)?
        accountingReject,
    TResult Function(PurchaseOrder purchaseOrder)? close,
    TResult Function(
            PlatformFile file, PurchaseOrder purchaseOrder, String description)?
        uploadDocument,
    TResult Function(PurchaseOrderDocument document)? documentDelete,
    required TResult orElse(),
  }) {
    if (documentDelete != null) {
      return documentDelete(document);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_ViewHistory value) viewHistory,
    required TResult Function(_CreateFormSupplier value) createFormSupplier,
    required TResult Function(_EditFormSupplier value) editFormSupplier,
    required TResult Function(_CreateFormMaterial value) createFormMaterial,
    required TResult Function(_CreateFormDiscount value) createFormDiscount,
    required TResult Function(_EditFormDiscount value) editFormDiscount,
    required TResult Function(_Submit value) submit,
    required TResult Function(_EditDetails value) editDetails,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Confirm value) confirm,
    required TResult Function(_UndoConfirm value) undoConfirm,
    required TResult Function(_AccountingConfirm value) accountingConfirm,
    required TResult Function(_AccountingUndoConfirm value)
        accountingUndoConfirm,
    required TResult Function(_AccountingReject value) accountingReject,
    required TResult Function(_Close value) close,
    required TResult Function(_UploadDocument value) uploadDocument,
    required TResult Function(_DocumentDelete value) documentDelete,
  }) {
    return documentDelete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_ViewHistory value)? viewHistory,
    TResult? Function(_CreateFormSupplier value)? createFormSupplier,
    TResult? Function(_EditFormSupplier value)? editFormSupplier,
    TResult? Function(_CreateFormMaterial value)? createFormMaterial,
    TResult? Function(_CreateFormDiscount value)? createFormDiscount,
    TResult? Function(_EditFormDiscount value)? editFormDiscount,
    TResult? Function(_Submit value)? submit,
    TResult? Function(_EditDetails value)? editDetails,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Confirm value)? confirm,
    TResult? Function(_UndoConfirm value)? undoConfirm,
    TResult? Function(_AccountingConfirm value)? accountingConfirm,
    TResult? Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult? Function(_AccountingReject value)? accountingReject,
    TResult? Function(_Close value)? close,
    TResult? Function(_UploadDocument value)? uploadDocument,
    TResult? Function(_DocumentDelete value)? documentDelete,
  }) {
    return documentDelete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_ViewHistory value)? viewHistory,
    TResult Function(_CreateFormSupplier value)? createFormSupplier,
    TResult Function(_EditFormSupplier value)? editFormSupplier,
    TResult Function(_CreateFormMaterial value)? createFormMaterial,
    TResult Function(_CreateFormDiscount value)? createFormDiscount,
    TResult Function(_EditFormDiscount value)? editFormDiscount,
    TResult Function(_Submit value)? submit,
    TResult Function(_EditDetails value)? editDetails,
    TResult Function(_Delete value)? delete,
    TResult Function(_Confirm value)? confirm,
    TResult Function(_UndoConfirm value)? undoConfirm,
    TResult Function(_AccountingConfirm value)? accountingConfirm,
    TResult Function(_AccountingUndoConfirm value)? accountingUndoConfirm,
    TResult Function(_AccountingReject value)? accountingReject,
    TResult Function(_Close value)? close,
    TResult Function(_UploadDocument value)? uploadDocument,
    TResult Function(_DocumentDelete value)? documentDelete,
    required TResult orElse(),
  }) {
    if (documentDelete != null) {
      return documentDelete(this);
    }
    return orElse();
  }
}

abstract class _DocumentDelete implements PurchaseOrderEvent {
  const factory _DocumentDelete(
      {required final PurchaseOrderDocument document}) = _$DocumentDeleteImpl;

  PurchaseOrderDocument get document;

  /// Create a copy of PurchaseOrderEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DocumentDeleteImplCopyWith<_$DocumentDeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
