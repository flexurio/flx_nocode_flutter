// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'accounts_receivable_customer_query_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccountsReceivableCustomerQueryEvent {
  TransactionType? get transactionType => throw _privateConstructorUsedError;
  Customer? get customer => throw _privateConstructorUsedError;
  DateTime? get transactionDateGte => throw _privateConstructorUsedError;
  DateTime? get transactionDateLte => throw _privateConstructorUsedError;
  PageOptions<AccountsReceivableCustomer>? get pageOptions =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            TransactionType? transactionType,
            Customer? customer,
            DateTime? transactionDateGte,
            DateTime? transactionDateLte,
            PageOptions<AccountsReceivableCustomer>? pageOptions)
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            TransactionType? transactionType,
            Customer? customer,
            DateTime? transactionDateGte,
            DateTime? transactionDateLte,
            PageOptions<AccountsReceivableCustomer>? pageOptions)?
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            TransactionType? transactionType,
            Customer? customer,
            DateTime? transactionDateGte,
            DateTime? transactionDateLte,
            PageOptions<AccountsReceivableCustomer>? pageOptions)?
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

  /// Create a copy of AccountsReceivableCustomerQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AccountsReceivableCustomerQueryEventCopyWith<
          AccountsReceivableCustomerQueryEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsReceivableCustomerQueryEventCopyWith<$Res> {
  factory $AccountsReceivableCustomerQueryEventCopyWith(
          AccountsReceivableCustomerQueryEvent value,
          $Res Function(AccountsReceivableCustomerQueryEvent) then) =
      _$AccountsReceivableCustomerQueryEventCopyWithImpl<$Res,
          AccountsReceivableCustomerQueryEvent>;
  @useResult
  $Res call(
      {TransactionType? transactionType,
      Customer? customer,
      DateTime? transactionDateGte,
      DateTime? transactionDateLte,
      PageOptions<AccountsReceivableCustomer>? pageOptions});

  $TransactionTypeCopyWith<$Res>? get transactionType;
  $CustomerCopyWith<$Res>? get customer;
}

/// @nodoc
class _$AccountsReceivableCustomerQueryEventCopyWithImpl<$Res,
        $Val extends AccountsReceivableCustomerQueryEvent>
    implements $AccountsReceivableCustomerQueryEventCopyWith<$Res> {
  _$AccountsReceivableCustomerQueryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountsReceivableCustomerQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionType = freezed,
    Object? customer = freezed,
    Object? transactionDateGte = freezed,
    Object? transactionDateLte = freezed,
    Object? pageOptions = freezed,
  }) {
    return _then(_value.copyWith(
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      transactionDateGte: freezed == transactionDateGte
          ? _value.transactionDateGte
          : transactionDateGte // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transactionDateLte: freezed == transactionDateLte
          ? _value.transactionDateLte
          : transactionDateLte // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pageOptions: freezed == pageOptions
          ? _value.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<AccountsReceivableCustomer>?,
    ) as $Val);
  }

  /// Create a copy of AccountsReceivableCustomerQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TransactionTypeCopyWith<$Res>? get transactionType {
    if (_value.transactionType == null) {
      return null;
    }

    return $TransactionTypeCopyWith<$Res>(_value.transactionType!, (value) {
      return _then(_value.copyWith(transactionType: value) as $Val);
    });
  }

  /// Create a copy of AccountsReceivableCustomerQueryEvent
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
    implements $AccountsReceivableCustomerQueryEventCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TransactionType? transactionType,
      Customer? customer,
      DateTime? transactionDateGte,
      DateTime? transactionDateLte,
      PageOptions<AccountsReceivableCustomer>? pageOptions});

  @override
  $TransactionTypeCopyWith<$Res>? get transactionType;
  @override
  $CustomerCopyWith<$Res>? get customer;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$AccountsReceivableCustomerQueryEventCopyWithImpl<$Res,
        _$FetchImpl> implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountsReceivableCustomerQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionType = freezed,
    Object? customer = freezed,
    Object? transactionDateGte = freezed,
    Object? transactionDateLte = freezed,
    Object? pageOptions = freezed,
  }) {
    return _then(_$FetchImpl(
      transactionType: freezed == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as TransactionType?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      transactionDateGte: freezed == transactionDateGte
          ? _value.transactionDateGte
          : transactionDateGte // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transactionDateLte: freezed == transactionDateLte
          ? _value.transactionDateLte
          : transactionDateLte // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pageOptions: freezed == pageOptions
          ? _value.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<AccountsReceivableCustomer>?,
    ));
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl(
      {required this.transactionType,
      required this.customer,
      required this.transactionDateGte,
      required this.transactionDateLte,
      this.pageOptions});

  @override
  final TransactionType? transactionType;
  @override
  final Customer? customer;
  @override
  final DateTime? transactionDateGte;
  @override
  final DateTime? transactionDateLte;
  @override
  final PageOptions<AccountsReceivableCustomer>? pageOptions;

  @override
  String toString() {
    return 'AccountsReceivableCustomerQueryEvent.fetch(transactionType: $transactionType, customer: $customer, transactionDateGte: $transactionDateGte, transactionDateLte: $transactionDateLte, pageOptions: $pageOptions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.transactionDateGte, transactionDateGte) ||
                other.transactionDateGte == transactionDateGte) &&
            (identical(other.transactionDateLte, transactionDateLte) ||
                other.transactionDateLte == transactionDateLte) &&
            (identical(other.pageOptions, pageOptions) ||
                other.pageOptions == pageOptions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transactionType, customer,
      transactionDateGte, transactionDateLte, pageOptions);

  /// Create a copy of AccountsReceivableCustomerQueryEvent
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
            TransactionType? transactionType,
            Customer? customer,
            DateTime? transactionDateGte,
            DateTime? transactionDateLte,
            PageOptions<AccountsReceivableCustomer>? pageOptions)
        fetch,
  }) {
    return fetch(transactionType, customer, transactionDateGte,
        transactionDateLte, pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            TransactionType? transactionType,
            Customer? customer,
            DateTime? transactionDateGte,
            DateTime? transactionDateLte,
            PageOptions<AccountsReceivableCustomer>? pageOptions)?
        fetch,
  }) {
    return fetch?.call(transactionType, customer, transactionDateGte,
        transactionDateLte, pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            TransactionType? transactionType,
            Customer? customer,
            DateTime? transactionDateGte,
            DateTime? transactionDateLte,
            PageOptions<AccountsReceivableCustomer>? pageOptions)?
        fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(transactionType, customer, transactionDateGte,
          transactionDateLte, pageOptions);
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

abstract class _Fetch implements AccountsReceivableCustomerQueryEvent {
  const factory _Fetch(
          {required final TransactionType? transactionType,
          required final Customer? customer,
          required final DateTime? transactionDateGte,
          required final DateTime? transactionDateLte,
          final PageOptions<AccountsReceivableCustomer>? pageOptions}) =
      _$FetchImpl;

  @override
  TransactionType? get transactionType;
  @override
  Customer? get customer;
  @override
  DateTime? get transactionDateGte;
  @override
  DateTime? get transactionDateLte;
  @override
  PageOptions<AccountsReceivableCustomer>? get pageOptions;

  /// Create a copy of AccountsReceivableCustomerQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AccountsReceivableCustomerQueryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function() initial,
    required TResult Function(
            PageOptions<AccountsReceivableCustomer> pageOptions)
        loading,
    required TResult Function(
            PageOptions<AccountsReceivableCustomer> pageOptions)
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(PageOptions<AccountsReceivableCustomer> pageOptions)?
        loading,
    TResult? Function(PageOptions<AccountsReceivableCustomer> pageOptions)?
        loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(PageOptions<AccountsReceivableCustomer> pageOptions)?
        loading,
    TResult Function(PageOptions<AccountsReceivableCustomer> pageOptions)?
        loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Error value) error,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountsReceivableCustomerQueryStateCopyWith<$Res> {
  factory $AccountsReceivableCustomerQueryStateCopyWith(
          AccountsReceivableCustomerQueryState value,
          $Res Function(AccountsReceivableCustomerQueryState) then) =
      _$AccountsReceivableCustomerQueryStateCopyWithImpl<$Res,
          AccountsReceivableCustomerQueryState>;
}

/// @nodoc
class _$AccountsReceivableCustomerQueryStateCopyWithImpl<$Res,
        $Val extends AccountsReceivableCustomerQueryState>
    implements $AccountsReceivableCustomerQueryStateCopyWith<$Res> {
  _$AccountsReceivableCustomerQueryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AccountsReceivableCustomerQueryState
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
    extends _$AccountsReceivableCustomerQueryStateCopyWithImpl<$Res,
        _$ErrorImpl> implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountsReceivableCustomerQueryState
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
    return 'AccountsReceivableCustomerQueryState.error(error: $error)';
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

  /// Create a copy of AccountsReceivableCustomerQueryState
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
    required TResult Function(
            PageOptions<AccountsReceivableCustomer> pageOptions)
        loading,
    required TResult Function(
            PageOptions<AccountsReceivableCustomer> pageOptions)
        loaded,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(PageOptions<AccountsReceivableCustomer> pageOptions)?
        loading,
    TResult? Function(PageOptions<AccountsReceivableCustomer> pageOptions)?
        loaded,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(PageOptions<AccountsReceivableCustomer> pageOptions)?
        loading,
    TResult Function(PageOptions<AccountsReceivableCustomer> pageOptions)?
        loaded,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AccountsReceivableCustomerQueryState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of AccountsReceivableCustomerQueryState
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
    extends _$AccountsReceivableCustomerQueryStateCopyWithImpl<$Res,
        _$InitialImpl> implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountsReceivableCustomerQueryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AccountsReceivableCustomerQueryState.initial()';
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
    required TResult Function(
            PageOptions<AccountsReceivableCustomer> pageOptions)
        loading,
    required TResult Function(
            PageOptions<AccountsReceivableCustomer> pageOptions)
        loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(PageOptions<AccountsReceivableCustomer> pageOptions)?
        loading,
    TResult? Function(PageOptions<AccountsReceivableCustomer> pageOptions)?
        loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(PageOptions<AccountsReceivableCustomer> pageOptions)?
        loading,
    TResult Function(PageOptions<AccountsReceivableCustomer> pageOptions)?
        loaded,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AccountsReceivableCustomerQueryState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PageOptions<AccountsReceivableCustomer> pageOptions});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AccountsReceivableCustomerQueryStateCopyWithImpl<$Res,
        _$LoadingImpl> implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountsReceivableCustomerQueryState
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
              as PageOptions<AccountsReceivableCustomer>,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(this.pageOptions);

  @override
  final PageOptions<AccountsReceivableCustomer> pageOptions;

  @override
  String toString() {
    return 'AccountsReceivableCustomerQueryState.loading(pageOptions: $pageOptions)';
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

  /// Create a copy of AccountsReceivableCustomerQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      __$$LoadingImplCopyWithImpl<_$LoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function() initial,
    required TResult Function(
            PageOptions<AccountsReceivableCustomer> pageOptions)
        loading,
    required TResult Function(
            PageOptions<AccountsReceivableCustomer> pageOptions)
        loaded,
  }) {
    return loading(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(PageOptions<AccountsReceivableCustomer> pageOptions)?
        loading,
    TResult? Function(PageOptions<AccountsReceivableCustomer> pageOptions)?
        loaded,
  }) {
    return loading?.call(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(PageOptions<AccountsReceivableCustomer> pageOptions)?
        loading,
    TResult Function(PageOptions<AccountsReceivableCustomer> pageOptions)?
        loaded,
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
    required TResult Function(_Error value) error,
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AccountsReceivableCustomerQueryState {
  const factory _Loading(
          final PageOptions<AccountsReceivableCustomer> pageOptions) =
      _$LoadingImpl;

  PageOptions<AccountsReceivableCustomer> get pageOptions;

  /// Create a copy of AccountsReceivableCustomerQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PageOptions<AccountsReceivableCustomer> pageOptions});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$AccountsReceivableCustomerQueryStateCopyWithImpl<$Res,
        _$SuccessImpl> implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of AccountsReceivableCustomerQueryState
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
              as PageOptions<AccountsReceivableCustomer>,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.pageOptions);

  @override
  final PageOptions<AccountsReceivableCustomer> pageOptions;

  @override
  String toString() {
    return 'AccountsReceivableCustomerQueryState.loaded(pageOptions: $pageOptions)';
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

  /// Create a copy of AccountsReceivableCustomerQueryState
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
    required TResult Function(
            PageOptions<AccountsReceivableCustomer> pageOptions)
        loading,
    required TResult Function(
            PageOptions<AccountsReceivableCustomer> pageOptions)
        loaded,
  }) {
    return loaded(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(PageOptions<AccountsReceivableCustomer> pageOptions)?
        loading,
    TResult? Function(PageOptions<AccountsReceivableCustomer> pageOptions)?
        loaded,
  }) {
    return loaded?.call(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(PageOptions<AccountsReceivableCustomer> pageOptions)?
        loading,
    TResult Function(PageOptions<AccountsReceivableCustomer> pageOptions)?
        loaded,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Error value)? error,
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Error value)? error,
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Success implements AccountsReceivableCustomerQueryState {
  const factory _Success(
          final PageOptions<AccountsReceivableCustomer> pageOptions) =
      _$SuccessImpl;

  PageOptions<AccountsReceivableCustomer> get pageOptions;

  /// Create a copy of AccountsReceivableCustomerQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
