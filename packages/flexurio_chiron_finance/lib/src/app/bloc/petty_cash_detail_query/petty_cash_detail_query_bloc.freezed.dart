// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'petty_cash_detail_query_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PettyCashDetailQueryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pettyCashId) fetchByPettyCashId,
    required TResult Function(PageOptions<PettyCashDetail>? pageOptions,
            DateTime documentReceiveAtStart, DateTime documentReceiveAtEnd)
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pettyCashId)? fetchByPettyCashId,
    TResult? Function(PageOptions<PettyCashDetail>? pageOptions,
            DateTime documentReceiveAtStart, DateTime documentReceiveAtEnd)?
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pettyCashId)? fetchByPettyCashId,
    TResult Function(PageOptions<PettyCashDetail>? pageOptions,
            DateTime documentReceiveAtStart, DateTime documentReceiveAtEnd)?
        fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchByPettyCashId value) fetchByPettyCashId,
    required TResult Function(_Fetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchByPettyCashId value)? fetchByPettyCashId,
    TResult? Function(_Fetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchByPettyCashId value)? fetchByPettyCashId,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PettyCashDetailQueryEventCopyWith<$Res> {
  factory $PettyCashDetailQueryEventCopyWith(PettyCashDetailQueryEvent value,
          $Res Function(PettyCashDetailQueryEvent) then) =
      _$PettyCashDetailQueryEventCopyWithImpl<$Res, PettyCashDetailQueryEvent>;
}

/// @nodoc
class _$PettyCashDetailQueryEventCopyWithImpl<$Res,
        $Val extends PettyCashDetailQueryEvent>
    implements $PettyCashDetailQueryEventCopyWith<$Res> {
  _$PettyCashDetailQueryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PettyCashDetailQueryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchByPettyCashIdImplCopyWith<$Res> {
  factory _$$FetchByPettyCashIdImplCopyWith(_$FetchByPettyCashIdImpl value,
          $Res Function(_$FetchByPettyCashIdImpl) then) =
      __$$FetchByPettyCashIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String pettyCashId});
}

/// @nodoc
class __$$FetchByPettyCashIdImplCopyWithImpl<$Res>
    extends _$PettyCashDetailQueryEventCopyWithImpl<$Res,
        _$FetchByPettyCashIdImpl>
    implements _$$FetchByPettyCashIdImplCopyWith<$Res> {
  __$$FetchByPettyCashIdImplCopyWithImpl(_$FetchByPettyCashIdImpl _value,
      $Res Function(_$FetchByPettyCashIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of PettyCashDetailQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pettyCashId = null,
  }) {
    return _then(_$FetchByPettyCashIdImpl(
      pettyCashId: null == pettyCashId
          ? _value.pettyCashId
          : pettyCashId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchByPettyCashIdImpl implements _FetchByPettyCashId {
  const _$FetchByPettyCashIdImpl({required this.pettyCashId});

  @override
  final String pettyCashId;

  @override
  String toString() {
    return 'PettyCashDetailQueryEvent.fetchByPettyCashId(pettyCashId: $pettyCashId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchByPettyCashIdImpl &&
            (identical(other.pettyCashId, pettyCashId) ||
                other.pettyCashId == pettyCashId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pettyCashId);

  /// Create a copy of PettyCashDetailQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchByPettyCashIdImplCopyWith<_$FetchByPettyCashIdImpl> get copyWith =>
      __$$FetchByPettyCashIdImplCopyWithImpl<_$FetchByPettyCashIdImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pettyCashId) fetchByPettyCashId,
    required TResult Function(PageOptions<PettyCashDetail>? pageOptions,
            DateTime documentReceiveAtStart, DateTime documentReceiveAtEnd)
        fetch,
  }) {
    return fetchByPettyCashId(pettyCashId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pettyCashId)? fetchByPettyCashId,
    TResult? Function(PageOptions<PettyCashDetail>? pageOptions,
            DateTime documentReceiveAtStart, DateTime documentReceiveAtEnd)?
        fetch,
  }) {
    return fetchByPettyCashId?.call(pettyCashId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pettyCashId)? fetchByPettyCashId,
    TResult Function(PageOptions<PettyCashDetail>? pageOptions,
            DateTime documentReceiveAtStart, DateTime documentReceiveAtEnd)?
        fetch,
    required TResult orElse(),
  }) {
    if (fetchByPettyCashId != null) {
      return fetchByPettyCashId(pettyCashId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchByPettyCashId value) fetchByPettyCashId,
    required TResult Function(_Fetch value) fetch,
  }) {
    return fetchByPettyCashId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchByPettyCashId value)? fetchByPettyCashId,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return fetchByPettyCashId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchByPettyCashId value)? fetchByPettyCashId,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetchByPettyCashId != null) {
      return fetchByPettyCashId(this);
    }
    return orElse();
  }
}

abstract class _FetchByPettyCashId implements PettyCashDetailQueryEvent {
  const factory _FetchByPettyCashId({required final String pettyCashId}) =
      _$FetchByPettyCashIdImpl;

  String get pettyCashId;

  /// Create a copy of PettyCashDetailQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchByPettyCashIdImplCopyWith<_$FetchByPettyCashIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PageOptions<PettyCashDetail>? pageOptions,
      DateTime documentReceiveAtStart,
      DateTime documentReceiveAtEnd});
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$PettyCashDetailQueryEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  /// Create a copy of PettyCashDetailQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageOptions = freezed,
    Object? documentReceiveAtStart = null,
    Object? documentReceiveAtEnd = null,
  }) {
    return _then(_$FetchImpl(
      pageOptions: freezed == pageOptions
          ? _value.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<PettyCashDetail>?,
      documentReceiveAtStart: null == documentReceiveAtStart
          ? _value.documentReceiveAtStart
          : documentReceiveAtStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      documentReceiveAtEnd: null == documentReceiveAtEnd
          ? _value.documentReceiveAtEnd
          : documentReceiveAtEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl(
      {this.pageOptions,
      required this.documentReceiveAtStart,
      required this.documentReceiveAtEnd});

  @override
  final PageOptions<PettyCashDetail>? pageOptions;
  @override
  final DateTime documentReceiveAtStart;
  @override
  final DateTime documentReceiveAtEnd;

  @override
  String toString() {
    return 'PettyCashDetailQueryEvent.fetch(pageOptions: $pageOptions, documentReceiveAtStart: $documentReceiveAtStart, documentReceiveAtEnd: $documentReceiveAtEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.pageOptions, pageOptions) ||
                other.pageOptions == pageOptions) &&
            (identical(other.documentReceiveAtStart, documentReceiveAtStart) ||
                other.documentReceiveAtStart == documentReceiveAtStart) &&
            (identical(other.documentReceiveAtEnd, documentReceiveAtEnd) ||
                other.documentReceiveAtEnd == documentReceiveAtEnd));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, pageOptions, documentReceiveAtStart, documentReceiveAtEnd);

  /// Create a copy of PettyCashDetailQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String pettyCashId) fetchByPettyCashId,
    required TResult Function(PageOptions<PettyCashDetail>? pageOptions,
            DateTime documentReceiveAtStart, DateTime documentReceiveAtEnd)
        fetch,
  }) {
    return fetch(pageOptions, documentReceiveAtStart, documentReceiveAtEnd);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String pettyCashId)? fetchByPettyCashId,
    TResult? Function(PageOptions<PettyCashDetail>? pageOptions,
            DateTime documentReceiveAtStart, DateTime documentReceiveAtEnd)?
        fetch,
  }) {
    return fetch?.call(
        pageOptions, documentReceiveAtStart, documentReceiveAtEnd);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String pettyCashId)? fetchByPettyCashId,
    TResult Function(PageOptions<PettyCashDetail>? pageOptions,
            DateTime documentReceiveAtStart, DateTime documentReceiveAtEnd)?
        fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(pageOptions, documentReceiveAtStart, documentReceiveAtEnd);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchByPettyCashId value) fetchByPettyCashId,
    required TResult Function(_Fetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_FetchByPettyCashId value)? fetchByPettyCashId,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchByPettyCashId value)? fetchByPettyCashId,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements PettyCashDetailQueryEvent {
  const factory _Fetch(
      {final PageOptions<PettyCashDetail>? pageOptions,
      required final DateTime documentReceiveAtStart,
      required final DateTime documentReceiveAtEnd}) = _$FetchImpl;

  PageOptions<PettyCashDetail>? get pageOptions;
  DateTime get documentReceiveAtStart;
  DateTime get documentReceiveAtEnd;

  /// Create a copy of PettyCashDetailQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PettyCashDetailQueryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function() initial,
    required TResult Function(PageOptions<PettyCashDetail> pageOptions) loaded,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(PageOptions<PettyCashDetail> pageOptions)? loaded,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(PageOptions<PettyCashDetail> pageOptions)? loaded,
    TResult Function()? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) loaded,
    required TResult Function(_Loading value) loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? loaded,
    TResult? Function(_Loading value)? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? loaded,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PettyCashDetailQueryStateCopyWith<$Res> {
  factory $PettyCashDetailQueryStateCopyWith(PettyCashDetailQueryState value,
          $Res Function(PettyCashDetailQueryState) then) =
      _$PettyCashDetailQueryStateCopyWithImpl<$Res, PettyCashDetailQueryState>;
}

/// @nodoc
class _$PettyCashDetailQueryStateCopyWithImpl<$Res,
        $Val extends PettyCashDetailQueryState>
    implements $PettyCashDetailQueryStateCopyWith<$Res> {
  _$PettyCashDetailQueryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PettyCashDetailQueryState
  /// with the given fields replaced by the non-null parameter values.
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
    extends _$PettyCashDetailQueryStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of PettyCashDetailQueryState
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
    return 'PettyCashDetailQueryState.error(error: $error)';
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

  /// Create a copy of PettyCashDetailQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function() initial,
    required TResult Function(PageOptions<PettyCashDetail> pageOptions) loaded,
    required TResult Function() loading,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(PageOptions<PettyCashDetail> pageOptions)? loaded,
    TResult? Function()? loading,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(PageOptions<PettyCashDetail> pageOptions)? loaded,
    TResult Function()? loading,
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
    required TResult Function(_Error value) error,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) loaded,
    required TResult Function(_Loading value) loading,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? loaded,
    TResult? Function(_Loading value)? loading,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? loaded,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements PettyCashDetailQueryState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of PettyCashDetailQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$PettyCashDetailQueryStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PettyCashDetailQueryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PettyCashDetailQueryState.initial()';
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
    required TResult Function(String error) error,
    required TResult Function() initial,
    required TResult Function(PageOptions<PettyCashDetail> pageOptions) loaded,
    required TResult Function() loading,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(PageOptions<PettyCashDetail> pageOptions)? loaded,
    TResult? Function()? loading,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(PageOptions<PettyCashDetail> pageOptions)? loaded,
    TResult Function()? loading,
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
    required TResult Function(_Error value) error,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) loaded,
    required TResult Function(_Loading value) loading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? loaded,
    TResult? Function(_Loading value)? loading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? loaded,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PettyCashDetailQueryState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PageOptions<PettyCashDetail> pageOptions});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$PettyCashDetailQueryStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of PettyCashDetailQueryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageOptions = null,
  }) {
    return _then(_$SuccessImpl(
      null == pageOptions
          ? _value.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<PettyCashDetail>,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.pageOptions);

  @override
  final PageOptions<PettyCashDetail> pageOptions;

  @override
  String toString() {
    return 'PettyCashDetailQueryState.loaded(pageOptions: $pageOptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.pageOptions, pageOptions) ||
                other.pageOptions == pageOptions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageOptions);

  /// Create a copy of PettyCashDetailQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function() initial,
    required TResult Function(PageOptions<PettyCashDetail> pageOptions) loaded,
    required TResult Function() loading,
  }) {
    return loaded(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(PageOptions<PettyCashDetail> pageOptions)? loaded,
    TResult? Function()? loading,
  }) {
    return loaded?.call(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(PageOptions<PettyCashDetail> pageOptions)? loaded,
    TResult Function()? loading,
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
    required TResult Function(_Error value) error,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) loaded,
    required TResult Function(_Loading value) loading,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? loaded,
    TResult? Function(_Loading value)? loading,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? loaded,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Success implements PettyCashDetailQueryState {
  const factory _Success(final PageOptions<PettyCashDetail> pageOptions) =
      _$SuccessImpl;

  PageOptions<PettyCashDetail> get pageOptions;

  /// Create a copy of PettyCashDetailQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
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
    extends _$PettyCashDetailQueryStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PettyCashDetailQueryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'PettyCashDetailQueryState.loading()';
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
    required TResult Function(String error) error,
    required TResult Function() initial,
    required TResult Function(PageOptions<PettyCashDetail> pageOptions) loaded,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(PageOptions<PettyCashDetail> pageOptions)? loaded,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(PageOptions<PettyCashDetail> pageOptions)? loaded,
    TResult Function()? loading,
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
    required TResult Function(_Error value) error,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Success value) loaded,
    required TResult Function(_Loading value) loading,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Success value)? loaded,
    TResult? Function(_Loading value)? loading,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    TResult Function(_Success value)? loaded,
    TResult Function(_Loading value)? loading,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PettyCashDetailQueryState {
  const factory _Loading() = _$LoadingImpl;
}
