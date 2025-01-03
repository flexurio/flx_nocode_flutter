// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_request_query_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PurchaseRequestQueryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(PageOptions<MaterialRequest> pageOptions) loading,
    required TResult Function(PageOptions<MaterialRequest> pageOptions) loaded,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PageOptions<MaterialRequest> pageOptions)? loading,
    TResult? Function(PageOptions<MaterialRequest> pageOptions)? loaded,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PageOptions<MaterialRequest> pageOptions)? loading,
    TResult Function(PageOptions<MaterialRequest> pageOptions)? loaded,
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
abstract class $PurchaseRequestQueryStateCopyWith<$Res> {
  factory $PurchaseRequestQueryStateCopyWith(PurchaseRequestQueryState value,
          $Res Function(PurchaseRequestQueryState) then) =
      _$PurchaseRequestQueryStateCopyWithImpl<$Res, PurchaseRequestQueryState>;
}

/// @nodoc
class _$PurchaseRequestQueryStateCopyWithImpl<$Res,
        $Val extends PurchaseRequestQueryState>
    implements $PurchaseRequestQueryStateCopyWith<$Res> {
  _$PurchaseRequestQueryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseRequestQueryState
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
    extends _$PurchaseRequestQueryStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseRequestQueryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'PurchaseRequestQueryState.initial()';
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
    required TResult Function(PageOptions<MaterialRequest> pageOptions) loading,
    required TResult Function(PageOptions<MaterialRequest> pageOptions) loaded,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PageOptions<MaterialRequest> pageOptions)? loading,
    TResult? Function(PageOptions<MaterialRequest> pageOptions)? loaded,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PageOptions<MaterialRequest> pageOptions)? loading,
    TResult Function(PageOptions<MaterialRequest> pageOptions)? loaded,
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

abstract class _Initial implements PurchaseRequestQueryState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PageOptions<MaterialRequest> pageOptions});
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$PurchaseRequestQueryStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseRequestQueryState
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
              as PageOptions<MaterialRequest>,
    ));
  }
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl(this.pageOptions);

  @override
  final PageOptions<MaterialRequest> pageOptions;

  @override
  String toString() {
    return 'PurchaseRequestQueryState.loading(pageOptions: $pageOptions)';
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

  /// Create a copy of PurchaseRequestQueryState
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
    required TResult Function(PageOptions<MaterialRequest> pageOptions) loading,
    required TResult Function(PageOptions<MaterialRequest> pageOptions) loaded,
    required TResult Function(String error) error,
  }) {
    return loading(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PageOptions<MaterialRequest> pageOptions)? loading,
    TResult? Function(PageOptions<MaterialRequest> pageOptions)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loading?.call(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PageOptions<MaterialRequest> pageOptions)? loading,
    TResult Function(PageOptions<MaterialRequest> pageOptions)? loaded,
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

abstract class _Loading implements PurchaseRequestQueryState {
  const factory _Loading(final PageOptions<MaterialRequest> pageOptions) =
      _$LoadingImpl;

  PageOptions<MaterialRequest> get pageOptions;

  /// Create a copy of PurchaseRequestQueryState
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
  $Res call({PageOptions<MaterialRequest> pageOptions});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$PurchaseRequestQueryStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseRequestQueryState
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
              as PageOptions<MaterialRequest>,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.pageOptions);

  @override
  final PageOptions<MaterialRequest> pageOptions;

  @override
  String toString() {
    return 'PurchaseRequestQueryState.loaded(pageOptions: $pageOptions)';
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

  /// Create a copy of PurchaseRequestQueryState
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
    required TResult Function(PageOptions<MaterialRequest> pageOptions) loading,
    required TResult Function(PageOptions<MaterialRequest> pageOptions) loaded,
    required TResult Function(String error) error,
  }) {
    return loaded(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PageOptions<MaterialRequest> pageOptions)? loading,
    TResult? Function(PageOptions<MaterialRequest> pageOptions)? loaded,
    TResult? Function(String error)? error,
  }) {
    return loaded?.call(pageOptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PageOptions<MaterialRequest> pageOptions)? loading,
    TResult Function(PageOptions<MaterialRequest> pageOptions)? loaded,
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

abstract class _Success implements PurchaseRequestQueryState {
  const factory _Success(final PageOptions<MaterialRequest> pageOptions) =
      _$SuccessImpl;

  PageOptions<MaterialRequest> get pageOptions;

  /// Create a copy of PurchaseRequestQueryState
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
    extends _$PurchaseRequestQueryStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseRequestQueryState
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
    return 'PurchaseRequestQueryState.error(error: $error)';
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

  /// Create a copy of PurchaseRequestQueryState
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
    required TResult Function(PageOptions<MaterialRequest> pageOptions) loading,
    required TResult Function(PageOptions<MaterialRequest> pageOptions) loaded,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(PageOptions<MaterialRequest> pageOptions)? loading,
    TResult? Function(PageOptions<MaterialRequest> pageOptions)? loaded,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(PageOptions<MaterialRequest> pageOptions)? loading,
    TResult Function(PageOptions<MaterialRequest> pageOptions)? loaded,
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

abstract class _Error implements PurchaseRequestQueryState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of PurchaseRequestQueryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PurchaseRequestQueryEvent {
  PageOptions<MaterialRequest>? get pageOptions =>
      throw _privateConstructorUsedError;
  PurchaseRequestStatus? get status => throw _privateConstructorUsedError;
  List<Department>? get departments => throw _privateConstructorUsedError;
  bool? get isRequestForm => throw _privateConstructorUsedError;
  bool? get isOrder => throw _privateConstructorUsedError;
  List<MaterialGroup>? get materialGroupIdIn =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            PageOptions<MaterialRequest>? pageOptions,
            PurchaseRequestStatus? status,
            List<Department>? departments,
            bool? isRequestForm,
            bool? isOrder,
            List<MaterialGroup>? materialGroupIdIn)
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PageOptions<MaterialRequest>? pageOptions,
            PurchaseRequestStatus? status,
            List<Department>? departments,
            bool? isRequestForm,
            bool? isOrder,
            List<MaterialGroup>? materialGroupIdIn)?
        fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PageOptions<MaterialRequest>? pageOptions,
            PurchaseRequestStatus? status,
            List<Department>? departments,
            bool? isRequestForm,
            bool? isOrder,
            List<MaterialGroup>? materialGroupIdIn)?
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

  /// Create a copy of PurchaseRequestQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseRequestQueryEventCopyWith<PurchaseRequestQueryEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseRequestQueryEventCopyWith<$Res> {
  factory $PurchaseRequestQueryEventCopyWith(PurchaseRequestQueryEvent value,
          $Res Function(PurchaseRequestQueryEvent) then) =
      _$PurchaseRequestQueryEventCopyWithImpl<$Res, PurchaseRequestQueryEvent>;
  @useResult
  $Res call(
      {PageOptions<MaterialRequest>? pageOptions,
      PurchaseRequestStatus? status,
      List<Department>? departments,
      bool? isRequestForm,
      bool? isOrder,
      List<MaterialGroup>? materialGroupIdIn});
}

/// @nodoc
class _$PurchaseRequestQueryEventCopyWithImpl<$Res,
        $Val extends PurchaseRequestQueryEvent>
    implements $PurchaseRequestQueryEventCopyWith<$Res> {
  _$PurchaseRequestQueryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseRequestQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageOptions = freezed,
    Object? status = freezed,
    Object? departments = freezed,
    Object? isRequestForm = freezed,
    Object? isOrder = freezed,
    Object? materialGroupIdIn = freezed,
  }) {
    return _then(_value.copyWith(
      pageOptions: freezed == pageOptions
          ? _value.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<MaterialRequest>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PurchaseRequestStatus?,
      departments: freezed == departments
          ? _value.departments
          : departments // ignore: cast_nullable_to_non_nullable
              as List<Department>?,
      isRequestForm: freezed == isRequestForm
          ? _value.isRequestForm
          : isRequestForm // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOrder: freezed == isOrder
          ? _value.isOrder
          : isOrder // ignore: cast_nullable_to_non_nullable
              as bool?,
      materialGroupIdIn: freezed == materialGroupIdIn
          ? _value.materialGroupIdIn
          : materialGroupIdIn // ignore: cast_nullable_to_non_nullable
              as List<MaterialGroup>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res>
    implements $PurchaseRequestQueryEventCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PageOptions<MaterialRequest>? pageOptions,
      PurchaseRequestStatus? status,
      List<Department>? departments,
      bool? isRequestForm,
      bool? isOrder,
      List<MaterialGroup>? materialGroupIdIn});
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$PurchaseRequestQueryEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseRequestQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageOptions = freezed,
    Object? status = freezed,
    Object? departments = freezed,
    Object? isRequestForm = freezed,
    Object? isOrder = freezed,
    Object? materialGroupIdIn = freezed,
  }) {
    return _then(_$FetchImpl(
      pageOptions: freezed == pageOptions
          ? _value.pageOptions
          : pageOptions // ignore: cast_nullable_to_non_nullable
              as PageOptions<MaterialRequest>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PurchaseRequestStatus?,
      departments: freezed == departments
          ? _value._departments
          : departments // ignore: cast_nullable_to_non_nullable
              as List<Department>?,
      isRequestForm: freezed == isRequestForm
          ? _value.isRequestForm
          : isRequestForm // ignore: cast_nullable_to_non_nullable
              as bool?,
      isOrder: freezed == isOrder
          ? _value.isOrder
          : isOrder // ignore: cast_nullable_to_non_nullable
              as bool?,
      materialGroupIdIn: freezed == materialGroupIdIn
          ? _value._materialGroupIdIn
          : materialGroupIdIn // ignore: cast_nullable_to_non_nullable
              as List<MaterialGroup>?,
    ));
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl(
      {this.pageOptions,
      this.status,
      final List<Department>? departments,
      this.isRequestForm,
      this.isOrder,
      final List<MaterialGroup>? materialGroupIdIn})
      : _departments = departments,
        _materialGroupIdIn = materialGroupIdIn;

  @override
  final PageOptions<MaterialRequest>? pageOptions;
  @override
  final PurchaseRequestStatus? status;
  final List<Department>? _departments;
  @override
  List<Department>? get departments {
    final value = _departments;
    if (value == null) return null;
    if (_departments is EqualUnmodifiableListView) return _departments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isRequestForm;
  @override
  final bool? isOrder;
  final List<MaterialGroup>? _materialGroupIdIn;
  @override
  List<MaterialGroup>? get materialGroupIdIn {
    final value = _materialGroupIdIn;
    if (value == null) return null;
    if (_materialGroupIdIn is EqualUnmodifiableListView)
      return _materialGroupIdIn;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PurchaseRequestQueryEvent.fetch(pageOptions: $pageOptions, status: $status, departments: $departments, isRequestForm: $isRequestForm, isOrder: $isOrder, materialGroupIdIn: $materialGroupIdIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.pageOptions, pageOptions) ||
                other.pageOptions == pageOptions) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._departments, _departments) &&
            (identical(other.isRequestForm, isRequestForm) ||
                other.isRequestForm == isRequestForm) &&
            (identical(other.isOrder, isOrder) || other.isOrder == isOrder) &&
            const DeepCollectionEquality()
                .equals(other._materialGroupIdIn, _materialGroupIdIn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      pageOptions,
      status,
      const DeepCollectionEquality().hash(_departments),
      isRequestForm,
      isOrder,
      const DeepCollectionEquality().hash(_materialGroupIdIn));

  /// Create a copy of PurchaseRequestQueryEvent
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
            PageOptions<MaterialRequest>? pageOptions,
            PurchaseRequestStatus? status,
            List<Department>? departments,
            bool? isRequestForm,
            bool? isOrder,
            List<MaterialGroup>? materialGroupIdIn)
        fetch,
  }) {
    return fetch(pageOptions, status, departments, isRequestForm, isOrder,
        materialGroupIdIn);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            PageOptions<MaterialRequest>? pageOptions,
            PurchaseRequestStatus? status,
            List<Department>? departments,
            bool? isRequestForm,
            bool? isOrder,
            List<MaterialGroup>? materialGroupIdIn)?
        fetch,
  }) {
    return fetch?.call(pageOptions, status, departments, isRequestForm, isOrder,
        materialGroupIdIn);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            PageOptions<MaterialRequest>? pageOptions,
            PurchaseRequestStatus? status,
            List<Department>? departments,
            bool? isRequestForm,
            bool? isOrder,
            List<MaterialGroup>? materialGroupIdIn)?
        fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(pageOptions, status, departments, isRequestForm, isOrder,
          materialGroupIdIn);
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

abstract class _Fetch implements PurchaseRequestQueryEvent {
  const factory _Fetch(
      {final PageOptions<MaterialRequest>? pageOptions,
      final PurchaseRequestStatus? status,
      final List<Department>? departments,
      final bool? isRequestForm,
      final bool? isOrder,
      final List<MaterialGroup>? materialGroupIdIn}) = _$FetchImpl;

  @override
  PageOptions<MaterialRequest>? get pageOptions;
  @override
  PurchaseRequestStatus? get status;
  @override
  List<Department>? get departments;
  @override
  bool? get isRequestForm;
  @override
  bool? get isOrder;
  @override
  List<MaterialGroup>? get materialGroupIdIn;

  /// Create a copy of PurchaseRequestQueryEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
