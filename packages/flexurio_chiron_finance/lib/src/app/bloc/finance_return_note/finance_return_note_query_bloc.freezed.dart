// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'finance_return_note_query_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FinanceReturnNoteQueryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<FinanceReturnNote> returnNotes,
            Company company,
            FinanceCustomer customer,
            DateTime periodStart,
            DateTime periodEnd,
            String srpNo)
        loaded,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<FinanceReturnNote> returnNotes,
            Company company,
            FinanceCustomer customer,
            DateTime periodStart,
            DateTime periodEnd,
            String srpNo)?
        loaded,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<FinanceReturnNote> returnNotes,
            Company company,
            FinanceCustomer customer,
            DateTime periodStart,
            DateTime periodEnd,
            String srpNo)?
        loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) loaded,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? loaded,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinanceReturnNoteQueryStateCopyWith<$Res> {
  factory $FinanceReturnNoteQueryStateCopyWith(
          FinanceReturnNoteQueryState value,
          $Res Function(FinanceReturnNoteQueryState) then) =
      _$FinanceReturnNoteQueryStateCopyWithImpl<$Res,
          FinanceReturnNoteQueryState>;
}

/// @nodoc
class _$FinanceReturnNoteQueryStateCopyWithImpl<$Res,
        $Val extends FinanceReturnNoteQueryState>
    implements $FinanceReturnNoteQueryStateCopyWith<$Res> {
  _$FinanceReturnNoteQueryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinanceReturnNoteQueryState
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
    extends _$FinanceReturnNoteQueryStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of FinanceReturnNoteQueryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'FinanceReturnNoteQueryState.initial()';
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
    required TResult Function(
            List<FinanceReturnNote> returnNotes,
            Company company,
            FinanceCustomer customer,
            DateTime periodStart,
            DateTime periodEnd,
            String srpNo)
        loaded,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<FinanceReturnNote> returnNotes,
            Company company,
            FinanceCustomer customer,
            DateTime periodStart,
            DateTime periodEnd,
            String srpNo)?
        loaded,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<FinanceReturnNote> returnNotes,
            Company company,
            FinanceCustomer customer,
            DateTime periodStart,
            DateTime periodEnd,
            String srpNo)?
        loaded,
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
    required TResult Function(_Success value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements FinanceReturnNoteQueryState {
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
    extends _$FinanceReturnNoteQueryStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of FinanceReturnNoteQueryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'FinanceReturnNoteQueryState.loading()';
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
    required TResult Function(
            List<FinanceReturnNote> returnNotes,
            Company company,
            FinanceCustomer customer,
            DateTime periodStart,
            DateTime periodEnd,
            String srpNo)
        loaded,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<FinanceReturnNote> returnNotes,
            Company company,
            FinanceCustomer customer,
            DateTime periodStart,
            DateTime periodEnd,
            String srpNo)?
        loaded,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<FinanceReturnNote> returnNotes,
            Company company,
            FinanceCustomer customer,
            DateTime periodStart,
            DateTime periodEnd,
            String srpNo)?
        loaded,
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
    required TResult Function(_Success value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements FinanceReturnNoteQueryState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<FinanceReturnNote> returnNotes,
      Company company,
      FinanceCustomer customer,
      DateTime periodStart,
      DateTime periodEnd,
      String srpNo});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$FinanceReturnNoteQueryStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of FinanceReturnNoteQueryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? returnNotes = null,
    Object? company = null,
    Object? customer = null,
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? srpNo = null,
  }) {
    return _then(_$SuccessImpl(
      null == returnNotes
          ? _value._returnNotes
          : returnNotes // ignore: cast_nullable_to_non_nullable
              as List<FinanceReturnNote>,
      null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Company,
      null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as FinanceCustomer,
      null == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == srpNo
          ? _value.srpNo
          : srpNo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(final List<FinanceReturnNote> returnNotes, this.company,
      this.customer, this.periodStart, this.periodEnd, this.srpNo)
      : _returnNotes = returnNotes;

  final List<FinanceReturnNote> _returnNotes;
  @override
  List<FinanceReturnNote> get returnNotes {
    if (_returnNotes is EqualUnmodifiableListView) return _returnNotes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_returnNotes);
  }

  @override
  final Company company;
  @override
  final FinanceCustomer customer;
  @override
  final DateTime periodStart;
  @override
  final DateTime periodEnd;
  @override
  final String srpNo;

  @override
  String toString() {
    return 'FinanceReturnNoteQueryState.loaded(returnNotes: $returnNotes, company: $company, customer: $customer, periodStart: $periodStart, periodEnd: $periodEnd, srpNo: $srpNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._returnNotes, _returnNotes) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.periodStart, periodStart) ||
                other.periodStart == periodStart) &&
            (identical(other.periodEnd, periodEnd) ||
                other.periodEnd == periodEnd) &&
            (identical(other.srpNo, srpNo) || other.srpNo == srpNo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_returnNotes),
      company,
      customer,
      periodStart,
      periodEnd,
      srpNo);

  /// Create a copy of FinanceReturnNoteQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<FinanceReturnNote> returnNotes,
            Company company,
            FinanceCustomer customer,
            DateTime periodStart,
            DateTime periodEnd,
            String srpNo)
        loaded,
    required TResult Function(String error) error,
  }) {
    return loaded(
        returnNotes, company, customer, periodStart, periodEnd, srpNo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<FinanceReturnNote> returnNotes,
            Company company,
            FinanceCustomer customer,
            DateTime periodStart,
            DateTime periodEnd,
            String srpNo)?
        loaded,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call(
        returnNotes, company, customer, periodStart, periodEnd, srpNo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<FinanceReturnNote> returnNotes,
            Company company,
            FinanceCustomer customer,
            DateTime periodStart,
            DateTime periodEnd,
            String srpNo)?
        loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(
          returnNotes, company, customer, periodStart, periodEnd, srpNo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Success implements FinanceReturnNoteQueryState {
  const factory _Success(
      final List<FinanceReturnNote> returnNotes,
      final Company company,
      final FinanceCustomer customer,
      final DateTime periodStart,
      final DateTime periodEnd,
      final String srpNo) = _$SuccessImpl;

  List<FinanceReturnNote> get returnNotes;
  Company get company;
  FinanceCustomer get customer;
  DateTime get periodStart;
  DateTime get periodEnd;
  String get srpNo;

  /// Create a copy of FinanceReturnNoteQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
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
    extends _$FinanceReturnNoteQueryStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of FinanceReturnNoteQueryState
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
    return 'FinanceReturnNoteQueryState.error(error: $error)';
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

  /// Create a copy of FinanceReturnNoteQueryState
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
    required TResult Function(
            List<FinanceReturnNote> returnNotes,
            Company company,
            FinanceCustomer customer,
            DateTime periodStart,
            DateTime periodEnd,
            String srpNo)
        loaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<FinanceReturnNote> returnNotes,
            Company company,
            FinanceCustomer customer,
            DateTime periodStart,
            DateTime periodEnd,
            String srpNo)?
        loaded,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<FinanceReturnNote> returnNotes,
            Company company,
            FinanceCustomer customer,
            DateTime periodStart,
            DateTime periodEnd,
            String srpNo)?
        loaded,
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
    required TResult Function(_Success value) loaded,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements FinanceReturnNoteQueryState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of FinanceReturnNoteQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$FinanceReturnNoteQueryEvent {
  Company get company => throw _privateConstructorUsedError;
  FinanceCustomer get customer => throw _privateConstructorUsedError;
  DateTime get periodStart => throw _privateConstructorUsedError;
  DateTime get periodEnd => throw _privateConstructorUsedError;
  String get srpNo => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Company company, FinanceCustomer customer,
            DateTime periodStart, DateTime periodEnd, String srpNo)
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Company company, FinanceCustomer customer,
            DateTime periodStart, DateTime periodEnd, String srpNo)?
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Company company, FinanceCustomer customer,
            DateTime periodStart, DateTime periodEnd, String srpNo)?
        fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of FinanceReturnNoteQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FinanceReturnNoteQueryEventCopyWith<FinanceReturnNoteQueryEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FinanceReturnNoteQueryEventCopyWith<$Res> {
  factory $FinanceReturnNoteQueryEventCopyWith(
          FinanceReturnNoteQueryEvent value,
          $Res Function(FinanceReturnNoteQueryEvent) then) =
      _$FinanceReturnNoteQueryEventCopyWithImpl<$Res,
          FinanceReturnNoteQueryEvent>;
  @useResult
  $Res call(
      {Company company,
      FinanceCustomer customer,
      DateTime periodStart,
      DateTime periodEnd,
      String srpNo});
}

/// @nodoc
class _$FinanceReturnNoteQueryEventCopyWithImpl<$Res,
        $Val extends FinanceReturnNoteQueryEvent>
    implements $FinanceReturnNoteQueryEventCopyWith<$Res> {
  _$FinanceReturnNoteQueryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FinanceReturnNoteQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? company = null,
    Object? customer = null,
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? srpNo = null,
  }) {
    return _then(_value.copyWith(
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Company,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as FinanceCustomer,
      periodStart: null == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodEnd: null == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      srpNo: null == srpNo
          ? _value.srpNo
          : srpNo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res>
    implements $FinanceReturnNoteQueryEventCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Company company,
      FinanceCustomer customer,
      DateTime periodStart,
      DateTime periodEnd,
      String srpNo});
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$FinanceReturnNoteQueryEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  /// Create a copy of FinanceReturnNoteQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? company = null,
    Object? customer = null,
    Object? periodStart = null,
    Object? periodEnd = null,
    Object? srpNo = null,
  }) {
    return _then(_$FetchImpl(
      company: null == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as Company,
      customer: null == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as FinanceCustomer,
      periodStart: null == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodEnd: null == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime,
      srpNo: null == srpNo
          ? _value.srpNo
          : srpNo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl(
      {required this.company,
      required this.customer,
      required this.periodStart,
      required this.periodEnd,
      required this.srpNo});

  @override
  final Company company;
  @override
  final FinanceCustomer customer;
  @override
  final DateTime periodStart;
  @override
  final DateTime periodEnd;
  @override
  final String srpNo;

  @override
  String toString() {
    return 'FinanceReturnNoteQueryEvent.fetch(company: $company, customer: $customer, periodStart: $periodStart, periodEnd: $periodEnd, srpNo: $srpNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.periodStart, periodStart) ||
                other.periodStart == periodStart) &&
            (identical(other.periodEnd, periodEnd) ||
                other.periodEnd == periodEnd) &&
            (identical(other.srpNo, srpNo) || other.srpNo == srpNo));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, company, customer, periodStart, periodEnd, srpNo);

  /// Create a copy of FinanceReturnNoteQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Company company, FinanceCustomer customer,
            DateTime periodStart, DateTime periodEnd, String srpNo)
        fetch,
  }) {
    return fetch(company, customer, periodStart, periodEnd, srpNo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Company company, FinanceCustomer customer,
            DateTime periodStart, DateTime periodEnd, String srpNo)?
        fetch,
  }) {
    return fetch?.call(company, customer, periodStart, periodEnd, srpNo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Company company, FinanceCustomer customer,
            DateTime periodStart, DateTime periodEnd, String srpNo)?
        fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(company, customer, periodStart, periodEnd, srpNo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements FinanceReturnNoteQueryEvent {
  const factory _Fetch(
      {required final Company company,
      required final FinanceCustomer customer,
      required final DateTime periodStart,
      required final DateTime periodEnd,
      required final String srpNo}) = _$FetchImpl;

  @override
  Company get company;
  @override
  FinanceCustomer get customer;
  @override
  DateTime get periodStart;
  @override
  DateTime get periodEnd;
  @override
  String get srpNo;

  /// Create a copy of FinanceReturnNoteQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
