// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_receive_document_query_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$InvoiceReceiveDocumentQueryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InvoiceReceive invoiceReceive) fetch,
    required TResult Function(String purchaseOrderId) fetchByPurchaseOrderId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InvoiceReceive invoiceReceive)? fetch,
    TResult? Function(String purchaseOrderId)? fetchByPurchaseOrderId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InvoiceReceive invoiceReceive)? fetch,
    TResult Function(String purchaseOrderId)? fetchByPurchaseOrderId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchByPurchaseOrderId value)
        fetchByPurchaseOrderId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchByPurchaseOrderId value)? fetchByPurchaseOrderId,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchByPurchaseOrderId value)? fetchByPurchaseOrderId,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceReceiveDocumentQueryEventCopyWith<$Res> {
  factory $InvoiceReceiveDocumentQueryEventCopyWith(
          InvoiceReceiveDocumentQueryEvent value,
          $Res Function(InvoiceReceiveDocumentQueryEvent) then) =
      _$InvoiceReceiveDocumentQueryEventCopyWithImpl<$Res,
          InvoiceReceiveDocumentQueryEvent>;
}

/// @nodoc
class _$InvoiceReceiveDocumentQueryEventCopyWithImpl<$Res,
        $Val extends InvoiceReceiveDocumentQueryEvent>
    implements $InvoiceReceiveDocumentQueryEventCopyWith<$Res> {
  _$InvoiceReceiveDocumentQueryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceReceiveDocumentQueryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({InvoiceReceive invoiceReceive});

  $InvoiceReceiveCopyWith<$Res> get invoiceReceive;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$InvoiceReceiveDocumentQueryEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceReceiveDocumentQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceReceive = null,
  }) {
    return _then(_$FetchImpl(
      invoiceReceive: null == invoiceReceive
          ? _value.invoiceReceive
          : invoiceReceive // ignore: cast_nullable_to_non_nullable
              as InvoiceReceive,
    ));
  }

  /// Create a copy of InvoiceReceiveDocumentQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceReceiveCopyWith<$Res> get invoiceReceive {
    return $InvoiceReceiveCopyWith<$Res>(_value.invoiceReceive, (value) {
      return _then(_value.copyWith(invoiceReceive: value));
    });
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl({required this.invoiceReceive});

  @override
  final InvoiceReceive invoiceReceive;

  @override
  String toString() {
    return 'InvoiceReceiveDocumentQueryEvent.fetch(invoiceReceive: $invoiceReceive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.invoiceReceive, invoiceReceive) ||
                other.invoiceReceive == invoiceReceive));
  }

  @override
  int get hashCode => Object.hash(runtimeType, invoiceReceive);

  /// Create a copy of InvoiceReceiveDocumentQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InvoiceReceive invoiceReceive) fetch,
    required TResult Function(String purchaseOrderId) fetchByPurchaseOrderId,
  }) {
    return fetch(invoiceReceive);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InvoiceReceive invoiceReceive)? fetch,
    TResult? Function(String purchaseOrderId)? fetchByPurchaseOrderId,
  }) {
    return fetch?.call(invoiceReceive);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InvoiceReceive invoiceReceive)? fetch,
    TResult Function(String purchaseOrderId)? fetchByPurchaseOrderId,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(invoiceReceive);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchByPurchaseOrderId value)
        fetchByPurchaseOrderId,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchByPurchaseOrderId value)? fetchByPurchaseOrderId,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchByPurchaseOrderId value)? fetchByPurchaseOrderId,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements InvoiceReceiveDocumentQueryEvent {
  const factory _Fetch({required final InvoiceReceive invoiceReceive}) =
      _$FetchImpl;

  InvoiceReceive get invoiceReceive;

  /// Create a copy of InvoiceReceiveDocumentQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchByPurchaseOrderIdImplCopyWith<$Res> {
  factory _$$FetchByPurchaseOrderIdImplCopyWith(
          _$FetchByPurchaseOrderIdImpl value,
          $Res Function(_$FetchByPurchaseOrderIdImpl) then) =
      __$$FetchByPurchaseOrderIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String purchaseOrderId});
}

/// @nodoc
class __$$FetchByPurchaseOrderIdImplCopyWithImpl<$Res>
    extends _$InvoiceReceiveDocumentQueryEventCopyWithImpl<$Res,
        _$FetchByPurchaseOrderIdImpl>
    implements _$$FetchByPurchaseOrderIdImplCopyWith<$Res> {
  __$$FetchByPurchaseOrderIdImplCopyWithImpl(
      _$FetchByPurchaseOrderIdImpl _value,
      $Res Function(_$FetchByPurchaseOrderIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceReceiveDocumentQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? purchaseOrderId = null,
  }) {
    return _then(_$FetchByPurchaseOrderIdImpl(
      purchaseOrderId: null == purchaseOrderId
          ? _value.purchaseOrderId
          : purchaseOrderId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchByPurchaseOrderIdImpl implements _FetchByPurchaseOrderId {
  const _$FetchByPurchaseOrderIdImpl({required this.purchaseOrderId});

  @override
  final String purchaseOrderId;

  @override
  String toString() {
    return 'InvoiceReceiveDocumentQueryEvent.fetchByPurchaseOrderId(purchaseOrderId: $purchaseOrderId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchByPurchaseOrderIdImpl &&
            (identical(other.purchaseOrderId, purchaseOrderId) ||
                other.purchaseOrderId == purchaseOrderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, purchaseOrderId);

  /// Create a copy of InvoiceReceiveDocumentQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchByPurchaseOrderIdImplCopyWith<_$FetchByPurchaseOrderIdImpl>
      get copyWith => __$$FetchByPurchaseOrderIdImplCopyWithImpl<
          _$FetchByPurchaseOrderIdImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(InvoiceReceive invoiceReceive) fetch,
    required TResult Function(String purchaseOrderId) fetchByPurchaseOrderId,
  }) {
    return fetchByPurchaseOrderId(purchaseOrderId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(InvoiceReceive invoiceReceive)? fetch,
    TResult? Function(String purchaseOrderId)? fetchByPurchaseOrderId,
  }) {
    return fetchByPurchaseOrderId?.call(purchaseOrderId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(InvoiceReceive invoiceReceive)? fetch,
    TResult Function(String purchaseOrderId)? fetchByPurchaseOrderId,
    required TResult orElse(),
  }) {
    if (fetchByPurchaseOrderId != null) {
      return fetchByPurchaseOrderId(purchaseOrderId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchByPurchaseOrderId value)
        fetchByPurchaseOrderId,
  }) {
    return fetchByPurchaseOrderId(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchByPurchaseOrderId value)? fetchByPurchaseOrderId,
  }) {
    return fetchByPurchaseOrderId?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchByPurchaseOrderId value)? fetchByPurchaseOrderId,
    required TResult orElse(),
  }) {
    if (fetchByPurchaseOrderId != null) {
      return fetchByPurchaseOrderId(this);
    }
    return orElse();
  }
}

abstract class _FetchByPurchaseOrderId
    implements InvoiceReceiveDocumentQueryEvent {
  const factory _FetchByPurchaseOrderId(
      {required final String purchaseOrderId}) = _$FetchByPurchaseOrderIdImpl;

  String get purchaseOrderId;

  /// Create a copy of InvoiceReceiveDocumentQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchByPurchaseOrderIdImplCopyWith<_$FetchByPurchaseOrderIdImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$InvoiceReceiveDocumentQueryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function() initial,
    required TResult Function(
            InvoiceReceiveDocument? invoiceReceiveDocuments, List<int>? bytes)
        loaded,
    required TResult Function() loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(
            InvoiceReceiveDocument? invoiceReceiveDocuments, List<int>? bytes)?
        loaded,
    TResult? Function()? loading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(
            InvoiceReceiveDocument? invoiceReceiveDocuments, List<int>? bytes)?
        loaded,
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
abstract class $InvoiceReceiveDocumentQueryStateCopyWith<$Res> {
  factory $InvoiceReceiveDocumentQueryStateCopyWith(
          InvoiceReceiveDocumentQueryState value,
          $Res Function(InvoiceReceiveDocumentQueryState) then) =
      _$InvoiceReceiveDocumentQueryStateCopyWithImpl<$Res,
          InvoiceReceiveDocumentQueryState>;
}

/// @nodoc
class _$InvoiceReceiveDocumentQueryStateCopyWithImpl<$Res,
        $Val extends InvoiceReceiveDocumentQueryState>
    implements $InvoiceReceiveDocumentQueryStateCopyWith<$Res> {
  _$InvoiceReceiveDocumentQueryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceReceiveDocumentQueryState
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
    extends _$InvoiceReceiveDocumentQueryStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceReceiveDocumentQueryState
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
    return 'InvoiceReceiveDocumentQueryState.error(error: $error)';
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

  /// Create a copy of InvoiceReceiveDocumentQueryState
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
            InvoiceReceiveDocument? invoiceReceiveDocuments, List<int>? bytes)
        loaded,
    required TResult Function() loading,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(
            InvoiceReceiveDocument? invoiceReceiveDocuments, List<int>? bytes)?
        loaded,
    TResult? Function()? loading,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(
            InvoiceReceiveDocument? invoiceReceiveDocuments, List<int>? bytes)?
        loaded,
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

abstract class _Error implements InvoiceReceiveDocumentQueryState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of InvoiceReceiveDocumentQueryState
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
    extends _$InvoiceReceiveDocumentQueryStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceReceiveDocumentQueryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'InvoiceReceiveDocumentQueryState.initial()';
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
            InvoiceReceiveDocument? invoiceReceiveDocuments, List<int>? bytes)
        loaded,
    required TResult Function() loading,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(
            InvoiceReceiveDocument? invoiceReceiveDocuments, List<int>? bytes)?
        loaded,
    TResult? Function()? loading,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(
            InvoiceReceiveDocument? invoiceReceiveDocuments, List<int>? bytes)?
        loaded,
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

abstract class _Initial implements InvoiceReceiveDocumentQueryState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {InvoiceReceiveDocument? invoiceReceiveDocuments, List<int>? bytes});

  $InvoiceReceiveDocumentCopyWith<$Res>? get invoiceReceiveDocuments;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$InvoiceReceiveDocumentQueryStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceReceiveDocumentQueryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? invoiceReceiveDocuments = freezed,
    Object? bytes = freezed,
  }) {
    return _then(_$SuccessImpl(
      freezed == invoiceReceiveDocuments
          ? _value.invoiceReceiveDocuments
          : invoiceReceiveDocuments // ignore: cast_nullable_to_non_nullable
              as InvoiceReceiveDocument?,
      freezed == bytes
          ? _value._bytes
          : bytes // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }

  /// Create a copy of InvoiceReceiveDocumentQueryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InvoiceReceiveDocumentCopyWith<$Res>? get invoiceReceiveDocuments {
    if (_value.invoiceReceiveDocuments == null) {
      return null;
    }

    return $InvoiceReceiveDocumentCopyWith<$Res>(
        _value.invoiceReceiveDocuments!, (value) {
      return _then(_value.copyWith(invoiceReceiveDocuments: value));
    });
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.invoiceReceiveDocuments, final List<int>? bytes)
      : _bytes = bytes;

  @override
  final InvoiceReceiveDocument? invoiceReceiveDocuments;
  final List<int>? _bytes;
  @override
  List<int>? get bytes {
    final value = _bytes;
    if (value == null) return null;
    if (_bytes is EqualUnmodifiableListView) return _bytes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'InvoiceReceiveDocumentQueryState.loaded(invoiceReceiveDocuments: $invoiceReceiveDocuments, bytes: $bytes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(
                    other.invoiceReceiveDocuments, invoiceReceiveDocuments) ||
                other.invoiceReceiveDocuments == invoiceReceiveDocuments) &&
            const DeepCollectionEquality().equals(other._bytes, _bytes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, invoiceReceiveDocuments,
      const DeepCollectionEquality().hash(_bytes));

  /// Create a copy of InvoiceReceiveDocumentQueryState
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
            InvoiceReceiveDocument? invoiceReceiveDocuments, List<int>? bytes)
        loaded,
    required TResult Function() loading,
  }) {
    return loaded(invoiceReceiveDocuments, bytes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(
            InvoiceReceiveDocument? invoiceReceiveDocuments, List<int>? bytes)?
        loaded,
    TResult? Function()? loading,
  }) {
    return loaded?.call(invoiceReceiveDocuments, bytes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(
            InvoiceReceiveDocument? invoiceReceiveDocuments, List<int>? bytes)?
        loaded,
    TResult Function()? loading,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(invoiceReceiveDocuments, bytes);
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

abstract class _Success implements InvoiceReceiveDocumentQueryState {
  const factory _Success(final InvoiceReceiveDocument? invoiceReceiveDocuments,
      final List<int>? bytes) = _$SuccessImpl;

  InvoiceReceiveDocument? get invoiceReceiveDocuments;
  List<int>? get bytes;

  /// Create a copy of InvoiceReceiveDocumentQueryState
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
    extends _$InvoiceReceiveDocumentQueryStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceReceiveDocumentQueryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'InvoiceReceiveDocumentQueryState.loading()';
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
    required TResult Function(
            InvoiceReceiveDocument? invoiceReceiveDocuments, List<int>? bytes)
        loaded,
    required TResult Function() loading,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function()? initial,
    TResult? Function(
            InvoiceReceiveDocument? invoiceReceiveDocuments, List<int>? bytes)?
        loaded,
    TResult? Function()? loading,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function()? initial,
    TResult Function(
            InvoiceReceiveDocument? invoiceReceiveDocuments, List<int>? bytes)?
        loaded,
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

abstract class _Loading implements InvoiceReceiveDocumentQueryState {
  const factory _Loading() = _$LoadingImpl;
}
