// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MaterialState {
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
abstract class $MaterialStateCopyWith<$Res> {
  factory $MaterialStateCopyWith(
          MaterialState value, $Res Function(MaterialState) then) =
      _$MaterialStateCopyWithImpl<$Res, MaterialState>;
}

/// @nodoc
class _$MaterialStateCopyWithImpl<$Res, $Val extends MaterialState>
    implements $MaterialStateCopyWith<$Res> {
  _$MaterialStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialState
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
    extends _$MaterialStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'MaterialState.initial()';
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

abstract class _Initial implements MaterialState {
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
    extends _$MaterialStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'MaterialState.loading()';
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

abstract class _Loading implements MaterialState {
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
    extends _$MaterialStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'MaterialState.success()';
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

abstract class _Success implements MaterialState {
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
    extends _$MaterialStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialState
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
    return 'MaterialState.error(error: $error)';
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

  /// Create a copy of MaterialState
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

abstract class _Error implements MaterialState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of MaterialState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MaterialEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)
        create,
    required TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)
        edit,
    required TResult Function(String id) delete,
    required TResult Function(String id) activate,
    required TResult Function(String id) deactivate,
    required TResult Function(Material material) activateIsStock,
    required TResult Function(Material material) deactivateIsStock,
    required TResult Function(Material material) activateIsOrder,
    required TResult Function(Material material) deactivateIsOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)?
        create,
    TResult? Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)?
        edit,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? activate,
    TResult? Function(String id)? deactivate,
    TResult? Function(Material material)? activateIsStock,
    TResult? Function(Material material)? deactivateIsStock,
    TResult? Function(Material material)? activateIsOrder,
    TResult? Function(Material material)? deactivateIsOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)?
        create,
    TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)?
        edit,
    TResult Function(String id)? delete,
    TResult Function(String id)? activate,
    TResult Function(String id)? deactivate,
    TResult Function(Material material)? activateIsStock,
    TResult Function(Material material)? deactivateIsStock,
    TResult Function(Material material)? activateIsOrder,
    TResult Function(Material material)? deactivateIsOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Activate value) activate,
    required TResult Function(_Deactivate value) deactivate,
    required TResult Function(_ActivateIsStock value) activateIsStock,
    required TResult Function(_DeactivateIsStock value) deactivateIsStock,
    required TResult Function(_ActivateIsOrder value) activateIsOrder,
    required TResult Function(_DeactivateIsOrder value) deactivateIsOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Activate value)? activate,
    TResult? Function(_Deactivate value)? deactivate,
    TResult? Function(_ActivateIsStock value)? activateIsStock,
    TResult? Function(_DeactivateIsStock value)? deactivateIsStock,
    TResult? Function(_ActivateIsOrder value)? activateIsOrder,
    TResult? Function(_DeactivateIsOrder value)? deactivateIsOrder,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_Activate value)? activate,
    TResult Function(_Deactivate value)? deactivate,
    TResult Function(_ActivateIsStock value)? activateIsStock,
    TResult Function(_DeactivateIsStock value)? deactivateIsStock,
    TResult Function(_ActivateIsOrder value)? activateIsOrder,
    TResult Function(_DeactivateIsOrder value)? deactivateIsOrder,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialEventCopyWith<$Res> {
  factory $MaterialEventCopyWith(
          MaterialEvent value, $Res Function(MaterialEvent) then) =
      _$MaterialEventCopyWithImpl<$Res, MaterialEvent>;
}

/// @nodoc
class _$MaterialEventCopyWithImpl<$Res, $Val extends MaterialEvent>
    implements $MaterialEventCopyWith<$Res> {
  _$MaterialEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CreateImplCopyWith<$Res> {
  factory _$$CreateImplCopyWith(
          _$CreateImpl value, $Res Function(_$CreateImpl) then) =
      __$$CreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String name,
      MaterialGroup materialGroup,
      MaterialUnit materialUnit,
      MaterialUnit stockUnit,
      String id,
      int packSize,
      MaterialType type,
      bool? isAssets,
      String companyId});

  $MaterialGroupCopyWith<$Res> get materialGroup;
  $MaterialUnitCopyWith<$Res> get materialUnit;
  $MaterialUnitCopyWith<$Res> get stockUnit;
  $MaterialTypeCopyWith<$Res> get type;
}

/// @nodoc
class __$$CreateImplCopyWithImpl<$Res>
    extends _$MaterialEventCopyWithImpl<$Res, _$CreateImpl>
    implements _$$CreateImplCopyWith<$Res> {
  __$$CreateImplCopyWithImpl(
      _$CreateImpl _value, $Res Function(_$CreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? materialGroup = null,
    Object? materialUnit = null,
    Object? stockUnit = null,
    Object? id = null,
    Object? packSize = null,
    Object? type = null,
    Object? isAssets = freezed,
    Object? companyId = null,
  }) {
    return _then(_$CreateImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroup: null == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      materialUnit: null == materialUnit
          ? _value.materialUnit
          : materialUnit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      stockUnit: null == stockUnit
          ? _value.stockUnit
          : stockUnit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      packSize: null == packSize
          ? _value.packSize
          : packSize // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MaterialType,
      isAssets: freezed == isAssets
          ? _value.isAssets
          : isAssets // ignore: cast_nullable_to_non_nullable
              as bool?,
      companyId: null == companyId
          ? _value.companyId
          : companyId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialGroupCopyWith<$Res> get materialGroup {
    return $MaterialGroupCopyWith<$Res>(_value.materialGroup, (value) {
      return _then(_value.copyWith(materialGroup: value));
    });
  }

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get materialUnit {
    return $MaterialUnitCopyWith<$Res>(_value.materialUnit, (value) {
      return _then(_value.copyWith(materialUnit: value));
    });
  }

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get stockUnit {
    return $MaterialUnitCopyWith<$Res>(_value.stockUnit, (value) {
      return _then(_value.copyWith(stockUnit: value));
    });
  }

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialTypeCopyWith<$Res> get type {
    return $MaterialTypeCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value));
    });
  }
}

/// @nodoc

class _$CreateImpl implements _Create {
  const _$CreateImpl(
      {required this.name,
      required this.materialGroup,
      required this.materialUnit,
      required this.stockUnit,
      required this.id,
      required this.packSize,
      required this.type,
      this.isAssets,
      required this.companyId});

  @override
  final String name;
  @override
  final MaterialGroup materialGroup;
  @override
  final MaterialUnit materialUnit;
  @override
  final MaterialUnit stockUnit;
  @override
  final String id;
  @override
  final int packSize;
  @override
  final MaterialType type;
  @override
  final bool? isAssets;
  @override
  final String companyId;

  @override
  String toString() {
    return 'MaterialEvent.create(name: $name, materialGroup: $materialGroup, materialUnit: $materialUnit, stockUnit: $stockUnit, id: $id, packSize: $packSize, type: $type, isAssets: $isAssets, companyId: $companyId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.materialGroup, materialGroup) ||
                other.materialGroup == materialGroup) &&
            (identical(other.materialUnit, materialUnit) ||
                other.materialUnit == materialUnit) &&
            (identical(other.stockUnit, stockUnit) ||
                other.stockUnit == stockUnit) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.packSize, packSize) ||
                other.packSize == packSize) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isAssets, isAssets) ||
                other.isAssets == isAssets) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, materialGroup,
      materialUnit, stockUnit, id, packSize, type, isAssets, companyId);

  /// Create a copy of MaterialEvent
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
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)
        create,
    required TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)
        edit,
    required TResult Function(String id) delete,
    required TResult Function(String id) activate,
    required TResult Function(String id) deactivate,
    required TResult Function(Material material) activateIsStock,
    required TResult Function(Material material) deactivateIsStock,
    required TResult Function(Material material) activateIsOrder,
    required TResult Function(Material material) deactivateIsOrder,
  }) {
    return create(name, materialGroup, materialUnit, stockUnit, id, packSize,
        type, isAssets, companyId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)?
        create,
    TResult? Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)?
        edit,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? activate,
    TResult? Function(String id)? deactivate,
    TResult? Function(Material material)? activateIsStock,
    TResult? Function(Material material)? deactivateIsStock,
    TResult? Function(Material material)? activateIsOrder,
    TResult? Function(Material material)? deactivateIsOrder,
  }) {
    return create?.call(name, materialGroup, materialUnit, stockUnit, id,
        packSize, type, isAssets, companyId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)?
        create,
    TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)?
        edit,
    TResult Function(String id)? delete,
    TResult Function(String id)? activate,
    TResult Function(String id)? deactivate,
    TResult Function(Material material)? activateIsStock,
    TResult Function(Material material)? deactivateIsStock,
    TResult Function(Material material)? activateIsOrder,
    TResult Function(Material material)? deactivateIsOrder,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(name, materialGroup, materialUnit, stockUnit, id, packSize,
          type, isAssets, companyId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Activate value) activate,
    required TResult Function(_Deactivate value) deactivate,
    required TResult Function(_ActivateIsStock value) activateIsStock,
    required TResult Function(_DeactivateIsStock value) deactivateIsStock,
    required TResult Function(_ActivateIsOrder value) activateIsOrder,
    required TResult Function(_DeactivateIsOrder value) deactivateIsOrder,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Activate value)? activate,
    TResult? Function(_Deactivate value)? deactivate,
    TResult? Function(_ActivateIsStock value)? activateIsStock,
    TResult? Function(_DeactivateIsStock value)? deactivateIsStock,
    TResult? Function(_ActivateIsOrder value)? activateIsOrder,
    TResult? Function(_DeactivateIsOrder value)? deactivateIsOrder,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_Activate value)? activate,
    TResult Function(_Deactivate value)? deactivate,
    TResult Function(_ActivateIsStock value)? activateIsStock,
    TResult Function(_DeactivateIsStock value)? deactivateIsStock,
    TResult Function(_ActivateIsOrder value)? activateIsOrder,
    TResult Function(_DeactivateIsOrder value)? deactivateIsOrder,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class _Create implements MaterialEvent {
  const factory _Create(
      {required final String name,
      required final MaterialGroup materialGroup,
      required final MaterialUnit materialUnit,
      required final MaterialUnit stockUnit,
      required final String id,
      required final int packSize,
      required final MaterialType type,
      final bool? isAssets,
      required final String companyId}) = _$CreateImpl;

  String get name;
  MaterialGroup get materialGroup;
  MaterialUnit get materialUnit;
  MaterialUnit get stockUnit;
  String get id;
  int get packSize;
  MaterialType get type;
  bool? get isAssets;
  String get companyId;

  /// Create a copy of MaterialEvent
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
      {String name,
      MaterialGroup materialGroup,
      MaterialUnit materialUnit,
      String id,
      int packSize,
      MaterialType type,
      bool? isAssets});

  $MaterialGroupCopyWith<$Res> get materialGroup;
  $MaterialUnitCopyWith<$Res> get materialUnit;
  $MaterialTypeCopyWith<$Res> get type;
}

/// @nodoc
class __$$EditImplCopyWithImpl<$Res>
    extends _$MaterialEventCopyWithImpl<$Res, _$EditImpl>
    implements _$$EditImplCopyWith<$Res> {
  __$$EditImplCopyWithImpl(_$EditImpl _value, $Res Function(_$EditImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? materialGroup = null,
    Object? materialUnit = null,
    Object? id = null,
    Object? packSize = null,
    Object? type = null,
    Object? isAssets = freezed,
  }) {
    return _then(_$EditImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroup: null == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      materialUnit: null == materialUnit
          ? _value.materialUnit
          : materialUnit // ignore: cast_nullable_to_non_nullable
              as MaterialUnit,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      packSize: null == packSize
          ? _value.packSize
          : packSize // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MaterialType,
      isAssets: freezed == isAssets
          ? _value.isAssets
          : isAssets // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialGroupCopyWith<$Res> get materialGroup {
    return $MaterialGroupCopyWith<$Res>(_value.materialGroup, (value) {
      return _then(_value.copyWith(materialGroup: value));
    });
  }

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get materialUnit {
    return $MaterialUnitCopyWith<$Res>(_value.materialUnit, (value) {
      return _then(_value.copyWith(materialUnit: value));
    });
  }

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialTypeCopyWith<$Res> get type {
    return $MaterialTypeCopyWith<$Res>(_value.type, (value) {
      return _then(_value.copyWith(type: value));
    });
  }
}

/// @nodoc

class _$EditImpl implements _Edit {
  const _$EditImpl(
      {required this.name,
      required this.materialGroup,
      required this.materialUnit,
      required this.id,
      required this.packSize,
      required this.type,
      this.isAssets});

  @override
  final String name;
  @override
  final MaterialGroup materialGroup;
  @override
  final MaterialUnit materialUnit;
  @override
  final String id;
  @override
  final int packSize;
  @override
  final MaterialType type;
  @override
  final bool? isAssets;

  @override
  String toString() {
    return 'MaterialEvent.edit(name: $name, materialGroup: $materialGroup, materialUnit: $materialUnit, id: $id, packSize: $packSize, type: $type, isAssets: $isAssets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.materialGroup, materialGroup) ||
                other.materialGroup == materialGroup) &&
            (identical(other.materialUnit, materialUnit) ||
                other.materialUnit == materialUnit) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.packSize, packSize) ||
                other.packSize == packSize) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.isAssets, isAssets) ||
                other.isAssets == isAssets));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, materialGroup,
      materialUnit, id, packSize, type, isAssets);

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EditImplCopyWith<_$EditImpl> get copyWith =>
      __$$EditImplCopyWithImpl<_$EditImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)
        create,
    required TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)
        edit,
    required TResult Function(String id) delete,
    required TResult Function(String id) activate,
    required TResult Function(String id) deactivate,
    required TResult Function(Material material) activateIsStock,
    required TResult Function(Material material) deactivateIsStock,
    required TResult Function(Material material) activateIsOrder,
    required TResult Function(Material material) deactivateIsOrder,
  }) {
    return edit(
        name, materialGroup, materialUnit, id, packSize, type, isAssets);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)?
        create,
    TResult? Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)?
        edit,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? activate,
    TResult? Function(String id)? deactivate,
    TResult? Function(Material material)? activateIsStock,
    TResult? Function(Material material)? deactivateIsStock,
    TResult? Function(Material material)? activateIsOrder,
    TResult? Function(Material material)? deactivateIsOrder,
  }) {
    return edit?.call(
        name, materialGroup, materialUnit, id, packSize, type, isAssets);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)?
        create,
    TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)?
        edit,
    TResult Function(String id)? delete,
    TResult Function(String id)? activate,
    TResult Function(String id)? deactivate,
    TResult Function(Material material)? activateIsStock,
    TResult Function(Material material)? deactivateIsStock,
    TResult Function(Material material)? activateIsOrder,
    TResult Function(Material material)? deactivateIsOrder,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(
          name, materialGroup, materialUnit, id, packSize, type, isAssets);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Activate value) activate,
    required TResult Function(_Deactivate value) deactivate,
    required TResult Function(_ActivateIsStock value) activateIsStock,
    required TResult Function(_DeactivateIsStock value) deactivateIsStock,
    required TResult Function(_ActivateIsOrder value) activateIsOrder,
    required TResult Function(_DeactivateIsOrder value) deactivateIsOrder,
  }) {
    return edit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Activate value)? activate,
    TResult? Function(_Deactivate value)? deactivate,
    TResult? Function(_ActivateIsStock value)? activateIsStock,
    TResult? Function(_DeactivateIsStock value)? deactivateIsStock,
    TResult? Function(_ActivateIsOrder value)? activateIsOrder,
    TResult? Function(_DeactivateIsOrder value)? deactivateIsOrder,
  }) {
    return edit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_Activate value)? activate,
    TResult Function(_Deactivate value)? deactivate,
    TResult Function(_ActivateIsStock value)? activateIsStock,
    TResult Function(_DeactivateIsStock value)? deactivateIsStock,
    TResult Function(_ActivateIsOrder value)? activateIsOrder,
    TResult Function(_DeactivateIsOrder value)? deactivateIsOrder,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(this);
    }
    return orElse();
  }
}

abstract class _Edit implements MaterialEvent {
  const factory _Edit(
      {required final String name,
      required final MaterialGroup materialGroup,
      required final MaterialUnit materialUnit,
      required final String id,
      required final int packSize,
      required final MaterialType type,
      final bool? isAssets}) = _$EditImpl;

  String get name;
  MaterialGroup get materialGroup;
  MaterialUnit get materialUnit;
  String get id;
  int get packSize;
  MaterialType get type;
  bool? get isAssets;

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EditImplCopyWith<_$EditImpl> get copyWith =>
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
    extends _$MaterialEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$DeleteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeleteImpl implements _Delete {
  const _$DeleteImpl({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'MaterialEvent.delete(id: $id)';
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

  /// Create a copy of MaterialEvent
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
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)
        create,
    required TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)
        edit,
    required TResult Function(String id) delete,
    required TResult Function(String id) activate,
    required TResult Function(String id) deactivate,
    required TResult Function(Material material) activateIsStock,
    required TResult Function(Material material) deactivateIsStock,
    required TResult Function(Material material) activateIsOrder,
    required TResult Function(Material material) deactivateIsOrder,
  }) {
    return delete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)?
        create,
    TResult? Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)?
        edit,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? activate,
    TResult? Function(String id)? deactivate,
    TResult? Function(Material material)? activateIsStock,
    TResult? Function(Material material)? deactivateIsStock,
    TResult? Function(Material material)? activateIsOrder,
    TResult? Function(Material material)? deactivateIsOrder,
  }) {
    return delete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)?
        create,
    TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)?
        edit,
    TResult Function(String id)? delete,
    TResult Function(String id)? activate,
    TResult Function(String id)? deactivate,
    TResult Function(Material material)? activateIsStock,
    TResult Function(Material material)? deactivateIsStock,
    TResult Function(Material material)? activateIsOrder,
    TResult Function(Material material)? deactivateIsOrder,
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
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Activate value) activate,
    required TResult Function(_Deactivate value) deactivate,
    required TResult Function(_ActivateIsStock value) activateIsStock,
    required TResult Function(_DeactivateIsStock value) deactivateIsStock,
    required TResult Function(_ActivateIsOrder value) activateIsOrder,
    required TResult Function(_DeactivateIsOrder value) deactivateIsOrder,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Activate value)? activate,
    TResult? Function(_Deactivate value)? deactivate,
    TResult? Function(_ActivateIsStock value)? activateIsStock,
    TResult? Function(_DeactivateIsStock value)? deactivateIsStock,
    TResult? Function(_ActivateIsOrder value)? activateIsOrder,
    TResult? Function(_DeactivateIsOrder value)? deactivateIsOrder,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_Activate value)? activate,
    TResult Function(_Deactivate value)? deactivate,
    TResult Function(_ActivateIsStock value)? activateIsStock,
    TResult Function(_DeactivateIsStock value)? deactivateIsStock,
    TResult Function(_ActivateIsOrder value)? activateIsOrder,
    TResult Function(_DeactivateIsOrder value)? deactivateIsOrder,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements MaterialEvent {
  const factory _Delete({required final String id}) = _$DeleteImpl;

  String get id;

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
    extends _$MaterialEventCopyWithImpl<$Res, _$ActivateImpl>
    implements _$$ActivateImplCopyWith<$Res> {
  __$$ActivateImplCopyWithImpl(
      _$ActivateImpl _value, $Res Function(_$ActivateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
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
    return 'MaterialEvent.activate(id: $id)';
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

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivateImplCopyWith<_$ActivateImpl> get copyWith =>
      __$$ActivateImplCopyWithImpl<_$ActivateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)
        create,
    required TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)
        edit,
    required TResult Function(String id) delete,
    required TResult Function(String id) activate,
    required TResult Function(String id) deactivate,
    required TResult Function(Material material) activateIsStock,
    required TResult Function(Material material) deactivateIsStock,
    required TResult Function(Material material) activateIsOrder,
    required TResult Function(Material material) deactivateIsOrder,
  }) {
    return activate(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)?
        create,
    TResult? Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)?
        edit,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? activate,
    TResult? Function(String id)? deactivate,
    TResult? Function(Material material)? activateIsStock,
    TResult? Function(Material material)? deactivateIsStock,
    TResult? Function(Material material)? activateIsOrder,
    TResult? Function(Material material)? deactivateIsOrder,
  }) {
    return activate?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)?
        create,
    TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)?
        edit,
    TResult Function(String id)? delete,
    TResult Function(String id)? activate,
    TResult Function(String id)? deactivate,
    TResult Function(Material material)? activateIsStock,
    TResult Function(Material material)? deactivateIsStock,
    TResult Function(Material material)? activateIsOrder,
    TResult Function(Material material)? deactivateIsOrder,
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
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Activate value) activate,
    required TResult Function(_Deactivate value) deactivate,
    required TResult Function(_ActivateIsStock value) activateIsStock,
    required TResult Function(_DeactivateIsStock value) deactivateIsStock,
    required TResult Function(_ActivateIsOrder value) activateIsOrder,
    required TResult Function(_DeactivateIsOrder value) deactivateIsOrder,
  }) {
    return activate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Activate value)? activate,
    TResult? Function(_Deactivate value)? deactivate,
    TResult? Function(_ActivateIsStock value)? activateIsStock,
    TResult? Function(_DeactivateIsStock value)? deactivateIsStock,
    TResult? Function(_ActivateIsOrder value)? activateIsOrder,
    TResult? Function(_DeactivateIsOrder value)? deactivateIsOrder,
  }) {
    return activate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_Activate value)? activate,
    TResult Function(_Deactivate value)? deactivate,
    TResult Function(_ActivateIsStock value)? activateIsStock,
    TResult Function(_DeactivateIsStock value)? deactivateIsStock,
    TResult Function(_ActivateIsOrder value)? activateIsOrder,
    TResult Function(_DeactivateIsOrder value)? deactivateIsOrder,
    required TResult orElse(),
  }) {
    if (activate != null) {
      return activate(this);
    }
    return orElse();
  }
}

abstract class _Activate implements MaterialEvent {
  const factory _Activate({required final String id}) = _$ActivateImpl;

  String get id;

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
    extends _$MaterialEventCopyWithImpl<$Res, _$DeactivateImpl>
    implements _$$DeactivateImplCopyWith<$Res> {
  __$$DeactivateImplCopyWithImpl(
      _$DeactivateImpl _value, $Res Function(_$DeactivateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
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
    return 'MaterialEvent.deactivate(id: $id)';
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

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeactivateImplCopyWith<_$DeactivateImpl> get copyWith =>
      __$$DeactivateImplCopyWithImpl<_$DeactivateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)
        create,
    required TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)
        edit,
    required TResult Function(String id) delete,
    required TResult Function(String id) activate,
    required TResult Function(String id) deactivate,
    required TResult Function(Material material) activateIsStock,
    required TResult Function(Material material) deactivateIsStock,
    required TResult Function(Material material) activateIsOrder,
    required TResult Function(Material material) deactivateIsOrder,
  }) {
    return deactivate(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)?
        create,
    TResult? Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)?
        edit,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? activate,
    TResult? Function(String id)? deactivate,
    TResult? Function(Material material)? activateIsStock,
    TResult? Function(Material material)? deactivateIsStock,
    TResult? Function(Material material)? activateIsOrder,
    TResult? Function(Material material)? deactivateIsOrder,
  }) {
    return deactivate?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)?
        create,
    TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)?
        edit,
    TResult Function(String id)? delete,
    TResult Function(String id)? activate,
    TResult Function(String id)? deactivate,
    TResult Function(Material material)? activateIsStock,
    TResult Function(Material material)? deactivateIsStock,
    TResult Function(Material material)? activateIsOrder,
    TResult Function(Material material)? deactivateIsOrder,
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
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Activate value) activate,
    required TResult Function(_Deactivate value) deactivate,
    required TResult Function(_ActivateIsStock value) activateIsStock,
    required TResult Function(_DeactivateIsStock value) deactivateIsStock,
    required TResult Function(_ActivateIsOrder value) activateIsOrder,
    required TResult Function(_DeactivateIsOrder value) deactivateIsOrder,
  }) {
    return deactivate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Activate value)? activate,
    TResult? Function(_Deactivate value)? deactivate,
    TResult? Function(_ActivateIsStock value)? activateIsStock,
    TResult? Function(_DeactivateIsStock value)? deactivateIsStock,
    TResult? Function(_ActivateIsOrder value)? activateIsOrder,
    TResult? Function(_DeactivateIsOrder value)? deactivateIsOrder,
  }) {
    return deactivate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_Activate value)? activate,
    TResult Function(_Deactivate value)? deactivate,
    TResult Function(_ActivateIsStock value)? activateIsStock,
    TResult Function(_DeactivateIsStock value)? deactivateIsStock,
    TResult Function(_ActivateIsOrder value)? activateIsOrder,
    TResult Function(_DeactivateIsOrder value)? deactivateIsOrder,
    required TResult orElse(),
  }) {
    if (deactivate != null) {
      return deactivate(this);
    }
    return orElse();
  }
}

abstract class _Deactivate implements MaterialEvent {
  const factory _Deactivate({required final String id}) = _$DeactivateImpl;

  String get id;

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeactivateImplCopyWith<_$DeactivateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ActivateIsStockImplCopyWith<$Res> {
  factory _$$ActivateIsStockImplCopyWith(_$ActivateIsStockImpl value,
          $Res Function(_$ActivateIsStockImpl) then) =
      __$$ActivateIsStockImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Material material});

  $MaterialCopyWith<$Res> get material;
}

/// @nodoc
class __$$ActivateIsStockImplCopyWithImpl<$Res>
    extends _$MaterialEventCopyWithImpl<$Res, _$ActivateIsStockImpl>
    implements _$$ActivateIsStockImplCopyWith<$Res> {
  __$$ActivateIsStockImplCopyWithImpl(
      _$ActivateIsStockImpl _value, $Res Function(_$ActivateIsStockImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? material = null,
  }) {
    return _then(_$ActivateIsStockImpl(
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
    ));
  }

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialCopyWith<$Res> get material {
    return $MaterialCopyWith<$Res>(_value.material, (value) {
      return _then(_value.copyWith(material: value));
    });
  }
}

/// @nodoc

class _$ActivateIsStockImpl implements _ActivateIsStock {
  const _$ActivateIsStockImpl({required this.material});

  @override
  final Material material;

  @override
  String toString() {
    return 'MaterialEvent.activateIsStock(material: $material)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivateIsStockImpl &&
            (identical(other.material, material) ||
                other.material == material));
  }

  @override
  int get hashCode => Object.hash(runtimeType, material);

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivateIsStockImplCopyWith<_$ActivateIsStockImpl> get copyWith =>
      __$$ActivateIsStockImplCopyWithImpl<_$ActivateIsStockImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)
        create,
    required TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)
        edit,
    required TResult Function(String id) delete,
    required TResult Function(String id) activate,
    required TResult Function(String id) deactivate,
    required TResult Function(Material material) activateIsStock,
    required TResult Function(Material material) deactivateIsStock,
    required TResult Function(Material material) activateIsOrder,
    required TResult Function(Material material) deactivateIsOrder,
  }) {
    return activateIsStock(material);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)?
        create,
    TResult? Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)?
        edit,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? activate,
    TResult? Function(String id)? deactivate,
    TResult? Function(Material material)? activateIsStock,
    TResult? Function(Material material)? deactivateIsStock,
    TResult? Function(Material material)? activateIsOrder,
    TResult? Function(Material material)? deactivateIsOrder,
  }) {
    return activateIsStock?.call(material);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)?
        create,
    TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)?
        edit,
    TResult Function(String id)? delete,
    TResult Function(String id)? activate,
    TResult Function(String id)? deactivate,
    TResult Function(Material material)? activateIsStock,
    TResult Function(Material material)? deactivateIsStock,
    TResult Function(Material material)? activateIsOrder,
    TResult Function(Material material)? deactivateIsOrder,
    required TResult orElse(),
  }) {
    if (activateIsStock != null) {
      return activateIsStock(material);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Activate value) activate,
    required TResult Function(_Deactivate value) deactivate,
    required TResult Function(_ActivateIsStock value) activateIsStock,
    required TResult Function(_DeactivateIsStock value) deactivateIsStock,
    required TResult Function(_ActivateIsOrder value) activateIsOrder,
    required TResult Function(_DeactivateIsOrder value) deactivateIsOrder,
  }) {
    return activateIsStock(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Activate value)? activate,
    TResult? Function(_Deactivate value)? deactivate,
    TResult? Function(_ActivateIsStock value)? activateIsStock,
    TResult? Function(_DeactivateIsStock value)? deactivateIsStock,
    TResult? Function(_ActivateIsOrder value)? activateIsOrder,
    TResult? Function(_DeactivateIsOrder value)? deactivateIsOrder,
  }) {
    return activateIsStock?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_Activate value)? activate,
    TResult Function(_Deactivate value)? deactivate,
    TResult Function(_ActivateIsStock value)? activateIsStock,
    TResult Function(_DeactivateIsStock value)? deactivateIsStock,
    TResult Function(_ActivateIsOrder value)? activateIsOrder,
    TResult Function(_DeactivateIsOrder value)? deactivateIsOrder,
    required TResult orElse(),
  }) {
    if (activateIsStock != null) {
      return activateIsStock(this);
    }
    return orElse();
  }
}

abstract class _ActivateIsStock implements MaterialEvent {
  const factory _ActivateIsStock({required final Material material}) =
      _$ActivateIsStockImpl;

  Material get material;

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivateIsStockImplCopyWith<_$ActivateIsStockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeactivateIsStockImplCopyWith<$Res> {
  factory _$$DeactivateIsStockImplCopyWith(_$DeactivateIsStockImpl value,
          $Res Function(_$DeactivateIsStockImpl) then) =
      __$$DeactivateIsStockImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Material material});

  $MaterialCopyWith<$Res> get material;
}

/// @nodoc
class __$$DeactivateIsStockImplCopyWithImpl<$Res>
    extends _$MaterialEventCopyWithImpl<$Res, _$DeactivateIsStockImpl>
    implements _$$DeactivateIsStockImplCopyWith<$Res> {
  __$$DeactivateIsStockImplCopyWithImpl(_$DeactivateIsStockImpl _value,
      $Res Function(_$DeactivateIsStockImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? material = null,
  }) {
    return _then(_$DeactivateIsStockImpl(
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
    ));
  }

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialCopyWith<$Res> get material {
    return $MaterialCopyWith<$Res>(_value.material, (value) {
      return _then(_value.copyWith(material: value));
    });
  }
}

/// @nodoc

class _$DeactivateIsStockImpl implements _DeactivateIsStock {
  const _$DeactivateIsStockImpl({required this.material});

  @override
  final Material material;

  @override
  String toString() {
    return 'MaterialEvent.deactivateIsStock(material: $material)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeactivateIsStockImpl &&
            (identical(other.material, material) ||
                other.material == material));
  }

  @override
  int get hashCode => Object.hash(runtimeType, material);

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeactivateIsStockImplCopyWith<_$DeactivateIsStockImpl> get copyWith =>
      __$$DeactivateIsStockImplCopyWithImpl<_$DeactivateIsStockImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)
        create,
    required TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)
        edit,
    required TResult Function(String id) delete,
    required TResult Function(String id) activate,
    required TResult Function(String id) deactivate,
    required TResult Function(Material material) activateIsStock,
    required TResult Function(Material material) deactivateIsStock,
    required TResult Function(Material material) activateIsOrder,
    required TResult Function(Material material) deactivateIsOrder,
  }) {
    return deactivateIsStock(material);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)?
        create,
    TResult? Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)?
        edit,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? activate,
    TResult? Function(String id)? deactivate,
    TResult? Function(Material material)? activateIsStock,
    TResult? Function(Material material)? deactivateIsStock,
    TResult? Function(Material material)? activateIsOrder,
    TResult? Function(Material material)? deactivateIsOrder,
  }) {
    return deactivateIsStock?.call(material);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)?
        create,
    TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)?
        edit,
    TResult Function(String id)? delete,
    TResult Function(String id)? activate,
    TResult Function(String id)? deactivate,
    TResult Function(Material material)? activateIsStock,
    TResult Function(Material material)? deactivateIsStock,
    TResult Function(Material material)? activateIsOrder,
    TResult Function(Material material)? deactivateIsOrder,
    required TResult orElse(),
  }) {
    if (deactivateIsStock != null) {
      return deactivateIsStock(material);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Activate value) activate,
    required TResult Function(_Deactivate value) deactivate,
    required TResult Function(_ActivateIsStock value) activateIsStock,
    required TResult Function(_DeactivateIsStock value) deactivateIsStock,
    required TResult Function(_ActivateIsOrder value) activateIsOrder,
    required TResult Function(_DeactivateIsOrder value) deactivateIsOrder,
  }) {
    return deactivateIsStock(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Activate value)? activate,
    TResult? Function(_Deactivate value)? deactivate,
    TResult? Function(_ActivateIsStock value)? activateIsStock,
    TResult? Function(_DeactivateIsStock value)? deactivateIsStock,
    TResult? Function(_ActivateIsOrder value)? activateIsOrder,
    TResult? Function(_DeactivateIsOrder value)? deactivateIsOrder,
  }) {
    return deactivateIsStock?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_Activate value)? activate,
    TResult Function(_Deactivate value)? deactivate,
    TResult Function(_ActivateIsStock value)? activateIsStock,
    TResult Function(_DeactivateIsStock value)? deactivateIsStock,
    TResult Function(_ActivateIsOrder value)? activateIsOrder,
    TResult Function(_DeactivateIsOrder value)? deactivateIsOrder,
    required TResult orElse(),
  }) {
    if (deactivateIsStock != null) {
      return deactivateIsStock(this);
    }
    return orElse();
  }
}

abstract class _DeactivateIsStock implements MaterialEvent {
  const factory _DeactivateIsStock({required final Material material}) =
      _$DeactivateIsStockImpl;

  Material get material;

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeactivateIsStockImplCopyWith<_$DeactivateIsStockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ActivateIsOrderImplCopyWith<$Res> {
  factory _$$ActivateIsOrderImplCopyWith(_$ActivateIsOrderImpl value,
          $Res Function(_$ActivateIsOrderImpl) then) =
      __$$ActivateIsOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Material material});

  $MaterialCopyWith<$Res> get material;
}

/// @nodoc
class __$$ActivateIsOrderImplCopyWithImpl<$Res>
    extends _$MaterialEventCopyWithImpl<$Res, _$ActivateIsOrderImpl>
    implements _$$ActivateIsOrderImplCopyWith<$Res> {
  __$$ActivateIsOrderImplCopyWithImpl(
      _$ActivateIsOrderImpl _value, $Res Function(_$ActivateIsOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? material = null,
  }) {
    return _then(_$ActivateIsOrderImpl(
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
    ));
  }

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialCopyWith<$Res> get material {
    return $MaterialCopyWith<$Res>(_value.material, (value) {
      return _then(_value.copyWith(material: value));
    });
  }
}

/// @nodoc

class _$ActivateIsOrderImpl implements _ActivateIsOrder {
  const _$ActivateIsOrderImpl({required this.material});

  @override
  final Material material;

  @override
  String toString() {
    return 'MaterialEvent.activateIsOrder(material: $material)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActivateIsOrderImpl &&
            (identical(other.material, material) ||
                other.material == material));
  }

  @override
  int get hashCode => Object.hash(runtimeType, material);

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActivateIsOrderImplCopyWith<_$ActivateIsOrderImpl> get copyWith =>
      __$$ActivateIsOrderImplCopyWithImpl<_$ActivateIsOrderImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)
        create,
    required TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)
        edit,
    required TResult Function(String id) delete,
    required TResult Function(String id) activate,
    required TResult Function(String id) deactivate,
    required TResult Function(Material material) activateIsStock,
    required TResult Function(Material material) deactivateIsStock,
    required TResult Function(Material material) activateIsOrder,
    required TResult Function(Material material) deactivateIsOrder,
  }) {
    return activateIsOrder(material);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)?
        create,
    TResult? Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)?
        edit,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? activate,
    TResult? Function(String id)? deactivate,
    TResult? Function(Material material)? activateIsStock,
    TResult? Function(Material material)? deactivateIsStock,
    TResult? Function(Material material)? activateIsOrder,
    TResult? Function(Material material)? deactivateIsOrder,
  }) {
    return activateIsOrder?.call(material);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)?
        create,
    TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)?
        edit,
    TResult Function(String id)? delete,
    TResult Function(String id)? activate,
    TResult Function(String id)? deactivate,
    TResult Function(Material material)? activateIsStock,
    TResult Function(Material material)? deactivateIsStock,
    TResult Function(Material material)? activateIsOrder,
    TResult Function(Material material)? deactivateIsOrder,
    required TResult orElse(),
  }) {
    if (activateIsOrder != null) {
      return activateIsOrder(material);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Activate value) activate,
    required TResult Function(_Deactivate value) deactivate,
    required TResult Function(_ActivateIsStock value) activateIsStock,
    required TResult Function(_DeactivateIsStock value) deactivateIsStock,
    required TResult Function(_ActivateIsOrder value) activateIsOrder,
    required TResult Function(_DeactivateIsOrder value) deactivateIsOrder,
  }) {
    return activateIsOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Activate value)? activate,
    TResult? Function(_Deactivate value)? deactivate,
    TResult? Function(_ActivateIsStock value)? activateIsStock,
    TResult? Function(_DeactivateIsStock value)? deactivateIsStock,
    TResult? Function(_ActivateIsOrder value)? activateIsOrder,
    TResult? Function(_DeactivateIsOrder value)? deactivateIsOrder,
  }) {
    return activateIsOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_Activate value)? activate,
    TResult Function(_Deactivate value)? deactivate,
    TResult Function(_ActivateIsStock value)? activateIsStock,
    TResult Function(_DeactivateIsStock value)? deactivateIsStock,
    TResult Function(_ActivateIsOrder value)? activateIsOrder,
    TResult Function(_DeactivateIsOrder value)? deactivateIsOrder,
    required TResult orElse(),
  }) {
    if (activateIsOrder != null) {
      return activateIsOrder(this);
    }
    return orElse();
  }
}

abstract class _ActivateIsOrder implements MaterialEvent {
  const factory _ActivateIsOrder({required final Material material}) =
      _$ActivateIsOrderImpl;

  Material get material;

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActivateIsOrderImplCopyWith<_$ActivateIsOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeactivateIsOrderImplCopyWith<$Res> {
  factory _$$DeactivateIsOrderImplCopyWith(_$DeactivateIsOrderImpl value,
          $Res Function(_$DeactivateIsOrderImpl) then) =
      __$$DeactivateIsOrderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Material material});

  $MaterialCopyWith<$Res> get material;
}

/// @nodoc
class __$$DeactivateIsOrderImplCopyWithImpl<$Res>
    extends _$MaterialEventCopyWithImpl<$Res, _$DeactivateIsOrderImpl>
    implements _$$DeactivateIsOrderImplCopyWith<$Res> {
  __$$DeactivateIsOrderImplCopyWithImpl(_$DeactivateIsOrderImpl _value,
      $Res Function(_$DeactivateIsOrderImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? material = null,
  }) {
    return _then(_$DeactivateIsOrderImpl(
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
    ));
  }

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialCopyWith<$Res> get material {
    return $MaterialCopyWith<$Res>(_value.material, (value) {
      return _then(_value.copyWith(material: value));
    });
  }
}

/// @nodoc

class _$DeactivateIsOrderImpl implements _DeactivateIsOrder {
  const _$DeactivateIsOrderImpl({required this.material});

  @override
  final Material material;

  @override
  String toString() {
    return 'MaterialEvent.deactivateIsOrder(material: $material)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeactivateIsOrderImpl &&
            (identical(other.material, material) ||
                other.material == material));
  }

  @override
  int get hashCode => Object.hash(runtimeType, material);

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeactivateIsOrderImplCopyWith<_$DeactivateIsOrderImpl> get copyWith =>
      __$$DeactivateIsOrderImplCopyWithImpl<_$DeactivateIsOrderImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)
        create,
    required TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)
        edit,
    required TResult Function(String id) delete,
    required TResult Function(String id) activate,
    required TResult Function(String id) deactivate,
    required TResult Function(Material material) activateIsStock,
    required TResult Function(Material material) deactivateIsStock,
    required TResult Function(Material material) activateIsOrder,
    required TResult Function(Material material) deactivateIsOrder,
  }) {
    return deactivateIsOrder(material);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)?
        create,
    TResult? Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)?
        edit,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? activate,
    TResult? Function(String id)? deactivate,
    TResult? Function(Material material)? activateIsStock,
    TResult? Function(Material material)? deactivateIsStock,
    TResult? Function(Material material)? activateIsOrder,
    TResult? Function(Material material)? deactivateIsOrder,
  }) {
    return deactivateIsOrder?.call(material);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets,
            String companyId)?
        create,
    TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            String id,
            int packSize,
            MaterialType type,
            bool? isAssets)?
        edit,
    TResult Function(String id)? delete,
    TResult Function(String id)? activate,
    TResult Function(String id)? deactivate,
    TResult Function(Material material)? activateIsStock,
    TResult Function(Material material)? deactivateIsStock,
    TResult Function(Material material)? activateIsOrder,
    TResult Function(Material material)? deactivateIsOrder,
    required TResult orElse(),
  }) {
    if (deactivateIsOrder != null) {
      return deactivateIsOrder(material);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_Activate value) activate,
    required TResult Function(_Deactivate value) deactivate,
    required TResult Function(_ActivateIsStock value) activateIsStock,
    required TResult Function(_DeactivateIsStock value) deactivateIsStock,
    required TResult Function(_ActivateIsOrder value) activateIsOrder,
    required TResult Function(_DeactivateIsOrder value) deactivateIsOrder,
  }) {
    return deactivateIsOrder(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Activate value)? activate,
    TResult? Function(_Deactivate value)? deactivate,
    TResult? Function(_ActivateIsStock value)? activateIsStock,
    TResult? Function(_DeactivateIsStock value)? deactivateIsStock,
    TResult? Function(_ActivateIsOrder value)? activateIsOrder,
    TResult? Function(_DeactivateIsOrder value)? deactivateIsOrder,
  }) {
    return deactivateIsOrder?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_Activate value)? activate,
    TResult Function(_Deactivate value)? deactivate,
    TResult Function(_ActivateIsStock value)? activateIsStock,
    TResult Function(_DeactivateIsStock value)? deactivateIsStock,
    TResult Function(_ActivateIsOrder value)? activateIsOrder,
    TResult Function(_DeactivateIsOrder value)? deactivateIsOrder,
    required TResult orElse(),
  }) {
    if (deactivateIsOrder != null) {
      return deactivateIsOrder(this);
    }
    return orElse();
  }
}

abstract class _DeactivateIsOrder implements MaterialEvent {
  const factory _DeactivateIsOrder({required final Material material}) =
      _$DeactivateIsOrderImpl;

  Material get material;

  /// Create a copy of MaterialEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeactivateIsOrderImplCopyWith<_$DeactivateIsOrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
