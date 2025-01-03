// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
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
abstract class $ProductStateCopyWith<$Res> {
  factory $ProductStateCopyWith(
          ProductState value, $Res Function(ProductState) then) =
      _$ProductStateCopyWithImpl<$Res, ProductState>;
}

/// @nodoc
class _$ProductStateCopyWithImpl<$Res, $Val extends ProductState>
    implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._value, this._then);

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
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ProductState.initial()';
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
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
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

abstract class _Initial implements ProductState {
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
    extends _$ProductStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'ProductState.loading()';
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
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
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

abstract class _Loading implements ProductState {
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
    extends _$ProductStateCopyWithImpl<$Res, _$SuccessImpl>
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
    return 'ProductState.success()';
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
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
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

abstract class _Success implements ProductState {
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
    extends _$ProductStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'ProductState.error(error: $error)';
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
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
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

abstract class _Error implements ProductState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType,
            String companyId)
        create,
    required TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType)
        update,
    required TResult Function(String id) delete,
    required TResult Function(String id) activate,
    required TResult Function(String id) deactivate,
    required TResult Function(Product product) phasedOut,
    required TResult Function(Product product) notPhasedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType,
            String companyId)?
        create,
    TResult? Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType)?
        update,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? activate,
    TResult? Function(String id)? deactivate,
    TResult? Function(Product product)? phasedOut,
    TResult? Function(Product product)? notPhasedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType,
            String companyId)?
        create,
    TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType)?
        update,
    TResult Function(String id)? delete,
    TResult Function(String id)? activate,
    TResult Function(String id)? deactivate,
    TResult Function(Product product)? phasedOut,
    TResult Function(Product product)? notPhasedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Activate value) activate,
    required TResult Function(_Deactivate value) deactivate,
    required TResult Function(_PhasedOut value) phasedOut,
    required TResult Function(_NotPhasedOut value) notPhasedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Activate value)? activate,
    TResult? Function(_Deactivate value)? deactivate,
    TResult? Function(_PhasedOut value)? phasedOut,
    TResult? Function(_NotPhasedOut value)? notPhasedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    TResult Function(_Activate value)? activate,
    TResult Function(_Deactivate value)? deactivate,
    TResult Function(_PhasedOut value)? phasedOut,
    TResult Function(_NotPhasedOut value)? notPhasedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductEventCopyWith<$Res> {
  factory $ProductEventCopyWith(
          ProductEvent value, $Res Function(ProductEvent) then) =
      _$ProductEventCopyWithImpl<$Res, ProductEvent>;
}

/// @nodoc
class _$ProductEventCopyWithImpl<$Res, $Val extends ProductEvent>
    implements $ProductEventCopyWith<$Res> {
  _$ProductEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CreateImplCopyWith<$Res> {
  factory _$$CreateImplCopyWith(
          _$CreateImpl value, $Res Function(_$CreateImpl) then) =
      __$$CreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String id,
      String no,
      String name,
      String type,
      ProductGroup productGroup,
      MaterialUnit unitPacking,
      MaterialUnit unitSmallest,
      MaterialUnit unitOrder,
      MaterialUnit unitSecondary,
      int expiryPeriod,
      bool tollOut,
      int quantityTablet,
      int quantityStrip,
      int quantityBatch,
      int quantityPack,
      DivisionType divisionType,
      String companyId});

  $ProductGroupCopyWith<$Res> get productGroup;
  $MaterialUnitCopyWith<$Res> get unitPacking;
  $MaterialUnitCopyWith<$Res> get unitSmallest;
  $MaterialUnitCopyWith<$Res> get unitOrder;
  $MaterialUnitCopyWith<$Res> get unitSecondary;
}

/// @nodoc
class __$$CreateImplCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$CreateImpl>
    implements _$$CreateImplCopyWith<$Res> {
  __$$CreateImplCopyWithImpl(
      _$CreateImpl _value, $Res Function(_$CreateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? no = null,
    Object? name = null,
    Object? type = null,
    Object? productGroup = null,
    Object? unitPacking = null,
    Object? unitSmallest = null,
    Object? unitOrder = null,
    Object? unitSecondary = null,
    Object? expiryPeriod = null,
    Object? tollOut = null,
    Object? quantityTablet = null,
    Object? quantityStrip = null,
    Object? quantityBatch = null,
    Object? quantityPack = null,
    Object? divisionType = null,
    Object? companyId = null,
  }) {
    return _then(_$CreateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      productGroup: null == productGroup
          ? _value.productGroup
          : productGroup // ignore: cast_nullable_to_non_nullable
              as ProductGroup,
      unitPacking: null == unitPacking
          ? _value.unitPacking
          : unitPacking // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      unitSmallest: null == unitSmallest
          ? _value.unitSmallest
          : unitSmallest // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      unitOrder: null == unitOrder
          ? _value.unitOrder
          : unitOrder // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      unitSecondary: null == unitSecondary
          ? _value.unitSecondary
          : unitSecondary // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      expiryPeriod: null == expiryPeriod
          ? _value.expiryPeriod
          : expiryPeriod // ignore: cast_nullable_to_non_nullable
              as int,
      tollOut: null == tollOut
          ? _value.tollOut
          : tollOut // ignore: cast_nullable_to_non_nullable
              as bool,
      quantityTablet: null == quantityTablet
          ? _value.quantityTablet
          : quantityTablet // ignore: cast_nullable_to_non_nullable
              as int,
      quantityStrip: null == quantityStrip
          ? _value.quantityStrip
          : quantityStrip // ignore: cast_nullable_to_non_nullable
              as int,
      quantityBatch: null == quantityBatch
          ? _value.quantityBatch
          : quantityBatch // ignore: cast_nullable_to_non_nullable
              as int,
      quantityPack: null == quantityPack
          ? _value.quantityPack
          : quantityPack // ignore: cast_nullable_to_non_nullable
              as int,
      divisionType: null == divisionType
          ? _value.divisionType
          : divisionType // ignore: cast_nullable_to_non_nullable
              as DivisionType,
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductGroupCopyWith<$Res> get productGroup {
    return $ProductGroupCopyWith<$Res>(_value.productGroup, (value) {
      return _then(_value.copyWith(productGroup: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get unitPacking {
    return $MaterialUnitCopyWith<$Res>(_value.unitPacking, (value) {
      return _then(_value.copyWith(unitPacking: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get unitSmallest {
    return $MaterialUnitCopyWith<$Res>(_value.unitSmallest, (value) {
      return _then(_value.copyWith(unitSmallest: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get unitOrder {
    return $MaterialUnitCopyWith<$Res>(_value.unitOrder, (value) {
      return _then(_value.copyWith(unitOrder: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get unitSecondary {
    return $MaterialUnitCopyWith<$Res>(_value.unitSecondary, (value) {
      return _then(_value.copyWith(unitSecondary: value));
    });
  }
}

/// @nodoc

class _$CreateImpl implements _Create {
  const _$CreateImpl(
      {required this.id,
      required this.no,
      required this.name,
      required this.type,
      required this.productGroup,
      required this.unitPacking,
      required this.unitSmallest,
      required this.unitOrder,
      required this.unitSecondary,
      required this.expiryPeriod,
      required this.tollOut,
      required this.quantityTablet,
      required this.quantityStrip,
      required this.quantityBatch,
      required this.quantityPack,
      required this.divisionType,
      required this.companyId});

  @override
  final String id;
  @override
  final String no;
  @override
  final String name;
  @override
  final String type;
  @override
  final ProductGroup productGroup;
  @override
  final MaterialUnit unitPacking;
  @override
  final MaterialUnit unitSmallest;
  @override
  final MaterialUnit unitOrder;
  @override
  final MaterialUnit unitSecondary;
  @override
  final int expiryPeriod;
  @override
  final bool tollOut;
  @override
  final int quantityTablet;
  @override
  final int quantityStrip;
  @override
  final int quantityBatch;
  @override
  final int quantityPack;
  @override
  final DivisionType divisionType;
  @override
  final String companyId;

  @override
  String toString() {
    return 'ProductEvent.create(id: $id, no: $no, name: $name, type: $type, productGroup: $productGroup, unitPacking: $unitPacking, unitSmallest: $unitSmallest, unitOrder: $unitOrder, unitSecondary: $unitSecondary, expiryPeriod: $expiryPeriod, tollOut: $tollOut, quantityTablet: $quantityTablet, quantityStrip: $quantityStrip, quantityBatch: $quantityBatch, quantityPack: $quantityPack, divisionType: $divisionType, companyId: $companyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.no, no) || other.no == no) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.productGroup, productGroup) ||
                other.productGroup == productGroup) &&
            (identical(other.unitPacking, unitPacking) ||
                other.unitPacking == unitPacking) &&
            (identical(other.unitSmallest, unitSmallest) ||
                other.unitSmallest == unitSmallest) &&
            (identical(other.unitOrder, unitOrder) ||
                other.unitOrder == unitOrder) &&
            (identical(other.unitSecondary, unitSecondary) ||
                other.unitSecondary == unitSecondary) &&
            (identical(other.expiryPeriod, expiryPeriod) ||
                other.expiryPeriod == expiryPeriod) &&
            (identical(other.tollOut, tollOut) || other.tollOut == tollOut) &&
            (identical(other.quantityTablet, quantityTablet) ||
                other.quantityTablet == quantityTablet) &&
            (identical(other.quantityStrip, quantityStrip) ||
                other.quantityStrip == quantityStrip) &&
            (identical(other.quantityBatch, quantityBatch) ||
                other.quantityBatch == quantityBatch) &&
            (identical(other.quantityPack, quantityPack) ||
                other.quantityPack == quantityPack) &&
            (identical(other.divisionType, divisionType) ||
                other.divisionType == divisionType) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      no,
      name,
      type,
      productGroup,
      unitPacking,
      unitSmallest,
      unitOrder,
      unitSecondary,
      expiryPeriod,
      tollOut,
      quantityTablet,
      quantityStrip,
      quantityBatch,
      quantityPack,
      divisionType,
      companyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      __$$CreateImplCopyWithImpl<_$CreateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType,
            String companyId)
        create,
    required TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType)
        update,
    required TResult Function(String id) delete,
    required TResult Function(String id) activate,
    required TResult Function(String id) deactivate,
    required TResult Function(Product product) phasedOut,
    required TResult Function(Product product) notPhasedOut,
  }) {
    return create(
        id,
        no,
        name,
        type,
        productGroup,
        unitPacking,
        unitSmallest,
        unitOrder,
        unitSecondary,
        expiryPeriod,
        tollOut,
        quantityTablet,
        quantityStrip,
        quantityBatch,
        quantityPack,
        divisionType,
        companyId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType,
            String companyId)?
        create,
    TResult? Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType)?
        update,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? activate,
    TResult? Function(String id)? deactivate,
    TResult? Function(Product product)? phasedOut,
    TResult? Function(Product product)? notPhasedOut,
  }) {
    return create?.call(
        id,
        no,
        name,
        type,
        productGroup,
        unitPacking,
        unitSmallest,
        unitOrder,
        unitSecondary,
        expiryPeriod,
        tollOut,
        quantityTablet,
        quantityStrip,
        quantityBatch,
        quantityPack,
        divisionType,
        companyId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType,
            String companyId)?
        create,
    TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType)?
        update,
    TResult Function(String id)? delete,
    TResult Function(String id)? activate,
    TResult Function(String id)? deactivate,
    TResult Function(Product product)? phasedOut,
    TResult Function(Product product)? notPhasedOut,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(
          id,
          no,
          name,
          type,
          productGroup,
          unitPacking,
          unitSmallest,
          unitOrder,
          unitSecondary,
          expiryPeriod,
          tollOut,
          quantityTablet,
          quantityStrip,
          quantityBatch,
          quantityPack,
          divisionType,
          companyId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Activate value) activate,
    required TResult Function(_Deactivate value) deactivate,
    required TResult Function(_PhasedOut value) phasedOut,
    required TResult Function(_NotPhasedOut value) notPhasedOut,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Activate value)? activate,
    TResult? Function(_Deactivate value)? deactivate,
    TResult? Function(_PhasedOut value)? phasedOut,
    TResult? Function(_NotPhasedOut value)? notPhasedOut,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    TResult Function(_Activate value)? activate,
    TResult Function(_Deactivate value)? deactivate,
    TResult Function(_PhasedOut value)? phasedOut,
    TResult Function(_NotPhasedOut value)? notPhasedOut,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class _Create implements ProductEvent {
  const factory _Create(
      {required final String id,
      required final String no,
      required final String name,
      required final String type,
      required final ProductGroup productGroup,
      required final MaterialUnit unitPacking,
      required final MaterialUnit unitSmallest,
      required final MaterialUnit unitOrder,
      required final MaterialUnit unitSecondary,
      required final int expiryPeriod,
      required final bool tollOut,
      required final int quantityTablet,
      required final int quantityStrip,
      required final int quantityBatch,
      required final int quantityPack,
      required final DivisionType divisionType,
      required final String companyId}) = _$CreateImpl;

  String get id;
  String get no;
  String get name;
  String get type;
  ProductGroup get productGroup;
  MaterialUnit get unitPacking;
  MaterialUnit get unitSmallest;
  MaterialUnit get unitOrder;
  MaterialUnit get unitSecondary;
  int get expiryPeriod;
  bool get tollOut;
  int get quantityTablet;
  int get quantityStrip;
  int get quantityBatch;
  int get quantityPack;
  DivisionType get divisionType;
  String get companyId;
  @JsonKey(ignore: true)
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateImplCopyWith<$Res> {
  factory _$$UpdateImplCopyWith(
          _$UpdateImpl value, $Res Function(_$UpdateImpl) then) =
      __$$UpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String id,
      String no,
      String name,
      String type,
      ProductGroup productGroup,
      MaterialUnit unitPacking,
      MaterialUnit unitSmallest,
      MaterialUnit unitOrder,
      MaterialUnit unitSecondary,
      int expiryPeriod,
      bool tollOut,
      int quantityTablet,
      int quantityStrip,
      int quantityBatch,
      int quantityPack,
      DivisionType divisionType});

  $ProductGroupCopyWith<$Res> get productGroup;
  $MaterialUnitCopyWith<$Res> get unitPacking;
  $MaterialUnitCopyWith<$Res> get unitSmallest;
  $MaterialUnitCopyWith<$Res> get unitOrder;
  $MaterialUnitCopyWith<$Res> get unitSecondary;
}

/// @nodoc
class __$$UpdateImplCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$UpdateImpl>
    implements _$$UpdateImplCopyWith<$Res> {
  __$$UpdateImplCopyWithImpl(
      _$UpdateImpl _value, $Res Function(_$UpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? no = null,
    Object? name = null,
    Object? type = null,
    Object? productGroup = null,
    Object? unitPacking = null,
    Object? unitSmallest = null,
    Object? unitOrder = null,
    Object? unitSecondary = null,
    Object? expiryPeriod = null,
    Object? tollOut = null,
    Object? quantityTablet = null,
    Object? quantityStrip = null,
    Object? quantityBatch = null,
    Object? quantityPack = null,
    Object? divisionType = null,
  }) {
    return _then(_$UpdateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      no: null == no
          ? _value.no
          : no // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      productGroup: null == productGroup
          ? _value.productGroup
          : productGroup // ignore: cast_nullable_to_non_nullable
              as ProductGroup,
      unitPacking: null == unitPacking
          ? _value.unitPacking
          : unitPacking // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      unitSmallest: null == unitSmallest
          ? _value.unitSmallest
          : unitSmallest // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      unitOrder: null == unitOrder
          ? _value.unitOrder
          : unitOrder // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      unitSecondary: null == unitSecondary
          ? _value.unitSecondary
          : unitSecondary // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      expiryPeriod: null == expiryPeriod
          ? _value.expiryPeriod
          : expiryPeriod // ignore: cast_nullable_to_non_nullable
              as int,
      tollOut: null == tollOut
          ? _value.tollOut
          : tollOut // ignore: cast_nullable_to_non_nullable
              as bool,
      quantityTablet: null == quantityTablet
          ? _value.quantityTablet
          : quantityTablet // ignore: cast_nullable_to_non_nullable
              as int,
      quantityStrip: null == quantityStrip
          ? _value.quantityStrip
          : quantityStrip // ignore: cast_nullable_to_non_nullable
              as int,
      quantityBatch: null == quantityBatch
          ? _value.quantityBatch
          : quantityBatch // ignore: cast_nullable_to_non_nullable
              as int,
      quantityPack: null == quantityPack
          ? _value.quantityPack
          : quantityPack // ignore: cast_nullable_to_non_nullable
              as int,
      divisionType: null == divisionType
          ? _value.divisionType
          : divisionType // ignore: cast_nullable_to_non_nullable
              as DivisionType,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductGroupCopyWith<$Res> get productGroup {
    return $ProductGroupCopyWith<$Res>(_value.productGroup, (value) {
      return _then(_value.copyWith(productGroup: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get unitPacking {
    return $MaterialUnitCopyWith<$Res>(_value.unitPacking, (value) {
      return _then(_value.copyWith(unitPacking: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get unitSmallest {
    return $MaterialUnitCopyWith<$Res>(_value.unitSmallest, (value) {
      return _then(_value.copyWith(unitSmallest: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get unitOrder {
    return $MaterialUnitCopyWith<$Res>(_value.unitOrder, (value) {
      return _then(_value.copyWith(unitOrder: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get unitSecondary {
    return $MaterialUnitCopyWith<$Res>(_value.unitSecondary, (value) {
      return _then(_value.copyWith(unitSecondary: value));
    });
  }
}

/// @nodoc

class _$UpdateImpl implements _Update {
  const _$UpdateImpl(
      {required this.id,
      required this.no,
      required this.name,
      required this.type,
      required this.productGroup,
      required this.unitPacking,
      required this.unitSmallest,
      required this.unitOrder,
      required this.unitSecondary,
      required this.expiryPeriod,
      required this.tollOut,
      required this.quantityTablet,
      required this.quantityStrip,
      required this.quantityBatch,
      required this.quantityPack,
      required this.divisionType});

  @override
  final String id;
  @override
  final String no;
  @override
  final String name;
  @override
  final String type;
  @override
  final ProductGroup productGroup;
  @override
  final MaterialUnit unitPacking;
  @override
  final MaterialUnit unitSmallest;
  @override
  final MaterialUnit unitOrder;
  @override
  final MaterialUnit unitSecondary;
  @override
  final int expiryPeriod;
  @override
  final bool tollOut;
  @override
  final int quantityTablet;
  @override
  final int quantityStrip;
  @override
  final int quantityBatch;
  @override
  final int quantityPack;
  @override
  final DivisionType divisionType;

  @override
  String toString() {
    return 'ProductEvent.update(id: $id, no: $no, name: $name, type: $type, productGroup: $productGroup, unitPacking: $unitPacking, unitSmallest: $unitSmallest, unitOrder: $unitOrder, unitSecondary: $unitSecondary, expiryPeriod: $expiryPeriod, tollOut: $tollOut, quantityTablet: $quantityTablet, quantityStrip: $quantityStrip, quantityBatch: $quantityBatch, quantityPack: $quantityPack, divisionType: $divisionType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.no, no) || other.no == no) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.productGroup, productGroup) ||
                other.productGroup == productGroup) &&
            (identical(other.unitPacking, unitPacking) ||
                other.unitPacking == unitPacking) &&
            (identical(other.unitSmallest, unitSmallest) ||
                other.unitSmallest == unitSmallest) &&
            (identical(other.unitOrder, unitOrder) ||
                other.unitOrder == unitOrder) &&
            (identical(other.unitSecondary, unitSecondary) ||
                other.unitSecondary == unitSecondary) &&
            (identical(other.expiryPeriod, expiryPeriod) ||
                other.expiryPeriod == expiryPeriod) &&
            (identical(other.tollOut, tollOut) || other.tollOut == tollOut) &&
            (identical(other.quantityTablet, quantityTablet) ||
                other.quantityTablet == quantityTablet) &&
            (identical(other.quantityStrip, quantityStrip) ||
                other.quantityStrip == quantityStrip) &&
            (identical(other.quantityBatch, quantityBatch) ||
                other.quantityBatch == quantityBatch) &&
            (identical(other.quantityPack, quantityPack) ||
                other.quantityPack == quantityPack) &&
            (identical(other.divisionType, divisionType) ||
                other.divisionType == divisionType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      no,
      name,
      type,
      productGroup,
      unitPacking,
      unitSmallest,
      unitOrder,
      unitSecondary,
      expiryPeriod,
      tollOut,
      quantityTablet,
      quantityStrip,
      quantityBatch,
      quantityPack,
      divisionType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      __$$UpdateImplCopyWithImpl<_$UpdateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType,
            String companyId)
        create,
    required TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType)
        update,
    required TResult Function(String id) delete,
    required TResult Function(String id) activate,
    required TResult Function(String id) deactivate,
    required TResult Function(Product product) phasedOut,
    required TResult Function(Product product) notPhasedOut,
  }) {
    return update(
        id,
        no,
        name,
        type,
        productGroup,
        unitPacking,
        unitSmallest,
        unitOrder,
        unitSecondary,
        expiryPeriod,
        tollOut,
        quantityTablet,
        quantityStrip,
        quantityBatch,
        quantityPack,
        divisionType);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType,
            String companyId)?
        create,
    TResult? Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType)?
        update,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? activate,
    TResult? Function(String id)? deactivate,
    TResult? Function(Product product)? phasedOut,
    TResult? Function(Product product)? notPhasedOut,
  }) {
    return update?.call(
        id,
        no,
        name,
        type,
        productGroup,
        unitPacking,
        unitSmallest,
        unitOrder,
        unitSecondary,
        expiryPeriod,
        tollOut,
        quantityTablet,
        quantityStrip,
        quantityBatch,
        quantityPack,
        divisionType);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType,
            String companyId)?
        create,
    TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType)?
        update,
    TResult Function(String id)? delete,
    TResult Function(String id)? activate,
    TResult Function(String id)? deactivate,
    TResult Function(Product product)? phasedOut,
    TResult Function(Product product)? notPhasedOut,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(
          id,
          no,
          name,
          type,
          productGroup,
          unitPacking,
          unitSmallest,
          unitOrder,
          unitSecondary,
          expiryPeriod,
          tollOut,
          quantityTablet,
          quantityStrip,
          quantityBatch,
          quantityPack,
          divisionType);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Activate value) activate,
    required TResult Function(_Deactivate value) deactivate,
    required TResult Function(_PhasedOut value) phasedOut,
    required TResult Function(_NotPhasedOut value) notPhasedOut,
  }) {
    return update(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Activate value)? activate,
    TResult? Function(_Deactivate value)? deactivate,
    TResult? Function(_PhasedOut value)? phasedOut,
    TResult? Function(_NotPhasedOut value)? notPhasedOut,
  }) {
    return update?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    TResult Function(_Activate value)? activate,
    TResult Function(_Deactivate value)? deactivate,
    TResult Function(_PhasedOut value)? phasedOut,
    TResult Function(_NotPhasedOut value)? notPhasedOut,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements ProductEvent {
  const factory _Update(
      {required final String id,
      required final String no,
      required final String name,
      required final String type,
      required final ProductGroup productGroup,
      required final MaterialUnit unitPacking,
      required final MaterialUnit unitSmallest,
      required final MaterialUnit unitOrder,
      required final MaterialUnit unitSecondary,
      required final int expiryPeriod,
      required final bool tollOut,
      required final int quantityTablet,
      required final int quantityStrip,
      required final int quantityBatch,
      required final int quantityPack,
      required final DivisionType divisionType}) = _$UpdateImpl;

  String get id;
  String get no;
  String get name;
  String get type;
  ProductGroup get productGroup;
  MaterialUnit get unitPacking;
  MaterialUnit get unitSmallest;
  MaterialUnit get unitOrder;
  MaterialUnit get unitSecondary;
  int get expiryPeriod;
  bool get tollOut;
  int get quantityTablet;
  int get quantityStrip;
  int get quantityBatch;
  int get quantityPack;
  DivisionType get divisionType;
  @JsonKey(ignore: true)
  _$$UpdateImplCopyWith<_$UpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteImpl implements _Delete {
  const _$DeleteImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'ProductEvent.delete(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      __$$DeleteImplCopyWithImpl<_$DeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType,
            String companyId)
        create,
    required TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType)
        update,
    required TResult Function(String id) delete,
    required TResult Function(String id) activate,
    required TResult Function(String id) deactivate,
    required TResult Function(Product product) phasedOut,
    required TResult Function(Product product) notPhasedOut,
  }) {
    return delete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType,
            String companyId)?
        create,
    TResult? Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType)?
        update,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? activate,
    TResult? Function(String id)? deactivate,
    TResult? Function(Product product)? phasedOut,
    TResult? Function(Product product)? notPhasedOut,
  }) {
    return delete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType,
            String companyId)?
        create,
    TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType)?
        update,
    TResult Function(String id)? delete,
    TResult Function(String id)? activate,
    TResult Function(String id)? deactivate,
    TResult Function(Product product)? phasedOut,
    TResult Function(Product product)? notPhasedOut,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Activate value) activate,
    required TResult Function(_Deactivate value) deactivate,
    required TResult Function(_PhasedOut value) phasedOut,
    required TResult Function(_NotPhasedOut value) notPhasedOut,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Activate value)? activate,
    TResult? Function(_Deactivate value)? deactivate,
    TResult? Function(_PhasedOut value)? phasedOut,
    TResult? Function(_NotPhasedOut value)? notPhasedOut,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    TResult Function(_Activate value)? activate,
    TResult Function(_Deactivate value)? deactivate,
    TResult Function(_PhasedOut value)? phasedOut,
    TResult Function(_NotPhasedOut value)? notPhasedOut,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements ProductEvent {
  const factory _Delete(final String id) = _$DeleteImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ActivateImplCopyWith<$Res> {
  factory _$$ActivateImplCopyWith(
          _$ActivateImpl value, $Res Function(_$ActivateImpl) then) =
      __$$ActivateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$ActivateImplCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$ActivateImpl>
    implements _$$ActivateImplCopyWith<$Res> {
  __$$ActivateImplCopyWithImpl(
      _$ActivateImpl _value, $Res Function(_$ActivateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$ActivateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ActivateImpl implements _Activate {
  const _$ActivateImpl({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'ProductEvent.activate(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivateImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivateImplCopyWith<_$ActivateImpl> get copyWith =>
      __$$ActivateImplCopyWithImpl<_$ActivateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType,
            String companyId)
        create,
    required TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType)
        update,
    required TResult Function(String id) delete,
    required TResult Function(String id) activate,
    required TResult Function(String id) deactivate,
    required TResult Function(Product product) phasedOut,
    required TResult Function(Product product) notPhasedOut,
  }) {
    return activate(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType,
            String companyId)?
        create,
    TResult? Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType)?
        update,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? activate,
    TResult? Function(String id)? deactivate,
    TResult? Function(Product product)? phasedOut,
    TResult? Function(Product product)? notPhasedOut,
  }) {
    return activate?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType,
            String companyId)?
        create,
    TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType)?
        update,
    TResult Function(String id)? delete,
    TResult Function(String id)? activate,
    TResult Function(String id)? deactivate,
    TResult Function(Product product)? phasedOut,
    TResult Function(Product product)? notPhasedOut,
    required TResult orElse(),
  }) {
    if (activate != null) {
      return activate(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Activate value) activate,
    required TResult Function(_Deactivate value) deactivate,
    required TResult Function(_PhasedOut value) phasedOut,
    required TResult Function(_NotPhasedOut value) notPhasedOut,
  }) {
    return activate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Activate value)? activate,
    TResult? Function(_Deactivate value)? deactivate,
    TResult? Function(_PhasedOut value)? phasedOut,
    TResult? Function(_NotPhasedOut value)? notPhasedOut,
  }) {
    return activate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    TResult Function(_Activate value)? activate,
    TResult Function(_Deactivate value)? deactivate,
    TResult Function(_PhasedOut value)? phasedOut,
    TResult Function(_NotPhasedOut value)? notPhasedOut,
    required TResult orElse(),
  }) {
    if (activate != null) {
      return activate(this);
    }
    return orElse();
  }
}

abstract class _Activate implements ProductEvent {
  const factory _Activate({required final String id}) = _$ActivateImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$ActivateImplCopyWith<_$ActivateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeactivateImplCopyWith<$Res> {
  factory _$$DeactivateImplCopyWith(
          _$DeactivateImpl value, $Res Function(_$DeactivateImpl) then) =
      __$$DeactivateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$DeactivateImplCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$DeactivateImpl>
    implements _$$DeactivateImplCopyWith<$Res> {
  __$$DeactivateImplCopyWithImpl(
      _$DeactivateImpl _value, $Res Function(_$DeactivateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeactivateImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeactivateImpl implements _Deactivate {
  const _$DeactivateImpl({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'ProductEvent.deactivate(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeactivateImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeactivateImplCopyWith<_$DeactivateImpl> get copyWith =>
      __$$DeactivateImplCopyWithImpl<_$DeactivateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType,
            String companyId)
        create,
    required TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType)
        update,
    required TResult Function(String id) delete,
    required TResult Function(String id) activate,
    required TResult Function(String id) deactivate,
    required TResult Function(Product product) phasedOut,
    required TResult Function(Product product) notPhasedOut,
  }) {
    return deactivate(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType,
            String companyId)?
        create,
    TResult? Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType)?
        update,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? activate,
    TResult? Function(String id)? deactivate,
    TResult? Function(Product product)? phasedOut,
    TResult? Function(Product product)? notPhasedOut,
  }) {
    return deactivate?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType,
            String companyId)?
        create,
    TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType)?
        update,
    TResult Function(String id)? delete,
    TResult Function(String id)? activate,
    TResult Function(String id)? deactivate,
    TResult Function(Product product)? phasedOut,
    TResult Function(Product product)? notPhasedOut,
    required TResult orElse(),
  }) {
    if (deactivate != null) {
      return deactivate(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Activate value) activate,
    required TResult Function(_Deactivate value) deactivate,
    required TResult Function(_PhasedOut value) phasedOut,
    required TResult Function(_NotPhasedOut value) notPhasedOut,
  }) {
    return deactivate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Activate value)? activate,
    TResult? Function(_Deactivate value)? deactivate,
    TResult? Function(_PhasedOut value)? phasedOut,
    TResult? Function(_NotPhasedOut value)? notPhasedOut,
  }) {
    return deactivate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    TResult Function(_Activate value)? activate,
    TResult Function(_Deactivate value)? deactivate,
    TResult Function(_PhasedOut value)? phasedOut,
    TResult Function(_NotPhasedOut value)? notPhasedOut,
    required TResult orElse(),
  }) {
    if (deactivate != null) {
      return deactivate(this);
    }
    return orElse();
  }
}

abstract class _Deactivate implements ProductEvent {
  const factory _Deactivate({required final String id}) = _$DeactivateImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$DeactivateImplCopyWith<_$DeactivateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PhasedOutImplCopyWith<$Res> {
  factory _$$PhasedOutImplCopyWith(
          _$PhasedOutImpl value, $Res Function(_$PhasedOutImpl) then) =
      __$$PhasedOutImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$PhasedOutImplCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$PhasedOutImpl>
    implements _$$PhasedOutImplCopyWith<$Res> {
  __$$PhasedOutImplCopyWithImpl(
      _$PhasedOutImpl _value, $Res Function(_$PhasedOutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$PhasedOutImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc

class _$PhasedOutImpl implements _PhasedOut {
  const _$PhasedOutImpl({required this.product});

  @override
  final Product product;

  @override
  String toString() {
    return 'ProductEvent.phasedOut(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhasedOutImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhasedOutImplCopyWith<_$PhasedOutImpl> get copyWith =>
      __$$PhasedOutImplCopyWithImpl<_$PhasedOutImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType,
            String companyId)
        create,
    required TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType)
        update,
    required TResult Function(String id) delete,
    required TResult Function(String id) activate,
    required TResult Function(String id) deactivate,
    required TResult Function(Product product) phasedOut,
    required TResult Function(Product product) notPhasedOut,
  }) {
    return phasedOut(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType,
            String companyId)?
        create,
    TResult? Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType)?
        update,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? activate,
    TResult? Function(String id)? deactivate,
    TResult? Function(Product product)? phasedOut,
    TResult? Function(Product product)? notPhasedOut,
  }) {
    return phasedOut?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType,
            String companyId)?
        create,
    TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType)?
        update,
    TResult Function(String id)? delete,
    TResult Function(String id)? activate,
    TResult Function(String id)? deactivate,
    TResult Function(Product product)? phasedOut,
    TResult Function(Product product)? notPhasedOut,
    required TResult orElse(),
  }) {
    if (phasedOut != null) {
      return phasedOut(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Activate value) activate,
    required TResult Function(_Deactivate value) deactivate,
    required TResult Function(_PhasedOut value) phasedOut,
    required TResult Function(_NotPhasedOut value) notPhasedOut,
  }) {
    return phasedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Activate value)? activate,
    TResult? Function(_Deactivate value)? deactivate,
    TResult? Function(_PhasedOut value)? phasedOut,
    TResult? Function(_NotPhasedOut value)? notPhasedOut,
  }) {
    return phasedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    TResult Function(_Activate value)? activate,
    TResult Function(_Deactivate value)? deactivate,
    TResult Function(_PhasedOut value)? phasedOut,
    TResult Function(_NotPhasedOut value)? notPhasedOut,
    required TResult orElse(),
  }) {
    if (phasedOut != null) {
      return phasedOut(this);
    }
    return orElse();
  }
}

abstract class _PhasedOut implements ProductEvent {
  const factory _PhasedOut({required final Product product}) = _$PhasedOutImpl;

  Product get product;
  @JsonKey(ignore: true)
  _$$PhasedOutImplCopyWith<_$PhasedOutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotPhasedOutImplCopyWith<$Res> {
  factory _$$NotPhasedOutImplCopyWith(
          _$NotPhasedOutImpl value, $Res Function(_$NotPhasedOutImpl) then) =
      __$$NotPhasedOutImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Product product});

  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$NotPhasedOutImplCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$NotPhasedOutImpl>
    implements _$$NotPhasedOutImplCopyWith<$Res> {
  __$$NotPhasedOutImplCopyWithImpl(
      _$NotPhasedOutImpl _value, $Res Function(_$NotPhasedOutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
  }) {
    return _then(_$NotPhasedOutImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc

class _$NotPhasedOutImpl implements _NotPhasedOut {
  const _$NotPhasedOutImpl({required this.product});

  @override
  final Product product;

  @override
  String toString() {
    return 'ProductEvent.notPhasedOut(product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotPhasedOutImpl &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NotPhasedOutImplCopyWith<_$NotPhasedOutImpl> get copyWith =>
      __$$NotPhasedOutImplCopyWithImpl<_$NotPhasedOutImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType,
            String companyId)
        create,
    required TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType)
        update,
    required TResult Function(String id) delete,
    required TResult Function(String id) activate,
    required TResult Function(String id) deactivate,
    required TResult Function(Product product) phasedOut,
    required TResult Function(Product product) notPhasedOut,
  }) {
    return notPhasedOut(product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType,
            String companyId)?
        create,
    TResult? Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType)?
        update,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? activate,
    TResult? Function(String id)? deactivate,
    TResult? Function(Product product)? phasedOut,
    TResult? Function(Product product)? notPhasedOut,
  }) {
    return notPhasedOut?.call(product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType,
            String companyId)?
        create,
    TResult Function(
            String id,
            String no,
            String name,
            String type,
            ProductGroup productGroup,
            MaterialUnit unitPacking,
            MaterialUnit unitSmallest,
            MaterialUnit unitOrder,
            MaterialUnit unitSecondary,
            int expiryPeriod,
            bool tollOut,
            int quantityTablet,
            int quantityStrip,
            int quantityBatch,
            int quantityPack,
            DivisionType divisionType)?
        update,
    TResult Function(String id)? delete,
    TResult Function(String id)? activate,
    TResult Function(String id)? deactivate,
    TResult Function(Product product)? phasedOut,
    TResult Function(Product product)? notPhasedOut,
    required TResult orElse(),
  }) {
    if (notPhasedOut != null) {
      return notPhasedOut(product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Update value) update,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Activate value) activate,
    required TResult Function(_Deactivate value) deactivate,
    required TResult Function(_PhasedOut value) phasedOut,
    required TResult Function(_NotPhasedOut value) notPhasedOut,
  }) {
    return notPhasedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Activate value)? activate,
    TResult? Function(_Deactivate value)? deactivate,
    TResult? Function(_PhasedOut value)? phasedOut,
    TResult? Function(_NotPhasedOut value)? notPhasedOut,
  }) {
    return notPhasedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    TResult Function(_Activate value)? activate,
    TResult Function(_Deactivate value)? deactivate,
    TResult Function(_PhasedOut value)? phasedOut,
    TResult Function(_NotPhasedOut value)? notPhasedOut,
    required TResult orElse(),
  }) {
    if (notPhasedOut != null) {
      return notPhasedOut(this);
    }
    return orElse();
  }
}

abstract class _NotPhasedOut implements ProductEvent {
  const factory _NotPhasedOut({required final Product product}) =
      _$NotPhasedOutImpl;

  Product get product;
  @JsonKey(ignore: true)
  _$$NotPhasedOutImplCopyWith<_$NotPhasedOutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
