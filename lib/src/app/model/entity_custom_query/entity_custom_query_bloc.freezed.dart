// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity_custom_query_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EntityCustomQueryState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is EntityCustomQueryState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'EntityCustomQueryState()';
  }
}

/// @nodoc
class $EntityCustomQueryStateCopyWith<$Res> {
  $EntityCustomQueryStateCopyWith(
      EntityCustomQueryState _, $Res Function(EntityCustomQueryState) __);
}

/// Adds pattern-matching-related methods to [EntityCustomQueryState].
extension EntityCustomQueryStatePatterns on EntityCustomQueryState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _Error() when error != null:
        return error(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _Loaded():
        return loaded(_that);
      case _Error():
        return error(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _Error() when error != null:
        return error(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PageOptions<Map<String, dynamic>> pageOptions)? loading,
    TResult Function(PageOptions<Map<String, dynamic>> pageOptions)? loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading(_that.pageOptions);
      case _Loaded() when loaded != null:
        return loaded(_that.pageOptions);
      case _Error() when error != null:
        return error(_that.error);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(PageOptions<Map<String, dynamic>> pageOptions)
        loading,
    required TResult Function(PageOptions<Map<String, dynamic>> pageOptions)
        loaded,
    required TResult Function(String error) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading(_that.pageOptions);
      case _Loaded():
        return loaded(_that.pageOptions);
      case _Error():
        return error(_that.error);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PageOptions<Map<String, dynamic>> pageOptions)? loading,
    TResult? Function(PageOptions<Map<String, dynamic>> pageOptions)? loaded,
    TResult? Function(String error)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading(_that.pageOptions);
      case _Loaded() when loaded != null:
        return loaded(_that.pageOptions);
      case _Error() when error != null:
        return error(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements EntityCustomQueryState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'EntityCustomQueryState.initial()';
  }
}

/// @nodoc

class _Loading implements EntityCustomQueryState {
  const _Loading(this.pageOptions);

  final PageOptions<Map<String, dynamic>> pageOptions;

  /// Create a copy of EntityCustomQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadingCopyWith<_Loading> get copyWith =>
      __$LoadingCopyWithImpl<_Loading>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loading &&
            (identical(other.pageOptions, pageOptions) ||
                other.pageOptions == pageOptions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageOptions);

  @override
  String toString() {
    return 'EntityCustomQueryState.loading(pageOptions: $pageOptions)';
  }
}

/// @nodoc
abstract mixin class _$LoadingCopyWith<$Res>
    implements $EntityCustomQueryStateCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) _then) =
      __$LoadingCopyWithImpl;
  @useResult
  $Res call({PageOptions<Map<String, dynamic>> pageOptions});
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(this._self, this._then);

  final _Loading _self;
  final $Res Function(_Loading) _then;

  /// Create a copy of EntityCustomQueryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pageOptions = null,
  }) {
    return _then(_Loading(
      null == pageOptions
          ? _self.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _Loaded implements EntityCustomQueryState {
  const _Loaded(this.pageOptions);

  final PageOptions<Map<String, dynamic>> pageOptions;

  /// Create a copy of EntityCustomQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            (identical(other.pageOptions, pageOptions) ||
                other.pageOptions == pageOptions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageOptions);

  @override
  String toString() {
    return 'EntityCustomQueryState.loaded(pageOptions: $pageOptions)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $EntityCustomQueryStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @useResult
  $Res call({PageOptions<Map<String, dynamic>> pageOptions});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of EntityCustomQueryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pageOptions = null,
  }) {
    return _then(_Loaded(
      null == pageOptions
          ? _self.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _Error implements EntityCustomQueryState {
  const _Error(this.error);

  final String error;

  /// Create a copy of EntityCustomQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'EntityCustomQueryState.error(error: $error)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $EntityCustomQueryStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of EntityCustomQueryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(_Error(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$EntityCustomQueryEvent {
  String get method;
  String get url;
  bool? get mockEnabled;
  Object? get mockData;
  List<Map<String, dynamic>> get parentData;

  /// Create a copy of EntityCustomQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $EntityCustomQueryEventCopyWith<EntityCustomQueryEvent> get copyWith =>
      _$EntityCustomQueryEventCopyWithImpl<EntityCustomQueryEvent>(
          this as EntityCustomQueryEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is EntityCustomQueryEvent &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.mockEnabled, mockEnabled) ||
                other.mockEnabled == mockEnabled) &&
            const DeepCollectionEquality().equals(other.mockData, mockData) &&
            const DeepCollectionEquality()
                .equals(other.parentData, parentData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      method,
      url,
      mockEnabled,
      const DeepCollectionEquality().hash(mockData),
      const DeepCollectionEquality().hash(parentData));

  @override
  String toString() {
    return 'EntityCustomQueryEvent(method: $method, url: $url, mockEnabled: $mockEnabled, mockData: $mockData, parentData: $parentData)';
  }
}

/// @nodoc
abstract mixin class $EntityCustomQueryEventCopyWith<$Res> {
  factory $EntityCustomQueryEventCopyWith(EntityCustomQueryEvent value,
          $Res Function(EntityCustomQueryEvent) _then) =
      _$EntityCustomQueryEventCopyWithImpl;
  @useResult
  $Res call(
      {String method,
      String url,
      bool? mockEnabled,
      Object? mockData,
      List<Map<String, dynamic>> parentData});
}

/// @nodoc
class _$EntityCustomQueryEventCopyWithImpl<$Res>
    implements $EntityCustomQueryEventCopyWith<$Res> {
  _$EntityCustomQueryEventCopyWithImpl(this._self, this._then);

  final EntityCustomQueryEvent _self;
  final $Res Function(EntityCustomQueryEvent) _then;

  /// Create a copy of EntityCustomQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
    Object? url = null,
    Object? mockEnabled = freezed,
    Object? mockData = freezed,
    Object? parentData = null,
  }) {
    return _then(_self.copyWith(
      method: null == method
          ? _self.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      mockEnabled: freezed == mockEnabled
          ? _self.mockEnabled
          : mockEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      mockData: freezed == mockData ? _self.mockData : mockData,
      parentData: null == parentData
          ? _self.parentData
          : parentData // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// Adds pattern-matching-related methods to [EntityCustomQueryEvent].
extension EntityCustomQueryEventPatterns on EntityCustomQueryEvent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchById value)? fetchById,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Fetch() when fetch != null:
        return fetch(_that);
      case _FetchById() when fetchById != null:
        return fetchById(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchById value) fetchById,
  }) {
    final _that = this;
    switch (_that) {
      case _Fetch():
        return fetch(_that);
      case _FetchById():
        return fetchById(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchById value)? fetchById,
  }) {
    final _that = this;
    switch (_that) {
      case _Fetch() when fetch != null:
        return fetch(_that);
      case _FetchById() when fetchById != null:
        return fetchById(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PageOptions<Map<String, dynamic>>? pageOptions,
            List<Filter>? filters,
            String method,
            String url,
            int? cachedDurationSeconds,
            bool? mockEnabled,
            Object? mockData,
            List<Map<String, dynamic>> parentData)?
        fetch,
    TResult Function(String id, String method, String url, bool? mockEnabled,
            Object? mockData, List<Map<String, dynamic>> parentData)?
        fetchById,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Fetch() when fetch != null:
        return fetch(
            _that.pageOptions,
            _that.filters,
            _that.method,
            _that.url,
            _that.cachedDurationSeconds,
            _that.mockEnabled,
            _that.mockData,
            _that.parentData);
      case _FetchById() when fetchById != null:
        return fetchById(_that.id, _that.method, _that.url, _that.mockEnabled,
            _that.mockData, _that.parentData);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PageOptions<Map<String, dynamic>>? pageOptions,
            List<Filter>? filters,
            String method,
            String url,
            int? cachedDurationSeconds,
            bool? mockEnabled,
            Object? mockData,
            List<Map<String, dynamic>> parentData)
        fetch,
    required TResult Function(
            String id,
            String method,
            String url,
            bool? mockEnabled,
            Object? mockData,
            List<Map<String, dynamic>> parentData)
        fetchById,
  }) {
    final _that = this;
    switch (_that) {
      case _Fetch():
        return fetch(
            _that.pageOptions,
            _that.filters,
            _that.method,
            _that.url,
            _that.cachedDurationSeconds,
            _that.mockEnabled,
            _that.mockData,
            _that.parentData);
      case _FetchById():
        return fetchById(_that.id, _that.method, _that.url, _that.mockEnabled,
            _that.mockData, _that.parentData);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PageOptions<Map<String, dynamic>>? pageOptions,
            List<Filter>? filters,
            String method,
            String url,
            int? cachedDurationSeconds,
            bool? mockEnabled,
            Object? mockData,
            List<Map<String, dynamic>> parentData)?
        fetch,
    TResult? Function(String id, String method, String url, bool? mockEnabled,
            Object? mockData, List<Map<String, dynamic>> parentData)?
        fetchById,
  }) {
    final _that = this;
    switch (_that) {
      case _Fetch() when fetch != null:
        return fetch(
            _that.pageOptions,
            _that.filters,
            _that.method,
            _that.url,
            _that.cachedDurationSeconds,
            _that.mockEnabled,
            _that.mockData,
            _that.parentData);
      case _FetchById() when fetchById != null:
        return fetchById(_that.id, _that.method, _that.url, _that.mockEnabled,
            _that.mockData, _that.parentData);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Fetch implements EntityCustomQueryEvent {
  const _Fetch(
      {this.pageOptions,
      final List<Filter>? filters,
      required this.method,
      required this.url,
      required this.cachedDurationSeconds,
      this.mockEnabled,
      this.mockData,
      final List<Map<String, dynamic>> parentData = const []})
      : _filters = filters,
        _parentData = parentData;

  final PageOptions<Map<String, dynamic>>? pageOptions;
  final List<Filter>? _filters;
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
  final int? cachedDurationSeconds;
  @override
  final bool? mockEnabled;
  @override
  final Object? mockData;
  final List<Map<String, dynamic>> _parentData;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get parentData {
    if (_parentData is EqualUnmodifiableListView) return _parentData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parentData);
  }

  /// Create a copy of EntityCustomQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FetchCopyWith<_Fetch> get copyWith =>
      __$FetchCopyWithImpl<_Fetch>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Fetch &&
            (identical(other.pageOptions, pageOptions) ||
                other.pageOptions == pageOptions) &&
            const DeepCollectionEquality().equals(other._filters, _filters) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.cachedDurationSeconds, cachedDurationSeconds) ||
                other.cachedDurationSeconds == cachedDurationSeconds) &&
            (identical(other.mockEnabled, mockEnabled) ||
                other.mockEnabled == mockEnabled) &&
            const DeepCollectionEquality().equals(other.mockData, mockData) &&
            const DeepCollectionEquality()
                .equals(other._parentData, _parentData));
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
      const DeepCollectionEquality().hash(mockData),
      const DeepCollectionEquality().hash(_parentData));

  @override
  String toString() {
    return 'EntityCustomQueryEvent.fetch(pageOptions: $pageOptions, filters: $filters, method: $method, url: $url, cachedDurationSeconds: $cachedDurationSeconds, mockEnabled: $mockEnabled, mockData: $mockData, parentData: $parentData)';
  }
}

/// @nodoc
abstract mixin class _$FetchCopyWith<$Res>
    implements $EntityCustomQueryEventCopyWith<$Res> {
  factory _$FetchCopyWith(_Fetch value, $Res Function(_Fetch) _then) =
      __$FetchCopyWithImpl;
  @override
  @useResult
  $Res call(
      {PageOptions<Map<String, dynamic>>? pageOptions,
      List<Filter>? filters,
      String method,
      String url,
      int? cachedDurationSeconds,
      bool? mockEnabled,
      Object? mockData,
      List<Map<String, dynamic>> parentData});
}

/// @nodoc
class __$FetchCopyWithImpl<$Res> implements _$FetchCopyWith<$Res> {
  __$FetchCopyWithImpl(this._self, this._then);

  final _Fetch _self;
  final $Res Function(_Fetch) _then;

  /// Create a copy of EntityCustomQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pageOptions = freezed,
    Object? filters = freezed,
    Object? method = null,
    Object? url = null,
    Object? cachedDurationSeconds = freezed,
    Object? mockEnabled = freezed,
    Object? mockData = freezed,
    Object? parentData = null,
  }) {
    return _then(_Fetch(
      pageOptions: freezed == pageOptions
          ? _self.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<Map<String, dynamic>>?,
      filters: freezed == filters
          ? _self._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<Filter>?,
      method: null == method
          ? _self.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      cachedDurationSeconds: freezed == cachedDurationSeconds
          ? _self.cachedDurationSeconds
          : cachedDurationSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      mockEnabled: freezed == mockEnabled
          ? _self.mockEnabled
          : mockEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      mockData: freezed == mockData ? _self.mockData : mockData,
      parentData: null == parentData
          ? _self._parentData
          : parentData // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

/// @nodoc

class _FetchById implements EntityCustomQueryEvent {
  const _FetchById(
      {required this.id,
      required this.method,
      required this.url,
      this.mockEnabled,
      this.mockData,
      final List<Map<String, dynamic>> parentData = const []})
      : _parentData = parentData;

  final String id;
  @override
  final String method;
  @override
  final String url;
  @override
  final bool? mockEnabled;
  @override
  final Object? mockData;
  final List<Map<String, dynamic>> _parentData;
  @override
  @JsonKey()
  List<Map<String, dynamic>> get parentData {
    if (_parentData is EqualUnmodifiableListView) return _parentData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_parentData);
  }

  /// Create a copy of EntityCustomQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FetchByIdCopyWith<_FetchById> get copyWith =>
      __$FetchByIdCopyWithImpl<_FetchById>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FetchById &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.mockEnabled, mockEnabled) ||
                other.mockEnabled == mockEnabled) &&
            const DeepCollectionEquality().equals(other.mockData, mockData) &&
            const DeepCollectionEquality()
                .equals(other._parentData, _parentData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      method,
      url,
      mockEnabled,
      const DeepCollectionEquality().hash(mockData),
      const DeepCollectionEquality().hash(_parentData));

  @override
  String toString() {
    return 'EntityCustomQueryEvent.fetchById(id: $id, method: $method, url: $url, mockEnabled: $mockEnabled, mockData: $mockData, parentData: $parentData)';
  }
}

/// @nodoc
abstract mixin class _$FetchByIdCopyWith<$Res>
    implements $EntityCustomQueryEventCopyWith<$Res> {
  factory _$FetchByIdCopyWith(
          _FetchById value, $Res Function(_FetchById) _then) =
      __$FetchByIdCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String method,
      String url,
      bool? mockEnabled,
      Object? mockData,
      List<Map<String, dynamic>> parentData});
}

/// @nodoc
class __$FetchByIdCopyWithImpl<$Res> implements _$FetchByIdCopyWith<$Res> {
  __$FetchByIdCopyWithImpl(this._self, this._then);

  final _FetchById _self;
  final $Res Function(_FetchById) _then;

  /// Create a copy of EntityCustomQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? method = null,
    Object? url = null,
    Object? mockEnabled = freezed,
    Object? mockData = freezed,
    Object? parentData = null,
  }) {
    return _then(_FetchById(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      method: null == method
          ? _self.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      mockEnabled: freezed == mockEnabled
          ? _self.mockEnabled
          : mockEnabled // ignore: cast_nullable_to_non_nullable
              as bool?,
      mockData: freezed == mockData ? _self.mockData : mockData,
      parentData: null == parentData
          ? _self._parentData
          : parentData // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
    ));
  }
}

// dart format on
