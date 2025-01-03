// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_order_query_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SalesOrderQueryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(PageOptions<SalesOrder> pageOptions) loading,
    required TResult Function(
            PageOptions<SalesOrder> pageOptions, List<Customer> filterCustomer)
        loaded,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PageOptions<SalesOrder> pageOptions)? loading,
    TResult? Function(
            PageOptions<SalesOrder> pageOptions, List<Customer> filterCustomer)?
        loaded,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PageOptions<SalesOrder> pageOptions)? loading,
    TResult Function(
            PageOptions<SalesOrder> pageOptions, List<Customer> filterCustomer)?
        loaded,
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
abstract class $SalesOrderQueryStateCopyWith<$Res> {
  factory $SalesOrderQueryStateCopyWith(SalesOrderQueryState value,
          $Res Function(SalesOrderQueryState) then) =
      _$SalesOrderQueryStateCopyWithImpl<$Res, SalesOrderQueryState>;
}

/// @nodoc
class _$SalesOrderQueryStateCopyWithImpl<$Res,
        $Val extends SalesOrderQueryState>
    implements $SalesOrderQueryStateCopyWith<$Res> {
  _$SalesOrderQueryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesOrderQueryState
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
    extends _$SalesOrderQueryStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderQueryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SalesOrderQueryState.initial()';
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
    required TResult Function(PageOptions<SalesOrder> pageOptions) loading,
    required TResult Function(
            PageOptions<SalesOrder> pageOptions, List<Customer> filterCustomer)
        loaded,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PageOptions<SalesOrder> pageOptions)? loading,
    TResult? Function(
            PageOptions<SalesOrder> pageOptions, List<Customer> filterCustomer)?
        loaded,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PageOptions<SalesOrder> pageOptions)? loading,
    TResult Function(
            PageOptions<SalesOrder> pageOptions, List<Customer> filterCustomer)?
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

abstract class _Initial implements SalesOrderQueryState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PageOptions<SalesOrder> pageOptions});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SalesOrderQueryStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderQueryState
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
              as PageOptions<SalesOrder>,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(this.pageOptions);

  @override
  final PageOptions<SalesOrder> pageOptions;

  @override
  String toString() {
    return 'SalesOrderQueryState.loading(pageOptions: $pageOptions)';
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

  /// Create a copy of SalesOrderQueryState
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
    required TResult Function(PageOptions<SalesOrder> pageOptions) loading,
    required TResult Function(
            PageOptions<SalesOrder> pageOptions, List<Customer> filterCustomer)
        loaded,
    required TResult Function(String error) error,
  }) {
    return loading(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PageOptions<SalesOrder> pageOptions)? loading,
    TResult? Function(
            PageOptions<SalesOrder> pageOptions, List<Customer> filterCustomer)?
        loaded,
    TResult? Function(String error)? error,
  }) {
    return loading?.call(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PageOptions<SalesOrder> pageOptions)? loading,
    TResult Function(
            PageOptions<SalesOrder> pageOptions, List<Customer> filterCustomer)?
        loaded,
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

abstract class _Loading implements SalesOrderQueryState {
  const factory _Loading(final PageOptions<SalesOrder> pageOptions) =
      _$LoadingImpl;

  PageOptions<SalesOrder> get pageOptions;

  /// Create a copy of SalesOrderQueryState
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
  $Res call(
      {PageOptions<SalesOrder> pageOptions, List<Customer> filterCustomer});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$SalesOrderQueryStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderQueryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageOptions = null,
    Object? filterCustomer = null,
  }) {
    return _then(_$LoadedImpl(
      null == pageOptions
          ? _value.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<SalesOrder>,
      null == filterCustomer
          ? _value._filterCustomer
          : filterCustomer // ignore: cast_nullable_to_non_nullable
              as List<Customer>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(this.pageOptions, final List<Customer> filterCustomer)
      : _filterCustomer = filterCustomer;

  @override
  final PageOptions<SalesOrder> pageOptions;
  final List<Customer> _filterCustomer;
  @override
  List<Customer> get filterCustomer {
    if (_filterCustomer is EqualUnmodifiableListView) return _filterCustomer;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filterCustomer);
  }

  @override
  String toString() {
    return 'SalesOrderQueryState.loaded(pageOptions: $pageOptions, filterCustomer: $filterCustomer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.pageOptions, pageOptions) ||
                other.pageOptions == pageOptions) &&
            const DeepCollectionEquality()
                .equals(other._filterCustomer, _filterCustomer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageOptions,
      const DeepCollectionEquality().hash(_filterCustomer));

  /// Create a copy of SalesOrderQueryState
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
    required TResult Function(PageOptions<SalesOrder> pageOptions) loading,
    required TResult Function(
            PageOptions<SalesOrder> pageOptions, List<Customer> filterCustomer)
        loaded,
    required TResult Function(String error) error,
  }) {
    return loaded(pageOptions, filterCustomer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PageOptions<SalesOrder> pageOptions)? loading,
    TResult? Function(
            PageOptions<SalesOrder> pageOptions, List<Customer> filterCustomer)?
        loaded,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call(pageOptions, filterCustomer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PageOptions<SalesOrder> pageOptions)? loading,
    TResult Function(
            PageOptions<SalesOrder> pageOptions, List<Customer> filterCustomer)?
        loaded,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(pageOptions, filterCustomer);
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

abstract class _Loaded implements SalesOrderQueryState {
  const factory _Loaded(final PageOptions<SalesOrder> pageOptions,
      final List<Customer> filterCustomer) = _$LoadedImpl;

  PageOptions<SalesOrder> get pageOptions;
  List<Customer> get filterCustomer;

  /// Create a copy of SalesOrderQueryState
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
    extends _$SalesOrderQueryStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderQueryState
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
    return 'SalesOrderQueryState.error(error: $error)';
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

  /// Create a copy of SalesOrderQueryState
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
    required TResult Function(PageOptions<SalesOrder> pageOptions) loading,
    required TResult Function(
            PageOptions<SalesOrder> pageOptions, List<Customer> filterCustomer)
        loaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PageOptions<SalesOrder> pageOptions)? loading,
    TResult? Function(
            PageOptions<SalesOrder> pageOptions, List<Customer> filterCustomer)?
        loaded,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PageOptions<SalesOrder> pageOptions)? loading,
    TResult Function(
            PageOptions<SalesOrder> pageOptions, List<Customer> filterCustomer)?
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

abstract class _Error implements SalesOrderQueryState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of SalesOrderQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SalesOrderQueryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PageOptions<SalesOrder>? pageOptions,
            DateTime? periodStart,
            DateTime? periodEnd,
            String? status,
            Customer? customer,
            String? orderTypeId)
        fetch,
    required TResult Function(String id) fetchById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PageOptions<SalesOrder>? pageOptions,
            DateTime? periodStart,
            DateTime? periodEnd,
            String? status,
            Customer? customer,
            String? orderTypeId)?
        fetch,
    TResult? Function(String id)? fetchById,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PageOptions<SalesOrder>? pageOptions,
            DateTime? periodStart,
            DateTime? periodEnd,
            String? status,
            Customer? customer,
            String? orderTypeId)?
        fetch,
    TResult Function(String id)? fetchById,
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
}

/// @nodoc
abstract class $SalesOrderQueryEventCopyWith<$Res> {
  factory $SalesOrderQueryEventCopyWith(SalesOrderQueryEvent value,
          $Res Function(SalesOrderQueryEvent) then) =
      _$SalesOrderQueryEventCopyWithImpl<$Res, SalesOrderQueryEvent>;
}

/// @nodoc
class _$SalesOrderQueryEventCopyWithImpl<$Res,
        $Val extends SalesOrderQueryEvent>
    implements $SalesOrderQueryEventCopyWith<$Res> {
  _$SalesOrderQueryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesOrderQueryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {PageOptions<SalesOrder>? pageOptions,
      DateTime? periodStart,
      DateTime? periodEnd,
      String? status,
      Customer? customer,
      String? orderTypeId});

  $CustomerCopyWith<$Res>? get customer;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$SalesOrderQueryEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageOptions = freezed,
    Object? periodStart = freezed,
    Object? periodEnd = freezed,
    Object? status = freezed,
    Object? customer = freezed,
    Object? orderTypeId = freezed,
  }) {
    return _then(_$FetchImpl(
      pageOptions: freezed == pageOptions
          ? _value.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<SalesOrder>?,
      periodStart: freezed == periodStart
          ? _value.periodStart
          : periodStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      periodEnd: freezed == periodEnd
          ? _value.periodEnd
          : periodEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      customer: freezed == customer
          ? _value.customer
          : customer // ignore: cast_nullable_to_non_nullable
              as Customer?,
      orderTypeId: freezed == orderTypeId
          ? _value.orderTypeId
          : orderTypeId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of SalesOrderQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CustomerCopyWith<$Res>? get customer {
    if (_value.customer == null) {
      return null;
    }

    return $CustomerCopyWith<$Res>(_value.customer!, (value) {
      return _then(_value.copyWith(customer: value));
    });
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl(
      {this.pageOptions,
      this.periodStart,
      this.periodEnd,
      this.status,
      this.customer,
      this.orderTypeId});

  @override
  final PageOptions<SalesOrder>? pageOptions;
  @override
  final DateTime? periodStart;
  @override
  final DateTime? periodEnd;
  @override
  final String? status;
  @override
  final Customer? customer;
  @override
  final String? orderTypeId;

  @override
  String toString() {
    return 'SalesOrderQueryEvent.fetch(pageOptions: $pageOptions, periodStart: $periodStart, periodEnd: $periodEnd, status: $status, customer: $customer, orderTypeId: $orderTypeId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.pageOptions, pageOptions) ||
                other.pageOptions == pageOptions) &&
            (identical(other.periodStart, periodStart) ||
                other.periodStart == periodStart) &&
            (identical(other.periodEnd, periodEnd) ||
                other.periodEnd == periodEnd) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.customer, customer) ||
                other.customer == customer) &&
            (identical(other.orderTypeId, orderTypeId) ||
                other.orderTypeId == orderTypeId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageOptions, periodStart,
      periodEnd, status, customer, orderTypeId);

  /// Create a copy of SalesOrderQueryEvent
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
            PageOptions<SalesOrder>? pageOptions,
            DateTime? periodStart,
            DateTime? periodEnd,
            String? status,
            Customer? customer,
            String? orderTypeId)
        fetch,
    required TResult Function(String id) fetchById,
  }) {
    return fetch(
        pageOptions, periodStart, periodEnd, status, customer, orderTypeId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PageOptions<SalesOrder>? pageOptions,
            DateTime? periodStart,
            DateTime? periodEnd,
            String? status,
            Customer? customer,
            String? orderTypeId)?
        fetch,
    TResult? Function(String id)? fetchById,
  }) {
    return fetch?.call(
        pageOptions, periodStart, periodEnd, status, customer, orderTypeId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PageOptions<SalesOrder>? pageOptions,
            DateTime? periodStart,
            DateTime? periodEnd,
            String? status,
            Customer? customer,
            String? orderTypeId)?
        fetch,
    TResult Function(String id)? fetchById,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(
          pageOptions, periodStart, periodEnd, status, customer, orderTypeId);
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

abstract class _Fetch implements SalesOrderQueryEvent {
  const factory _Fetch(
      {final PageOptions<SalesOrder>? pageOptions,
      final DateTime? periodStart,
      final DateTime? periodEnd,
      final String? status,
      final Customer? customer,
      final String? orderTypeId}) = _$FetchImpl;

  PageOptions<SalesOrder>? get pageOptions;
  DateTime? get periodStart;
  DateTime? get periodEnd;
  String? get status;
  Customer? get customer;
  String? get orderTypeId;

  /// Create a copy of SalesOrderQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchByIdImplCopyWith<$Res> {
  factory _$$FetchByIdImplCopyWith(
          _$FetchByIdImpl value, $Res Function(_$FetchByIdImpl) then) =
      __$$FetchByIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$FetchByIdImplCopyWithImpl<$Res>
    extends _$SalesOrderQueryEventCopyWithImpl<$Res, _$FetchByIdImpl>
    implements _$$FetchByIdImplCopyWith<$Res> {
  __$$FetchByIdImplCopyWithImpl(
      _$FetchByIdImpl _value, $Res Function(_$FetchByIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$FetchByIdImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchByIdImpl implements _FetchById {
  const _$FetchByIdImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'SalesOrderQueryEvent.fetchById(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchByIdImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of SalesOrderQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchByIdImplCopyWith<_$FetchByIdImpl> get copyWith =>
      __$$FetchByIdImplCopyWithImpl<_$FetchByIdImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PageOptions<SalesOrder>? pageOptions,
            DateTime? periodStart,
            DateTime? periodEnd,
            String? status,
            Customer? customer,
            String? orderTypeId)
        fetch,
    required TResult Function(String id) fetchById,
  }) {
    return fetchById(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PageOptions<SalesOrder>? pageOptions,
            DateTime? periodStart,
            DateTime? periodEnd,
            String? status,
            Customer? customer,
            String? orderTypeId)?
        fetch,
    TResult? Function(String id)? fetchById,
  }) {
    return fetchById?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PageOptions<SalesOrder>? pageOptions,
            DateTime? periodStart,
            DateTime? periodEnd,
            String? status,
            Customer? customer,
            String? orderTypeId)?
        fetch,
    TResult Function(String id)? fetchById,
    required TResult orElse(),
  }) {
    if (fetchById != null) {
      return fetchById(id);
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

abstract class _FetchById implements SalesOrderQueryEvent {
  const factory _FetchById(final String id) = _$FetchByIdImpl;

  String get id;

  /// Create a copy of SalesOrderQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchByIdImplCopyWith<_$FetchByIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
