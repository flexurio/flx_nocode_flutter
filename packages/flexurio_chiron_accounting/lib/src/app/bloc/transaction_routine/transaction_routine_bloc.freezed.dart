// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_routine_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionRoutineState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)
        initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)?
        initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)?
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
abstract class $TransactionRoutineStateCopyWith<$Res> {
  factory $TransactionRoutineStateCopyWith(TransactionRoutineState value,
          $Res Function(TransactionRoutineState) then) =
      _$TransactionRoutineStateCopyWithImpl<$Res, TransactionRoutineState>;
}

/// @nodoc
class _$TransactionRoutineStateCopyWithImpl<$Res,
        $Val extends TransactionRoutineState>
    implements $TransactionRoutineStateCopyWith<$Res> {
  _$TransactionRoutineStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionRoutineState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {TransactionRoutineHeader? transactionRoutineHeader,
      List<TransactionRoutineDetail>? transactionRoutineDetail});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$TransactionRoutineStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionRoutineState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionRoutineHeader = freezed,
    Object? transactionRoutineDetail = freezed,
  }) {
    return _then(_$InitialImpl(
      transactionRoutineHeader: freezed == transactionRoutineHeader
          ? _value.transactionRoutineHeader
          : transactionRoutineHeader // ignore: cast_nullable_to_non_nullable
              as TransactionRoutineHeader?,
      transactionRoutineDetail: freezed == transactionRoutineDetail
          ? _value._transactionRoutineDetail
          : transactionRoutineDetail // ignore: cast_nullable_to_non_nullable
              as List<TransactionRoutineDetail>?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  _$InitialImpl(
      {this.transactionRoutineHeader,
      final List<TransactionRoutineDetail>? transactionRoutineDetail})
      : _transactionRoutineDetail = transactionRoutineDetail;

  @override
  final TransactionRoutineHeader? transactionRoutineHeader;
  final List<TransactionRoutineDetail>? _transactionRoutineDetail;
  @override
  List<TransactionRoutineDetail>? get transactionRoutineDetail {
    final value = _transactionRoutineDetail;
    if (value == null) return null;
    if (_transactionRoutineDetail is EqualUnmodifiableListView)
      return _transactionRoutineDetail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TransactionRoutineState.initial(transactionRoutineHeader: $transactionRoutineHeader, transactionRoutineDetail: $transactionRoutineDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(
                    other.transactionRoutineHeader, transactionRoutineHeader) ||
                other.transactionRoutineHeader == transactionRoutineHeader) &&
            const DeepCollectionEquality().equals(
                other._transactionRoutineDetail, _transactionRoutineDetail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transactionRoutineHeader,
      const DeepCollectionEquality().hash(_transactionRoutineDetail));

  /// Create a copy of TransactionRoutineState
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
            TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)
        initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return initial(transactionRoutineHeader, transactionRoutineDetail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)?
        initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call(transactionRoutineHeader, transactionRoutineDetail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)?
        initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(transactionRoutineHeader, transactionRoutineDetail);
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

abstract class _Initial implements TransactionRoutineState {
  factory _Initial(
          {final TransactionRoutineHeader? transactionRoutineHeader,
          final List<TransactionRoutineDetail>? transactionRoutineDetail}) =
      _$InitialImpl;

  TransactionRoutineHeader? get transactionRoutineHeader;
  List<TransactionRoutineDetail>? get transactionRoutineDetail;

  /// Create a copy of TransactionRoutineState
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
    extends _$TransactionRoutineStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionRoutineState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  _$LoadingImpl();

  @override
  String toString() {
    return 'TransactionRoutineState.loading()';
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
            TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)
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
    TResult? Function(TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)?
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
    TResult Function(TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)?
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

abstract class _Loading implements TransactionRoutineState {
  factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$TransactionRoutineStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionRoutineState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessImpl implements _Success {
  _$SuccessImpl();

  @override
  String toString() {
    return 'TransactionRoutineState.success()';
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
            TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)
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
    TResult? Function(TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)?
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
    TResult Function(TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)?
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

abstract class _Success implements TransactionRoutineState {
  factory _Success() = _$SuccessImpl;
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
    extends _$TransactionRoutineStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionRoutineState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  _$ErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'TransactionRoutineState.error(error: $error)';
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

  /// Create a copy of TransactionRoutineState
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
            TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)
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
    TResult? Function(TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)?
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
    TResult Function(TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)?
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

abstract class _Error implements TransactionRoutineState {
  factory _Error({required final String error}) = _$ErrorImpl;

  String get error;

  /// Create a copy of TransactionRoutineState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TransactionRoutineEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TransactionRoutineHeader? transactionRoutineHeader)
        createHeader,
    required TResult Function(
            TransactionRoutineDetail? newTransactionRoutineDetail)
        createDetail,
    required TResult Function(String unique) remove,
    required TResult Function(
            TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)
        create,
    required TResult Function(TransactionRoutine transactionRoutine) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TransactionRoutineHeader? transactionRoutineHeader)?
        createHeader,
    TResult? Function(TransactionRoutineDetail? newTransactionRoutineDetail)?
        createDetail,
    TResult? Function(String unique)? remove,
    TResult? Function(TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)?
        create,
    TResult? Function(TransactionRoutine transactionRoutine)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TransactionRoutineHeader? transactionRoutineHeader)?
        createHeader,
    TResult Function(TransactionRoutineDetail? newTransactionRoutineDetail)?
        createDetail,
    TResult Function(String unique)? remove,
    TResult Function(TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)?
        create,
    TResult Function(TransactionRoutine transactionRoutine)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateHeader value) createHeader,
    required TResult Function(_CreateDetail value) createDetail,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Create value) create,
    required TResult Function(_Delete value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateHeader value)? createHeader,
    TResult? Function(_CreateDetail value)? createDetail,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Create value)? create,
    TResult? Function(_Delete value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateHeader value)? createHeader,
    TResult Function(_CreateDetail value)? createDetail,
    TResult Function(_Remove value)? remove,
    TResult Function(_Create value)? create,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionRoutineEventCopyWith<$Res> {
  factory $TransactionRoutineEventCopyWith(TransactionRoutineEvent value,
          $Res Function(TransactionRoutineEvent) then) =
      _$TransactionRoutineEventCopyWithImpl<$Res, TransactionRoutineEvent>;
}

/// @nodoc
class _$TransactionRoutineEventCopyWithImpl<$Res,
        $Val extends TransactionRoutineEvent>
    implements $TransactionRoutineEventCopyWith<$Res> {
  _$TransactionRoutineEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionRoutineEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CreateHeaderImplCopyWith<$Res> {
  factory _$$CreateHeaderImplCopyWith(
          _$CreateHeaderImpl value, $Res Function(_$CreateHeaderImpl) then) =
      __$$CreateHeaderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TransactionRoutineHeader? transactionRoutineHeader});
}

/// @nodoc
class __$$CreateHeaderImplCopyWithImpl<$Res>
    extends _$TransactionRoutineEventCopyWithImpl<$Res, _$CreateHeaderImpl>
    implements _$$CreateHeaderImplCopyWith<$Res> {
  __$$CreateHeaderImplCopyWithImpl(
      _$CreateHeaderImpl _value, $Res Function(_$CreateHeaderImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionRoutineEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionRoutineHeader = freezed,
  }) {
    return _then(_$CreateHeaderImpl(
      transactionRoutineHeader: freezed == transactionRoutineHeader
          ? _value.transactionRoutineHeader
          : transactionRoutineHeader // ignore: cast_nullable_to_non_nullable
              as TransactionRoutineHeader?,
    ));
  }
}

/// @nodoc

class _$CreateHeaderImpl implements _CreateHeader {
  const _$CreateHeaderImpl({this.transactionRoutineHeader});

  @override
  final TransactionRoutineHeader? transactionRoutineHeader;

  @override
  String toString() {
    return 'TransactionRoutineEvent.createHeader(transactionRoutineHeader: $transactionRoutineHeader)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateHeaderImpl &&
            (identical(
                    other.transactionRoutineHeader, transactionRoutineHeader) ||
                other.transactionRoutineHeader == transactionRoutineHeader));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transactionRoutineHeader);

  /// Create a copy of TransactionRoutineEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateHeaderImplCopyWith<_$CreateHeaderImpl> get copyWith =>
      __$$CreateHeaderImplCopyWithImpl<_$CreateHeaderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TransactionRoutineHeader? transactionRoutineHeader)
        createHeader,
    required TResult Function(
            TransactionRoutineDetail? newTransactionRoutineDetail)
        createDetail,
    required TResult Function(String unique) remove,
    required TResult Function(
            TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)
        create,
    required TResult Function(TransactionRoutine transactionRoutine) delete,
  }) {
    return createHeader(transactionRoutineHeader);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TransactionRoutineHeader? transactionRoutineHeader)?
        createHeader,
    TResult? Function(TransactionRoutineDetail? newTransactionRoutineDetail)?
        createDetail,
    TResult? Function(String unique)? remove,
    TResult? Function(TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)?
        create,
    TResult? Function(TransactionRoutine transactionRoutine)? delete,
  }) {
    return createHeader?.call(transactionRoutineHeader);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TransactionRoutineHeader? transactionRoutineHeader)?
        createHeader,
    TResult Function(TransactionRoutineDetail? newTransactionRoutineDetail)?
        createDetail,
    TResult Function(String unique)? remove,
    TResult Function(TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)?
        create,
    TResult Function(TransactionRoutine transactionRoutine)? delete,
    required TResult orElse(),
  }) {
    if (createHeader != null) {
      return createHeader(transactionRoutineHeader);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateHeader value) createHeader,
    required TResult Function(_CreateDetail value) createDetail,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Create value) create,
    required TResult Function(_Delete value) delete,
  }) {
    return createHeader(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateHeader value)? createHeader,
    TResult? Function(_CreateDetail value)? createDetail,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Create value)? create,
    TResult? Function(_Delete value)? delete,
  }) {
    return createHeader?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateHeader value)? createHeader,
    TResult Function(_CreateDetail value)? createDetail,
    TResult Function(_Remove value)? remove,
    TResult Function(_Create value)? create,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (createHeader != null) {
      return createHeader(this);
    }
    return orElse();
  }
}

abstract class _CreateHeader implements TransactionRoutineEvent {
  const factory _CreateHeader(
          {final TransactionRoutineHeader? transactionRoutineHeader}) =
      _$CreateHeaderImpl;

  TransactionRoutineHeader? get transactionRoutineHeader;

  /// Create a copy of TransactionRoutineEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateHeaderImplCopyWith<_$CreateHeaderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateDetailImplCopyWith<$Res> {
  factory _$$CreateDetailImplCopyWith(
          _$CreateDetailImpl value, $Res Function(_$CreateDetailImpl) then) =
      __$$CreateDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TransactionRoutineDetail? newTransactionRoutineDetail});
}

/// @nodoc
class __$$CreateDetailImplCopyWithImpl<$Res>
    extends _$TransactionRoutineEventCopyWithImpl<$Res, _$CreateDetailImpl>
    implements _$$CreateDetailImplCopyWith<$Res> {
  __$$CreateDetailImplCopyWithImpl(
      _$CreateDetailImpl _value, $Res Function(_$CreateDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionRoutineEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newTransactionRoutineDetail = freezed,
  }) {
    return _then(_$CreateDetailImpl(
      newTransactionRoutineDetail: freezed == newTransactionRoutineDetail
          ? _value.newTransactionRoutineDetail
          : newTransactionRoutineDetail // ignore: cast_nullable_to_non_nullable
              as TransactionRoutineDetail?,
    ));
  }
}

/// @nodoc

class _$CreateDetailImpl implements _CreateDetail {
  const _$CreateDetailImpl({this.newTransactionRoutineDetail});

  @override
  final TransactionRoutineDetail? newTransactionRoutineDetail;

  @override
  String toString() {
    return 'TransactionRoutineEvent.createDetail(newTransactionRoutineDetail: $newTransactionRoutineDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateDetailImpl &&
            (identical(other.newTransactionRoutineDetail,
                    newTransactionRoutineDetail) ||
                other.newTransactionRoutineDetail ==
                    newTransactionRoutineDetail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newTransactionRoutineDetail);

  /// Create a copy of TransactionRoutineEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateDetailImplCopyWith<_$CreateDetailImpl> get copyWith =>
      __$$CreateDetailImplCopyWithImpl<_$CreateDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TransactionRoutineHeader? transactionRoutineHeader)
        createHeader,
    required TResult Function(
            TransactionRoutineDetail? newTransactionRoutineDetail)
        createDetail,
    required TResult Function(String unique) remove,
    required TResult Function(
            TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)
        create,
    required TResult Function(TransactionRoutine transactionRoutine) delete,
  }) {
    return createDetail(newTransactionRoutineDetail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TransactionRoutineHeader? transactionRoutineHeader)?
        createHeader,
    TResult? Function(TransactionRoutineDetail? newTransactionRoutineDetail)?
        createDetail,
    TResult? Function(String unique)? remove,
    TResult? Function(TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)?
        create,
    TResult? Function(TransactionRoutine transactionRoutine)? delete,
  }) {
    return createDetail?.call(newTransactionRoutineDetail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TransactionRoutineHeader? transactionRoutineHeader)?
        createHeader,
    TResult Function(TransactionRoutineDetail? newTransactionRoutineDetail)?
        createDetail,
    TResult Function(String unique)? remove,
    TResult Function(TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)?
        create,
    TResult Function(TransactionRoutine transactionRoutine)? delete,
    required TResult orElse(),
  }) {
    if (createDetail != null) {
      return createDetail(newTransactionRoutineDetail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateHeader value) createHeader,
    required TResult Function(_CreateDetail value) createDetail,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Create value) create,
    required TResult Function(_Delete value) delete,
  }) {
    return createDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateHeader value)? createHeader,
    TResult? Function(_CreateDetail value)? createDetail,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Create value)? create,
    TResult? Function(_Delete value)? delete,
  }) {
    return createDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateHeader value)? createHeader,
    TResult Function(_CreateDetail value)? createDetail,
    TResult Function(_Remove value)? remove,
    TResult Function(_Create value)? create,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (createDetail != null) {
      return createDetail(this);
    }
    return orElse();
  }
}

abstract class _CreateDetail implements TransactionRoutineEvent {
  const factory _CreateDetail(
          {final TransactionRoutineDetail? newTransactionRoutineDetail}) =
      _$CreateDetailImpl;

  TransactionRoutineDetail? get newTransactionRoutineDetail;

  /// Create a copy of TransactionRoutineEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateDetailImplCopyWith<_$CreateDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveImplCopyWith<$Res> {
  factory _$$RemoveImplCopyWith(
          _$RemoveImpl value, $Res Function(_$RemoveImpl) then) =
      __$$RemoveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String unique});
}

/// @nodoc
class __$$RemoveImplCopyWithImpl<$Res>
    extends _$TransactionRoutineEventCopyWithImpl<$Res, _$RemoveImpl>
    implements _$$RemoveImplCopyWith<$Res> {
  __$$RemoveImplCopyWithImpl(
      _$RemoveImpl _value, $Res Function(_$RemoveImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionRoutineEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unique = null,
  }) {
    return _then(_$RemoveImpl(
      null == unique
          ? _value.unique
          : unique // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoveImpl implements _Remove {
  const _$RemoveImpl(this.unique);

  @override
  final String unique;

  @override
  String toString() {
    return 'TransactionRoutineEvent.remove(unique: $unique)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveImpl &&
            (identical(other.unique, unique) || other.unique == unique));
  }

  @override
  int get hashCode => Object.hash(runtimeType, unique);

  /// Create a copy of TransactionRoutineEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveImplCopyWith<_$RemoveImpl> get copyWith =>
      __$$RemoveImplCopyWithImpl<_$RemoveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TransactionRoutineHeader? transactionRoutineHeader)
        createHeader,
    required TResult Function(
            TransactionRoutineDetail? newTransactionRoutineDetail)
        createDetail,
    required TResult Function(String unique) remove,
    required TResult Function(
            TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)
        create,
    required TResult Function(TransactionRoutine transactionRoutine) delete,
  }) {
    return remove(unique);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TransactionRoutineHeader? transactionRoutineHeader)?
        createHeader,
    TResult? Function(TransactionRoutineDetail? newTransactionRoutineDetail)?
        createDetail,
    TResult? Function(String unique)? remove,
    TResult? Function(TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)?
        create,
    TResult? Function(TransactionRoutine transactionRoutine)? delete,
  }) {
    return remove?.call(unique);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TransactionRoutineHeader? transactionRoutineHeader)?
        createHeader,
    TResult Function(TransactionRoutineDetail? newTransactionRoutineDetail)?
        createDetail,
    TResult Function(String unique)? remove,
    TResult Function(TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)?
        create,
    TResult Function(TransactionRoutine transactionRoutine)? delete,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(unique);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateHeader value) createHeader,
    required TResult Function(_CreateDetail value) createDetail,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Create value) create,
    required TResult Function(_Delete value) delete,
  }) {
    return remove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateHeader value)? createHeader,
    TResult? Function(_CreateDetail value)? createDetail,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Create value)? create,
    TResult? Function(_Delete value)? delete,
  }) {
    return remove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateHeader value)? createHeader,
    TResult Function(_CreateDetail value)? createDetail,
    TResult Function(_Remove value)? remove,
    TResult Function(_Create value)? create,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(this);
    }
    return orElse();
  }
}

abstract class _Remove implements TransactionRoutineEvent {
  const factory _Remove(final String unique) = _$RemoveImpl;

  String get unique;

  /// Create a copy of TransactionRoutineEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveImplCopyWith<_$RemoveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateImplCopyWith<$Res> {
  factory _$$CreateImplCopyWith(
          _$CreateImpl value, $Res Function(_$CreateImpl) then) =
      __$$CreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {TransactionRoutineHeader? transactionRoutineHeader,
      List<TransactionRoutineDetail>? transactionRoutineDetail});
}

/// @nodoc
class __$$CreateImplCopyWithImpl<$Res>
    extends _$TransactionRoutineEventCopyWithImpl<$Res, _$CreateImpl>
    implements _$$CreateImplCopyWith<$Res> {
  __$$CreateImplCopyWithImpl(
      _$CreateImpl _value, $Res Function(_$CreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionRoutineEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionRoutineHeader = freezed,
    Object? transactionRoutineDetail = freezed,
  }) {
    return _then(_$CreateImpl(
      transactionRoutineHeader: freezed == transactionRoutineHeader
          ? _value.transactionRoutineHeader
          : transactionRoutineHeader // ignore: cast_nullable_to_non_nullable
              as TransactionRoutineHeader?,
      transactionRoutineDetail: freezed == transactionRoutineDetail
          ? _value._transactionRoutineDetail
          : transactionRoutineDetail // ignore: cast_nullable_to_non_nullable
              as List<TransactionRoutineDetail>?,
    ));
  }
}

/// @nodoc

class _$CreateImpl implements _Create {
  const _$CreateImpl(
      {this.transactionRoutineHeader,
      final List<TransactionRoutineDetail>? transactionRoutineDetail})
      : _transactionRoutineDetail = transactionRoutineDetail;

  @override
  final TransactionRoutineHeader? transactionRoutineHeader;
  final List<TransactionRoutineDetail>? _transactionRoutineDetail;
  @override
  List<TransactionRoutineDetail>? get transactionRoutineDetail {
    final value = _transactionRoutineDetail;
    if (value == null) return null;
    if (_transactionRoutineDetail is EqualUnmodifiableListView)
      return _transactionRoutineDetail;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TransactionRoutineEvent.create(transactionRoutineHeader: $transactionRoutineHeader, transactionRoutineDetail: $transactionRoutineDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateImpl &&
            (identical(
                    other.transactionRoutineHeader, transactionRoutineHeader) ||
                other.transactionRoutineHeader == transactionRoutineHeader) &&
            const DeepCollectionEquality().equals(
                other._transactionRoutineDetail, _transactionRoutineDetail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transactionRoutineHeader,
      const DeepCollectionEquality().hash(_transactionRoutineDetail));

  /// Create a copy of TransactionRoutineEvent
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
            TransactionRoutineHeader? transactionRoutineHeader)
        createHeader,
    required TResult Function(
            TransactionRoutineDetail? newTransactionRoutineDetail)
        createDetail,
    required TResult Function(String unique) remove,
    required TResult Function(
            TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)
        create,
    required TResult Function(TransactionRoutine transactionRoutine) delete,
  }) {
    return create(transactionRoutineHeader, transactionRoutineDetail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TransactionRoutineHeader? transactionRoutineHeader)?
        createHeader,
    TResult? Function(TransactionRoutineDetail? newTransactionRoutineDetail)?
        createDetail,
    TResult? Function(String unique)? remove,
    TResult? Function(TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)?
        create,
    TResult? Function(TransactionRoutine transactionRoutine)? delete,
  }) {
    return create?.call(transactionRoutineHeader, transactionRoutineDetail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TransactionRoutineHeader? transactionRoutineHeader)?
        createHeader,
    TResult Function(TransactionRoutineDetail? newTransactionRoutineDetail)?
        createDetail,
    TResult Function(String unique)? remove,
    TResult Function(TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)?
        create,
    TResult Function(TransactionRoutine transactionRoutine)? delete,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(transactionRoutineHeader, transactionRoutineDetail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateHeader value) createHeader,
    required TResult Function(_CreateDetail value) createDetail,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Create value) create,
    required TResult Function(_Delete value) delete,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateHeader value)? createHeader,
    TResult? Function(_CreateDetail value)? createDetail,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Create value)? create,
    TResult? Function(_Delete value)? delete,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateHeader value)? createHeader,
    TResult Function(_CreateDetail value)? createDetail,
    TResult Function(_Remove value)? remove,
    TResult Function(_Create value)? create,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class _Create implements TransactionRoutineEvent {
  const factory _Create(
          {final TransactionRoutineHeader? transactionRoutineHeader,
          final List<TransactionRoutineDetail>? transactionRoutineDetail}) =
      _$CreateImpl;

  TransactionRoutineHeader? get transactionRoutineHeader;
  List<TransactionRoutineDetail>? get transactionRoutineDetail;

  /// Create a copy of TransactionRoutineEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TransactionRoutine transactionRoutine});

  $TransactionRoutineCopyWith<$Res> get transactionRoutine;
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$TransactionRoutineEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionRoutineEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionRoutine = null,
  }) {
    return _then(_$DeleteImpl(
      transactionRoutine: null == transactionRoutine
          ? _value.transactionRoutine
          : transactionRoutine // ignore: cast_nullable_to_non_nullable
              as TransactionRoutine,
    ));
  }

  /// Create a copy of TransactionRoutineEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionRoutineCopyWith<$Res> get transactionRoutine {
    return $TransactionRoutineCopyWith<$Res>(_value.transactionRoutine,
        (value) {
      return _then(_value.copyWith(transactionRoutine: value));
    });
  }
}

/// @nodoc

class _$DeleteImpl implements _Delete {
  const _$DeleteImpl({required this.transactionRoutine});

  @override
  final TransactionRoutine transactionRoutine;

  @override
  String toString() {
    return 'TransactionRoutineEvent.delete(transactionRoutine: $transactionRoutine)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteImpl &&
            (identical(other.transactionRoutine, transactionRoutine) ||
                other.transactionRoutine == transactionRoutine));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transactionRoutine);

  /// Create a copy of TransactionRoutineEvent
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
            TransactionRoutineHeader? transactionRoutineHeader)
        createHeader,
    required TResult Function(
            TransactionRoutineDetail? newTransactionRoutineDetail)
        createDetail,
    required TResult Function(String unique) remove,
    required TResult Function(
            TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)
        create,
    required TResult Function(TransactionRoutine transactionRoutine) delete,
  }) {
    return delete(transactionRoutine);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TransactionRoutineHeader? transactionRoutineHeader)?
        createHeader,
    TResult? Function(TransactionRoutineDetail? newTransactionRoutineDetail)?
        createDetail,
    TResult? Function(String unique)? remove,
    TResult? Function(TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)?
        create,
    TResult? Function(TransactionRoutine transactionRoutine)? delete,
  }) {
    return delete?.call(transactionRoutine);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TransactionRoutineHeader? transactionRoutineHeader)?
        createHeader,
    TResult Function(TransactionRoutineDetail? newTransactionRoutineDetail)?
        createDetail,
    TResult Function(String unique)? remove,
    TResult Function(TransactionRoutineHeader? transactionRoutineHeader,
            List<TransactionRoutineDetail>? transactionRoutineDetail)?
        create,
    TResult Function(TransactionRoutine transactionRoutine)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(transactionRoutine);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_CreateHeader value) createHeader,
    required TResult Function(_CreateDetail value) createDetail,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Create value) create,
    required TResult Function(_Delete value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_CreateHeader value)? createHeader,
    TResult? Function(_CreateDetail value)? createDetail,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Create value)? create,
    TResult? Function(_Delete value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_CreateHeader value)? createHeader,
    TResult Function(_CreateDetail value)? createDetail,
    TResult Function(_Remove value)? remove,
    TResult Function(_Create value)? create,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements TransactionRoutineEvent {
  const factory _Delete(
      {required final TransactionRoutine transactionRoutine}) = _$DeleteImpl;

  TransactionRoutine get transactionRoutine;

  /// Create a copy of TransactionRoutineEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
