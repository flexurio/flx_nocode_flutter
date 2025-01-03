// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScheduleState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
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
abstract class $ScheduleStateCopyWith<$Res> {
  factory $ScheduleStateCopyWith(
          ScheduleState value, $Res Function(ScheduleState) then) =
      _$ScheduleStateCopyWithImpl<$Res, ScheduleState>;
}

/// @nodoc
class _$ScheduleStateCopyWithImpl<$Res, $Val extends ScheduleState>
    implements $ScheduleStateCopyWith<$Res> {
  _$ScheduleStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ScheduleStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'ScheduleState.initial()';
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
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? success,
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

abstract class _Initial implements ScheduleState {
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
    extends _$ScheduleStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'ScheduleState.loading()';
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
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
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

abstract class _Loading implements ScheduleState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$ScheduleStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'ScheduleState.success()';
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
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
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

abstract class _Success implements ScheduleState {
  const factory _Success() = _$SuccessImpl;
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
    extends _$ScheduleStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

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
    return 'ScheduleState.error(error: $error)';
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
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

abstract class _Error implements ScheduleState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ScheduleEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTime startTime,
            ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess,
            Product product)
        create,
    required TResult Function(
            int id,
            WorkHourShift workHourShift,
            int quantityMan,
            DateTime actualStartTime,
            DateTime actualEndTime,
            int yieldSchedule,
            String notes)
        createActual,
    required TResult Function(
            DateTime startTime,
            ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess,
            Product product,
            Schedule schedule)
        edit,
    required TResult Function(Schedule schedule) close,
    required TResult Function(Schedule schedule) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime startTime, ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess, Product product)?
        create,
    TResult? Function(
            int id,
            WorkHourShift workHourShift,
            int quantityMan,
            DateTime actualStartTime,
            DateTime actualEndTime,
            int yieldSchedule,
            String notes)?
        createActual,
    TResult? Function(
            DateTime startTime,
            ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess,
            Product product,
            Schedule schedule)?
        edit,
    TResult? Function(Schedule schedule)? close,
    TResult? Function(Schedule schedule)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime startTime, ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess, Product product)?
        create,
    TResult Function(
            int id,
            WorkHourShift workHourShift,
            int quantityMan,
            DateTime actualStartTime,
            DateTime actualEndTime,
            int yieldSchedule,
            String notes)?
        createActual,
    TResult Function(
            DateTime startTime,
            ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess,
            Product product,
            Schedule schedule)?
        edit,
    TResult Function(Schedule schedule)? close,
    TResult Function(Schedule schedule)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateActual value) createActual,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Close value) close,
    required TResult Function(_Delete value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateActual value)? createActual,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Close value)? close,
    TResult? Function(_Delete value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateActual value)? createActual,
    TResult Function(_Edit value)? edit,
    TResult Function(_Close value)? close,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleEventCopyWith<$Res> {
  factory $ScheduleEventCopyWith(
          ScheduleEvent value, $Res Function(ScheduleEvent) then) =
      _$ScheduleEventCopyWithImpl<$Res, ScheduleEvent>;
}

/// @nodoc
class _$ScheduleEventCopyWithImpl<$Res, $Val extends ScheduleEvent>
    implements $ScheduleEventCopyWith<$Res> {
  _$ScheduleEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$CreateImplCopyWith<$Res> {
  factory _$$CreateImplCopyWith(
          _$CreateImpl value, $Res Function(_$CreateImpl) then) =
      __$$CreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {DateTime startTime,
      ProductionOrder productionOrder,
      List<ProductionStageProcess> stageProcess,
      Product product});

  $ProductionOrderCopyWith<$Res> get productionOrder;
  $ProductCopyWith<$Res> get product;
}

/// @nodoc
class __$$CreateImplCopyWithImpl<$Res>
    extends _$ScheduleEventCopyWithImpl<$Res, _$CreateImpl>
    implements _$$CreateImplCopyWith<$Res> {
  __$$CreateImplCopyWithImpl(
      _$CreateImpl _value, $Res Function(_$CreateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? productionOrder = null,
    Object? stageProcess = null,
    Object? product = null,
  }) {
    return _then(_$CreateImpl(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      productionOrder: null == productionOrder
          ? _value.productionOrder
          : productionOrder // ignore: cast_nullable_to_non_nullable
              as ProductionOrder,
      stageProcess: null == stageProcess
          ? _value._stageProcess
          : stageProcess // ignore: cast_nullable_to_non_nullable
              as List<ProductionStageProcess>,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductionOrderCopyWith<$Res> get productionOrder {
    return $ProductionOrderCopyWith<$Res>(_value.productionOrder, (value) {
      return _then(_value.copyWith(productionOrder: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc

class _$CreateImpl implements _Create {
  const _$CreateImpl(
      {required this.startTime,
      required this.productionOrder,
      required final List<ProductionStageProcess> stageProcess,
      required this.product})
      : _stageProcess = stageProcess;

  @override
  final DateTime startTime;
  @override
  final ProductionOrder productionOrder;
  final List<ProductionStageProcess> _stageProcess;
  @override
  List<ProductionStageProcess> get stageProcess {
    if (_stageProcess is EqualUnmodifiableListView) return _stageProcess;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stageProcess);
  }

  @override
  final Product product;

  @override
  String toString() {
    return 'ScheduleEvent.create(startTime: $startTime, productionOrder: $productionOrder, stageProcess: $stageProcess, product: $product)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.productionOrder, productionOrder) ||
                other.productionOrder == productionOrder) &&
            const DeepCollectionEquality()
                .equals(other._stageProcess, _stageProcess) &&
            (identical(other.product, product) || other.product == product));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startTime, productionOrder,
      const DeepCollectionEquality().hash(_stageProcess), product);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      __$$CreateImplCopyWithImpl<_$CreateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTime startTime,
            ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess,
            Product product)
        create,
    required TResult Function(
            int id,
            WorkHourShift workHourShift,
            int quantityMan,
            DateTime actualStartTime,
            DateTime actualEndTime,
            int yieldSchedule,
            String notes)
        createActual,
    required TResult Function(
            DateTime startTime,
            ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess,
            Product product,
            Schedule schedule)
        edit,
    required TResult Function(Schedule schedule) close,
    required TResult Function(Schedule schedule) delete,
  }) {
    return create(startTime, productionOrder, stageProcess, product);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime startTime, ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess, Product product)?
        create,
    TResult? Function(
            int id,
            WorkHourShift workHourShift,
            int quantityMan,
            DateTime actualStartTime,
            DateTime actualEndTime,
            int yieldSchedule,
            String notes)?
        createActual,
    TResult? Function(
            DateTime startTime,
            ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess,
            Product product,
            Schedule schedule)?
        edit,
    TResult? Function(Schedule schedule)? close,
    TResult? Function(Schedule schedule)? delete,
  }) {
    return create?.call(startTime, productionOrder, stageProcess, product);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime startTime, ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess, Product product)?
        create,
    TResult Function(
            int id,
            WorkHourShift workHourShift,
            int quantityMan,
            DateTime actualStartTime,
            DateTime actualEndTime,
            int yieldSchedule,
            String notes)?
        createActual,
    TResult Function(
            DateTime startTime,
            ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess,
            Product product,
            Schedule schedule)?
        edit,
    TResult Function(Schedule schedule)? close,
    TResult Function(Schedule schedule)? delete,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(startTime, productionOrder, stageProcess, product);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateActual value) createActual,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Close value) close,
    required TResult Function(_Delete value) delete,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateActual value)? createActual,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Close value)? close,
    TResult? Function(_Delete value)? delete,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateActual value)? createActual,
    TResult Function(_Edit value)? edit,
    TResult Function(_Close value)? close,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class _Create implements ScheduleEvent {
  const factory _Create(
      {required final DateTime startTime,
      required final ProductionOrder productionOrder,
      required final List<ProductionStageProcess> stageProcess,
      required final Product product}) = _$CreateImpl;

  DateTime get startTime;
  ProductionOrder get productionOrder;
  List<ProductionStageProcess> get stageProcess;
  Product get product;
  @JsonKey(ignore: true)
  _$$CreateImplCopyWith<_$CreateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CreateActualImplCopyWith<$Res> {
  factory _$$CreateActualImplCopyWith(
          _$CreateActualImpl value, $Res Function(_$CreateActualImpl) then) =
      __$$CreateActualImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {int id,
      WorkHourShift workHourShift,
      int quantityMan,
      DateTime actualStartTime,
      DateTime actualEndTime,
      int yieldSchedule,
      String notes});

  $WorkHourShiftCopyWith<$Res> get workHourShift;
}

/// @nodoc
class __$$CreateActualImplCopyWithImpl<$Res>
    extends _$ScheduleEventCopyWithImpl<$Res, _$CreateActualImpl>
    implements _$$CreateActualImplCopyWith<$Res> {
  __$$CreateActualImplCopyWithImpl(
      _$CreateActualImpl _value, $Res Function(_$CreateActualImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? workHourShift = null,
    Object? quantityMan = null,
    Object? actualStartTime = null,
    Object? actualEndTime = null,
    Object? yieldSchedule = null,
    Object? notes = null,
  }) {
    return _then(_$CreateActualImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      workHourShift: null == workHourShift
          ? _value.workHourShift
          : workHourShift // ignore: cast_nullable_to_non_nullable
              as WorkHourShift,
      quantityMan: null == quantityMan
          ? _value.quantityMan
          : quantityMan // ignore: cast_nullable_to_non_nullable
              as int,
      actualStartTime: null == actualStartTime
          ? _value.actualStartTime
          : actualStartTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      actualEndTime: null == actualEndTime
          ? _value.actualEndTime
          : actualEndTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      yieldSchedule: null == yieldSchedule
          ? _value.yieldSchedule
          : yieldSchedule // ignore: cast_nullable_to_non_nullable
              as int,
      notes: null == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $WorkHourShiftCopyWith<$Res> get workHourShift {
    return $WorkHourShiftCopyWith<$Res>(_value.workHourShift, (value) {
      return _then(_value.copyWith(workHourShift: value));
    });
  }
}

/// @nodoc

class _$CreateActualImpl implements _CreateActual {
  const _$CreateActualImpl(
      {required this.id,
      required this.workHourShift,
      required this.quantityMan,
      required this.actualStartTime,
      required this.actualEndTime,
      required this.yieldSchedule,
      required this.notes});

  @override
  final int id;
  @override
  final WorkHourShift workHourShift;
  @override
  final int quantityMan;
  @override
  final DateTime actualStartTime;
  @override
  final DateTime actualEndTime;
  @override
  final int yieldSchedule;
  @override
  final String notes;

  @override
  String toString() {
    return 'ScheduleEvent.createActual(id: $id, workHourShift: $workHourShift, quantityMan: $quantityMan, actualStartTime: $actualStartTime, actualEndTime: $actualEndTime, yieldSchedule: $yieldSchedule, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateActualImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.workHourShift, workHourShift) ||
                other.workHourShift == workHourShift) &&
            (identical(other.quantityMan, quantityMan) ||
                other.quantityMan == quantityMan) &&
            (identical(other.actualStartTime, actualStartTime) ||
                other.actualStartTime == actualStartTime) &&
            (identical(other.actualEndTime, actualEndTime) ||
                other.actualEndTime == actualEndTime) &&
            (identical(other.yieldSchedule, yieldSchedule) ||
                other.yieldSchedule == yieldSchedule) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, workHourShift, quantityMan,
      actualStartTime, actualEndTime, yieldSchedule, notes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateActualImplCopyWith<_$CreateActualImpl> get copyWith =>
      __$$CreateActualImplCopyWithImpl<_$CreateActualImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTime startTime,
            ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess,
            Product product)
        create,
    required TResult Function(
            int id,
            WorkHourShift workHourShift,
            int quantityMan,
            DateTime actualStartTime,
            DateTime actualEndTime,
            int yieldSchedule,
            String notes)
        createActual,
    required TResult Function(
            DateTime startTime,
            ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess,
            Product product,
            Schedule schedule)
        edit,
    required TResult Function(Schedule schedule) close,
    required TResult Function(Schedule schedule) delete,
  }) {
    return createActual(id, workHourShift, quantityMan, actualStartTime,
        actualEndTime, yieldSchedule, notes);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime startTime, ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess, Product product)?
        create,
    TResult? Function(
            int id,
            WorkHourShift workHourShift,
            int quantityMan,
            DateTime actualStartTime,
            DateTime actualEndTime,
            int yieldSchedule,
            String notes)?
        createActual,
    TResult? Function(
            DateTime startTime,
            ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess,
            Product product,
            Schedule schedule)?
        edit,
    TResult? Function(Schedule schedule)? close,
    TResult? Function(Schedule schedule)? delete,
  }) {
    return createActual?.call(id, workHourShift, quantityMan, actualStartTime,
        actualEndTime, yieldSchedule, notes);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime startTime, ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess, Product product)?
        create,
    TResult Function(
            int id,
            WorkHourShift workHourShift,
            int quantityMan,
            DateTime actualStartTime,
            DateTime actualEndTime,
            int yieldSchedule,
            String notes)?
        createActual,
    TResult Function(
            DateTime startTime,
            ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess,
            Product product,
            Schedule schedule)?
        edit,
    TResult Function(Schedule schedule)? close,
    TResult Function(Schedule schedule)? delete,
    required TResult orElse(),
  }) {
    if (createActual != null) {
      return createActual(id, workHourShift, quantityMan, actualStartTime,
          actualEndTime, yieldSchedule, notes);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateActual value) createActual,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Close value) close,
    required TResult Function(_Delete value) delete,
  }) {
    return createActual(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateActual value)? createActual,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Close value)? close,
    TResult? Function(_Delete value)? delete,
  }) {
    return createActual?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateActual value)? createActual,
    TResult Function(_Edit value)? edit,
    TResult Function(_Close value)? close,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (createActual != null) {
      return createActual(this);
    }
    return orElse();
  }
}

abstract class _CreateActual implements ScheduleEvent {
  const factory _CreateActual(
      {required final int id,
      required final WorkHourShift workHourShift,
      required final int quantityMan,
      required final DateTime actualStartTime,
      required final DateTime actualEndTime,
      required final int yieldSchedule,
      required final String notes}) = _$CreateActualImpl;

  int get id;
  WorkHourShift get workHourShift;
  int get quantityMan;
  DateTime get actualStartTime;
  DateTime get actualEndTime;
  int get yieldSchedule;
  String get notes;
  @JsonKey(ignore: true)
  _$$CreateActualImplCopyWith<_$CreateActualImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditImplCopyWith<$Res> {
  factory _$$EditImplCopyWith(
          _$EditImpl value, $Res Function(_$EditImpl) then) =
      __$$EditImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {DateTime startTime,
      ProductionOrder productionOrder,
      List<ProductionStageProcess> stageProcess,
      Product product,
      Schedule schedule});

  $ProductionOrderCopyWith<$Res> get productionOrder;
  $ProductCopyWith<$Res> get product;
  $ScheduleCopyWith<$Res> get schedule;
}

/// @nodoc
class __$$EditImplCopyWithImpl<$Res>
    extends _$ScheduleEventCopyWithImpl<$Res, _$EditImpl>
    implements _$$EditImplCopyWith<$Res> {
  __$$EditImplCopyWithImpl(_$EditImpl _value, $Res Function(_$EditImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? startTime = null,
    Object? productionOrder = null,
    Object? stageProcess = null,
    Object? product = null,
    Object? schedule = null,
  }) {
    return _then(_$EditImpl(
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      productionOrder: null == productionOrder
          ? _value.productionOrder
          : productionOrder // ignore: cast_nullable_to_non_nullable
              as ProductionOrder,
      stageProcess: null == stageProcess
          ? _value._stageProcess
          : stageProcess // ignore: cast_nullable_to_non_nullable
              as List<ProductionStageProcess>,
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as Product,
      schedule: null == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Schedule,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductionOrderCopyWith<$Res> get productionOrder {
    return $ProductionOrderCopyWith<$Res>(_value.productionOrder, (value) {
      return _then(_value.copyWith(productionOrder: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProductCopyWith<$Res> get product {
    return $ProductCopyWith<$Res>(_value.product, (value) {
      return _then(_value.copyWith(product: value));
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ScheduleCopyWith<$Res> get schedule {
    return $ScheduleCopyWith<$Res>(_value.schedule, (value) {
      return _then(_value.copyWith(schedule: value));
    });
  }
}

/// @nodoc

class _$EditImpl implements _Edit {
  const _$EditImpl(
      {required this.startTime,
      required this.productionOrder,
      required final List<ProductionStageProcess> stageProcess,
      required this.product,
      required this.schedule})
      : _stageProcess = stageProcess;

  @override
  final DateTime startTime;
  @override
  final ProductionOrder productionOrder;
  final List<ProductionStageProcess> _stageProcess;
  @override
  List<ProductionStageProcess> get stageProcess {
    if (_stageProcess is EqualUnmodifiableListView) return _stageProcess;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stageProcess);
  }

  @override
  final Product product;
  @override
  final Schedule schedule;

  @override
  String toString() {
    return 'ScheduleEvent.edit(startTime: $startTime, productionOrder: $productionOrder, stageProcess: $stageProcess, product: $product, schedule: $schedule)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditImpl &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.productionOrder, productionOrder) ||
                other.productionOrder == productionOrder) &&
            const DeepCollectionEquality()
                .equals(other._stageProcess, _stageProcess) &&
            (identical(other.product, product) || other.product == product) &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startTime, productionOrder,
      const DeepCollectionEquality().hash(_stageProcess), product, schedule);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditImplCopyWith<_$EditImpl> get copyWith =>
      __$$EditImplCopyWithImpl<_$EditImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTime startTime,
            ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess,
            Product product)
        create,
    required TResult Function(
            int id,
            WorkHourShift workHourShift,
            int quantityMan,
            DateTime actualStartTime,
            DateTime actualEndTime,
            int yieldSchedule,
            String notes)
        createActual,
    required TResult Function(
            DateTime startTime,
            ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess,
            Product product,
            Schedule schedule)
        edit,
    required TResult Function(Schedule schedule) close,
    required TResult Function(Schedule schedule) delete,
  }) {
    return edit(startTime, productionOrder, stageProcess, product, schedule);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime startTime, ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess, Product product)?
        create,
    TResult? Function(
            int id,
            WorkHourShift workHourShift,
            int quantityMan,
            DateTime actualStartTime,
            DateTime actualEndTime,
            int yieldSchedule,
            String notes)?
        createActual,
    TResult? Function(
            DateTime startTime,
            ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess,
            Product product,
            Schedule schedule)?
        edit,
    TResult? Function(Schedule schedule)? close,
    TResult? Function(Schedule schedule)? delete,
  }) {
    return edit?.call(
        startTime, productionOrder, stageProcess, product, schedule);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime startTime, ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess, Product product)?
        create,
    TResult Function(
            int id,
            WorkHourShift workHourShift,
            int quantityMan,
            DateTime actualStartTime,
            DateTime actualEndTime,
            int yieldSchedule,
            String notes)?
        createActual,
    TResult Function(
            DateTime startTime,
            ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess,
            Product product,
            Schedule schedule)?
        edit,
    TResult Function(Schedule schedule)? close,
    TResult Function(Schedule schedule)? delete,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(startTime, productionOrder, stageProcess, product, schedule);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateActual value) createActual,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Close value) close,
    required TResult Function(_Delete value) delete,
  }) {
    return edit(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateActual value)? createActual,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Close value)? close,
    TResult? Function(_Delete value)? delete,
  }) {
    return edit?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateActual value)? createActual,
    TResult Function(_Edit value)? edit,
    TResult Function(_Close value)? close,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (edit != null) {
      return edit(this);
    }
    return orElse();
  }
}

abstract class _Edit implements ScheduleEvent {
  const factory _Edit(
      {required final DateTime startTime,
      required final ProductionOrder productionOrder,
      required final List<ProductionStageProcess> stageProcess,
      required final Product product,
      required final Schedule schedule}) = _$EditImpl;

  DateTime get startTime;
  ProductionOrder get productionOrder;
  List<ProductionStageProcess> get stageProcess;
  Product get product;
  Schedule get schedule;
  @JsonKey(ignore: true)
  _$$EditImplCopyWith<_$EditImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CloseImplCopyWith<$Res> {
  factory _$$CloseImplCopyWith(
          _$CloseImpl value, $Res Function(_$CloseImpl) then) =
      __$$CloseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Schedule schedule});

  $ScheduleCopyWith<$Res> get schedule;
}

/// @nodoc
class __$$CloseImplCopyWithImpl<$Res>
    extends _$ScheduleEventCopyWithImpl<$Res, _$CloseImpl>
    implements _$$CloseImplCopyWith<$Res> {
  __$$CloseImplCopyWithImpl(
      _$CloseImpl _value, $Res Function(_$CloseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schedule = null,
  }) {
    return _then(_$CloseImpl(
      schedule: null == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Schedule,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ScheduleCopyWith<$Res> get schedule {
    return $ScheduleCopyWith<$Res>(_value.schedule, (value) {
      return _then(_value.copyWith(schedule: value));
    });
  }
}

/// @nodoc

class _$CloseImpl implements _Close {
  const _$CloseImpl({required this.schedule});

  @override
  final Schedule schedule;

  @override
  String toString() {
    return 'ScheduleEvent.close(schedule: $schedule)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CloseImpl &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule));
  }

  @override
  int get hashCode => Object.hash(runtimeType, schedule);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CloseImplCopyWith<_$CloseImpl> get copyWith =>
      __$$CloseImplCopyWithImpl<_$CloseImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTime startTime,
            ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess,
            Product product)
        create,
    required TResult Function(
            int id,
            WorkHourShift workHourShift,
            int quantityMan,
            DateTime actualStartTime,
            DateTime actualEndTime,
            int yieldSchedule,
            String notes)
        createActual,
    required TResult Function(
            DateTime startTime,
            ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess,
            Product product,
            Schedule schedule)
        edit,
    required TResult Function(Schedule schedule) close,
    required TResult Function(Schedule schedule) delete,
  }) {
    return close(schedule);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime startTime, ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess, Product product)?
        create,
    TResult? Function(
            int id,
            WorkHourShift workHourShift,
            int quantityMan,
            DateTime actualStartTime,
            DateTime actualEndTime,
            int yieldSchedule,
            String notes)?
        createActual,
    TResult? Function(
            DateTime startTime,
            ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess,
            Product product,
            Schedule schedule)?
        edit,
    TResult? Function(Schedule schedule)? close,
    TResult? Function(Schedule schedule)? delete,
  }) {
    return close?.call(schedule);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime startTime, ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess, Product product)?
        create,
    TResult Function(
            int id,
            WorkHourShift workHourShift,
            int quantityMan,
            DateTime actualStartTime,
            DateTime actualEndTime,
            int yieldSchedule,
            String notes)?
        createActual,
    TResult Function(
            DateTime startTime,
            ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess,
            Product product,
            Schedule schedule)?
        edit,
    TResult Function(Schedule schedule)? close,
    TResult Function(Schedule schedule)? delete,
    required TResult orElse(),
  }) {
    if (close != null) {
      return close(schedule);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateActual value) createActual,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Close value) close,
    required TResult Function(_Delete value) delete,
  }) {
    return close(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateActual value)? createActual,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Close value)? close,
    TResult? Function(_Delete value)? delete,
  }) {
    return close?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateActual value)? createActual,
    TResult Function(_Edit value)? edit,
    TResult Function(_Close value)? close,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (close != null) {
      return close(this);
    }
    return orElse();
  }
}

abstract class _Close implements ScheduleEvent {
  const factory _Close({required final Schedule schedule}) = _$CloseImpl;

  Schedule get schedule;
  @JsonKey(ignore: true)
  _$$CloseImplCopyWith<_$CloseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteImplCopyWith<$Res> {
  factory _$$DeleteImplCopyWith(
          _$DeleteImpl value, $Res Function(_$DeleteImpl) then) =
      __$$DeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Schedule schedule});

  $ScheduleCopyWith<$Res> get schedule;
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$ScheduleEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schedule = null,
  }) {
    return _then(_$DeleteImpl(
      schedule: null == schedule
          ? _value.schedule
          : schedule // ignore: cast_nullable_to_non_nullable
              as Schedule,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ScheduleCopyWith<$Res> get schedule {
    return $ScheduleCopyWith<$Res>(_value.schedule, (value) {
      return _then(_value.copyWith(schedule: value));
    });
  }
}

/// @nodoc

class _$DeleteImpl implements _Delete {
  const _$DeleteImpl({required this.schedule});

  @override
  final Schedule schedule;

  @override
  String toString() {
    return 'ScheduleEvent.delete(schedule: $schedule)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteImpl &&
            (identical(other.schedule, schedule) ||
                other.schedule == schedule));
  }

  @override
  int get hashCode => Object.hash(runtimeType, schedule);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      __$$DeleteImplCopyWithImpl<_$DeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            DateTime startTime,
            ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess,
            Product product)
        create,
    required TResult Function(
            int id,
            WorkHourShift workHourShift,
            int quantityMan,
            DateTime actualStartTime,
            DateTime actualEndTime,
            int yieldSchedule,
            String notes)
        createActual,
    required TResult Function(
            DateTime startTime,
            ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess,
            Product product,
            Schedule schedule)
        edit,
    required TResult Function(Schedule schedule) close,
    required TResult Function(Schedule schedule) delete,
  }) {
    return delete(schedule);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime startTime, ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess, Product product)?
        create,
    TResult? Function(
            int id,
            WorkHourShift workHourShift,
            int quantityMan,
            DateTime actualStartTime,
            DateTime actualEndTime,
            int yieldSchedule,
            String notes)?
        createActual,
    TResult? Function(
            DateTime startTime,
            ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess,
            Product product,
            Schedule schedule)?
        edit,
    TResult? Function(Schedule schedule)? close,
    TResult? Function(Schedule schedule)? delete,
  }) {
    return delete?.call(schedule);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime startTime, ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess, Product product)?
        create,
    TResult Function(
            int id,
            WorkHourShift workHourShift,
            int quantityMan,
            DateTime actualStartTime,
            DateTime actualEndTime,
            int yieldSchedule,
            String notes)?
        createActual,
    TResult Function(
            DateTime startTime,
            ProductionOrder productionOrder,
            List<ProductionStageProcess> stageProcess,
            Product product,
            Schedule schedule)?
        edit,
    TResult Function(Schedule schedule)? close,
    TResult Function(Schedule schedule)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(schedule);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateActual value) createActual,
    required TResult Function(_Edit value) edit,
    required TResult Function(_Close value) close,
    required TResult Function(_Delete value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateActual value)? createActual,
    TResult? Function(_Edit value)? edit,
    TResult? Function(_Close value)? close,
    TResult? Function(_Delete value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateActual value)? createActual,
    TResult Function(_Edit value)? edit,
    TResult Function(_Close value)? close,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(this);
    }
    return orElse();
  }
}

abstract class _Delete implements ScheduleEvent {
  const factory _Delete({required final Schedule schedule}) = _$DeleteImpl;

  Schedule get schedule;
  @JsonKey(ignore: true)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
