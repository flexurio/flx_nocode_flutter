// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entity_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EntityState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Map<String, dynamic>? data) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Map<String, dynamic>? data)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<String, dynamic>? data)? success,
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
abstract class $EntityStateCopyWith<$Res> {
  factory $EntityStateCopyWith(
          EntityState value, $Res Function(EntityState) then) =
      _$EntityStateCopyWithImpl<$Res, EntityState>;
}

/// @nodoc
class _$EntityStateCopyWithImpl<$Res, $Val extends EntityState>
    implements $EntityStateCopyWith<$Res> {
  _$EntityStateCopyWithImpl(this._value, this._then);

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
    extends _$EntityStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'EntityState.initial()';
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
    required TResult Function(Map<String, dynamic>? data) success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Map<String, dynamic>? data)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<String, dynamic>? data)? success,
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

abstract class _Initial implements EntityState {
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
    extends _$EntityStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'EntityState.loading()';
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
    required TResult Function(Map<String, dynamic>? data) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Map<String, dynamic>? data)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<String, dynamic>? data)? success,
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

abstract class _Loading implements EntityState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic>? data});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$EntityStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$SuccessImpl(
      freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(final Map<String, dynamic>? data) : _data = data;

  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'EntityState.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Map<String, dynamic>? data) success,
    required TResult Function(String error) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Map<String, dynamic>? data)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<String, dynamic>? data)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
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

abstract class _Success implements EntityState {
  const factory _Success(final Map<String, dynamic>? data) = _$SuccessImpl;

  Map<String, dynamic>? get data;
  @JsonKey(ignore: true)
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
    extends _$EntityStateCopyWithImpl<$Res, _$ErrorImpl>
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
    return 'EntityState.error(error: $error)';
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
    required TResult Function(Map<String, dynamic>? data) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Map<String, dynamic>? data)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Map<String, dynamic>? data)? success,
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

abstract class _Error implements EntityState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EntityEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<String, dynamic> data, String method, String url)
        execute,
    required TResult Function(
            Map<String, dynamic> data, Map<String, dynamic> filters)
        create,
    required TResult Function(
            Map<String, dynamic> data, Map<String, dynamic> filters)
        edit,
    required TResult Function(String id) delete,
    required TResult Function(Map<String, dynamic> data, BackendOther event)
        otherEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> data, String method, String url)?
        execute,
    TResult? Function(Map<String, dynamic> data, Map<String, dynamic> filters)?
        create,
    TResult? Function(Map<String, dynamic> data, Map<String, dynamic> filters)?
        edit,
    TResult? Function(String id)? delete,
    TResult? Function(Map<String, dynamic> data, BackendOther event)?
        otherEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> data, String method, String url)?
        execute,
    TResult Function(Map<String, dynamic> data, Map<String, dynamic> filters)?
        create,
    TResult Function(Map<String, dynamic> data, Map<String, dynamic> filters)?
        edit,
    TResult Function(String id)? delete,
    TResult Function(Map<String, dynamic> data, BackendOther event)? otherEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Execute value) execute,
    required TResult Function(_Create value) create,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_OtherEvent value) otherEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Execute value)? execute,
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_OtherEvent value)? otherEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Execute value)? execute,
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_OtherEvent value)? otherEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntityEventCopyWith<$Res> {
  factory $EntityEventCopyWith(
          EntityEvent value, $Res Function(EntityEvent) then) =
      _$EntityEventCopyWithImpl<$Res, EntityEvent>;
}

/// @nodoc
class _$EntityEventCopyWithImpl<$Res, $Val extends EntityEvent>
    implements $EntityEventCopyWith<$Res> {
  _$EntityEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ExecuteImplCopyWith<$Res> {
  factory _$$ExecuteImplCopyWith(
          _$ExecuteImpl value, $Res Function(_$ExecuteImpl) then) =
      __$$ExecuteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> data, String method, String url});
}

/// @nodoc
class __$$ExecuteImplCopyWithImpl<$Res>
    extends _$EntityEventCopyWithImpl<$Res, _$ExecuteImpl>
    implements _$$ExecuteImplCopyWith<$Res> {
  __$$ExecuteImplCopyWithImpl(
      _$ExecuteImpl _value, $Res Function(_$ExecuteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? method = null,
    Object? url = null,
  }) {
    return _then(_$ExecuteImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      method: null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ExecuteImpl implements _Execute {
  const _$ExecuteImpl(
      {required final Map<String, dynamic> data,
      required this.method,
      required this.url})
      : _data = data;

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  final String method;
  @override
  final String url;

  @override
  String toString() {
    return 'EntityEvent.execute(data: $data, method: $method, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExecuteImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.method, method) || other.method == method) &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), method, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExecuteImplCopyWith<_$ExecuteImpl> get copyWith =>
      __$$ExecuteImplCopyWithImpl<_$ExecuteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<String, dynamic> data, String method, String url)
        execute,
    required TResult Function(
            Map<String, dynamic> data, Map<String, dynamic> filters)
        create,
    required TResult Function(
            Map<String, dynamic> data, Map<String, dynamic> filters)
        edit,
    required TResult Function(String id) delete,
    required TResult Function(Map<String, dynamic> data, BackendOther event)
        otherEvent,
  }) {
    return execute(data, method, url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> data, String method, String url)?
        execute,
    TResult? Function(Map<String, dynamic> data, Map<String, dynamic> filters)?
        create,
    TResult? Function(Map<String, dynamic> data, Map<String, dynamic> filters)?
        edit,
    TResult? Function(String id)? delete,
    TResult? Function(Map<String, dynamic> data, BackendOther event)?
        otherEvent,
  }) {
    return execute?.call(data, method, url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> data, String method, String url)?
        execute,
    TResult Function(Map<String, dynamic> data, Map<String, dynamic> filters)?
        create,
    TResult Function(Map<String, dynamic> data, Map<String, dynamic> filters)?
        edit,
    TResult Function(String id)? delete,
    TResult Function(Map<String, dynamic> data, BackendOther event)? otherEvent,
    required TResult orElse(),
  }) {
    if (execute != null) {
      return execute(data, method, url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Execute value) execute,
    required TResult Function(_Create value) create,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_OtherEvent value) otherEvent,
  }) {
    return execute(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Execute value)? execute,
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_OtherEvent value)? otherEvent,
  }) {
    return execute?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Execute value)? execute,
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_OtherEvent value)? otherEvent,
    required TResult orElse(),
  }) {
    if (execute != null) {
      return execute(this);
    }
    return orElse();
  }
}

abstract class _Execute implements EntityEvent {
  const factory _Execute(
      {required final Map<String, dynamic> data,
      required final String method,
      required final String url}) = _$ExecuteImpl;

  Map<String, dynamic> get data;
  String get method;
  String get url;
  @JsonKey(ignore: true)
  _$$ExecuteImplCopyWith<_$ExecuteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateImplCopyWith<$Res> {
  factory _$$CreateImplCopyWith(
          _$CreateImpl value, $Res Function(_$CreateImpl) then) =
      __$$CreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> data, Map<String, dynamic> filters});
}

/// @nodoc
class __$$CreateImplCopyWithImpl<$Res>
    extends _$EntityEventCopyWithImpl<$Res, _$CreateImpl>
    implements _$$CreateImplCopyWith<$Res> {
  __$$CreateImplCopyWithImpl(
      _$CreateImpl _value, $Res Function(_$CreateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? filters = null,
  }) {
    return _then(_$CreateImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      filters: null == filters
          ? _value._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$CreateImpl implements _Create {
  const _$CreateImpl(
      {required final Map<String, dynamic> data,
      required final Map<String, dynamic> filters})
      : _data = data,
        _filters = filters;

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  final Map<String, dynamic> _filters;
  @override
  Map<String, dynamic> get filters {
    if (_filters is EqualUnmodifiableMapView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_filters);
  }

  @override
  String toString() {
    return 'EntityEvent.create(data: $data, filters: $filters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other._filters, _filters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(_filters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      __$$CreateImplCopyWithImpl<_$CreateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<String, dynamic> data, String method, String url)
        execute,
    required TResult Function(
            Map<String, dynamic> data, Map<String, dynamic> filters)
        create,
    required TResult Function(
            Map<String, dynamic> data, Map<String, dynamic> filters)
        edit,
    required TResult Function(String id) delete,
    required TResult Function(Map<String, dynamic> data, BackendOther event)
        otherEvent,
  }) {
    return create(data, filters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> data, String method, String url)?
        execute,
    TResult? Function(Map<String, dynamic> data, Map<String, dynamic> filters)?
        create,
    TResult? Function(Map<String, dynamic> data, Map<String, dynamic> filters)?
        edit,
    TResult? Function(String id)? delete,
    TResult? Function(Map<String, dynamic> data, BackendOther event)?
        otherEvent,
  }) {
    return create?.call(data, filters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> data, String method, String url)?
        execute,
    TResult Function(Map<String, dynamic> data, Map<String, dynamic> filters)?
        create,
    TResult Function(Map<String, dynamic> data, Map<String, dynamic> filters)?
        edit,
    TResult Function(String id)? delete,
    TResult Function(Map<String, dynamic> data, BackendOther event)? otherEvent,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(data, filters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Execute value) execute,
    required TResult Function(_Create value) create,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_OtherEvent value) otherEvent,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Execute value)? execute,
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_OtherEvent value)? otherEvent,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Execute value)? execute,
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_OtherEvent value)? otherEvent,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class _Create implements EntityEvent {
  const factory _Create(
      {required final Map<String, dynamic> data,
      required final Map<String, dynamic> filters}) = _$CreateImpl;

  Map<String, dynamic> get data;
  Map<String, dynamic> get filters;
  @JsonKey(ignore: true)
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditImplCopyWith<$Res> {
  factory _$$EditImplCopyWith(
          _$EditImpl value, $Res Function(_$EditImpl) then) =
      __$$EditImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> data, Map<String, dynamic> filters});
}

/// @nodoc
class __$$EditImplCopyWithImpl<$Res>
    extends _$EntityEventCopyWithImpl<$Res, _$EditImpl>
    implements _$$EditImplCopyWith<$Res> {
  __$$EditImplCopyWithImpl(_$EditImpl _value, $Res Function(_$EditImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? filters = null,
  }) {
    return _then(_$EditImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      filters: null == filters
          ? _value._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
    ));
  }
}

/// @nodoc

class _$EditImpl implements _Edit {
  const _$EditImpl(
      {required final Map<String, dynamic> data,
      required final Map<String, dynamic> filters})
      : _data = data,
        _filters = filters;

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  final Map<String, dynamic> _filters;
  @override
  Map<String, dynamic> get filters {
    if (_filters is EqualUnmodifiableMapView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_filters);
  }

  @override
  String toString() {
    return 'EntityEvent.edit(data: $data, filters: $filters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            const DeepCollectionEquality().equals(other._filters, _filters));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      const DeepCollectionEquality().hash(_filters));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditImplCopyWith<_$EditImpl> get copyWith =>
      __$$EditImplCopyWithImpl<_$EditImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<String, dynamic> data, String method, String url)
        execute,
    required TResult Function(
            Map<String, dynamic> data, Map<String, dynamic> filters)
        create,
    required TResult Function(
            Map<String, dynamic> data, Map<String, dynamic> filters)
        edit,
    required TResult Function(String id) delete,
    required TResult Function(Map<String, dynamic> data, BackendOther event)
        otherEvent,
  }) {
    return edit(data, filters);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> data, String method, String url)?
        execute,
    TResult? Function(Map<String, dynamic> data, Map<String, dynamic> filters)?
        create,
    TResult? Function(Map<String, dynamic> data, Map<String, dynamic> filters)?
        edit,
    TResult? Function(String id)? delete,
    TResult? Function(Map<String, dynamic> data, BackendOther event)?
        otherEvent,
  }) {
    return edit?.call(data, filters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> data, String method, String url)?
        execute,
    TResult Function(Map<String, dynamic> data, Map<String, dynamic> filters)?
        create,
    TResult Function(Map<String, dynamic> data, Map<String, dynamic> filters)?
        edit,
    TResult Function(String id)? delete,
    TResult Function(Map<String, dynamic> data, BackendOther event)? otherEvent,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(data, filters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Execute value) execute,
    required TResult Function(_Create value) create,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_OtherEvent value) otherEvent,
  }) {
    return edit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Execute value)? execute,
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_OtherEvent value)? otherEvent,
  }) {
    return edit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Execute value)? execute,
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_OtherEvent value)? otherEvent,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(this);
    }
    return orElse();
  }
}

abstract class _Edit implements EntityEvent {
  const factory _Edit(
      {required final Map<String, dynamic> data,
      required final Map<String, dynamic> filters}) = _$EditImpl;

  Map<String, dynamic> get data;
  Map<String, dynamic> get filters;
  @JsonKey(ignore: true)
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
    extends _$EntityEventCopyWithImpl<$Res, _$DeleteImpl>
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
    return 'EntityEvent.delete(id: $id)';
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
            Map<String, dynamic> data, String method, String url)
        execute,
    required TResult Function(
            Map<String, dynamic> data, Map<String, dynamic> filters)
        create,
    required TResult Function(
            Map<String, dynamic> data, Map<String, dynamic> filters)
        edit,
    required TResult Function(String id) delete,
    required TResult Function(Map<String, dynamic> data, BackendOther event)
        otherEvent,
  }) {
    return delete(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> data, String method, String url)?
        execute,
    TResult? Function(Map<String, dynamic> data, Map<String, dynamic> filters)?
        create,
    TResult? Function(Map<String, dynamic> data, Map<String, dynamic> filters)?
        edit,
    TResult? Function(String id)? delete,
    TResult? Function(Map<String, dynamic> data, BackendOther event)?
        otherEvent,
  }) {
    return delete?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> data, String method, String url)?
        execute,
    TResult Function(Map<String, dynamic> data, Map<String, dynamic> filters)?
        create,
    TResult Function(Map<String, dynamic> data, Map<String, dynamic> filters)?
        edit,
    TResult Function(String id)? delete,
    TResult Function(Map<String, dynamic> data, BackendOther event)? otherEvent,
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
    required TResult Function(_Execute value) execute,
    required TResult Function(_Create value) create,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_OtherEvent value) otherEvent,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Execute value)? execute,
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_OtherEvent value)? otherEvent,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Execute value)? execute,
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_OtherEvent value)? otherEvent,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements EntityEvent {
  const factory _Delete({required final String id}) = _$DeleteImpl;

  String get id;
  @JsonKey(ignore: true)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OtherEventImplCopyWith<$Res> {
  factory _$$OtherEventImplCopyWith(
          _$OtherEventImpl value, $Res Function(_$OtherEventImpl) then) =
      __$$OtherEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Map<String, dynamic> data, BackendOther event});
}

/// @nodoc
class __$$OtherEventImplCopyWithImpl<$Res>
    extends _$EntityEventCopyWithImpl<$Res, _$OtherEventImpl>
    implements _$$OtherEventImplCopyWith<$Res> {
  __$$OtherEventImplCopyWithImpl(
      _$OtherEventImpl _value, $Res Function(_$OtherEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? event = null,
  }) {
    return _then(_$OtherEventImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      event: null == event
          ? _value.event
          : event // ignore: cast_nullable_to_non_nullable
              as BackendOther,
    ));
  }
}

/// @nodoc

class _$OtherEventImpl implements _OtherEvent {
  const _$OtherEventImpl(
      {required final Map<String, dynamic> data, required this.event})
      : _data = data;

  final Map<String, dynamic> _data;
  @override
  Map<String, dynamic> get data {
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_data);
  }

  @override
  final BackendOther event;

  @override
  String toString() {
    return 'EntityEvent.otherEvent(data: $data, event: $event)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OtherEventImpl &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.event, event) || other.event == event));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_data), event);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtherEventImplCopyWith<_$OtherEventImpl> get copyWith =>
      __$$OtherEventImplCopyWithImpl<_$OtherEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Map<String, dynamic> data, String method, String url)
        execute,
    required TResult Function(
            Map<String, dynamic> data, Map<String, dynamic> filters)
        create,
    required TResult Function(
            Map<String, dynamic> data, Map<String, dynamic> filters)
        edit,
    required TResult Function(String id) delete,
    required TResult Function(Map<String, dynamic> data, BackendOther event)
        otherEvent,
  }) {
    return otherEvent(data, event);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Map<String, dynamic> data, String method, String url)?
        execute,
    TResult? Function(Map<String, dynamic> data, Map<String, dynamic> filters)?
        create,
    TResult? Function(Map<String, dynamic> data, Map<String, dynamic> filters)?
        edit,
    TResult? Function(String id)? delete,
    TResult? Function(Map<String, dynamic> data, BackendOther event)?
        otherEvent,
  }) {
    return otherEvent?.call(data, event);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Map<String, dynamic> data, String method, String url)?
        execute,
    TResult Function(Map<String, dynamic> data, Map<String, dynamic> filters)?
        create,
    TResult Function(Map<String, dynamic> data, Map<String, dynamic> filters)?
        edit,
    TResult Function(String id)? delete,
    TResult Function(Map<String, dynamic> data, BackendOther event)? otherEvent,
    required TResult orElse(),
  }) {
    if (otherEvent != null) {
      return otherEvent(data, event);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Execute value) execute,
    required TResult Function(_Create value) create,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Delete value) delete,
    required TResult Function(_OtherEvent value) otherEvent,
  }) {
    return otherEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Execute value)? execute,
    TResult? Function(_Create value)? create,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Delete value)? delete,
    TResult? Function(_OtherEvent value)? otherEvent,
  }) {
    return otherEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Execute value)? execute,
    TResult Function(_Create value)? create,
    TResult Function(_Edit value)? edit,
    TResult Function(_Delete value)? delete,
    TResult Function(_OtherEvent value)? otherEvent,
    required TResult orElse(),
  }) {
    if (otherEvent != null) {
      return otherEvent(this);
    }
    return orElse();
  }
}

abstract class _OtherEvent implements EntityEvent {
  const factory _OtherEvent(
      {required final Map<String, dynamic> data,
      required final BackendOther event}) = _$OtherEventImpl;

  Map<String, dynamic> get data;
  BackendOther get event;
  @JsonKey(ignore: true)
  _$$OtherEventImplCopyWith<_$OtherEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
