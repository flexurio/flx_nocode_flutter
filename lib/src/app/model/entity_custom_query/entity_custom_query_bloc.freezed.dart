// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity_custom_query_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EntityCustomQueryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(PageOptions<Map<String, dynamic>> pageOptions)
        loading,
    required TResult Function(PageOptions<Map<String, dynamic>> pageOptions)
        loaded,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PageOptions<Map<String, dynamic>> pageOptions)? loading,
    TResult? Function(PageOptions<Map<String, dynamic>> pageOptions)? loaded,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PageOptions<Map<String, dynamic>> pageOptions)? loading,
    TResult Function(PageOptions<Map<String, dynamic>> pageOptions)? loaded,
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
abstract class $EntityCustomQueryStateCopyWith<$Res> {
  factory $EntityCustomQueryStateCopyWith(EntityCustomQueryState value,
          $Res Function(EntityCustomQueryState) then) =
      _$EntityCustomQueryStateCopyWithImpl<$Res, EntityCustomQueryState>;
}

/// @nodoc
class _$EntityCustomQueryStateCopyWithImpl<$Res,
        $Val extends EntityCustomQueryState>
    implements $EntityCustomQueryStateCopyWith<$Res> {
  _$EntityCustomQueryStateCopyWithImpl(this._value, this._then);

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
    extends _$EntityCustomQueryStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'EntityCustomQueryState.initial()';
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
    required TResult Function(PageOptions<Map<String, dynamic>> pageOptions)
        loading,
    required TResult Function(PageOptions<Map<String, dynamic>> pageOptions)
        loaded,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PageOptions<Map<String, dynamic>> pageOptions)? loading,
    TResult? Function(PageOptions<Map<String, dynamic>> pageOptions)? loaded,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PageOptions<Map<String, dynamic>> pageOptions)? loading,
    TResult Function(PageOptions<Map<String, dynamic>> pageOptions)? loaded,
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

abstract class _Initial implements EntityCustomQueryState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PageOptions<Map<String, dynamic>> pageOptions});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$EntityCustomQueryStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageOptions = null,
  }) {
    return _then(_$LoadingImpl(
      null == pageOptions
          ? _value.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(this.pageOptions);

  @override
  final PageOptions<Map<String, dynamic>> pageOptions;

  @override
  String toString() {
    return 'EntityCustomQueryState.loading(pageOptions: $pageOptions)';
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(PageOptions<Map<String, dynamic>> pageOptions)
        loading,
    required TResult Function(PageOptions<Map<String, dynamic>> pageOptions)
        loaded,
    required TResult Function(String error) error,
  }) {
    return loading(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PageOptions<Map<String, dynamic>> pageOptions)? loading,
    TResult? Function(PageOptions<Map<String, dynamic>> pageOptions)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loading?.call(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PageOptions<Map<String, dynamic>> pageOptions)? loading,
    TResult Function(PageOptions<Map<String, dynamic>> pageOptions)? loaded,
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

abstract class _Loading implements EntityCustomQueryState {
  const factory _Loading(final PageOptions<Map<String, dynamic>> pageOptions) =
      _$LoadingImpl;

  PageOptions<Map<String, dynamic>> get pageOptions;
  @JsonKey(ignore: true)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PageOptions<Map<String, dynamic>> pageOptions});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$EntityCustomQueryStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageOptions = null,
  }) {
    return _then(_$LoadedImpl(
      null == pageOptions
          ? _value.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(this.pageOptions);

  @override
  final PageOptions<Map<String, dynamic>> pageOptions;

  @override
  String toString() {
    return 'EntityCustomQueryState.loaded(pageOptions: $pageOptions)';
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(PageOptions<Map<String, dynamic>> pageOptions)
        loading,
    required TResult Function(PageOptions<Map<String, dynamic>> pageOptions)
        loaded,
    required TResult Function(String error) error,
  }) {
    return loaded(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PageOptions<Map<String, dynamic>> pageOptions)? loading,
    TResult? Function(PageOptions<Map<String, dynamic>> pageOptions)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PageOptions<Map<String, dynamic>> pageOptions)? loading,
    TResult Function(PageOptions<Map<String, dynamic>> pageOptions)? loaded,
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

abstract class _Loaded implements EntityCustomQueryState {
  const factory _Loaded(final PageOptions<Map<String, dynamic>> pageOptions) =
      _$LoadedImpl;

  PageOptions<Map<String, dynamic>> get pageOptions;
  @JsonKey(ignore: true)
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
    extends _$EntityCustomQueryStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'EntityCustomQueryState.error(error: $error)';
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
    required TResult Function(PageOptions<Map<String, dynamic>> pageOptions)
        loading,
    required TResult Function(PageOptions<Map<String, dynamic>> pageOptions)
        loaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PageOptions<Map<String, dynamic>> pageOptions)? loading,
    TResult? Function(PageOptions<Map<String, dynamic>> pageOptions)? loaded,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PageOptions<Map<String, dynamic>> pageOptions)? loading,
    TResult Function(PageOptions<Map<String, dynamic>> pageOptions)? loaded,
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

abstract class _Error implements EntityCustomQueryState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EntityCustomQueryEvent {
  String get method => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  bool? get mockEnabled => throw _privateConstructorUsedError;
  Object? get mockData => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PageOptions<Map<String, dynamic>>? pageOptions,
            List<Filter>? filters,
            String method,
            String url,
            int? cachedDurationSeconds,
            bool? mockEnabled,
            Object? mockData)
        fetch,
    required TResult Function(String id, String method, String url,
            bool? mockEnabled, Object? mockData)
        fetchById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PageOptions<Map<String, dynamic>>? pageOptions,
            List<Filter>? filters,
            String method,
            String url,
            int? cachedDurationSeconds,
            bool? mockEnabled,
            Object? mockData)?
        fetch,
    TResult? Function(String id, String method, String url, bool? mockEnabled,
            Object? mockData)?
        fetchById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PageOptions<Map<String, dynamic>>? pageOptions,
            List<Filter>? filters,
            String method,
            String url,
            int? cachedDurationSeconds,
            bool? mockEnabled,
            Object? mockData)?
        fetch,
    TResult Function(String id, String method, String url, bool? mockEnabled,
            Object? mockData)?
        fetchById,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchById value) fetchById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchById value)? fetchById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchById value)? fetchById,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EntityCustomQueryEventCopyWith<EntityCustomQueryEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntityCustomQueryEventCopyWith<$Res> {
  factory $EntityCustomQueryEventCopyWith(EntityCustomQueryEvent value,
          $Res Function(EntityCustomQueryEvent) then) =
      _$EntityCustomQueryEventCopyWithImpl<$Res, EntityCustomQueryEvent>;
  @useResult
  $Res call({String method, String url, bool? mockEnabled, Object? mockData});
}

/// @nodoc
class _$EntityCustomQueryEventCopyWithImpl<$Res,
        $Val extends EntityCustomQueryEvent>
    implements $EntityCustomQueryEventCopyWith<$Res> {
  _$EntityCustomQueryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? url = null,
    Object? mockEnabled = freezed,
    Object? mockData = freezed,
  }) {
    return _then(_value.copyWith(
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      mockEnabled: freezed == mockEnabled
          ? _value.mockEnabled
          : mockEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      mockData: freezed == mockData ? _value.mockData : mockData,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res>
    implements $EntityCustomQueryEventCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PageOptions<Map<String, dynamic>>? pageOptions,
      List<Filter>? filters,
      String method,
      String url,
      int? cachedDurationSeconds,
      bool? mockEnabled,
      Object? mockData});
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$EntityCustomQueryEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageOptions = freezed,
    Object? filters = freezed,
    Object? method = null,
    Object? url = null,
    Object? cachedDurationSeconds = freezed,
    Object? mockEnabled = freezed,
    Object? mockData = freezed,
  }) {
    return _then(_$FetchImpl(
      pageOptions: freezed == pageOptions
          ? _value.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<Map<String, dynamic>>?,
      filters: freezed == filters
          ? _value._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<Filter>?,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      cachedDurationSeconds: freezed == cachedDurationSeconds
          ? _value.cachedDurationSeconds
          : cachedDurationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      mockEnabled: freezed == mockEnabled
          ? _value.mockEnabled
          : mockEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      mockData: freezed == mockData ? _value.mockData : mockData,
    ));
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl(
      {this.pageOptions,
      final List<Filter>? filters,
      required this.method,
      required this.url,
      required this.cachedDurationSeconds,
      this.mockEnabled,
      this.mockData})
      : _filters = filters;

  @override
  final PageOptions<Map<String, dynamic>>? pageOptions;
  final List<Filter>? _filters;
  @override
  List<Filter>? get filters {
    final value = _filters;
    if (value == null) return null;
    if (_filters is EqualUnmodifiableListView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String method;
  @override
  final String url;
  @override
  final int? cachedDurationSeconds;
  @override
  final bool? mockEnabled;
  @override
  final Object? mockData;

  @override
  String toString() {
    return 'EntityCustomQueryEvent.fetch(pageOptions: $pageOptions, filters: $filters, method: $method, url: $url, cachedDurationSeconds: $cachedDurationSeconds, mockEnabled: $mockEnabled, mockData: $mockData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.pageOptions, pageOptions) ||
                other.pageOptions == pageOptions) &&
            const DeepCollectionEquality().equals(other._filters, _filters) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.cachedDurationSeconds, cachedDurationSeconds) ||
                other.cachedDurationSeconds == cachedDurationSeconds) &&
            (identical(other.mockEnabled, mockEnabled) ||
                other.mockEnabled == mockEnabled) &&
            const DeepCollectionEquality().equals(other.mockData, mockData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      pageOptions,
      const DeepCollectionEquality().hash(_filters),
      method,
      url,
      cachedDurationSeconds,
      mockEnabled,
      const DeepCollectionEquality().hash(mockData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PageOptions<Map<String, dynamic>>? pageOptions,
            List<Filter>? filters,
            String method,
            String url,
            int? cachedDurationSeconds,
            bool? mockEnabled,
            Object? mockData)
        fetch,
    required TResult Function(String id, String method, String url,
            bool? mockEnabled, Object? mockData)
        fetchById,
  }) {
    return fetch(pageOptions, filters, method, url, cachedDurationSeconds,
        mockEnabled, mockData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PageOptions<Map<String, dynamic>>? pageOptions,
            List<Filter>? filters,
            String method,
            String url,
            int? cachedDurationSeconds,
            bool? mockEnabled,
            Object? mockData)?
        fetch,
    TResult? Function(String id, String method, String url, bool? mockEnabled,
            Object? mockData)?
        fetchById,
  }) {
    return fetch?.call(pageOptions, filters, method, url, cachedDurationSeconds,
        mockEnabled, mockData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PageOptions<Map<String, dynamic>>? pageOptions,
            List<Filter>? filters,
            String method,
            String url,
            int? cachedDurationSeconds,
            bool? mockEnabled,
            Object? mockData)?
        fetch,
    TResult Function(String id, String method, String url, bool? mockEnabled,
            Object? mockData)?
        fetchById,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(pageOptions, filters, method, url, cachedDurationSeconds,
          mockEnabled, mockData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchById value) fetchById,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchById value)? fetchById,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchById value)? fetchById,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements EntityCustomQueryEvent {
  const factory _Fetch(
      {final PageOptions<Map<String, dynamic>>? pageOptions,
      final List<Filter>? filters,
      required final String method,
      required final String url,
      required final int? cachedDurationSeconds,
      final bool? mockEnabled,
      final Object? mockData}) = _$FetchImpl;

  PageOptions<Map<String, dynamic>>? get pageOptions;
  List<Filter>? get filters;
  @override
  String get method;
  @override
  String get url;
  int? get cachedDurationSeconds;
  @override
  bool? get mockEnabled;
  @override
  Object? get mockData;
  @override
  @JsonKey(ignore: true)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchByIdImplCopyWith<$Res>
    implements $EntityCustomQueryEventCopyWith<$Res> {
  factory _$$FetchByIdImplCopyWith(
          _$FetchByIdImpl value, $Res Function(_$FetchByIdImpl) then) =
      __$$FetchByIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String method,
      String url,
      bool? mockEnabled,
      Object? mockData});
}

/// @nodoc
class __$$FetchByIdImplCopyWithImpl<$Res>
    extends _$EntityCustomQueryEventCopyWithImpl<$Res, _$FetchByIdImpl>
    implements _$$FetchByIdImplCopyWith<$Res> {
  __$$FetchByIdImplCopyWithImpl(
      _$FetchByIdImpl _value, $Res Function(_$FetchByIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? method = null,
    Object? url = null,
    Object? mockEnabled = freezed,
    Object? mockData = freezed,
  }) {
    return _then(_$FetchByIdImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      mockEnabled: freezed == mockEnabled
          ? _value.mockEnabled
          : mockEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      mockData: freezed == mockData ? _value.mockData : mockData,
    ));
  }
}

/// @nodoc

class _$FetchByIdImpl implements _FetchById {
  const _$FetchByIdImpl(
      {required this.id,
      required this.method,
      required this.url,
      this.mockEnabled,
      this.mockData});

  @override
  final String id;
  @override
  final String method;
  @override
  final String url;
  @override
  final bool? mockEnabled;
  @override
  final Object? mockData;

  @override
  String toString() {
    return 'EntityCustomQueryEvent.fetchById(id: $id, method: $method, url: $url, mockEnabled: $mockEnabled, mockData: $mockData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchByIdImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.mockEnabled, mockEnabled) ||
                other.mockEnabled == mockEnabled) &&
            const DeepCollectionEquality().equals(other.mockData, mockData));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, method, url, mockEnabled,
      const DeepCollectionEquality().hash(mockData));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchByIdImplCopyWith<_$FetchByIdImpl> get copyWith =>
      __$$FetchByIdImplCopyWithImpl<_$FetchByIdImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PageOptions<Map<String, dynamic>>? pageOptions,
            List<Filter>? filters,
            String method,
            String url,
            int? cachedDurationSeconds,
            bool? mockEnabled,
            Object? mockData)
        fetch,
    required TResult Function(String id, String method, String url,
            bool? mockEnabled, Object? mockData)
        fetchById,
  }) {
    return fetchById(id, method, url, mockEnabled, mockData);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PageOptions<Map<String, dynamic>>? pageOptions,
            List<Filter>? filters,
            String method,
            String url,
            int? cachedDurationSeconds,
            bool? mockEnabled,
            Object? mockData)?
        fetch,
    TResult? Function(String id, String method, String url, bool? mockEnabled,
            Object? mockData)?
        fetchById,
  }) {
    return fetchById?.call(id, method, url, mockEnabled, mockData);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PageOptions<Map<String, dynamic>>? pageOptions,
            List<Filter>? filters,
            String method,
            String url,
            int? cachedDurationSeconds,
            bool? mockEnabled,
            Object? mockData)?
        fetch,
    TResult Function(String id, String method, String url, bool? mockEnabled,
            Object? mockData)?
        fetchById,
    required TResult orElse(),
  }) {
    if (fetchById != null) {
      return fetchById(id, method, url, mockEnabled, mockData);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchById value) fetchById,
  }) {
    return fetchById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchById value)? fetchById,
  }) {
    return fetchById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchById value)? fetchById,
    required TResult orElse(),
  }) {
    if (fetchById != null) {
      return fetchById(this);
    }
    return orElse();
  }
}

abstract class _FetchById implements EntityCustomQueryEvent {
  const factory _FetchById(
      {required final String id,
      required final String method,
      required final String url,
      final bool? mockEnabled,
      final Object? mockData}) = _$FetchByIdImpl;

  String get id;
  @override
  String get method;
  @override
  String get url;
  @override
  bool? get mockEnabled;
  @override
  Object? get mockData;
  @override
  @JsonKey(ignore: true)
  _$$FetchByIdImplCopyWith<_$FetchByIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
