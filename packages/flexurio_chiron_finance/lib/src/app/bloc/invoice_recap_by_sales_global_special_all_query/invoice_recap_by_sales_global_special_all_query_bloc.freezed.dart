// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_recap_by_sales_global_special_all_query_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InvoiceRecapBySalesGlobalSpecialAllQueryEvent {
  PageOptions<InvoiceRecapBySalesGlobalSpecialAll>? get pageOptions =>
      throw _privateConstructorUsedError;
  DateTime? get transactionDateStart => throw _privateConstructorUsedError;
  DateTime? get transactionDateEnd => throw _privateConstructorUsedError;
  String? get transactionTypeId => throw _privateConstructorUsedError;
  String? get customerId => throw _privateConstructorUsedError;
  String? get transactionId => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll>? pageOptions,
            DateTime? transactionDateStart,
            DateTime? transactionDateEnd,
            String? transactionTypeId,
            String? customerId,
            String? transactionId)
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll>? pageOptions,
            DateTime? transactionDateStart,
            DateTime? transactionDateEnd,
            String? transactionTypeId,
            String? customerId,
            String? transactionId)?
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll>? pageOptions,
            DateTime? transactionDateStart,
            DateTime? transactionDateEnd,
            String? transactionTypeId,
            String? customerId,
            String? transactionId)?
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

  /// Create a copy of InvoiceRecapBySalesGlobalSpecialAllQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceRecapBySalesGlobalSpecialAllQueryEventCopyWith<
          InvoiceRecapBySalesGlobalSpecialAllQueryEvent>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceRecapBySalesGlobalSpecialAllQueryEventCopyWith<$Res> {
  factory $InvoiceRecapBySalesGlobalSpecialAllQueryEventCopyWith(
          InvoiceRecapBySalesGlobalSpecialAllQueryEvent value,
          $Res Function(InvoiceRecapBySalesGlobalSpecialAllQueryEvent) then) =
      _$InvoiceRecapBySalesGlobalSpecialAllQueryEventCopyWithImpl<$Res,
          InvoiceRecapBySalesGlobalSpecialAllQueryEvent>;
  @useResult
  $Res call(
      {PageOptions<InvoiceRecapBySalesGlobalSpecialAll>? pageOptions,
      DateTime? transactionDateStart,
      DateTime? transactionDateEnd,
      String? transactionTypeId,
      String? customerId,
      String? transactionId});
}

/// @nodoc
class _$InvoiceRecapBySalesGlobalSpecialAllQueryEventCopyWithImpl<$Res,
        $Val extends InvoiceRecapBySalesGlobalSpecialAllQueryEvent>
    implements $InvoiceRecapBySalesGlobalSpecialAllQueryEventCopyWith<$Res> {
  _$InvoiceRecapBySalesGlobalSpecialAllQueryEventCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceRecapBySalesGlobalSpecialAllQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageOptions = freezed,
    Object? transactionDateStart = freezed,
    Object? transactionDateEnd = freezed,
    Object? transactionTypeId = freezed,
    Object? customerId = freezed,
    Object? transactionId = freezed,
  }) {
    return _then(_value.copyWith(
      pageOptions: freezed == pageOptions
          ? _value.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<InvoiceRecapBySalesGlobalSpecialAll>?,
      transactionDateStart: freezed == transactionDateStart
          ? _value.transactionDateStart
          : transactionDateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transactionDateEnd: freezed == transactionDateEnd
          ? _value.transactionDateEnd
          : transactionDateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transactionTypeId: freezed == transactionTypeId
          ? _value.transactionTypeId
          : transactionTypeId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res>
    implements $InvoiceRecapBySalesGlobalSpecialAllQueryEventCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PageOptions<InvoiceRecapBySalesGlobalSpecialAll>? pageOptions,
      DateTime? transactionDateStart,
      DateTime? transactionDateEnd,
      String? transactionTypeId,
      String? customerId,
      String? transactionId});
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$InvoiceRecapBySalesGlobalSpecialAllQueryEventCopyWithImpl<$Res,
        _$FetchImpl> implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceRecapBySalesGlobalSpecialAllQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageOptions = freezed,
    Object? transactionDateStart = freezed,
    Object? transactionDateEnd = freezed,
    Object? transactionTypeId = freezed,
    Object? customerId = freezed,
    Object? transactionId = freezed,
  }) {
    return _then(_$FetchImpl(
      pageOptions: freezed == pageOptions
          ? _value.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<InvoiceRecapBySalesGlobalSpecialAll>?,
      transactionDateStart: freezed == transactionDateStart
          ? _value.transactionDateStart
          : transactionDateStart // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transactionDateEnd: freezed == transactionDateEnd
          ? _value.transactionDateEnd
          : transactionDateEnd // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      transactionTypeId: freezed == transactionTypeId
          ? _value.transactionTypeId
          : transactionTypeId // ignore: cast_nullable_to_non_nullable
              as String?,
      customerId: freezed == customerId
          ? _value.customerId
          : customerId // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionId: freezed == transactionId
          ? _value.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl(
      {this.pageOptions,
      this.transactionDateStart,
      this.transactionDateEnd,
      this.transactionTypeId,
      this.customerId,
      this.transactionId});

  @override
  final PageOptions<InvoiceRecapBySalesGlobalSpecialAll>? pageOptions;
  @override
  final DateTime? transactionDateStart;
  @override
  final DateTime? transactionDateEnd;
  @override
  final String? transactionTypeId;
  @override
  final String? customerId;
  @override
  final String? transactionId;

  @override
  String toString() {
    return 'InvoiceRecapBySalesGlobalSpecialAllQueryEvent.fetch(pageOptions: $pageOptions, transactionDateStart: $transactionDateStart, transactionDateEnd: $transactionDateEnd, transactionTypeId: $transactionTypeId, customerId: $customerId, transactionId: $transactionId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.pageOptions, pageOptions) ||
                other.pageOptions == pageOptions) &&
            (identical(other.transactionDateStart, transactionDateStart) ||
                other.transactionDateStart == transactionDateStart) &&
            (identical(other.transactionDateEnd, transactionDateEnd) ||
                other.transactionDateEnd == transactionDateEnd) &&
            (identical(other.transactionTypeId, transactionTypeId) ||
                other.transactionTypeId == transactionTypeId) &&
            (identical(other.customerId, customerId) ||
                other.customerId == customerId) &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      pageOptions,
      transactionDateStart,
      transactionDateEnd,
      transactionTypeId,
      customerId,
      transactionId);

  /// Create a copy of InvoiceRecapBySalesGlobalSpecialAllQueryEvent
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
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll>? pageOptions,
            DateTime? transactionDateStart,
            DateTime? transactionDateEnd,
            String? transactionTypeId,
            String? customerId,
            String? transactionId)
        fetch,
  }) {
    return fetch(pageOptions, transactionDateStart, transactionDateEnd,
        transactionTypeId, customerId, transactionId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll>? pageOptions,
            DateTime? transactionDateStart,
            DateTime? transactionDateEnd,
            String? transactionTypeId,
            String? customerId,
            String? transactionId)?
        fetch,
  }) {
    return fetch?.call(pageOptions, transactionDateStart, transactionDateEnd,
        transactionTypeId, customerId, transactionId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll>? pageOptions,
            DateTime? transactionDateStart,
            DateTime? transactionDateEnd,
            String? transactionTypeId,
            String? customerId,
            String? transactionId)?
        fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(pageOptions, transactionDateStart, transactionDateEnd,
          transactionTypeId, customerId, transactionId);
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

abstract class _Fetch implements InvoiceRecapBySalesGlobalSpecialAllQueryEvent {
  const factory _Fetch(
      {final PageOptions<InvoiceRecapBySalesGlobalSpecialAll>? pageOptions,
      final DateTime? transactionDateStart,
      final DateTime? transactionDateEnd,
      final String? transactionTypeId,
      final String? customerId,
      final String? transactionId}) = _$FetchImpl;

  @override
  PageOptions<InvoiceRecapBySalesGlobalSpecialAll>? get pageOptions;
  @override
  DateTime? get transactionDateStart;
  @override
  DateTime? get transactionDateEnd;
  @override
  String? get transactionTypeId;
  @override
  String? get customerId;
  @override
  String? get transactionId;

  /// Create a copy of InvoiceRecapBySalesGlobalSpecialAllQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InvoiceRecapBySalesGlobalSpecialAllQueryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function() initial,
    required TResult Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)
        loaded,
    required TResult Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)
        loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)?
        loaded,
    TResult? Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)?
        loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)?
        loaded,
    TResult Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)?
        loading,
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
abstract class $InvoiceRecapBySalesGlobalSpecialAllQueryStateCopyWith<$Res> {
  factory $InvoiceRecapBySalesGlobalSpecialAllQueryStateCopyWith(
          InvoiceRecapBySalesGlobalSpecialAllQueryState value,
          $Res Function(InvoiceRecapBySalesGlobalSpecialAllQueryState) then) =
      _$InvoiceRecapBySalesGlobalSpecialAllQueryStateCopyWithImpl<$Res,
          InvoiceRecapBySalesGlobalSpecialAllQueryState>;
}

/// @nodoc
class _$InvoiceRecapBySalesGlobalSpecialAllQueryStateCopyWithImpl<$Res,
        $Val extends InvoiceRecapBySalesGlobalSpecialAllQueryState>
    implements $InvoiceRecapBySalesGlobalSpecialAllQueryStateCopyWith<$Res> {
  _$InvoiceRecapBySalesGlobalSpecialAllQueryStateCopyWithImpl(
      this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceRecapBySalesGlobalSpecialAllQueryState
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
    extends _$InvoiceRecapBySalesGlobalSpecialAllQueryStateCopyWithImpl<$Res,
        _$ErrorImpl> implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceRecapBySalesGlobalSpecialAllQueryState
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
    return 'InvoiceRecapBySalesGlobalSpecialAllQueryState.error(error: $error)';
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

  /// Create a copy of InvoiceRecapBySalesGlobalSpecialAllQueryState
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
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)
        loaded,
    required TResult Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)
        loading,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)?
        loaded,
    TResult? Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)?
        loading,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)?
        loaded,
    TResult Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)?
        loading,
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

abstract class _Error implements InvoiceRecapBySalesGlobalSpecialAllQueryState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of InvoiceRecapBySalesGlobalSpecialAllQueryState
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
    extends _$InvoiceRecapBySalesGlobalSpecialAllQueryStateCopyWithImpl<$Res,
        _$InitialImpl> implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceRecapBySalesGlobalSpecialAllQueryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'InvoiceRecapBySalesGlobalSpecialAllQueryState.initial()';
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
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)
        loaded,
    required TResult Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)
        loading,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)?
        loaded,
    TResult? Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)?
        loading,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)?
        loaded,
    TResult Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)?
        loading,
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

abstract class _Initial
    implements InvoiceRecapBySalesGlobalSpecialAllQueryState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$InvoiceRecapBySalesGlobalSpecialAllQueryStateCopyWithImpl<$Res,
        _$SuccessImpl> implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceRecapBySalesGlobalSpecialAllQueryState
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
              as PageOptions<InvoiceRecapBySalesGlobalSpecialAll>,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.pageOptions);

  @override
  final PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions;

  @override
  String toString() {
    return 'InvoiceRecapBySalesGlobalSpecialAllQueryState.loaded(pageOptions: $pageOptions)';
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

  /// Create a copy of InvoiceRecapBySalesGlobalSpecialAllQueryState
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
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)
        loaded,
    required TResult Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)
        loading,
  }) {
    return loaded(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)?
        loaded,
    TResult? Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)?
        loading,
  }) {
    return loaded?.call(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)?
        loaded,
    TResult Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)?
        loading,
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

abstract class _Success
    implements InvoiceRecapBySalesGlobalSpecialAllQueryState {
  const factory _Success(
          final PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions) =
      _$SuccessImpl;

  PageOptions<InvoiceRecapBySalesGlobalSpecialAll> get pageOptions;

  /// Create a copy of InvoiceRecapBySalesGlobalSpecialAllQueryState
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
  @useResult
  $Res call({PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$InvoiceRecapBySalesGlobalSpecialAllQueryStateCopyWithImpl<$Res,
        _$LoadingImpl> implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceRecapBySalesGlobalSpecialAllQueryState
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
              as PageOptions<InvoiceRecapBySalesGlobalSpecialAll>,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(this.pageOptions);

  @override
  final PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions;

  @override
  String toString() {
    return 'InvoiceRecapBySalesGlobalSpecialAllQueryState.loading(pageOptions: $pageOptions)';
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

  /// Create a copy of InvoiceRecapBySalesGlobalSpecialAllQueryState
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
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)
        loaded,
    required TResult Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)
        loading,
  }) {
    return loading(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)?
        loaded,
    TResult? Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)?
        loading,
  }) {
    return loading?.call(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)?
        loaded,
    TResult Function(
            PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions)?
        loading,
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

abstract class _Loading
    implements InvoiceRecapBySalesGlobalSpecialAllQueryState {
  const factory _Loading(
          final PageOptions<InvoiceRecapBySalesGlobalSpecialAll> pageOptions) =
      _$LoadingImpl;

  PageOptions<InvoiceRecapBySalesGlobalSpecialAll> get pageOptions;

  /// Create a copy of InvoiceRecapBySalesGlobalSpecialAllQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadingImplCopyWith<_$LoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
