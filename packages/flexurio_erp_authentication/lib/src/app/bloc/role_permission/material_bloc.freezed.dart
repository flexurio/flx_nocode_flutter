// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'material_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$MaterialStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'MaterialState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
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
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$MaterialStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'MaterialState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
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
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$MaterialStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success();

  @override
  String toString() {
    return 'MaterialState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Success);
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
  const factory _Success() = _$_Success;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$MaterialStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$_Error(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'MaterialState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

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
  const factory _Error(final String error) = _$_Error;

  String get error;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MaterialEvent {
  String get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            bool? isAssets)
        create,
    required TResult Function(String name, MaterialGroup materialGroup,
            MaterialUnit materialUnit, String id, bool? isAssets)
        update,
    required TResult Function(String id) delete,
    required TResult Function(String id) activate,
    required TResult Function(String id) deactivate,
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
            bool? isAssets)?
        create,
    TResult? Function(String name, MaterialGroup materialGroup,
            MaterialUnit materialUnit, String id, bool? isAssets)?
        update,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? activate,
    TResult? Function(String id)? deactivate,
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
            bool? isAssets)?
        create,
    TResult Function(String name, MaterialGroup materialGroup,
            MaterialUnit materialUnit, String id, bool? isAssets)?
        update,
    TResult Function(String id)? delete,
    TResult Function(String id)? activate,
    TResult Function(String id)? deactivate,
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
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_Update value)? update,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_Activate value)? activate,
    TResult? Function(_Deactivate value)? deactivate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_Update value)? update,
    TResult Function(_Delete value)? delete,
    TResult Function(_Activate value)? activate,
    TResult Function(_Deactivate value)? deactivate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MaterialEventCopyWith<MaterialEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialEventCopyWith<$Res> {
  factory $MaterialEventCopyWith(
          MaterialEvent value, $Res Function(MaterialEvent) then) =
      _$MaterialEventCopyWithImpl<$Res, MaterialEvent>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$MaterialEventCopyWithImpl<$Res, $Val extends MaterialEvent>
    implements $MaterialEventCopyWith<$Res> {
  _$MaterialEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateCopyWith<$Res>
    implements $MaterialEventCopyWith<$Res> {
  factory _$$_CreateCopyWith(_$_Create value, $Res Function(_$_Create) then) =
      __$$_CreateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      MaterialGroup materialGroup,
      MaterialUnit materialUnit,
      MaterialUnit stockUnit,
      String id,
      bool? isAssets});

  $MaterialGroupCopyWith<$Res> get materialGroup;
  $MaterialUnitCopyWith<$Res> get materialUnit;
  $MaterialUnitCopyWith<$Res> get stockUnit;
}

/// @nodoc
class __$$_CreateCopyWithImpl<$Res>
    extends _$MaterialEventCopyWithImpl<$Res, _$_Create>
    implements _$$_CreateCopyWith<$Res> {
  __$$_CreateCopyWithImpl(_$_Create _value, $Res Function(_$_Create) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? materialGroup = null,
    Object? materialUnit = null,
    Object? stockUnit = null,
    Object? id = null,
    Object? isAssets = freezed,
  }) {
    return _then(_$_Create(
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
      isAssets: freezed == isAssets
          ? _value.isAssets
          : isAssets // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialGroupCopyWith<$Res> get materialGroup {
    return $MaterialGroupCopyWith<$Res>(_value.materialGroup, (value) {
      return _then(_value.copyWith(materialGroup: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get materialUnit {
    return $MaterialUnitCopyWith<$Res>(_value.materialUnit, (value) {
      return _then(_value.copyWith(materialUnit: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get stockUnit {
    return $MaterialUnitCopyWith<$Res>(_value.stockUnit, (value) {
      return _then(_value.copyWith(stockUnit: value));
    });
  }
}

/// @nodoc

class _$_Create implements _Create {
  const _$_Create(
      {required this.name,
      required this.materialGroup,
      required this.materialUnit,
      required this.stockUnit,
      required this.id,
      this.isAssets});

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
  final bool? isAssets;

  @override
  String toString() {
    return 'MaterialEvent.create(name: $name, materialGroup: $materialGroup, materialUnit: $materialUnit, stockUnit: $stockUnit, id: $id, isAssets: $isAssets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Create &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.materialGroup, materialGroup) ||
                other.materialGroup == materialGroup) &&
            (identical(other.materialUnit, materialUnit) ||
                other.materialUnit == materialUnit) &&
            (identical(other.stockUnit, stockUnit) ||
                other.stockUnit == stockUnit) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isAssets, isAssets) ||
                other.isAssets == isAssets));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, materialGroup, materialUnit, stockUnit, id, isAssets);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      __$$_CreateCopyWithImpl<_$_Create>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            bool? isAssets)
        create,
    required TResult Function(String name, MaterialGroup materialGroup,
            MaterialUnit materialUnit, String id, bool? isAssets)
        update,
    required TResult Function(String id) delete,
    required TResult Function(String id) activate,
    required TResult Function(String id) deactivate,
  }) {
    return create(name, materialGroup, materialUnit, stockUnit, id, isAssets);
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
            bool? isAssets)?
        create,
    TResult? Function(String name, MaterialGroup materialGroup,
            MaterialUnit materialUnit, String id, bool? isAssets)?
        update,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? activate,
    TResult? Function(String id)? deactivate,
  }) {
    return create?.call(
        name, materialGroup, materialUnit, stockUnit, id, isAssets);
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
            bool? isAssets)?
        create,
    TResult Function(String name, MaterialGroup materialGroup,
            MaterialUnit materialUnit, String id, bool? isAssets)?
        update,
    TResult Function(String id)? delete,
    TResult Function(String id)? activate,
    TResult Function(String id)? deactivate,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(name, materialGroup, materialUnit, stockUnit, id, isAssets);
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
      final bool? isAssets}) = _$_Create;

  String get name;
  MaterialGroup get materialGroup;
  MaterialUnit get materialUnit;
  MaterialUnit get stockUnit;
  @override
  String get id;
  bool? get isAssets;
  @override
  @JsonKey(ignore: true)
  _$$_CreateCopyWith<_$_Create> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateCopyWith<$Res>
    implements $MaterialEventCopyWith<$Res> {
  factory _$$_UpdateCopyWith(_$_Update value, $Res Function(_$_Update) then) =
      __$$_UpdateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      MaterialGroup materialGroup,
      MaterialUnit materialUnit,
      String id,
      bool? isAssets});

  $MaterialGroupCopyWith<$Res> get materialGroup;
  $MaterialUnitCopyWith<$Res> get materialUnit;
}

/// @nodoc
class __$$_UpdateCopyWithImpl<$Res>
    extends _$MaterialEventCopyWithImpl<$Res, _$_Update>
    implements _$$_UpdateCopyWith<$Res> {
  __$$_UpdateCopyWithImpl(_$_Update _value, $Res Function(_$_Update) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? materialGroup = null,
    Object? materialUnit = null,
    Object? id = null,
    Object? isAssets = freezed,
  }) {
    return _then(_$_Update(
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
      isAssets: freezed == isAssets
          ? _value.isAssets
          : isAssets // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialGroupCopyWith<$Res> get materialGroup {
    return $MaterialGroupCopyWith<$Res>(_value.materialGroup, (value) {
      return _then(_value.copyWith(materialGroup: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $MaterialUnitCopyWith<$Res> get materialUnit {
    return $MaterialUnitCopyWith<$Res>(_value.materialUnit, (value) {
      return _then(_value.copyWith(materialUnit: value));
    });
  }
}

/// @nodoc

class _$_Update implements _Update {
  const _$_Update(
      {required this.name,
      required this.materialGroup,
      required this.materialUnit,
      required this.id,
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
  final bool? isAssets;

  @override
  String toString() {
    return 'MaterialEvent.update(name: $name, materialGroup: $materialGroup, materialUnit: $materialUnit, id: $id, isAssets: $isAssets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Update &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.materialGroup, materialGroup) ||
                other.materialGroup == materialGroup) &&
            (identical(other.materialUnit, materialUnit) ||
                other.materialUnit == materialUnit) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.isAssets, isAssets) ||
                other.isAssets == isAssets));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, name, materialGroup, materialUnit, id, isAssets);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateCopyWith<_$_Update> get copyWith =>
      __$$_UpdateCopyWithImpl<_$_Update>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            bool? isAssets)
        create,
    required TResult Function(String name, MaterialGroup materialGroup,
            MaterialUnit materialUnit, String id, bool? isAssets)
        update,
    required TResult Function(String id) delete,
    required TResult Function(String id) activate,
    required TResult Function(String id) deactivate,
  }) {
    return update(name, materialGroup, materialUnit, id, isAssets);
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
            bool? isAssets)?
        create,
    TResult? Function(String name, MaterialGroup materialGroup,
            MaterialUnit materialUnit, String id, bool? isAssets)?
        update,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? activate,
    TResult? Function(String id)? deactivate,
  }) {
    return update?.call(name, materialGroup, materialUnit, id, isAssets);
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
            bool? isAssets)?
        create,
    TResult Function(String name, MaterialGroup materialGroup,
            MaterialUnit materialUnit, String id, bool? isAssets)?
        update,
    TResult Function(String id)? delete,
    TResult Function(String id)? activate,
    TResult Function(String id)? deactivate,
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(name, materialGroup, materialUnit, id, isAssets);
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
    required TResult orElse(),
  }) {
    if (update != null) {
      return update(this);
    }
    return orElse();
  }
}

abstract class _Update implements MaterialEvent {
  const factory _Update(
      {required final String name,
      required final MaterialGroup materialGroup,
      required final MaterialUnit materialUnit,
      required final String id,
      final bool? isAssets}) = _$_Update;

  String get name;
  MaterialGroup get materialGroup;
  MaterialUnit get materialUnit;
  @override
  String get id;
  bool? get isAssets;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateCopyWith<_$_Update> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteCopyWith<$Res>
    implements $MaterialEventCopyWith<$Res> {
  factory _$$_DeleteCopyWith(_$_Delete value, $Res Function(_$_Delete) then) =
      __$$_DeleteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$_DeleteCopyWithImpl<$Res>
    extends _$MaterialEventCopyWithImpl<$Res, _$_Delete>
    implements _$$_DeleteCopyWith<$Res> {
  __$$_DeleteCopyWithImpl(_$_Delete _value, $Res Function(_$_Delete) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_Delete(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Delete implements _Delete {
  const _$_Delete({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'MaterialEvent.delete(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Delete &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteCopyWith<_$_Delete> get copyWith =>
      __$$_DeleteCopyWithImpl<_$_Delete>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            bool? isAssets)
        create,
    required TResult Function(String name, MaterialGroup materialGroup,
            MaterialUnit materialUnit, String id, bool? isAssets)
        update,
    required TResult Function(String id) delete,
    required TResult Function(String id) activate,
    required TResult Function(String id) deactivate,
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
            bool? isAssets)?
        create,
    TResult? Function(String name, MaterialGroup materialGroup,
            MaterialUnit materialUnit, String id, bool? isAssets)?
        update,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? activate,
    TResult? Function(String id)? deactivate,
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
            bool? isAssets)?
        create,
    TResult Function(String name, MaterialGroup materialGroup,
            MaterialUnit materialUnit, String id, bool? isAssets)?
        update,
    TResult Function(String id)? delete,
    TResult Function(String id)? activate,
    TResult Function(String id)? deactivate,
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
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements MaterialEvent {
  const factory _Delete({required final String id}) = _$_Delete;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_DeleteCopyWith<_$_Delete> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ActivateCopyWith<$Res>
    implements $MaterialEventCopyWith<$Res> {
  factory _$$_ActivateCopyWith(
          _$_Activate value, $Res Function(_$_Activate) then) =
      __$$_ActivateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$_ActivateCopyWithImpl<$Res>
    extends _$MaterialEventCopyWithImpl<$Res, _$_Activate>
    implements _$$_ActivateCopyWith<$Res> {
  __$$_ActivateCopyWithImpl(
      _$_Activate _value, $Res Function(_$_Activate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_Activate(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Activate implements _Activate {
  const _$_Activate({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'MaterialEvent.activate(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Activate &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ActivateCopyWith<_$_Activate> get copyWith =>
      __$$_ActivateCopyWithImpl<_$_Activate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            bool? isAssets)
        create,
    required TResult Function(String name, MaterialGroup materialGroup,
            MaterialUnit materialUnit, String id, bool? isAssets)
        update,
    required TResult Function(String id) delete,
    required TResult Function(String id) activate,
    required TResult Function(String id) deactivate,
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
            bool? isAssets)?
        create,
    TResult? Function(String name, MaterialGroup materialGroup,
            MaterialUnit materialUnit, String id, bool? isAssets)?
        update,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? activate,
    TResult? Function(String id)? deactivate,
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
            bool? isAssets)?
        create,
    TResult Function(String name, MaterialGroup materialGroup,
            MaterialUnit materialUnit, String id, bool? isAssets)?
        update,
    TResult Function(String id)? delete,
    TResult Function(String id)? activate,
    TResult Function(String id)? deactivate,
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
    required TResult orElse(),
  }) {
    if (activate != null) {
      return activate(this);
    }
    return orElse();
  }
}

abstract class _Activate implements MaterialEvent {
  const factory _Activate({required final String id}) = _$_Activate;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_ActivateCopyWith<_$_Activate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeactivateCopyWith<$Res>
    implements $MaterialEventCopyWith<$Res> {
  factory _$$_DeactivateCopyWith(
          _$_Deactivate value, $Res Function(_$_Deactivate) then) =
      __$$_DeactivateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$_DeactivateCopyWithImpl<$Res>
    extends _$MaterialEventCopyWithImpl<$Res, _$_Deactivate>
    implements _$$_DeactivateCopyWith<$Res> {
  __$$_DeactivateCopyWithImpl(
      _$_Deactivate _value, $Res Function(_$_Deactivate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_Deactivate(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Deactivate implements _Deactivate {
  const _$_Deactivate({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'MaterialEvent.deactivate(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Deactivate &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeactivateCopyWith<_$_Deactivate> get copyWith =>
      __$$_DeactivateCopyWithImpl<_$_Deactivate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String name,
            MaterialGroup materialGroup,
            MaterialUnit materialUnit,
            MaterialUnit stockUnit,
            String id,
            bool? isAssets)
        create,
    required TResult Function(String name, MaterialGroup materialGroup,
            MaterialUnit materialUnit, String id, bool? isAssets)
        update,
    required TResult Function(String id) delete,
    required TResult Function(String id) activate,
    required TResult Function(String id) deactivate,
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
            bool? isAssets)?
        create,
    TResult? Function(String name, MaterialGroup materialGroup,
            MaterialUnit materialUnit, String id, bool? isAssets)?
        update,
    TResult? Function(String id)? delete,
    TResult? Function(String id)? activate,
    TResult? Function(String id)? deactivate,
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
            bool? isAssets)?
        create,
    TResult Function(String name, MaterialGroup materialGroup,
            MaterialUnit materialUnit, String id, bool? isAssets)?
        update,
    TResult Function(String id)? delete,
    TResult Function(String id)? activate,
    TResult Function(String id)? deactivate,
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
    required TResult orElse(),
  }) {
    if (deactivate != null) {
      return deactivate(this);
    }
    return orElse();
  }
}

abstract class _Deactivate implements MaterialEvent {
  const factory _Deactivate({required final String id}) = _$_Deactivate;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_DeactivateCopyWith<_$_Deactivate> get copyWith =>
      throw _privateConstructorUsedError;
}
