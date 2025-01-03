// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sales_order_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SalesOrderDetailState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool? isHistory,
            Map<SalesOrderDetail, ProductStock?>? salesOrderDetails)
        initial,
    required TResult Function(List<SalesOrderDetail> salesOrderDetails)
        initialSetSalesOrderDetail,
    required TResult Function() loading,
    required TResult Function(bool isTrue) success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool? isHistory,
            Map<SalesOrderDetail, ProductStock?>? salesOrderDetails)?
        initial,
    TResult? Function(List<SalesOrderDetail> salesOrderDetails)?
        initialSetSalesOrderDetail,
    TResult? Function()? loading,
    TResult? Function(bool isTrue)? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool? isHistory,
            Map<SalesOrderDetail, ProductStock?>? salesOrderDetails)?
        initial,
    TResult Function(List<SalesOrderDetail> salesOrderDetails)?
        initialSetSalesOrderDetail,
    TResult Function()? loading,
    TResult Function(bool isTrue)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_InitialSetSalesOrderDetail value)
        initialSetSalesOrderDetail,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InitialSetSalesOrderDetail value)?
        initialSetSalesOrderDetail,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InitialSetSalesOrderDetail value)?
        initialSetSalesOrderDetail,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrderDetailStateCopyWith<$Res> {
  factory $SalesOrderDetailStateCopyWith(SalesOrderDetailState value,
          $Res Function(SalesOrderDetailState) then) =
      _$SalesOrderDetailStateCopyWithImpl<$Res, SalesOrderDetailState>;
}

/// @nodoc
class _$SalesOrderDetailStateCopyWithImpl<$Res,
        $Val extends SalesOrderDetailState>
    implements $SalesOrderDetailStateCopyWith<$Res> {
  _$SalesOrderDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesOrderDetailState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {bool? isHistory,
      Map<SalesOrderDetail, ProductStock?>? salesOrderDetails});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SalesOrderDetailStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isHistory = freezed,
    Object? salesOrderDetails = freezed,
  }) {
    return _then(_$InitialImpl(
      isHistory: freezed == isHistory
          ? _value.isHistory
          : isHistory // ignore: cast_nullable_to_non_nullable
              as bool?,
      salesOrderDetails: freezed == salesOrderDetails
          ? _value._salesOrderDetails
          : salesOrderDetails // ignore: cast_nullable_to_non_nullable
              as Map<SalesOrderDetail, ProductStock?>?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.isHistory,
      final Map<SalesOrderDetail, ProductStock?>? salesOrderDetails})
      : _salesOrderDetails = salesOrderDetails;

  @override
  final bool? isHistory;
  final Map<SalesOrderDetail, ProductStock?>? _salesOrderDetails;
  @override
  Map<SalesOrderDetail, ProductStock?>? get salesOrderDetails {
    final value = _salesOrderDetails;
    if (value == null) return null;
    if (_salesOrderDetails is EqualUnmodifiableMapView)
      return _salesOrderDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'SalesOrderDetailState.initial(isHistory: $isHistory, salesOrderDetails: $salesOrderDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isHistory, isHistory) ||
                other.isHistory == isHistory) &&
            const DeepCollectionEquality()
                .equals(other._salesOrderDetails, _salesOrderDetails));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isHistory,
      const DeepCollectionEquality().hash(_salesOrderDetails));

  /// Create a copy of SalesOrderDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool? isHistory,
            Map<SalesOrderDetail, ProductStock?>? salesOrderDetails)
        initial,
    required TResult Function(List<SalesOrderDetail> salesOrderDetails)
        initialSetSalesOrderDetail,
    required TResult Function() loading,
    required TResult Function(bool isTrue) success,
    required TResult Function(String error) error,
  }) {
    return initial(isHistory, salesOrderDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool? isHistory,
            Map<SalesOrderDetail, ProductStock?>? salesOrderDetails)?
        initial,
    TResult? Function(List<SalesOrderDetail> salesOrderDetails)?
        initialSetSalesOrderDetail,
    TResult? Function()? loading,
    TResult? Function(bool isTrue)? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call(isHistory, salesOrderDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool? isHistory,
            Map<SalesOrderDetail, ProductStock?>? salesOrderDetails)?
        initial,
    TResult Function(List<SalesOrderDetail> salesOrderDetails)?
        initialSetSalesOrderDetail,
    TResult Function()? loading,
    TResult Function(bool isTrue)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isHistory, salesOrderDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_InitialSetSalesOrderDetail value)
        initialSetSalesOrderDetail,
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
    TResult? Function(_InitialSetSalesOrderDetail value)?
        initialSetSalesOrderDetail,
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
    TResult Function(_InitialSetSalesOrderDetail value)?
        initialSetSalesOrderDetail,
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

abstract class _Initial implements SalesOrderDetailState {
  const factory _Initial(
          {final bool? isHistory,
          final Map<SalesOrderDetail, ProductStock?>? salesOrderDetails}) =
      _$InitialImpl;

  bool? get isHistory;
  Map<SalesOrderDetail, ProductStock?>? get salesOrderDetails;

  /// Create a copy of SalesOrderDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitialSetSalesOrderDetailImplCopyWith<$Res> {
  factory _$$InitialSetSalesOrderDetailImplCopyWith(
          _$InitialSetSalesOrderDetailImpl value,
          $Res Function(_$InitialSetSalesOrderDetailImpl) then) =
      __$$InitialSetSalesOrderDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<SalesOrderDetail> salesOrderDetails});
}

/// @nodoc
class __$$InitialSetSalesOrderDetailImplCopyWithImpl<$Res>
    extends _$SalesOrderDetailStateCopyWithImpl<$Res,
        _$InitialSetSalesOrderDetailImpl>
    implements _$$InitialSetSalesOrderDetailImplCopyWith<$Res> {
  __$$InitialSetSalesOrderDetailImplCopyWithImpl(
      _$InitialSetSalesOrderDetailImpl _value,
      $Res Function(_$InitialSetSalesOrderDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrderDetails = null,
  }) {
    return _then(_$InitialSetSalesOrderDetailImpl(
      salesOrderDetails: null == salesOrderDetails
          ? _value._salesOrderDetails
          : salesOrderDetails // ignore: cast_nullable_to_non_nullable
              as List<SalesOrderDetail>,
    ));
  }
}

/// @nodoc

class _$InitialSetSalesOrderDetailImpl implements _InitialSetSalesOrderDetail {
  const _$InitialSetSalesOrderDetailImpl(
      {required final List<SalesOrderDetail> salesOrderDetails})
      : _salesOrderDetails = salesOrderDetails;

  final List<SalesOrderDetail> _salesOrderDetails;
  @override
  List<SalesOrderDetail> get salesOrderDetails {
    if (_salesOrderDetails is EqualUnmodifiableListView)
      return _salesOrderDetails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_salesOrderDetails);
  }

  @override
  String toString() {
    return 'SalesOrderDetailState.initialSetSalesOrderDetail(salesOrderDetails: $salesOrderDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialSetSalesOrderDetailImpl &&
            const DeepCollectionEquality()
                .equals(other._salesOrderDetails, _salesOrderDetails));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_salesOrderDetails));

  /// Create a copy of SalesOrderDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialSetSalesOrderDetailImplCopyWith<_$InitialSetSalesOrderDetailImpl>
      get copyWith => __$$InitialSetSalesOrderDetailImplCopyWithImpl<
          _$InitialSetSalesOrderDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool? isHistory,
            Map<SalesOrderDetail, ProductStock?>? salesOrderDetails)
        initial,
    required TResult Function(List<SalesOrderDetail> salesOrderDetails)
        initialSetSalesOrderDetail,
    required TResult Function() loading,
    required TResult Function(bool isTrue) success,
    required TResult Function(String error) error,
  }) {
    return initialSetSalesOrderDetail(salesOrderDetails);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool? isHistory,
            Map<SalesOrderDetail, ProductStock?>? salesOrderDetails)?
        initial,
    TResult? Function(List<SalesOrderDetail> salesOrderDetails)?
        initialSetSalesOrderDetail,
    TResult? Function()? loading,
    TResult? Function(bool isTrue)? success,
    TResult? Function(String error)? error,
  }) {
    return initialSetSalesOrderDetail?.call(salesOrderDetails);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool? isHistory,
            Map<SalesOrderDetail, ProductStock?>? salesOrderDetails)?
        initial,
    TResult Function(List<SalesOrderDetail> salesOrderDetails)?
        initialSetSalesOrderDetail,
    TResult Function()? loading,
    TResult Function(bool isTrue)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initialSetSalesOrderDetail != null) {
      return initialSetSalesOrderDetail(salesOrderDetails);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_InitialSetSalesOrderDetail value)
        initialSetSalesOrderDetail,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return initialSetSalesOrderDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_InitialSetSalesOrderDetail value)?
        initialSetSalesOrderDetail,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return initialSetSalesOrderDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_InitialSetSalesOrderDetail value)?
        initialSetSalesOrderDetail,
    TResult Function(_Loading value)? loading,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initialSetSalesOrderDetail != null) {
      return initialSetSalesOrderDetail(this);
    }
    return orElse();
  }
}

abstract class _InitialSetSalesOrderDetail implements SalesOrderDetailState {
  const factory _InitialSetSalesOrderDetail(
          {required final List<SalesOrderDetail> salesOrderDetails}) =
      _$InitialSetSalesOrderDetailImpl;

  List<SalesOrderDetail> get salesOrderDetails;

  /// Create a copy of SalesOrderDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InitialSetSalesOrderDetailImplCopyWith<_$InitialSetSalesOrderDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$SalesOrderDetailStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderDetailState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'SalesOrderDetailState.loading()';
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
    required TResult Function(bool? isHistory,
            Map<SalesOrderDetail, ProductStock?>? salesOrderDetails)
        initial,
    required TResult Function(List<SalesOrderDetail> salesOrderDetails)
        initialSetSalesOrderDetail,
    required TResult Function() loading,
    required TResult Function(bool isTrue) success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool? isHistory,
            Map<SalesOrderDetail, ProductStock?>? salesOrderDetails)?
        initial,
    TResult? Function(List<SalesOrderDetail> salesOrderDetails)?
        initialSetSalesOrderDetail,
    TResult? Function()? loading,
    TResult? Function(bool isTrue)? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool? isHistory,
            Map<SalesOrderDetail, ProductStock?>? salesOrderDetails)?
        initial,
    TResult Function(List<SalesOrderDetail> salesOrderDetails)?
        initialSetSalesOrderDetail,
    TResult Function()? loading,
    TResult Function(bool isTrue)? success,
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
    required TResult Function(_InitialSetSalesOrderDetail value)
        initialSetSalesOrderDetail,
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
    TResult? Function(_InitialSetSalesOrderDetail value)?
        initialSetSalesOrderDetail,
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
    TResult Function(_InitialSetSalesOrderDetail value)?
        initialSetSalesOrderDetail,
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

abstract class _Loading implements SalesOrderDetailState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isTrue});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$SalesOrderDetailStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isTrue = null,
  }) {
    return _then(_$SuccessImpl(
      null == isTrue
          ? _value.isTrue
          : isTrue // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.isTrue);

  @override
  final bool isTrue;

  @override
  String toString() {
    return 'SalesOrderDetailState.success(isTrue: $isTrue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.isTrue, isTrue) || other.isTrue == isTrue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isTrue);

  /// Create a copy of SalesOrderDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool? isHistory,
            Map<SalesOrderDetail, ProductStock?>? salesOrderDetails)
        initial,
    required TResult Function(List<SalesOrderDetail> salesOrderDetails)
        initialSetSalesOrderDetail,
    required TResult Function() loading,
    required TResult Function(bool isTrue) success,
    required TResult Function(String error) error,
  }) {
    return success(isTrue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool? isHistory,
            Map<SalesOrderDetail, ProductStock?>? salesOrderDetails)?
        initial,
    TResult? Function(List<SalesOrderDetail> salesOrderDetails)?
        initialSetSalesOrderDetail,
    TResult? Function()? loading,
    TResult? Function(bool isTrue)? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call(isTrue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool? isHistory,
            Map<SalesOrderDetail, ProductStock?>? salesOrderDetails)?
        initial,
    TResult Function(List<SalesOrderDetail> salesOrderDetails)?
        initialSetSalesOrderDetail,
    TResult Function()? loading,
    TResult Function(bool isTrue)? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(isTrue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_InitialSetSalesOrderDetail value)
        initialSetSalesOrderDetail,
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
    TResult? Function(_InitialSetSalesOrderDetail value)?
        initialSetSalesOrderDetail,
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
    TResult Function(_InitialSetSalesOrderDetail value)?
        initialSetSalesOrderDetail,
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

abstract class _Success implements SalesOrderDetailState {
  const factory _Success(final bool isTrue) = _$SuccessImpl;

  bool get isTrue;

  /// Create a copy of SalesOrderDetailState
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
    extends _$SalesOrderDetailStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderDetailState
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
    return 'SalesOrderDetailState.error(error: $error)';
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

  /// Create a copy of SalesOrderDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool? isHistory,
            Map<SalesOrderDetail, ProductStock?>? salesOrderDetails)
        initial,
    required TResult Function(List<SalesOrderDetail> salesOrderDetails)
        initialSetSalesOrderDetail,
    required TResult Function() loading,
    required TResult Function(bool isTrue) success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool? isHistory,
            Map<SalesOrderDetail, ProductStock?>? salesOrderDetails)?
        initial,
    TResult? Function(List<SalesOrderDetail> salesOrderDetails)?
        initialSetSalesOrderDetail,
    TResult? Function()? loading,
    TResult? Function(bool isTrue)? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool? isHistory,
            Map<SalesOrderDetail, ProductStock?>? salesOrderDetails)?
        initial,
    TResult Function(List<SalesOrderDetail> salesOrderDetails)?
        initialSetSalesOrderDetail,
    TResult Function()? loading,
    TResult Function(bool isTrue)? success,
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
    required TResult Function(_InitialSetSalesOrderDetail value)
        initialSetSalesOrderDetail,
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
    TResult? Function(_InitialSetSalesOrderDetail value)?
        initialSetSalesOrderDetail,
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
    TResult Function(_InitialSetSalesOrderDetail value)?
        initialSetSalesOrderDetail,
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

abstract class _Error implements SalesOrderDetailState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of SalesOrderDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SalesOrderDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrder salesOrder) fetch,
    required TResult Function(SalesOrderDetail salesOrderDetail) fetchById,
    required TResult Function(
            SalesOrder salesOrder, SalesOrderHistory revisionNo)
        fetchHistory,
    required TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)
        updateProductStock,
    required TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)
        updateSalesOrderDetail,
    required TResult Function(SalesOrderDetail salesOrderDetail) remove,
    required TResult Function(SalesOrderDetail salesOrderDetail) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrder salesOrder)? fetch,
    TResult? Function(SalesOrderDetail salesOrderDetail)? fetchById,
    TResult? Function(SalesOrder salesOrder, SalesOrderHistory revisionNo)?
        fetchHistory,
    TResult? Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateProductStock,
    TResult? Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateSalesOrderDetail,
    TResult? Function(SalesOrderDetail salesOrderDetail)? remove,
    TResult? Function(SalesOrderDetail salesOrderDetail)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrder salesOrder)? fetch,
    TResult Function(SalesOrderDetail salesOrderDetail)? fetchById,
    TResult Function(SalesOrder salesOrder, SalesOrderHistory revisionNo)?
        fetchHistory,
    TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateProductStock,
    TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateSalesOrderDetail,
    TResult Function(SalesOrderDetail salesOrderDetail)? remove,
    TResult Function(SalesOrderDetail salesOrderDetail)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchById value) fetchById,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_UpdateSalesOrderDetail value)
        updateSalesOrderDetail,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Delete value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchById value)? fetchById,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_UpdateSalesOrderDetail value)? updateSalesOrderDetail,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Delete value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchById value)? fetchById,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_UpdateSalesOrderDetail value)? updateSalesOrderDetail,
    TResult Function(_Remove value)? remove,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SalesOrderDetailEventCopyWith<$Res> {
  factory $SalesOrderDetailEventCopyWith(SalesOrderDetailEvent value,
          $Res Function(SalesOrderDetailEvent) then) =
      _$SalesOrderDetailEventCopyWithImpl<$Res, SalesOrderDetailEvent>;
}

/// @nodoc
class _$SalesOrderDetailEventCopyWithImpl<$Res,
        $Val extends SalesOrderDetailEvent>
    implements $SalesOrderDetailEventCopyWith<$Res> {
  _$SalesOrderDetailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FetchImplCopyWith<$Res> {
  factory _$$FetchImplCopyWith(
          _$FetchImpl value, $Res Function(_$FetchImpl) then) =
      __$$FetchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrder salesOrder});

  $SalesOrderCopyWith<$Res> get salesOrder;
}

/// @nodoc
class __$$FetchImplCopyWithImpl<$Res>
    extends _$SalesOrderDetailEventCopyWithImpl<$Res, _$FetchImpl>
    implements _$$FetchImplCopyWith<$Res> {
  __$$FetchImplCopyWithImpl(
      _$FetchImpl _value, $Res Function(_$FetchImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrder = null,
  }) {
    return _then(_$FetchImpl(
      salesOrder: null == salesOrder
          ? _value.salesOrder
          : salesOrder // ignore: cast_nullable_to_non_nullable
              as SalesOrder,
    ));
  }

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SalesOrderCopyWith<$Res> get salesOrder {
    return $SalesOrderCopyWith<$Res>(_value.salesOrder, (value) {
      return _then(_value.copyWith(salesOrder: value));
    });
  }
}

/// @nodoc

class _$FetchImpl implements _Fetch {
  const _$FetchImpl({required this.salesOrder});

  @override
  final SalesOrder salesOrder;

  @override
  String toString() {
    return 'SalesOrderDetailEvent.fetch(salesOrder: $salesOrder)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchImpl &&
            (identical(other.salesOrder, salesOrder) ||
                other.salesOrder == salesOrder));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrder);

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchImplCopyWith<_$FetchImpl> get copyWith =>
      __$$FetchImplCopyWithImpl<_$FetchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrder salesOrder) fetch,
    required TResult Function(SalesOrderDetail salesOrderDetail) fetchById,
    required TResult Function(
            SalesOrder salesOrder, SalesOrderHistory revisionNo)
        fetchHistory,
    required TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)
        updateProductStock,
    required TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)
        updateSalesOrderDetail,
    required TResult Function(SalesOrderDetail salesOrderDetail) remove,
    required TResult Function(SalesOrderDetail salesOrderDetail) delete,
  }) {
    return fetch(salesOrder);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrder salesOrder)? fetch,
    TResult? Function(SalesOrderDetail salesOrderDetail)? fetchById,
    TResult? Function(SalesOrder salesOrder, SalesOrderHistory revisionNo)?
        fetchHistory,
    TResult? Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateProductStock,
    TResult? Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateSalesOrderDetail,
    TResult? Function(SalesOrderDetail salesOrderDetail)? remove,
    TResult? Function(SalesOrderDetail salesOrderDetail)? delete,
  }) {
    return fetch?.call(salesOrder);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrder salesOrder)? fetch,
    TResult Function(SalesOrderDetail salesOrderDetail)? fetchById,
    TResult Function(SalesOrder salesOrder, SalesOrderHistory revisionNo)?
        fetchHistory,
    TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateProductStock,
    TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateSalesOrderDetail,
    TResult Function(SalesOrderDetail salesOrderDetail)? remove,
    TResult Function(SalesOrderDetail salesOrderDetail)? delete,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(salesOrder);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchById value) fetchById,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_UpdateSalesOrderDetail value)
        updateSalesOrderDetail,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Delete value) delete,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchById value)? fetchById,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_UpdateSalesOrderDetail value)? updateSalesOrderDetail,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Delete value)? delete,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchById value)? fetchById,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_UpdateSalesOrderDetail value)? updateSalesOrderDetail,
    TResult Function(_Remove value)? remove,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements SalesOrderDetailEvent {
  const factory _Fetch({required final SalesOrder salesOrder}) = _$FetchImpl;

  SalesOrder get salesOrder;

  /// Create a copy of SalesOrderDetailEvent
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
  $Res call({SalesOrderDetail salesOrderDetail});

  $SalesOrderDetailCopyWith<$Res> get salesOrderDetail;
}

/// @nodoc
class __$$FetchByIdImplCopyWithImpl<$Res>
    extends _$SalesOrderDetailEventCopyWithImpl<$Res, _$FetchByIdImpl>
    implements _$$FetchByIdImplCopyWith<$Res> {
  __$$FetchByIdImplCopyWithImpl(
      _$FetchByIdImpl _value, $Res Function(_$FetchByIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrderDetail = null,
  }) {
    return _then(_$FetchByIdImpl(
      salesOrderDetail: null == salesOrderDetail
          ? _value.salesOrderDetail
          : salesOrderDetail // ignore: cast_nullable_to_non_nullable
              as SalesOrderDetail,
    ));
  }

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SalesOrderDetailCopyWith<$Res> get salesOrderDetail {
    return $SalesOrderDetailCopyWith<$Res>(_value.salesOrderDetail, (value) {
      return _then(_value.copyWith(salesOrderDetail: value));
    });
  }
}

/// @nodoc

class _$FetchByIdImpl implements _FetchById {
  const _$FetchByIdImpl({required this.salesOrderDetail});

  @override
  final SalesOrderDetail salesOrderDetail;

  @override
  String toString() {
    return 'SalesOrderDetailEvent.fetchById(salesOrderDetail: $salesOrderDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchByIdImpl &&
            (identical(other.salesOrderDetail, salesOrderDetail) ||
                other.salesOrderDetail == salesOrderDetail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrderDetail);

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchByIdImplCopyWith<_$FetchByIdImpl> get copyWith =>
      __$$FetchByIdImplCopyWithImpl<_$FetchByIdImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrder salesOrder) fetch,
    required TResult Function(SalesOrderDetail salesOrderDetail) fetchById,
    required TResult Function(
            SalesOrder salesOrder, SalesOrderHistory revisionNo)
        fetchHistory,
    required TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)
        updateProductStock,
    required TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)
        updateSalesOrderDetail,
    required TResult Function(SalesOrderDetail salesOrderDetail) remove,
    required TResult Function(SalesOrderDetail salesOrderDetail) delete,
  }) {
    return fetchById(salesOrderDetail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrder salesOrder)? fetch,
    TResult? Function(SalesOrderDetail salesOrderDetail)? fetchById,
    TResult? Function(SalesOrder salesOrder, SalesOrderHistory revisionNo)?
        fetchHistory,
    TResult? Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateProductStock,
    TResult? Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateSalesOrderDetail,
    TResult? Function(SalesOrderDetail salesOrderDetail)? remove,
    TResult? Function(SalesOrderDetail salesOrderDetail)? delete,
  }) {
    return fetchById?.call(salesOrderDetail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrder salesOrder)? fetch,
    TResult Function(SalesOrderDetail salesOrderDetail)? fetchById,
    TResult Function(SalesOrder salesOrder, SalesOrderHistory revisionNo)?
        fetchHistory,
    TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateProductStock,
    TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateSalesOrderDetail,
    TResult Function(SalesOrderDetail salesOrderDetail)? remove,
    TResult Function(SalesOrderDetail salesOrderDetail)? delete,
    required TResult orElse(),
  }) {
    if (fetchById != null) {
      return fetchById(salesOrderDetail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchById value) fetchById,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_UpdateSalesOrderDetail value)
        updateSalesOrderDetail,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Delete value) delete,
  }) {
    return fetchById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchById value)? fetchById,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_UpdateSalesOrderDetail value)? updateSalesOrderDetail,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Delete value)? delete,
  }) {
    return fetchById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchById value)? fetchById,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_UpdateSalesOrderDetail value)? updateSalesOrderDetail,
    TResult Function(_Remove value)? remove,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (fetchById != null) {
      return fetchById(this);
    }
    return orElse();
  }
}

abstract class _FetchById implements SalesOrderDetailEvent {
  const factory _FetchById({required final SalesOrderDetail salesOrderDetail}) =
      _$FetchByIdImpl;

  SalesOrderDetail get salesOrderDetail;

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchByIdImplCopyWith<_$FetchByIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchHistoryImplCopyWith<$Res> {
  factory _$$FetchHistoryImplCopyWith(
          _$FetchHistoryImpl value, $Res Function(_$FetchHistoryImpl) then) =
      __$$FetchHistoryImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrder salesOrder, SalesOrderHistory revisionNo});

  $SalesOrderCopyWith<$Res> get salesOrder;
  $SalesOrderHistoryCopyWith<$Res> get revisionNo;
}

/// @nodoc
class __$$FetchHistoryImplCopyWithImpl<$Res>
    extends _$SalesOrderDetailEventCopyWithImpl<$Res, _$FetchHistoryImpl>
    implements _$$FetchHistoryImplCopyWith<$Res> {
  __$$FetchHistoryImplCopyWithImpl(
      _$FetchHistoryImpl _value, $Res Function(_$FetchHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrder = null,
    Object? revisionNo = null,
  }) {
    return _then(_$FetchHistoryImpl(
      salesOrder: null == salesOrder
          ? _value.salesOrder
          : salesOrder // ignore: cast_nullable_to_non_nullable
              as SalesOrder,
      revisionNo: null == revisionNo
          ? _value.revisionNo
          : revisionNo // ignore: cast_nullable_to_non_nullable
              as SalesOrderHistory,
    ));
  }

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SalesOrderCopyWith<$Res> get salesOrder {
    return $SalesOrderCopyWith<$Res>(_value.salesOrder, (value) {
      return _then(_value.copyWith(salesOrder: value));
    });
  }

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SalesOrderHistoryCopyWith<$Res> get revisionNo {
    return $SalesOrderHistoryCopyWith<$Res>(_value.revisionNo, (value) {
      return _then(_value.copyWith(revisionNo: value));
    });
  }
}

/// @nodoc

class _$FetchHistoryImpl implements _FetchHistory {
  const _$FetchHistoryImpl(
      {required this.salesOrder, required this.revisionNo});

  @override
  final SalesOrder salesOrder;
  @override
  final SalesOrderHistory revisionNo;

  @override
  String toString() {
    return 'SalesOrderDetailEvent.fetchHistory(salesOrder: $salesOrder, revisionNo: $revisionNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchHistoryImpl &&
            (identical(other.salesOrder, salesOrder) ||
                other.salesOrder == salesOrder) &&
            (identical(other.revisionNo, revisionNo) ||
                other.revisionNo == revisionNo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrder, revisionNo);

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchHistoryImplCopyWith<_$FetchHistoryImpl> get copyWith =>
      __$$FetchHistoryImplCopyWithImpl<_$FetchHistoryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrder salesOrder) fetch,
    required TResult Function(SalesOrderDetail salesOrderDetail) fetchById,
    required TResult Function(
            SalesOrder salesOrder, SalesOrderHistory revisionNo)
        fetchHistory,
    required TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)
        updateProductStock,
    required TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)
        updateSalesOrderDetail,
    required TResult Function(SalesOrderDetail salesOrderDetail) remove,
    required TResult Function(SalesOrderDetail salesOrderDetail) delete,
  }) {
    return fetchHistory(salesOrder, revisionNo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrder salesOrder)? fetch,
    TResult? Function(SalesOrderDetail salesOrderDetail)? fetchById,
    TResult? Function(SalesOrder salesOrder, SalesOrderHistory revisionNo)?
        fetchHistory,
    TResult? Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateProductStock,
    TResult? Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateSalesOrderDetail,
    TResult? Function(SalesOrderDetail salesOrderDetail)? remove,
    TResult? Function(SalesOrderDetail salesOrderDetail)? delete,
  }) {
    return fetchHistory?.call(salesOrder, revisionNo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrder salesOrder)? fetch,
    TResult Function(SalesOrderDetail salesOrderDetail)? fetchById,
    TResult Function(SalesOrder salesOrder, SalesOrderHistory revisionNo)?
        fetchHistory,
    TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateProductStock,
    TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateSalesOrderDetail,
    TResult Function(SalesOrderDetail salesOrderDetail)? remove,
    TResult Function(SalesOrderDetail salesOrderDetail)? delete,
    required TResult orElse(),
  }) {
    if (fetchHistory != null) {
      return fetchHistory(salesOrder, revisionNo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchById value) fetchById,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_UpdateSalesOrderDetail value)
        updateSalesOrderDetail,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Delete value) delete,
  }) {
    return fetchHistory(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchById value)? fetchById,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_UpdateSalesOrderDetail value)? updateSalesOrderDetail,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Delete value)? delete,
  }) {
    return fetchHistory?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchById value)? fetchById,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_UpdateSalesOrderDetail value)? updateSalesOrderDetail,
    TResult Function(_Remove value)? remove,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (fetchHistory != null) {
      return fetchHistory(this);
    }
    return orElse();
  }
}

abstract class _FetchHistory implements SalesOrderDetailEvent {
  const factory _FetchHistory(
      {required final SalesOrder salesOrder,
      required final SalesOrderHistory revisionNo}) = _$FetchHistoryImpl;

  SalesOrder get salesOrder;
  SalesOrderHistory get revisionNo;

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchHistoryImplCopyWith<_$FetchHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateProductStockImplCopyWith<$Res> {
  factory _$$UpdateProductStockImplCopyWith(_$UpdateProductStockImpl value,
          $Res Function(_$UpdateProductStockImpl) then) =
      __$$UpdateProductStockImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrderDetail salesOrderDetail, String batchNo});

  $SalesOrderDetailCopyWith<$Res> get salesOrderDetail;
}

/// @nodoc
class __$$UpdateProductStockImplCopyWithImpl<$Res>
    extends _$SalesOrderDetailEventCopyWithImpl<$Res, _$UpdateProductStockImpl>
    implements _$$UpdateProductStockImplCopyWith<$Res> {
  __$$UpdateProductStockImplCopyWithImpl(_$UpdateProductStockImpl _value,
      $Res Function(_$UpdateProductStockImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrderDetail = null,
    Object? batchNo = null,
  }) {
    return _then(_$UpdateProductStockImpl(
      salesOrderDetail: null == salesOrderDetail
          ? _value.salesOrderDetail
          : salesOrderDetail // ignore: cast_nullable_to_non_nullable
              as SalesOrderDetail,
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SalesOrderDetailCopyWith<$Res> get salesOrderDetail {
    return $SalesOrderDetailCopyWith<$Res>(_value.salesOrderDetail, (value) {
      return _then(_value.copyWith(salesOrderDetail: value));
    });
  }
}

/// @nodoc

class _$UpdateProductStockImpl implements _UpdateProductStock {
  const _$UpdateProductStockImpl(
      {required this.salesOrderDetail, required this.batchNo});

  @override
  final SalesOrderDetail salesOrderDetail;
  @override
  final String batchNo;

  @override
  String toString() {
    return 'SalesOrderDetailEvent.updateProductStock(salesOrderDetail: $salesOrderDetail, batchNo: $batchNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProductStockImpl &&
            (identical(other.salesOrderDetail, salesOrderDetail) ||
                other.salesOrderDetail == salesOrderDetail) &&
            (identical(other.batchNo, batchNo) || other.batchNo == batchNo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrderDetail, batchNo);

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProductStockImplCopyWith<_$UpdateProductStockImpl> get copyWith =>
      __$$UpdateProductStockImplCopyWithImpl<_$UpdateProductStockImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrder salesOrder) fetch,
    required TResult Function(SalesOrderDetail salesOrderDetail) fetchById,
    required TResult Function(
            SalesOrder salesOrder, SalesOrderHistory revisionNo)
        fetchHistory,
    required TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)
        updateProductStock,
    required TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)
        updateSalesOrderDetail,
    required TResult Function(SalesOrderDetail salesOrderDetail) remove,
    required TResult Function(SalesOrderDetail salesOrderDetail) delete,
  }) {
    return updateProductStock(salesOrderDetail, batchNo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrder salesOrder)? fetch,
    TResult? Function(SalesOrderDetail salesOrderDetail)? fetchById,
    TResult? Function(SalesOrder salesOrder, SalesOrderHistory revisionNo)?
        fetchHistory,
    TResult? Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateProductStock,
    TResult? Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateSalesOrderDetail,
    TResult? Function(SalesOrderDetail salesOrderDetail)? remove,
    TResult? Function(SalesOrderDetail salesOrderDetail)? delete,
  }) {
    return updateProductStock?.call(salesOrderDetail, batchNo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrder salesOrder)? fetch,
    TResult Function(SalesOrderDetail salesOrderDetail)? fetchById,
    TResult Function(SalesOrder salesOrder, SalesOrderHistory revisionNo)?
        fetchHistory,
    TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateProductStock,
    TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateSalesOrderDetail,
    TResult Function(SalesOrderDetail salesOrderDetail)? remove,
    TResult Function(SalesOrderDetail salesOrderDetail)? delete,
    required TResult orElse(),
  }) {
    if (updateProductStock != null) {
      return updateProductStock(salesOrderDetail, batchNo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchById value) fetchById,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_UpdateSalesOrderDetail value)
        updateSalesOrderDetail,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Delete value) delete,
  }) {
    return updateProductStock(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchById value)? fetchById,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_UpdateSalesOrderDetail value)? updateSalesOrderDetail,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Delete value)? delete,
  }) {
    return updateProductStock?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchById value)? fetchById,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_UpdateSalesOrderDetail value)? updateSalesOrderDetail,
    TResult Function(_Remove value)? remove,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (updateProductStock != null) {
      return updateProductStock(this);
    }
    return orElse();
  }
}

abstract class _UpdateProductStock implements SalesOrderDetailEvent {
  const factory _UpdateProductStock(
      {required final SalesOrderDetail salesOrderDetail,
      required final String batchNo}) = _$UpdateProductStockImpl;

  SalesOrderDetail get salesOrderDetail;
  String get batchNo;

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateProductStockImplCopyWith<_$UpdateProductStockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateSalesOrderDetailImplCopyWith<$Res> {
  factory _$$UpdateSalesOrderDetailImplCopyWith(
          _$UpdateSalesOrderDetailImpl value,
          $Res Function(_$UpdateSalesOrderDetailImpl) then) =
      __$$UpdateSalesOrderDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrderDetail salesOrderDetail, String batchNo});

  $SalesOrderDetailCopyWith<$Res> get salesOrderDetail;
}

/// @nodoc
class __$$UpdateSalesOrderDetailImplCopyWithImpl<$Res>
    extends _$SalesOrderDetailEventCopyWithImpl<$Res,
        _$UpdateSalesOrderDetailImpl>
    implements _$$UpdateSalesOrderDetailImplCopyWith<$Res> {
  __$$UpdateSalesOrderDetailImplCopyWithImpl(
      _$UpdateSalesOrderDetailImpl _value,
      $Res Function(_$UpdateSalesOrderDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrderDetail = null,
    Object? batchNo = null,
  }) {
    return _then(_$UpdateSalesOrderDetailImpl(
      salesOrderDetail: null == salesOrderDetail
          ? _value.salesOrderDetail
          : salesOrderDetail // ignore: cast_nullable_to_non_nullable
              as SalesOrderDetail,
      batchNo: null == batchNo
          ? _value.batchNo
          : batchNo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SalesOrderDetailCopyWith<$Res> get salesOrderDetail {
    return $SalesOrderDetailCopyWith<$Res>(_value.salesOrderDetail, (value) {
      return _then(_value.copyWith(salesOrderDetail: value));
    });
  }
}

/// @nodoc

class _$UpdateSalesOrderDetailImpl implements _UpdateSalesOrderDetail {
  const _$UpdateSalesOrderDetailImpl(
      {required this.salesOrderDetail, required this.batchNo});

  @override
  final SalesOrderDetail salesOrderDetail;
  @override
  final String batchNo;

  @override
  String toString() {
    return 'SalesOrderDetailEvent.updateSalesOrderDetail(salesOrderDetail: $salesOrderDetail, batchNo: $batchNo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSalesOrderDetailImpl &&
            (identical(other.salesOrderDetail, salesOrderDetail) ||
                other.salesOrderDetail == salesOrderDetail) &&
            (identical(other.batchNo, batchNo) || other.batchNo == batchNo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrderDetail, batchNo);

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSalesOrderDetailImplCopyWith<_$UpdateSalesOrderDetailImpl>
      get copyWith => __$$UpdateSalesOrderDetailImplCopyWithImpl<
          _$UpdateSalesOrderDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrder salesOrder) fetch,
    required TResult Function(SalesOrderDetail salesOrderDetail) fetchById,
    required TResult Function(
            SalesOrder salesOrder, SalesOrderHistory revisionNo)
        fetchHistory,
    required TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)
        updateProductStock,
    required TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)
        updateSalesOrderDetail,
    required TResult Function(SalesOrderDetail salesOrderDetail) remove,
    required TResult Function(SalesOrderDetail salesOrderDetail) delete,
  }) {
    return updateSalesOrderDetail(salesOrderDetail, batchNo);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrder salesOrder)? fetch,
    TResult? Function(SalesOrderDetail salesOrderDetail)? fetchById,
    TResult? Function(SalesOrder salesOrder, SalesOrderHistory revisionNo)?
        fetchHistory,
    TResult? Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateProductStock,
    TResult? Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateSalesOrderDetail,
    TResult? Function(SalesOrderDetail salesOrderDetail)? remove,
    TResult? Function(SalesOrderDetail salesOrderDetail)? delete,
  }) {
    return updateSalesOrderDetail?.call(salesOrderDetail, batchNo);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrder salesOrder)? fetch,
    TResult Function(SalesOrderDetail salesOrderDetail)? fetchById,
    TResult Function(SalesOrder salesOrder, SalesOrderHistory revisionNo)?
        fetchHistory,
    TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateProductStock,
    TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateSalesOrderDetail,
    TResult Function(SalesOrderDetail salesOrderDetail)? remove,
    TResult Function(SalesOrderDetail salesOrderDetail)? delete,
    required TResult orElse(),
  }) {
    if (updateSalesOrderDetail != null) {
      return updateSalesOrderDetail(salesOrderDetail, batchNo);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchById value) fetchById,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_UpdateSalesOrderDetail value)
        updateSalesOrderDetail,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Delete value) delete,
  }) {
    return updateSalesOrderDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchById value)? fetchById,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_UpdateSalesOrderDetail value)? updateSalesOrderDetail,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Delete value)? delete,
  }) {
    return updateSalesOrderDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchById value)? fetchById,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_UpdateSalesOrderDetail value)? updateSalesOrderDetail,
    TResult Function(_Remove value)? remove,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (updateSalesOrderDetail != null) {
      return updateSalesOrderDetail(this);
    }
    return orElse();
  }
}

abstract class _UpdateSalesOrderDetail implements SalesOrderDetailEvent {
  const factory _UpdateSalesOrderDetail(
      {required final SalesOrderDetail salesOrderDetail,
      required final String batchNo}) = _$UpdateSalesOrderDetailImpl;

  SalesOrderDetail get salesOrderDetail;
  String get batchNo;

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateSalesOrderDetailImplCopyWith<_$UpdateSalesOrderDetailImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveImplCopyWith<$Res> {
  factory _$$RemoveImplCopyWith(
          _$RemoveImpl value, $Res Function(_$RemoveImpl) then) =
      __$$RemoveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrderDetail salesOrderDetail});

  $SalesOrderDetailCopyWith<$Res> get salesOrderDetail;
}

/// @nodoc
class __$$RemoveImplCopyWithImpl<$Res>
    extends _$SalesOrderDetailEventCopyWithImpl<$Res, _$RemoveImpl>
    implements _$$RemoveImplCopyWith<$Res> {
  __$$RemoveImplCopyWithImpl(
      _$RemoveImpl _value, $Res Function(_$RemoveImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrderDetail = null,
  }) {
    return _then(_$RemoveImpl(
      null == salesOrderDetail
          ? _value.salesOrderDetail
          : salesOrderDetail // ignore: cast_nullable_to_non_nullable
              as SalesOrderDetail,
    ));
  }

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SalesOrderDetailCopyWith<$Res> get salesOrderDetail {
    return $SalesOrderDetailCopyWith<$Res>(_value.salesOrderDetail, (value) {
      return _then(_value.copyWith(salesOrderDetail: value));
    });
  }
}

/// @nodoc

class _$RemoveImpl implements _Remove {
  const _$RemoveImpl(this.salesOrderDetail);

  @override
  final SalesOrderDetail salesOrderDetail;

  @override
  String toString() {
    return 'SalesOrderDetailEvent.remove(salesOrderDetail: $salesOrderDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveImpl &&
            (identical(other.salesOrderDetail, salesOrderDetail) ||
                other.salesOrderDetail == salesOrderDetail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrderDetail);

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveImplCopyWith<_$RemoveImpl> get copyWith =>
      __$$RemoveImplCopyWithImpl<_$RemoveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrder salesOrder) fetch,
    required TResult Function(SalesOrderDetail salesOrderDetail) fetchById,
    required TResult Function(
            SalesOrder salesOrder, SalesOrderHistory revisionNo)
        fetchHistory,
    required TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)
        updateProductStock,
    required TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)
        updateSalesOrderDetail,
    required TResult Function(SalesOrderDetail salesOrderDetail) remove,
    required TResult Function(SalesOrderDetail salesOrderDetail) delete,
  }) {
    return remove(salesOrderDetail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrder salesOrder)? fetch,
    TResult? Function(SalesOrderDetail salesOrderDetail)? fetchById,
    TResult? Function(SalesOrder salesOrder, SalesOrderHistory revisionNo)?
        fetchHistory,
    TResult? Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateProductStock,
    TResult? Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateSalesOrderDetail,
    TResult? Function(SalesOrderDetail salesOrderDetail)? remove,
    TResult? Function(SalesOrderDetail salesOrderDetail)? delete,
  }) {
    return remove?.call(salesOrderDetail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrder salesOrder)? fetch,
    TResult Function(SalesOrderDetail salesOrderDetail)? fetchById,
    TResult Function(SalesOrder salesOrder, SalesOrderHistory revisionNo)?
        fetchHistory,
    TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateProductStock,
    TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateSalesOrderDetail,
    TResult Function(SalesOrderDetail salesOrderDetail)? remove,
    TResult Function(SalesOrderDetail salesOrderDetail)? delete,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(salesOrderDetail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchById value) fetchById,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_UpdateSalesOrderDetail value)
        updateSalesOrderDetail,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Delete value) delete,
  }) {
    return remove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchById value)? fetchById,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_UpdateSalesOrderDetail value)? updateSalesOrderDetail,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Delete value)? delete,
  }) {
    return remove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchById value)? fetchById,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_UpdateSalesOrderDetail value)? updateSalesOrderDetail,
    TResult Function(_Remove value)? remove,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(this);
    }
    return orElse();
  }
}

abstract class _Remove implements SalesOrderDetailEvent {
  const factory _Remove(final SalesOrderDetail salesOrderDetail) = _$RemoveImpl;

  SalesOrderDetail get salesOrderDetail;

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoveImplCopyWith<_$RemoveImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SalesOrderDetail salesOrderDetail});

  $SalesOrderDetailCopyWith<$Res> get salesOrderDetail;
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$SalesOrderDetailEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? salesOrderDetail = null,
  }) {
    return _then(_$DeleteImpl(
      null == salesOrderDetail
          ? _value.salesOrderDetail
          : salesOrderDetail // ignore: cast_nullable_to_non_nullable
              as SalesOrderDetail,
    ));
  }

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SalesOrderDetailCopyWith<$Res> get salesOrderDetail {
    return $SalesOrderDetailCopyWith<$Res>(_value.salesOrderDetail, (value) {
      return _then(_value.copyWith(salesOrderDetail: value));
    });
  }
}

/// @nodoc

class _$DeleteImpl implements _Delete {
  const _$DeleteImpl(this.salesOrderDetail);

  @override
  final SalesOrderDetail salesOrderDetail;

  @override
  String toString() {
    return 'SalesOrderDetailEvent.delete(salesOrderDetail: $salesOrderDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteImpl &&
            (identical(other.salesOrderDetail, salesOrderDetail) ||
                other.salesOrderDetail == salesOrderDetail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, salesOrderDetail);

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      __$$DeleteImplCopyWithImpl<_$DeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(SalesOrder salesOrder) fetch,
    required TResult Function(SalesOrderDetail salesOrderDetail) fetchById,
    required TResult Function(
            SalesOrder salesOrder, SalesOrderHistory revisionNo)
        fetchHistory,
    required TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)
        updateProductStock,
    required TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)
        updateSalesOrderDetail,
    required TResult Function(SalesOrderDetail salesOrderDetail) remove,
    required TResult Function(SalesOrderDetail salesOrderDetail) delete,
  }) {
    return delete(salesOrderDetail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(SalesOrder salesOrder)? fetch,
    TResult? Function(SalesOrderDetail salesOrderDetail)? fetchById,
    TResult? Function(SalesOrder salesOrder, SalesOrderHistory revisionNo)?
        fetchHistory,
    TResult? Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateProductStock,
    TResult? Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateSalesOrderDetail,
    TResult? Function(SalesOrderDetail salesOrderDetail)? remove,
    TResult? Function(SalesOrderDetail salesOrderDetail)? delete,
  }) {
    return delete?.call(salesOrderDetail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(SalesOrder salesOrder)? fetch,
    TResult Function(SalesOrderDetail salesOrderDetail)? fetchById,
    TResult Function(SalesOrder salesOrder, SalesOrderHistory revisionNo)?
        fetchHistory,
    TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateProductStock,
    TResult Function(SalesOrderDetail salesOrderDetail, String batchNo)?
        updateSalesOrderDetail,
    TResult Function(SalesOrderDetail salesOrderDetail)? remove,
    TResult Function(SalesOrderDetail salesOrderDetail)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(salesOrderDetail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_FetchById value) fetchById,
    required TResult Function(_FetchHistory value) fetchHistory,
    required TResult Function(_UpdateProductStock value) updateProductStock,
    required TResult Function(_UpdateSalesOrderDetail value)
        updateSalesOrderDetail,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Delete value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_FetchById value)? fetchById,
    TResult? Function(_FetchHistory value)? fetchHistory,
    TResult? Function(_UpdateProductStock value)? updateProductStock,
    TResult? Function(_UpdateSalesOrderDetail value)? updateSalesOrderDetail,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Delete value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_FetchById value)? fetchById,
    TResult Function(_FetchHistory value)? fetchHistory,
    TResult Function(_UpdateProductStock value)? updateProductStock,
    TResult Function(_UpdateSalesOrderDetail value)? updateSalesOrderDetail,
    TResult Function(_Remove value)? remove,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements SalesOrderDetailEvent {
  const factory _Delete(final SalesOrderDetail salesOrderDetail) = _$DeleteImpl;

  SalesOrderDetail get salesOrderDetail;

  /// Create a copy of SalesOrderDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
