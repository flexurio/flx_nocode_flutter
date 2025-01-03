// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_query_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MaterialQueryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(PageOptions<Material> pageOptions) loading,
    required TResult Function(PageOptions<Material> pageOptions) loaded,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PageOptions<Material> pageOptions)? loading,
    TResult? Function(PageOptions<Material> pageOptions)? loaded,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PageOptions<Material> pageOptions)? loading,
    TResult Function(PageOptions<Material> pageOptions)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialQueryStateCopyWith<$Res> {
  factory $MaterialQueryStateCopyWith(
          MaterialQueryState value, $Res Function(MaterialQueryState) then) =
      _$MaterialQueryStateCopyWithImpl<$Res, MaterialQueryState>;
}

/// @nodoc
class _$MaterialQueryStateCopyWithImpl<$Res, $Val extends MaterialQueryState>
    implements $MaterialQueryStateCopyWith<$Res> {
  _$MaterialQueryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialQueryState
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
    extends _$MaterialQueryStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialQueryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'MaterialQueryState.initial()';
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
    required TResult Function(PageOptions<Material> pageOptions) loading,
    required TResult Function(PageOptions<Material> pageOptions) loaded,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PageOptions<Material> pageOptions)? loading,
    TResult? Function(PageOptions<Material> pageOptions)? loaded,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PageOptions<Material> pageOptions)? loading,
    TResult Function(PageOptions<Material> pageOptions)? loaded,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements MaterialQueryState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PageOptions<Material> pageOptions});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$MaterialQueryStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialQueryState
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
              as PageOptions<Material>,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(this.pageOptions);

  @override
  final PageOptions<Material> pageOptions;

  @override
  String toString() {
    return 'MaterialQueryState.loading(pageOptions: $pageOptions)';
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

  /// Create a copy of MaterialQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(PageOptions<Material> pageOptions) loading,
    required TResult Function(PageOptions<Material> pageOptions) loaded,
    required TResult Function(String error) error,
  }) {
    return loading(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PageOptions<Material> pageOptions)? loading,
    TResult? Function(PageOptions<Material> pageOptions)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loading?.call(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PageOptions<Material> pageOptions)? loading,
    TResult Function(PageOptions<Material> pageOptions)? loaded,
    TResult Function(String error)? error,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements MaterialQueryState {
  const factory _Loading(final PageOptions<Material> pageOptions) =
      _$LoadingImpl;

  PageOptions<Material> get pageOptions;

  /// Create a copy of MaterialQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PageOptions<Material> pageOptions});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$MaterialQueryStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialQueryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageOptions = null,
  }) {
    return _then(_$LoadedImpl(
      null == pageOptions
          ? _value.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<Material>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(this.pageOptions);

  @override
  final PageOptions<Material> pageOptions;

  @override
  String toString() {
    return 'MaterialQueryState.loaded(pageOptions: $pageOptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.pageOptions, pageOptions) ||
                other.pageOptions == pageOptions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageOptions);

  /// Create a copy of MaterialQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(PageOptions<Material> pageOptions) loading,
    required TResult Function(PageOptions<Material> pageOptions) loaded,
    required TResult Function(String error) error,
  }) {
    return loaded(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PageOptions<Material> pageOptions)? loading,
    TResult? Function(PageOptions<Material> pageOptions)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PageOptions<Material> pageOptions)? loading,
    TResult Function(PageOptions<Material> pageOptions)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(pageOptions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements MaterialQueryState {
  const factory _Loaded(final PageOptions<Material> pageOptions) = _$LoadedImpl;

  PageOptions<Material> get pageOptions;

  /// Create a copy of MaterialQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
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
    extends _$MaterialQueryStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialQueryState
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
    return 'MaterialQueryState.error(error: $error)';
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

  /// Create a copy of MaterialQueryState
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
    required TResult Function(PageOptions<Material> pageOptions) loading,
    required TResult Function(PageOptions<Material> pageOptions) loaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PageOptions<Material> pageOptions)? loading,
    TResult? Function(PageOptions<Material> pageOptions)? loaded,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PageOptions<Material> pageOptions)? loading,
    TResult Function(PageOptions<Material> pageOptions)? loaded,
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
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements MaterialQueryState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of MaterialQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MaterialQueryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup,
            MaterialType? materialType,
            bool? isActive,
            bool? isOrder)
        fetch,
    required TResult Function(PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup, String vendorId)
        fetchByVendorId,
    required TResult Function(String id) fetchByMaterialGroup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup,
            MaterialType? materialType,
            bool? isActive,
            bool? isOrder)?
        fetch,
    TResult? Function(PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup, String vendorId)?
        fetchByVendorId,
    TResult? Function(String id)? fetchByMaterialGroup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup,
            MaterialType? materialType,
            bool? isActive,
            bool? isOrder)?
        fetch,
    TResult Function(PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup, String vendorId)?
        fetchByVendorId,
    TResult Function(String id)? fetchByMaterialGroup,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchByVendorId value) fetchByVendorId,
    required TResult Function(_FetchByMaterialGroup value) fetchByMaterialGroup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchByVendorId value)? fetchByVendorId,
    TResult? Function(_FetchByMaterialGroup value)? fetchByMaterialGroup,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchByVendorId value)? fetchByVendorId,
    TResult Function(_FetchByMaterialGroup value)? fetchByMaterialGroup,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialQueryEventCopyWith<$Res> {
  factory $MaterialQueryEventCopyWith(
          MaterialQueryEvent value, $Res Function(MaterialQueryEvent) then) =
      _$MaterialQueryEventCopyWithImpl<$Res, MaterialQueryEvent>;
}

/// @nodoc
class _$MaterialQueryEventCopyWithImpl<$Res, $Val extends MaterialQueryEvent>
    implements $MaterialQueryEventCopyWith<$Res> {
  _$MaterialQueryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialQueryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitializeImplCopyWith<$Res> {
  factory _$$InitializeImplCopyWith(
          _$InitializeImpl value, $Res Function(_$InitializeImpl) then) =
      __$$InitializeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeImplCopyWithImpl<$Res>
    extends _$MaterialQueryEventCopyWithImpl<$Res, _$InitializeImpl>
    implements _$$InitializeImplCopyWith<$Res> {
  __$$InitializeImplCopyWithImpl(
      _$InitializeImpl _value, $Res Function(_$InitializeImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialQueryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitializeImpl implements _Initialize {
  const _$InitializeImpl();

  @override
  String toString() {
    return 'MaterialQueryEvent.initialize()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup,
            MaterialType? materialType,
            bool? isActive,
            bool? isOrder)
        fetch,
    required TResult Function(PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup, String vendorId)
        fetchByVendorId,
    required TResult Function(String id) fetchByMaterialGroup,
  }) {
    return initialize();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup,
            MaterialType? materialType,
            bool? isActive,
            bool? isOrder)?
        fetch,
    TResult? Function(PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup, String vendorId)?
        fetchByVendorId,
    TResult? Function(String id)? fetchByMaterialGroup,
  }) {
    return initialize?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup,
            MaterialType? materialType,
            bool? isActive,
            bool? isOrder)?
        fetch,
    TResult Function(PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup, String vendorId)?
        fetchByVendorId,
    TResult Function(String id)? fetchByMaterialGroup,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchByVendorId value) fetchByVendorId,
    required TResult Function(_FetchByMaterialGroup value) fetchByMaterialGroup,
  }) {
    return initialize(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchByVendorId value)? fetchByVendorId,
    TResult? Function(_FetchByMaterialGroup value)? fetchByMaterialGroup,
  }) {
    return initialize?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchByVendorId value)? fetchByVendorId,
    TResult Function(_FetchByMaterialGroup value)? fetchByMaterialGroup,
    required TResult orElse(),
  }) {
    if (initialize != null) {
      return initialize(this);
    }
    return orElse();
  }
}

abstract class _Initialize implements MaterialQueryEvent {
  const factory _Initialize() = _$InitializeImpl;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PageOptions<Material>? pageOptions,
      MaterialGroup? materialGroup,
      MaterialType? materialType,
      bool? isActive,
      bool? isOrder});

  $MaterialGroupCopyWith<$Res>? get materialGroup;
  $MaterialTypeCopyWith<$Res>? get materialType;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$MaterialQueryEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageOptions = freezed,
    Object? materialGroup = freezed,
    Object? materialType = freezed,
    Object? isActive = freezed,
    Object? isOrder = freezed,
  }) {
    return _then(_$FetchImpl(
      pageOptions: freezed == pageOptions
          ? _value.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<Material>?,
      materialGroup: freezed == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as MaterialGroup?,
      materialType: freezed == materialType
          ? _value.materialType
          : materialType // ignore: cast_nullable_to_non_nullable
              as MaterialType?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOrder: freezed == isOrder
          ? _value.isOrder
          : isOrder // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }

  /// Create a copy of MaterialQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialGroupCopyWith<$Res>? get materialGroup {
    if (_value.materialGroup == null) {
      return null;
    }

    return $MaterialGroupCopyWith<$Res>(_value.materialGroup!, (value) {
      return _then(_value.copyWith(materialGroup: value));
    });
  }

  /// Create a copy of MaterialQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialTypeCopyWith<$Res>? get materialType {
    if (_value.materialType == null) {
      return null;
    }

    return $MaterialTypeCopyWith<$Res>(_value.materialType!, (value) {
      return _then(_value.copyWith(materialType: value));
    });
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl(
      {this.pageOptions,
      this.materialGroup,
      this.materialType,
      this.isActive,
      this.isOrder});

  @override
  final PageOptions<Material>? pageOptions;
  @override
  final MaterialGroup? materialGroup;
  @override
  final MaterialType? materialType;
  @override
  final bool? isActive;
  @override
  final bool? isOrder;

  @override
  String toString() {
    return 'MaterialQueryEvent.fetch(pageOptions: $pageOptions, materialGroup: $materialGroup, materialType: $materialType, isActive: $isActive, isOrder: $isOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.pageOptions, pageOptions) ||
                other.pageOptions == pageOptions) &&
            (identical(other.materialGroup, materialGroup) ||
                other.materialGroup == materialGroup) &&
            (identical(other.materialType, materialType) ||
                other.materialType == materialType) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isOrder, isOrder) || other.isOrder == isOrder));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, pageOptions, materialGroup, materialType, isActive, isOrder);

  /// Create a copy of MaterialQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup,
            MaterialType? materialType,
            bool? isActive,
            bool? isOrder)
        fetch,
    required TResult Function(PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup, String vendorId)
        fetchByVendorId,
    required TResult Function(String id) fetchByMaterialGroup,
  }) {
    return fetch(pageOptions, materialGroup, materialType, isActive, isOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup,
            MaterialType? materialType,
            bool? isActive,
            bool? isOrder)?
        fetch,
    TResult? Function(PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup, String vendorId)?
        fetchByVendorId,
    TResult? Function(String id)? fetchByMaterialGroup,
  }) {
    return fetch?.call(
        pageOptions, materialGroup, materialType, isActive, isOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup,
            MaterialType? materialType,
            bool? isActive,
            bool? isOrder)?
        fetch,
    TResult Function(PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup, String vendorId)?
        fetchByVendorId,
    TResult Function(String id)? fetchByMaterialGroup,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(pageOptions, materialGroup, materialType, isActive, isOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchByVendorId value) fetchByVendorId,
    required TResult Function(_FetchByMaterialGroup value) fetchByMaterialGroup,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchByVendorId value)? fetchByVendorId,
    TResult? Function(_FetchByMaterialGroup value)? fetchByMaterialGroup,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchByVendorId value)? fetchByVendorId,
    TResult Function(_FetchByMaterialGroup value)? fetchByMaterialGroup,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements MaterialQueryEvent {
  const factory _Fetch(
      {final PageOptions<Material>? pageOptions,
      final MaterialGroup? materialGroup,
      final MaterialType? materialType,
      final bool? isActive,
      final bool? isOrder}) = _$FetchImpl;

  PageOptions<Material>? get pageOptions;
  MaterialGroup? get materialGroup;
  MaterialType? get materialType;
  bool? get isActive;
  bool? get isOrder;

  /// Create a copy of MaterialQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchByVendorIdImplCopyWith<$Res> {
  factory _$$FetchByVendorIdImplCopyWith(_$FetchByVendorIdImpl value,
          $Res Function(_$FetchByVendorIdImpl) then) =
      __$$FetchByVendorIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PageOptions<Material>? pageOptions,
      MaterialGroup? materialGroup,
      String vendorId});

  $MaterialGroupCopyWith<$Res>? get materialGroup;
}

/// @nodoc
class __$$FetchByVendorIdImplCopyWithImpl<$Res>
    extends _$MaterialQueryEventCopyWithImpl<$Res, _$FetchByVendorIdImpl>
    implements _$$FetchByVendorIdImplCopyWith<$Res> {
  __$$FetchByVendorIdImplCopyWithImpl(
      _$FetchByVendorIdImpl _value, $Res Function(_$FetchByVendorIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageOptions = freezed,
    Object? materialGroup = freezed,
    Object? vendorId = null,
  }) {
    return _then(_$FetchByVendorIdImpl(
      pageOptions: freezed == pageOptions
          ? _value.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<Material>?,
      materialGroup: freezed == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as MaterialGroup?,
      vendorId: null == vendorId
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of MaterialQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialGroupCopyWith<$Res>? get materialGroup {
    if (_value.materialGroup == null) {
      return null;
    }

    return $MaterialGroupCopyWith<$Res>(_value.materialGroup!, (value) {
      return _then(_value.copyWith(materialGroup: value));
    });
  }
}

/// @nodoc

class _$FetchByVendorIdImpl implements _FetchByVendorId {
  const _$FetchByVendorIdImpl(
      {this.pageOptions, this.materialGroup, required this.vendorId});

  @override
  final PageOptions<Material>? pageOptions;
  @override
  final MaterialGroup? materialGroup;
  @override
  final String vendorId;

  @override
  String toString() {
    return 'MaterialQueryEvent.fetchByVendorId(pageOptions: $pageOptions, materialGroup: $materialGroup, vendorId: $vendorId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchByVendorIdImpl &&
            (identical(other.pageOptions, pageOptions) ||
                other.pageOptions == pageOptions) &&
            (identical(other.materialGroup, materialGroup) ||
                other.materialGroup == materialGroup) &&
            (identical(other.vendorId, vendorId) ||
                other.vendorId == vendorId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, pageOptions, materialGroup, vendorId);

  /// Create a copy of MaterialQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchByVendorIdImplCopyWith<_$FetchByVendorIdImpl> get copyWith =>
      __$$FetchByVendorIdImplCopyWithImpl<_$FetchByVendorIdImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup,
            MaterialType? materialType,
            bool? isActive,
            bool? isOrder)
        fetch,
    required TResult Function(PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup, String vendorId)
        fetchByVendorId,
    required TResult Function(String id) fetchByMaterialGroup,
  }) {
    return fetchByVendorId(pageOptions, materialGroup, vendorId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup,
            MaterialType? materialType,
            bool? isActive,
            bool? isOrder)?
        fetch,
    TResult? Function(PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup, String vendorId)?
        fetchByVendorId,
    TResult? Function(String id)? fetchByMaterialGroup,
  }) {
    return fetchByVendorId?.call(pageOptions, materialGroup, vendorId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup,
            MaterialType? materialType,
            bool? isActive,
            bool? isOrder)?
        fetch,
    TResult Function(PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup, String vendorId)?
        fetchByVendorId,
    TResult Function(String id)? fetchByMaterialGroup,
    required TResult orElse(),
  }) {
    if (fetchByVendorId != null) {
      return fetchByVendorId(pageOptions, materialGroup, vendorId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchByVendorId value) fetchByVendorId,
    required TResult Function(_FetchByMaterialGroup value) fetchByMaterialGroup,
  }) {
    return fetchByVendorId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchByVendorId value)? fetchByVendorId,
    TResult? Function(_FetchByMaterialGroup value)? fetchByMaterialGroup,
  }) {
    return fetchByVendorId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchByVendorId value)? fetchByVendorId,
    TResult Function(_FetchByMaterialGroup value)? fetchByMaterialGroup,
    required TResult orElse(),
  }) {
    if (fetchByVendorId != null) {
      return fetchByVendorId(this);
    }
    return orElse();
  }
}

abstract class _FetchByVendorId implements MaterialQueryEvent {
  const factory _FetchByVendorId(
      {final PageOptions<Material>? pageOptions,
      final MaterialGroup? materialGroup,
      required final String vendorId}) = _$FetchByVendorIdImpl;

  PageOptions<Material>? get pageOptions;
  MaterialGroup? get materialGroup;
  String get vendorId;

  /// Create a copy of MaterialQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchByVendorIdImplCopyWith<_$FetchByVendorIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchByMaterialGroupImplCopyWith<$Res> {
  factory _$$FetchByMaterialGroupImplCopyWith(_$FetchByMaterialGroupImpl value,
          $Res Function(_$FetchByMaterialGroupImpl) then) =
      __$$FetchByMaterialGroupImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$FetchByMaterialGroupImplCopyWithImpl<$Res>
    extends _$MaterialQueryEventCopyWithImpl<$Res, _$FetchByMaterialGroupImpl>
    implements _$$FetchByMaterialGroupImplCopyWith<$Res> {
  __$$FetchByMaterialGroupImplCopyWithImpl(_$FetchByMaterialGroupImpl _value,
      $Res Function(_$FetchByMaterialGroupImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$FetchByMaterialGroupImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchByMaterialGroupImpl implements _FetchByMaterialGroup {
  const _$FetchByMaterialGroupImpl({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'MaterialQueryEvent.fetchByMaterialGroup(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchByMaterialGroupImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of MaterialQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchByMaterialGroupImplCopyWith<_$FetchByMaterialGroupImpl>
      get copyWith =>
          __$$FetchByMaterialGroupImplCopyWithImpl<_$FetchByMaterialGroupImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialize,
    required TResult Function(
            PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup,
            MaterialType? materialType,
            bool? isActive,
            bool? isOrder)
        fetch,
    required TResult Function(PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup, String vendorId)
        fetchByVendorId,
    required TResult Function(String id) fetchByMaterialGroup,
  }) {
    return fetchByMaterialGroup(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialize,
    TResult? Function(
            PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup,
            MaterialType? materialType,
            bool? isActive,
            bool? isOrder)?
        fetch,
    TResult? Function(PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup, String vendorId)?
        fetchByVendorId,
    TResult? Function(String id)? fetchByMaterialGroup,
  }) {
    return fetchByMaterialGroup?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialize,
    TResult Function(
            PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup,
            MaterialType? materialType,
            bool? isActive,
            bool? isOrder)?
        fetch,
    TResult Function(PageOptions<Material>? pageOptions,
            MaterialGroup? materialGroup, String vendorId)?
        fetchByVendorId,
    TResult Function(String id)? fetchByMaterialGroup,
    required TResult orElse(),
  }) {
    if (fetchByMaterialGroup != null) {
      return fetchByMaterialGroup(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialize value) initialize,
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchByVendorId value) fetchByVendorId,
    required TResult Function(_FetchByMaterialGroup value) fetchByMaterialGroup,
  }) {
    return fetchByMaterialGroup(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialize value)? initialize,
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchByVendorId value)? fetchByVendorId,
    TResult? Function(_FetchByMaterialGroup value)? fetchByMaterialGroup,
  }) {
    return fetchByMaterialGroup?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialize value)? initialize,
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchByVendorId value)? fetchByVendorId,
    TResult Function(_FetchByMaterialGroup value)? fetchByMaterialGroup,
    required TResult orElse(),
  }) {
    if (fetchByMaterialGroup != null) {
      return fetchByMaterialGroup(this);
    }
    return orElse();
  }
}

abstract class _FetchByMaterialGroup implements MaterialQueryEvent {
  const factory _FetchByMaterialGroup({required final String id}) =
      _$FetchByMaterialGroupImpl;

  String get id;

  /// Create a copy of MaterialQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchByMaterialGroupImplCopyWith<_$FetchByMaterialGroupImpl>
      get copyWith => throw _privateConstructorUsedError;
}
