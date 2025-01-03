// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_query_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionQueryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(PageOptions<Transaction> pageOptions) loading,
    required TResult Function(PageOptions<Transaction> pageOptions) loaded,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PageOptions<Transaction> pageOptions)? loading,
    TResult? Function(PageOptions<Transaction> pageOptions)? loaded,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PageOptions<Transaction> pageOptions)? loading,
    TResult Function(PageOptions<Transaction> pageOptions)? loaded,
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
abstract class $TransactionQueryStateCopyWith<$Res> {
  factory $TransactionQueryStateCopyWith(TransactionQueryState value,
          $Res Function(TransactionQueryState) then) =
      _$TransactionQueryStateCopyWithImpl<$Res, TransactionQueryState>;
}

/// @nodoc
class _$TransactionQueryStateCopyWithImpl<$Res,
        $Val extends TransactionQueryState>
    implements $TransactionQueryStateCopyWith<$Res> {
  _$TransactionQueryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionQueryState
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
    extends _$TransactionQueryStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionQueryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'TransactionQueryState.initial()';
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
    required TResult Function(PageOptions<Transaction> pageOptions) loading,
    required TResult Function(PageOptions<Transaction> pageOptions) loaded,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PageOptions<Transaction> pageOptions)? loading,
    TResult? Function(PageOptions<Transaction> pageOptions)? loaded,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PageOptions<Transaction> pageOptions)? loading,
    TResult Function(PageOptions<Transaction> pageOptions)? loaded,
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

abstract class _Initial implements TransactionQueryState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PageOptions<Transaction> pageOptions});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$TransactionQueryStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionQueryState
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
              as PageOptions<Transaction>,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(this.pageOptions);

  @override
  final PageOptions<Transaction> pageOptions;

  @override
  String toString() {
    return 'TransactionQueryState.loading(pageOptions: $pageOptions)';
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

  /// Create a copy of TransactionQueryState
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
    required TResult Function(PageOptions<Transaction> pageOptions) loading,
    required TResult Function(PageOptions<Transaction> pageOptions) loaded,
    required TResult Function(String error) error,
  }) {
    return loading(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PageOptions<Transaction> pageOptions)? loading,
    TResult? Function(PageOptions<Transaction> pageOptions)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loading?.call(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PageOptions<Transaction> pageOptions)? loading,
    TResult Function(PageOptions<Transaction> pageOptions)? loaded,
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

abstract class _Loading implements TransactionQueryState {
  const factory _Loading(final PageOptions<Transaction> pageOptions) =
      _$LoadingImpl;

  PageOptions<Transaction> get pageOptions;

  /// Create a copy of TransactionQueryState
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
  $Res call({PageOptions<Transaction> pageOptions});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$TransactionQueryStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionQueryState
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
              as PageOptions<Transaction>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(this.pageOptions);

  @override
  final PageOptions<Transaction> pageOptions;

  @override
  String toString() {
    return 'TransactionQueryState.loaded(pageOptions: $pageOptions)';
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

  /// Create a copy of TransactionQueryState
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
    required TResult Function(PageOptions<Transaction> pageOptions) loading,
    required TResult Function(PageOptions<Transaction> pageOptions) loaded,
    required TResult Function(String error) error,
  }) {
    return loaded(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PageOptions<Transaction> pageOptions)? loading,
    TResult? Function(PageOptions<Transaction> pageOptions)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PageOptions<Transaction> pageOptions)? loading,
    TResult Function(PageOptions<Transaction> pageOptions)? loaded,
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

abstract class _Loaded implements TransactionQueryState {
  const factory _Loaded(final PageOptions<Transaction> pageOptions) =
      _$LoadedImpl;

  PageOptions<Transaction> get pageOptions;

  /// Create a copy of TransactionQueryState
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
    extends _$TransactionQueryStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionQueryState
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
    return 'TransactionQueryState.error(error: $error)';
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

  /// Create a copy of TransactionQueryState
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
    required TResult Function(PageOptions<Transaction> pageOptions) loading,
    required TResult Function(PageOptions<Transaction> pageOptions) loaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PageOptions<Transaction> pageOptions)? loading,
    TResult? Function(PageOptions<Transaction> pageOptions)? loaded,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PageOptions<Transaction> pageOptions)? loading,
    TResult Function(PageOptions<Transaction> pageOptions)? loaded,
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

abstract class _Error implements TransactionQueryState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of TransactionQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TransactionQueryEvent {
  PageOptions<Transaction>? get pageOptions =>
      throw _privateConstructorUsedError;
  double? get paymentRemainingGreaterThan => throw _privateConstructorUsedError;
  DateTime? get dateGraterThanEqualTo => throw _privateConstructorUsedError;
  DateTime? get dateLessThanEqualTo => throw _privateConstructorUsedError;
  TransactionJournalType? get type => throw _privateConstructorUsedError;
  Supplier? get supplier => throw _privateConstructorUsedError;
  Customer? get customer => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PageOptions<Transaction>? pageOptions,
            double? paymentRemainingGreaterThan,
            DateTime? dateGraterThanEqualTo,
            DateTime? dateLessThanEqualTo,
            TransactionJournalType? type,
            Supplier? supplier,
            Customer? customer)
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PageOptions<Transaction>? pageOptions,
            double? paymentRemainingGreaterThan,
            DateTime? dateGraterThanEqualTo,
            DateTime? dateLessThanEqualTo,
            TransactionJournalType? type,
            Supplier? supplier,
            Customer? customer)?
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PageOptions<Transaction>? pageOptions,
            double? paymentRemainingGreaterThan,
            DateTime? dateGraterThanEqualTo,
            DateTime? dateLessThanEqualTo,
            TransactionJournalType? type,
            Supplier? supplier,
            Customer? customer)?
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

  /// Create a copy of TransactionQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TransactionQueryEventCopyWith<TransactionQueryEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionQueryEventCopyWith<$Res> {
  factory $TransactionQueryEventCopyWith(TransactionQueryEvent value,
          $Res Function(TransactionQueryEvent) then) =
      _$TransactionQueryEventCopyWithImpl<$Res, TransactionQueryEvent>;
  @useResult
  $Res call(
      {PageOptions<Transaction>? pageOptions,
      double? paymentRemainingGreaterThan,
      DateTime? dateGraterThanEqualTo,
      DateTime? dateLessThanEqualTo,
      TransactionJournalType? type,
      Supplier? supplier,
      Customer? customer});

  $SupplierCopyWith<$Res>? get supplier;
  $CustomerCopyWith<$Res>? get customer;
}

/// @nodoc
class _$TransactionQueryEventCopyWithImpl<$Res,
        $Val extends TransactionQueryEvent>
    implements $TransactionQueryEventCopyWith<$Res> {
  _$TransactionQueryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TransactionQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageOptions = freezed,
    Object? paymentRemainingGreaterThan = freezed,
    Object? dateGraterThanEqualTo = freezed,
    Object? dateLessThanEqualTo = freezed,
    Object? type = freezed,
    Object? supplier = freezed,
    Object? customer = freezed,
  }) {
    return _then(_value.copyWith(
      pageOptions: freezed == pageOptions
          ? _value.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<Transaction>?,
      paymentRemainingGreaterThan: freezed == paymentRemainingGreaterThan
          ? _value.paymentRemainingGreaterThan
          : paymentRemainingGreaterThan // ignore: cast_nullable_to_non_nullable
              as double?,
      dateGraterThanEqualTo: freezed == dateGraterThanEqualTo
          ? _value.dateGraterThanEqualTo
          : dateGraterThanEqualTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateLessThanEqualTo: freezed == dateLessThanEqualTo
          ? _value.dateLessThanEqualTo
          : dateLessThanEqualTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionJournalType?,
      supplier: freezed == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
    ) as $Val);
  }

  /// Create a copy of TransactionQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SupplierCopyWith<$Res>? get supplier {
    if (_value.supplier == null) {
      return null;
    }

    return $SupplierCopyWith<$Res>(_value.supplier!, (value) {
      return _then(_value.copyWith(supplier: value) as $Val);
    });
  }

  /// Create a copy of TransactionQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $CustomerCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res>
    implements $TransactionQueryEventCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PageOptions<Transaction>? pageOptions,
      double? paymentRemainingGreaterThan,
      DateTime? dateGraterThanEqualTo,
      DateTime? dateLessThanEqualTo,
      TransactionJournalType? type,
      Supplier? supplier,
      Customer? customer});

  @override
  $SupplierCopyWith<$Res>? get supplier;
  @override
  $CustomerCopyWith<$Res>? get customer;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$TransactionQueryEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  /// Create a copy of TransactionQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageOptions = freezed,
    Object? paymentRemainingGreaterThan = freezed,
    Object? dateGraterThanEqualTo = freezed,
    Object? dateLessThanEqualTo = freezed,
    Object? type = freezed,
    Object? supplier = freezed,
    Object? customer = freezed,
  }) {
    return _then(_$FetchImpl(
      pageOptions: freezed == pageOptions
          ? _value.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<Transaction>?,
      paymentRemainingGreaterThan: freezed == paymentRemainingGreaterThan
          ? _value.paymentRemainingGreaterThan
          : paymentRemainingGreaterThan // ignore: cast_nullable_to_non_nullable
              as double?,
      dateGraterThanEqualTo: freezed == dateGraterThanEqualTo
          ? _value.dateGraterThanEqualTo
          : dateGraterThanEqualTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      dateLessThanEqualTo: freezed == dateLessThanEqualTo
          ? _value.dateLessThanEqualTo
          : dateLessThanEqualTo // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as TransactionJournalType?,
      supplier: freezed == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
    ));
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl(
      {this.pageOptions,
      this.paymentRemainingGreaterThan,
      this.dateGraterThanEqualTo,
      this.dateLessThanEqualTo,
      this.type,
      this.supplier,
      this.customer});

  @override
  final PageOptions<Transaction>? pageOptions;
  @override
  final double? paymentRemainingGreaterThan;
  @override
  final DateTime? dateGraterThanEqualTo;
  @override
  final DateTime? dateLessThanEqualTo;
  @override
  final TransactionJournalType? type;
  @override
  final Supplier? supplier;
  @override
  final Customer? customer;

  @override
  String toString() {
    return 'TransactionQueryEvent.fetch(pageOptions: $pageOptions, paymentRemainingGreaterThan: $paymentRemainingGreaterThan, dateGraterThanEqualTo: $dateGraterThanEqualTo, dateLessThanEqualTo: $dateLessThanEqualTo, type: $type, supplier: $supplier, customer: $customer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.pageOptions, pageOptions) ||
                other.pageOptions == pageOptions) &&
            (identical(other.paymentRemainingGreaterThan,
                    paymentRemainingGreaterThan) ||
                other.paymentRemainingGreaterThan ==
                    paymentRemainingGreaterThan) &&
            (identical(other.dateGraterThanEqualTo, dateGraterThanEqualTo) ||
                other.dateGraterThanEqualTo == dateGraterThanEqualTo) &&
            (identical(other.dateLessThanEqualTo, dateLessThanEqualTo) ||
                other.dateLessThanEqualTo == dateLessThanEqualTo) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.customer, customer) ||
                other.customer == customer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      pageOptions,
      paymentRemainingGreaterThan,
      dateGraterThanEqualTo,
      dateLessThanEqualTo,
      type,
      supplier,
      customer);

  /// Create a copy of TransactionQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PageOptions<Transaction>? pageOptions,
            double? paymentRemainingGreaterThan,
            DateTime? dateGraterThanEqualTo,
            DateTime? dateLessThanEqualTo,
            TransactionJournalType? type,
            Supplier? supplier,
            Customer? customer)
        fetch,
  }) {
    return fetch(pageOptions, paymentRemainingGreaterThan,
        dateGraterThanEqualTo, dateLessThanEqualTo, type, supplier, customer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PageOptions<Transaction>? pageOptions,
            double? paymentRemainingGreaterThan,
            DateTime? dateGraterThanEqualTo,
            DateTime? dateLessThanEqualTo,
            TransactionJournalType? type,
            Supplier? supplier,
            Customer? customer)?
        fetch,
  }) {
    return fetch?.call(pageOptions, paymentRemainingGreaterThan,
        dateGraterThanEqualTo, dateLessThanEqualTo, type, supplier, customer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PageOptions<Transaction>? pageOptions,
            double? paymentRemainingGreaterThan,
            DateTime? dateGraterThanEqualTo,
            DateTime? dateLessThanEqualTo,
            TransactionJournalType? type,
            Supplier? supplier,
            Customer? customer)?
        fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(pageOptions, paymentRemainingGreaterThan,
          dateGraterThanEqualTo, dateLessThanEqualTo, type, supplier, customer);
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

abstract class _Fetch implements TransactionQueryEvent {
  const factory _Fetch(
      {final PageOptions<Transaction>? pageOptions,
      final double? paymentRemainingGreaterThan,
      final DateTime? dateGraterThanEqualTo,
      final DateTime? dateLessThanEqualTo,
      final TransactionJournalType? type,
      final Supplier? supplier,
      final Customer? customer}) = _$FetchImpl;

  @override
  PageOptions<Transaction>? get pageOptions;
  @override
  double? get paymentRemainingGreaterThan;
  @override
  DateTime? get dateGraterThanEqualTo;
  @override
  DateTime? get dateLessThanEqualTo;
  @override
  TransactionJournalType? get type;
  @override
  Supplier? get supplier;
  @override
  Customer? get customer;

  /// Create a copy of TransactionQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
