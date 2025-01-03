// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_rent_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VehicleRentState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<LatLng> destination,
            VehicleRentFormHeader? vehicleRentFormHeader)
        initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<LatLng> destination,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<LatLng> destination,
            VehicleRentFormHeader? vehicleRentFormHeader)?
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
abstract class $VehicleRentStateCopyWith<$Res> {
  factory $VehicleRentStateCopyWith(
          VehicleRentState value, $Res Function(VehicleRentState) then) =
      _$VehicleRentStateCopyWithImpl<$Res, VehicleRentState>;
}

/// @nodoc
class _$VehicleRentStateCopyWithImpl<$Res, $Val extends VehicleRentState>
    implements $VehicleRentStateCopyWith<$Res> {
  _$VehicleRentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleRentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<LatLng> destination, VehicleRentFormHeader? vehicleRentFormHeader});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$VehicleRentStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleRentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? destination = null,
    Object? vehicleRentFormHeader = freezed,
  }) {
    return _then(_$InitialImpl(
      destination: null == destination
          ? _value._destination
          : destination // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
      vehicleRentFormHeader: freezed == vehicleRentFormHeader
          ? _value.vehicleRentFormHeader
          : vehicleRentFormHeader // ignore: cast_nullable_to_non_nullable
              as VehicleRentFormHeader?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required final List<LatLng> destination, this.vehicleRentFormHeader})
      : _destination = destination;

  final List<LatLng> _destination;
  @override
  List<LatLng> get destination {
    if (_destination is EqualUnmodifiableListView) return _destination;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_destination);
  }

  @override
  final VehicleRentFormHeader? vehicleRentFormHeader;

  @override
  String toString() {
    return 'VehicleRentState.initial(destination: $destination, vehicleRentFormHeader: $vehicleRentFormHeader)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality()
                .equals(other._destination, _destination) &&
            (identical(other.vehicleRentFormHeader, vehicleRentFormHeader) ||
                other.vehicleRentFormHeader == vehicleRentFormHeader));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_destination), vehicleRentFormHeader);

  /// Create a copy of VehicleRentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<LatLng> destination,
            VehicleRentFormHeader? vehicleRentFormHeader)
        initial,
    required TResult Function() loading,
    required TResult Function() success,
    required TResult Function(String error) error,
  }) {
    return initial(destination, vehicleRentFormHeader);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<LatLng> destination,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        initial,
    TResult? Function()? loading,
    TResult? Function()? success,
    TResult? Function(String error)? error,
  }) {
    return initial?.call(destination, vehicleRentFormHeader);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<LatLng> destination,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        initial,
    TResult Function()? loading,
    TResult Function()? success,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(destination, vehicleRentFormHeader);
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

abstract class _Initial implements VehicleRentState {
  const factory _Initial(
      {required final List<LatLng> destination,
      final VehicleRentFormHeader? vehicleRentFormHeader}) = _$InitialImpl;

  List<LatLng> get destination;
  VehicleRentFormHeader? get vehicleRentFormHeader;

  /// Create a copy of VehicleRentState
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
    extends _$VehicleRentStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleRentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'VehicleRentState.loading()';
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
    required TResult Function(List<LatLng> destination,
            VehicleRentFormHeader? vehicleRentFormHeader)
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
    TResult? Function(List<LatLng> destination,
            VehicleRentFormHeader? vehicleRentFormHeader)?
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
    TResult Function(List<LatLng> destination,
            VehicleRentFormHeader? vehicleRentFormHeader)?
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

abstract class _Loading implements VehicleRentState {
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
    extends _$VehicleRentStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleRentState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl();

  @override
  String toString() {
    return 'VehicleRentState.success()';
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
    required TResult Function(List<LatLng> destination,
            VehicleRentFormHeader? vehicleRentFormHeader)
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
    TResult? Function(List<LatLng> destination,
            VehicleRentFormHeader? vehicleRentFormHeader)?
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
    TResult Function(List<LatLng> destination,
            VehicleRentFormHeader? vehicleRentFormHeader)?
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

abstract class _Success implements VehicleRentState {
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
    extends _$VehicleRentStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleRentState
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
    return 'VehicleRentState.error(error: $error)';
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

  /// Create a copy of VehicleRentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<LatLng> destination,
            VehicleRentFormHeader? vehicleRentFormHeader)
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
    TResult? Function(List<LatLng> destination,
            VehicleRentFormHeader? vehicleRentFormHeader)?
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
    TResult Function(List<LatLng> destination,
            VehicleRentFormHeader? vehicleRentFormHeader)?
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

abstract class _Error implements VehicleRentState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of VehicleRentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VehicleRentEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        createHeaderToLocal,
    required TResult Function(LatLng destination) addDestinationToLocal,
    required TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)
        addAllDestinationToLocal,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        updateHeader,
    required TResult Function(VehicleRent vehicleRent) approveManager,
    required TResult Function(VehicleRent vehicleRent, String reason)
        rejectManager,
    required TResult Function(
            VehicleRent vehicleRent, int driverId, Vehicle vehicle)
        approveCs,
    required TResult Function(VehicleRent vehicleRent, String reason) rejectCs,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualStart,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualEnd,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)
        updateDestinations,
    required TResult Function(VehicleRentFormHeader header) fetchById,
    required TResult Function(LatLng destination) remove,
    required TResult Function(VehicleRent vehicleRent) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult? Function(LatLng destination)? addDestinationToLocal,
    TResult? Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        updateHeader,
    TResult? Function(VehicleRent vehicleRent)? approveManager,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult? Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult? Function(VehicleRentFormHeader header)? fetchById,
    TResult? Function(LatLng destination)? remove,
    TResult? Function(VehicleRent vehicleRent)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult Function(LatLng destination)? addDestinationToLocal,
    TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)? updateHeader,
    TResult Function(VehicleRent vehicleRent)? approveManager,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult Function(VehicleRentFormHeader header)? fetchById,
    TResult Function(LatLng destination)? remove,
    TResult Function(VehicleRent vehicleRent)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateHeaderToLocal value) createHeaderToLocal,
    required TResult Function(_AddDestinationToLocal value)
        addDestinationToLocal,
    required TResult Function(_AddAllDestinationToLocal value)
        addAllDestinationToLocal,
    required TResult Function(_UpdateHeader value) updateHeader,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveCs value) approveCs,
    required TResult Function(_RejectCs value) rejectCs,
    required TResult Function(_UpdateActualStart value) updateActualStart,
    required TResult Function(_UpdateActualEnd value) updateActualEnd,
    required TResult Function(_UpdateDestinations value) updateDestinations,
    required TResult Function(_FetchById value) fetchById,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Delete value) delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult? Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult? Function(_AddAllDestinationToLocal value)?
        addAllDestinationToLocal,
    TResult? Function(_UpdateHeader value)? updateHeader,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveCs value)? approveCs,
    TResult? Function(_RejectCs value)? rejectCs,
    TResult? Function(_UpdateActualStart value)? updateActualStart,
    TResult? Function(_UpdateActualEnd value)? updateActualEnd,
    TResult? Function(_UpdateDestinations value)? updateDestinations,
    TResult? Function(_FetchById value)? fetchById,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Delete value)? delete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult Function(_AddAllDestinationToLocal value)? addAllDestinationToLocal,
    TResult Function(_UpdateHeader value)? updateHeader,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveCs value)? approveCs,
    TResult Function(_RejectCs value)? rejectCs,
    TResult Function(_UpdateActualStart value)? updateActualStart,
    TResult Function(_UpdateActualEnd value)? updateActualEnd,
    TResult Function(_UpdateDestinations value)? updateDestinations,
    TResult Function(_FetchById value)? fetchById,
    TResult Function(_Remove value)? remove,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleRentEventCopyWith<$Res> {
  factory $VehicleRentEventCopyWith(
          VehicleRentEvent value, $Res Function(VehicleRentEvent) then) =
      _$VehicleRentEventCopyWithImpl<$Res, VehicleRentEvent>;
}

/// @nodoc
class _$VehicleRentEventCopyWithImpl<$Res, $Val extends VehicleRentEvent>
    implements $VehicleRentEventCopyWith<$Res> {
  _$VehicleRentEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$CreateImplCopyWith<$Res> {
  factory _$$CreateImplCopyWith(
          _$CreateImpl value, $Res Function(_$CreateImpl) then) =
      __$$CreateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CreateImplCopyWithImpl<$Res>
    extends _$VehicleRentEventCopyWithImpl<$Res, _$CreateImpl>
    implements _$$CreateImplCopyWith<$Res> {
  __$$CreateImplCopyWithImpl(
      _$CreateImpl _value, $Res Function(_$CreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$CreateImpl implements _Create {
  const _$CreateImpl();

  @override
  String toString() {
    return 'VehicleRentEvent.create()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CreateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        createHeaderToLocal,
    required TResult Function(LatLng destination) addDestinationToLocal,
    required TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)
        addAllDestinationToLocal,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        updateHeader,
    required TResult Function(VehicleRent vehicleRent) approveManager,
    required TResult Function(VehicleRent vehicleRent, String reason)
        rejectManager,
    required TResult Function(
            VehicleRent vehicleRent, int driverId, Vehicle vehicle)
        approveCs,
    required TResult Function(VehicleRent vehicleRent, String reason) rejectCs,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualStart,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualEnd,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)
        updateDestinations,
    required TResult Function(VehicleRentFormHeader header) fetchById,
    required TResult Function(LatLng destination) remove,
    required TResult Function(VehicleRent vehicleRent) delete,
  }) {
    return create();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult? Function(LatLng destination)? addDestinationToLocal,
    TResult? Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        updateHeader,
    TResult? Function(VehicleRent vehicleRent)? approveManager,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult? Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult? Function(VehicleRentFormHeader header)? fetchById,
    TResult? Function(LatLng destination)? remove,
    TResult? Function(VehicleRent vehicleRent)? delete,
  }) {
    return create?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult Function(LatLng destination)? addDestinationToLocal,
    TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)? updateHeader,
    TResult Function(VehicleRent vehicleRent)? approveManager,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult Function(VehicleRentFormHeader header)? fetchById,
    TResult Function(LatLng destination)? remove,
    TResult Function(VehicleRent vehicleRent)? delete,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateHeaderToLocal value) createHeaderToLocal,
    required TResult Function(_AddDestinationToLocal value)
        addDestinationToLocal,
    required TResult Function(_AddAllDestinationToLocal value)
        addAllDestinationToLocal,
    required TResult Function(_UpdateHeader value) updateHeader,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveCs value) approveCs,
    required TResult Function(_RejectCs value) rejectCs,
    required TResult Function(_UpdateActualStart value) updateActualStart,
    required TResult Function(_UpdateActualEnd value) updateActualEnd,
    required TResult Function(_UpdateDestinations value) updateDestinations,
    required TResult Function(_FetchById value) fetchById,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Delete value) delete,
  }) {
    return create(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult? Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult? Function(_AddAllDestinationToLocal value)?
        addAllDestinationToLocal,
    TResult? Function(_UpdateHeader value)? updateHeader,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveCs value)? approveCs,
    TResult? Function(_RejectCs value)? rejectCs,
    TResult? Function(_UpdateActualStart value)? updateActualStart,
    TResult? Function(_UpdateActualEnd value)? updateActualEnd,
    TResult? Function(_UpdateDestinations value)? updateDestinations,
    TResult? Function(_FetchById value)? fetchById,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Delete value)? delete,
  }) {
    return create?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult Function(_AddAllDestinationToLocal value)? addAllDestinationToLocal,
    TResult Function(_UpdateHeader value)? updateHeader,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveCs value)? approveCs,
    TResult Function(_RejectCs value)? rejectCs,
    TResult Function(_UpdateActualStart value)? updateActualStart,
    TResult Function(_UpdateActualEnd value)? updateActualEnd,
    TResult Function(_UpdateDestinations value)? updateDestinations,
    TResult Function(_FetchById value)? fetchById,
    TResult Function(_Remove value)? remove,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (create != null) {
      return create(this);
    }
    return orElse();
  }
}

abstract class _Create implements VehicleRentEvent {
  const factory _Create() = _$CreateImpl;
}

/// @nodoc
abstract class _$$CreateHeaderToLocalImplCopyWith<$Res> {
  factory _$$CreateHeaderToLocalImplCopyWith(_$CreateHeaderToLocalImpl value,
          $Res Function(_$CreateHeaderToLocalImpl) then) =
      __$$CreateHeaderToLocalImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VehicleRentFormHeader vehicleRentFormHeader});
}

/// @nodoc
class __$$CreateHeaderToLocalImplCopyWithImpl<$Res>
    extends _$VehicleRentEventCopyWithImpl<$Res, _$CreateHeaderToLocalImpl>
    implements _$$CreateHeaderToLocalImplCopyWith<$Res> {
  __$$CreateHeaderToLocalImplCopyWithImpl(_$CreateHeaderToLocalImpl _value,
      $Res Function(_$CreateHeaderToLocalImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleRentFormHeader = null,
  }) {
    return _then(_$CreateHeaderToLocalImpl(
      vehicleRentFormHeader: null == vehicleRentFormHeader
          ? _value.vehicleRentFormHeader
          : vehicleRentFormHeader // ignore: cast_nullable_to_non_nullable
              as VehicleRentFormHeader,
    ));
  }
}

/// @nodoc

class _$CreateHeaderToLocalImpl implements _CreateHeaderToLocal {
  const _$CreateHeaderToLocalImpl({required this.vehicleRentFormHeader});

  @override
  final VehicleRentFormHeader vehicleRentFormHeader;

  @override
  String toString() {
    return 'VehicleRentEvent.createHeaderToLocal(vehicleRentFormHeader: $vehicleRentFormHeader)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CreateHeaderToLocalImpl &&
            (identical(other.vehicleRentFormHeader, vehicleRentFormHeader) ||
                other.vehicleRentFormHeader == vehicleRentFormHeader));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vehicleRentFormHeader);

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CreateHeaderToLocalImplCopyWith<_$CreateHeaderToLocalImpl> get copyWith =>
      __$$CreateHeaderToLocalImplCopyWithImpl<_$CreateHeaderToLocalImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        createHeaderToLocal,
    required TResult Function(LatLng destination) addDestinationToLocal,
    required TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)
        addAllDestinationToLocal,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        updateHeader,
    required TResult Function(VehicleRent vehicleRent) approveManager,
    required TResult Function(VehicleRent vehicleRent, String reason)
        rejectManager,
    required TResult Function(
            VehicleRent vehicleRent, int driverId, Vehicle vehicle)
        approveCs,
    required TResult Function(VehicleRent vehicleRent, String reason) rejectCs,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualStart,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualEnd,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)
        updateDestinations,
    required TResult Function(VehicleRentFormHeader header) fetchById,
    required TResult Function(LatLng destination) remove,
    required TResult Function(VehicleRent vehicleRent) delete,
  }) {
    return createHeaderToLocal(vehicleRentFormHeader);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult? Function(LatLng destination)? addDestinationToLocal,
    TResult? Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        updateHeader,
    TResult? Function(VehicleRent vehicleRent)? approveManager,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult? Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult? Function(VehicleRentFormHeader header)? fetchById,
    TResult? Function(LatLng destination)? remove,
    TResult? Function(VehicleRent vehicleRent)? delete,
  }) {
    return createHeaderToLocal?.call(vehicleRentFormHeader);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult Function(LatLng destination)? addDestinationToLocal,
    TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)? updateHeader,
    TResult Function(VehicleRent vehicleRent)? approveManager,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult Function(VehicleRentFormHeader header)? fetchById,
    TResult Function(LatLng destination)? remove,
    TResult Function(VehicleRent vehicleRent)? delete,
    required TResult orElse(),
  }) {
    if (createHeaderToLocal != null) {
      return createHeaderToLocal(vehicleRentFormHeader);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateHeaderToLocal value) createHeaderToLocal,
    required TResult Function(_AddDestinationToLocal value)
        addDestinationToLocal,
    required TResult Function(_AddAllDestinationToLocal value)
        addAllDestinationToLocal,
    required TResult Function(_UpdateHeader value) updateHeader,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveCs value) approveCs,
    required TResult Function(_RejectCs value) rejectCs,
    required TResult Function(_UpdateActualStart value) updateActualStart,
    required TResult Function(_UpdateActualEnd value) updateActualEnd,
    required TResult Function(_UpdateDestinations value) updateDestinations,
    required TResult Function(_FetchById value) fetchById,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Delete value) delete,
  }) {
    return createHeaderToLocal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult? Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult? Function(_AddAllDestinationToLocal value)?
        addAllDestinationToLocal,
    TResult? Function(_UpdateHeader value)? updateHeader,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveCs value)? approveCs,
    TResult? Function(_RejectCs value)? rejectCs,
    TResult? Function(_UpdateActualStart value)? updateActualStart,
    TResult? Function(_UpdateActualEnd value)? updateActualEnd,
    TResult? Function(_UpdateDestinations value)? updateDestinations,
    TResult? Function(_FetchById value)? fetchById,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Delete value)? delete,
  }) {
    return createHeaderToLocal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult Function(_AddAllDestinationToLocal value)? addAllDestinationToLocal,
    TResult Function(_UpdateHeader value)? updateHeader,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveCs value)? approveCs,
    TResult Function(_RejectCs value)? rejectCs,
    TResult Function(_UpdateActualStart value)? updateActualStart,
    TResult Function(_UpdateActualEnd value)? updateActualEnd,
    TResult Function(_UpdateDestinations value)? updateDestinations,
    TResult Function(_FetchById value)? fetchById,
    TResult Function(_Remove value)? remove,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (createHeaderToLocal != null) {
      return createHeaderToLocal(this);
    }
    return orElse();
  }
}

abstract class _CreateHeaderToLocal implements VehicleRentEvent {
  const factory _CreateHeaderToLocal(
          {required final VehicleRentFormHeader vehicleRentFormHeader}) =
      _$CreateHeaderToLocalImpl;

  VehicleRentFormHeader get vehicleRentFormHeader;

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CreateHeaderToLocalImplCopyWith<_$CreateHeaderToLocalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddDestinationToLocalImplCopyWith<$Res> {
  factory _$$AddDestinationToLocalImplCopyWith(
          _$AddDestinationToLocalImpl value,
          $Res Function(_$AddDestinationToLocalImpl) then) =
      __$$AddDestinationToLocalImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LatLng destination});
}

/// @nodoc
class __$$AddDestinationToLocalImplCopyWithImpl<$Res>
    extends _$VehicleRentEventCopyWithImpl<$Res, _$AddDestinationToLocalImpl>
    implements _$$AddDestinationToLocalImplCopyWith<$Res> {
  __$$AddDestinationToLocalImplCopyWithImpl(_$AddDestinationToLocalImpl _value,
      $Res Function(_$AddDestinationToLocalImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? destination = null,
  }) {
    return _then(_$AddDestinationToLocalImpl(
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc

class _$AddDestinationToLocalImpl implements _AddDestinationToLocal {
  const _$AddDestinationToLocalImpl({required this.destination});

  @override
  final LatLng destination;

  @override
  String toString() {
    return 'VehicleRentEvent.addDestinationToLocal(destination: $destination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddDestinationToLocalImpl &&
            (identical(other.destination, destination) ||
                other.destination == destination));
  }

  @override
  int get hashCode => Object.hash(runtimeType, destination);

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddDestinationToLocalImplCopyWith<_$AddDestinationToLocalImpl>
      get copyWith => __$$AddDestinationToLocalImplCopyWithImpl<
          _$AddDestinationToLocalImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        createHeaderToLocal,
    required TResult Function(LatLng destination) addDestinationToLocal,
    required TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)
        addAllDestinationToLocal,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        updateHeader,
    required TResult Function(VehicleRent vehicleRent) approveManager,
    required TResult Function(VehicleRent vehicleRent, String reason)
        rejectManager,
    required TResult Function(
            VehicleRent vehicleRent, int driverId, Vehicle vehicle)
        approveCs,
    required TResult Function(VehicleRent vehicleRent, String reason) rejectCs,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualStart,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualEnd,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)
        updateDestinations,
    required TResult Function(VehicleRentFormHeader header) fetchById,
    required TResult Function(LatLng destination) remove,
    required TResult Function(VehicleRent vehicleRent) delete,
  }) {
    return addDestinationToLocal(destination);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult? Function(LatLng destination)? addDestinationToLocal,
    TResult? Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        updateHeader,
    TResult? Function(VehicleRent vehicleRent)? approveManager,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult? Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult? Function(VehicleRentFormHeader header)? fetchById,
    TResult? Function(LatLng destination)? remove,
    TResult? Function(VehicleRent vehicleRent)? delete,
  }) {
    return addDestinationToLocal?.call(destination);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult Function(LatLng destination)? addDestinationToLocal,
    TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)? updateHeader,
    TResult Function(VehicleRent vehicleRent)? approveManager,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult Function(VehicleRentFormHeader header)? fetchById,
    TResult Function(LatLng destination)? remove,
    TResult Function(VehicleRent vehicleRent)? delete,
    required TResult orElse(),
  }) {
    if (addDestinationToLocal != null) {
      return addDestinationToLocal(destination);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateHeaderToLocal value) createHeaderToLocal,
    required TResult Function(_AddDestinationToLocal value)
        addDestinationToLocal,
    required TResult Function(_AddAllDestinationToLocal value)
        addAllDestinationToLocal,
    required TResult Function(_UpdateHeader value) updateHeader,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveCs value) approveCs,
    required TResult Function(_RejectCs value) rejectCs,
    required TResult Function(_UpdateActualStart value) updateActualStart,
    required TResult Function(_UpdateActualEnd value) updateActualEnd,
    required TResult Function(_UpdateDestinations value) updateDestinations,
    required TResult Function(_FetchById value) fetchById,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Delete value) delete,
  }) {
    return addDestinationToLocal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult? Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult? Function(_AddAllDestinationToLocal value)?
        addAllDestinationToLocal,
    TResult? Function(_UpdateHeader value)? updateHeader,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveCs value)? approveCs,
    TResult? Function(_RejectCs value)? rejectCs,
    TResult? Function(_UpdateActualStart value)? updateActualStart,
    TResult? Function(_UpdateActualEnd value)? updateActualEnd,
    TResult? Function(_UpdateDestinations value)? updateDestinations,
    TResult? Function(_FetchById value)? fetchById,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Delete value)? delete,
  }) {
    return addDestinationToLocal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult Function(_AddAllDestinationToLocal value)? addAllDestinationToLocal,
    TResult Function(_UpdateHeader value)? updateHeader,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveCs value)? approveCs,
    TResult Function(_RejectCs value)? rejectCs,
    TResult Function(_UpdateActualStart value)? updateActualStart,
    TResult Function(_UpdateActualEnd value)? updateActualEnd,
    TResult Function(_UpdateDestinations value)? updateDestinations,
    TResult Function(_FetchById value)? fetchById,
    TResult Function(_Remove value)? remove,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (addDestinationToLocal != null) {
      return addDestinationToLocal(this);
    }
    return orElse();
  }
}

abstract class _AddDestinationToLocal implements VehicleRentEvent {
  const factory _AddDestinationToLocal({required final LatLng destination}) =
      _$AddDestinationToLocalImpl;

  LatLng get destination;

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddDestinationToLocalImplCopyWith<_$AddDestinationToLocalImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddAllDestinationToLocalImplCopyWith<$Res> {
  factory _$$AddAllDestinationToLocalImplCopyWith(
          _$AddAllDestinationToLocalImpl value,
          $Res Function(_$AddAllDestinationToLocalImpl) then) =
      __$$AddAllDestinationToLocalImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {List<LatLng> destinations,
      VehicleRentFormHeader? vehicleRentFormHeader});
}

/// @nodoc
class __$$AddAllDestinationToLocalImplCopyWithImpl<$Res>
    extends _$VehicleRentEventCopyWithImpl<$Res, _$AddAllDestinationToLocalImpl>
    implements _$$AddAllDestinationToLocalImplCopyWith<$Res> {
  __$$AddAllDestinationToLocalImplCopyWithImpl(
      _$AddAllDestinationToLocalImpl _value,
      $Res Function(_$AddAllDestinationToLocalImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? destinations = null,
    Object? vehicleRentFormHeader = freezed,
  }) {
    return _then(_$AddAllDestinationToLocalImpl(
      destinations: null == destinations
          ? _value._destinations
          : destinations // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
      vehicleRentFormHeader: freezed == vehicleRentFormHeader
          ? _value.vehicleRentFormHeader
          : vehicleRentFormHeader // ignore: cast_nullable_to_non_nullable
              as VehicleRentFormHeader?,
    ));
  }
}

/// @nodoc

class _$AddAllDestinationToLocalImpl implements _AddAllDestinationToLocal {
  const _$AddAllDestinationToLocalImpl(
      {required final List<LatLng> destinations, this.vehicleRentFormHeader})
      : _destinations = destinations;

  final List<LatLng> _destinations;
  @override
  List<LatLng> get destinations {
    if (_destinations is EqualUnmodifiableListView) return _destinations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_destinations);
  }

  @override
  final VehicleRentFormHeader? vehicleRentFormHeader;

  @override
  String toString() {
    return 'VehicleRentEvent.addAllDestinationToLocal(destinations: $destinations, vehicleRentFormHeader: $vehicleRentFormHeader)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddAllDestinationToLocalImpl &&
            const DeepCollectionEquality()
                .equals(other._destinations, _destinations) &&
            (identical(other.vehicleRentFormHeader, vehicleRentFormHeader) ||
                other.vehicleRentFormHeader == vehicleRentFormHeader));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_destinations),
      vehicleRentFormHeader);

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddAllDestinationToLocalImplCopyWith<_$AddAllDestinationToLocalImpl>
      get copyWith => __$$AddAllDestinationToLocalImplCopyWithImpl<
          _$AddAllDestinationToLocalImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        createHeaderToLocal,
    required TResult Function(LatLng destination) addDestinationToLocal,
    required TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)
        addAllDestinationToLocal,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        updateHeader,
    required TResult Function(VehicleRent vehicleRent) approveManager,
    required TResult Function(VehicleRent vehicleRent, String reason)
        rejectManager,
    required TResult Function(
            VehicleRent vehicleRent, int driverId, Vehicle vehicle)
        approveCs,
    required TResult Function(VehicleRent vehicleRent, String reason) rejectCs,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualStart,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualEnd,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)
        updateDestinations,
    required TResult Function(VehicleRentFormHeader header) fetchById,
    required TResult Function(LatLng destination) remove,
    required TResult Function(VehicleRent vehicleRent) delete,
  }) {
    return addAllDestinationToLocal(destinations, vehicleRentFormHeader);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult? Function(LatLng destination)? addDestinationToLocal,
    TResult? Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        updateHeader,
    TResult? Function(VehicleRent vehicleRent)? approveManager,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult? Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult? Function(VehicleRentFormHeader header)? fetchById,
    TResult? Function(LatLng destination)? remove,
    TResult? Function(VehicleRent vehicleRent)? delete,
  }) {
    return addAllDestinationToLocal?.call(destinations, vehicleRentFormHeader);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult Function(LatLng destination)? addDestinationToLocal,
    TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)? updateHeader,
    TResult Function(VehicleRent vehicleRent)? approveManager,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult Function(VehicleRentFormHeader header)? fetchById,
    TResult Function(LatLng destination)? remove,
    TResult Function(VehicleRent vehicleRent)? delete,
    required TResult orElse(),
  }) {
    if (addAllDestinationToLocal != null) {
      return addAllDestinationToLocal(destinations, vehicleRentFormHeader);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateHeaderToLocal value) createHeaderToLocal,
    required TResult Function(_AddDestinationToLocal value)
        addDestinationToLocal,
    required TResult Function(_AddAllDestinationToLocal value)
        addAllDestinationToLocal,
    required TResult Function(_UpdateHeader value) updateHeader,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveCs value) approveCs,
    required TResult Function(_RejectCs value) rejectCs,
    required TResult Function(_UpdateActualStart value) updateActualStart,
    required TResult Function(_UpdateActualEnd value) updateActualEnd,
    required TResult Function(_UpdateDestinations value) updateDestinations,
    required TResult Function(_FetchById value) fetchById,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Delete value) delete,
  }) {
    return addAllDestinationToLocal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult? Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult? Function(_AddAllDestinationToLocal value)?
        addAllDestinationToLocal,
    TResult? Function(_UpdateHeader value)? updateHeader,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveCs value)? approveCs,
    TResult? Function(_RejectCs value)? rejectCs,
    TResult? Function(_UpdateActualStart value)? updateActualStart,
    TResult? Function(_UpdateActualEnd value)? updateActualEnd,
    TResult? Function(_UpdateDestinations value)? updateDestinations,
    TResult? Function(_FetchById value)? fetchById,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Delete value)? delete,
  }) {
    return addAllDestinationToLocal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult Function(_AddAllDestinationToLocal value)? addAllDestinationToLocal,
    TResult Function(_UpdateHeader value)? updateHeader,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveCs value)? approveCs,
    TResult Function(_RejectCs value)? rejectCs,
    TResult Function(_UpdateActualStart value)? updateActualStart,
    TResult Function(_UpdateActualEnd value)? updateActualEnd,
    TResult Function(_UpdateDestinations value)? updateDestinations,
    TResult Function(_FetchById value)? fetchById,
    TResult Function(_Remove value)? remove,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (addAllDestinationToLocal != null) {
      return addAllDestinationToLocal(this);
    }
    return orElse();
  }
}

abstract class _AddAllDestinationToLocal implements VehicleRentEvent {
  const factory _AddAllDestinationToLocal(
          {required final List<LatLng> destinations,
          final VehicleRentFormHeader? vehicleRentFormHeader}) =
      _$AddAllDestinationToLocalImpl;

  List<LatLng> get destinations;
  VehicleRentFormHeader? get vehicleRentFormHeader;

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddAllDestinationToLocalImplCopyWith<_$AddAllDestinationToLocalImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateHeaderImplCopyWith<$Res> {
  factory _$$UpdateHeaderImplCopyWith(
          _$UpdateHeaderImpl value, $Res Function(_$UpdateHeaderImpl) then) =
      __$$UpdateHeaderImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VehicleRentFormHeader vehicleRentFormHeader});
}

/// @nodoc
class __$$UpdateHeaderImplCopyWithImpl<$Res>
    extends _$VehicleRentEventCopyWithImpl<$Res, _$UpdateHeaderImpl>
    implements _$$UpdateHeaderImplCopyWith<$Res> {
  __$$UpdateHeaderImplCopyWithImpl(
      _$UpdateHeaderImpl _value, $Res Function(_$UpdateHeaderImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleRentFormHeader = null,
  }) {
    return _then(_$UpdateHeaderImpl(
      vehicleRentFormHeader: null == vehicleRentFormHeader
          ? _value.vehicleRentFormHeader
          : vehicleRentFormHeader // ignore: cast_nullable_to_non_nullable
              as VehicleRentFormHeader,
    ));
  }
}

/// @nodoc

class _$UpdateHeaderImpl implements _UpdateHeader {
  const _$UpdateHeaderImpl({required this.vehicleRentFormHeader});

  @override
  final VehicleRentFormHeader vehicleRentFormHeader;

  @override
  String toString() {
    return 'VehicleRentEvent.updateHeader(vehicleRentFormHeader: $vehicleRentFormHeader)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateHeaderImpl &&
            (identical(other.vehicleRentFormHeader, vehicleRentFormHeader) ||
                other.vehicleRentFormHeader == vehicleRentFormHeader));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vehicleRentFormHeader);

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateHeaderImplCopyWith<_$UpdateHeaderImpl> get copyWith =>
      __$$UpdateHeaderImplCopyWithImpl<_$UpdateHeaderImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        createHeaderToLocal,
    required TResult Function(LatLng destination) addDestinationToLocal,
    required TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)
        addAllDestinationToLocal,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        updateHeader,
    required TResult Function(VehicleRent vehicleRent) approveManager,
    required TResult Function(VehicleRent vehicleRent, String reason)
        rejectManager,
    required TResult Function(
            VehicleRent vehicleRent, int driverId, Vehicle vehicle)
        approveCs,
    required TResult Function(VehicleRent vehicleRent, String reason) rejectCs,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualStart,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualEnd,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)
        updateDestinations,
    required TResult Function(VehicleRentFormHeader header) fetchById,
    required TResult Function(LatLng destination) remove,
    required TResult Function(VehicleRent vehicleRent) delete,
  }) {
    return updateHeader(vehicleRentFormHeader);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult? Function(LatLng destination)? addDestinationToLocal,
    TResult? Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        updateHeader,
    TResult? Function(VehicleRent vehicleRent)? approveManager,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult? Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult? Function(VehicleRentFormHeader header)? fetchById,
    TResult? Function(LatLng destination)? remove,
    TResult? Function(VehicleRent vehicleRent)? delete,
  }) {
    return updateHeader?.call(vehicleRentFormHeader);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult Function(LatLng destination)? addDestinationToLocal,
    TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)? updateHeader,
    TResult Function(VehicleRent vehicleRent)? approveManager,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult Function(VehicleRentFormHeader header)? fetchById,
    TResult Function(LatLng destination)? remove,
    TResult Function(VehicleRent vehicleRent)? delete,
    required TResult orElse(),
  }) {
    if (updateHeader != null) {
      return updateHeader(vehicleRentFormHeader);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateHeaderToLocal value) createHeaderToLocal,
    required TResult Function(_AddDestinationToLocal value)
        addDestinationToLocal,
    required TResult Function(_AddAllDestinationToLocal value)
        addAllDestinationToLocal,
    required TResult Function(_UpdateHeader value) updateHeader,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveCs value) approveCs,
    required TResult Function(_RejectCs value) rejectCs,
    required TResult Function(_UpdateActualStart value) updateActualStart,
    required TResult Function(_UpdateActualEnd value) updateActualEnd,
    required TResult Function(_UpdateDestinations value) updateDestinations,
    required TResult Function(_FetchById value) fetchById,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Delete value) delete,
  }) {
    return updateHeader(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult? Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult? Function(_AddAllDestinationToLocal value)?
        addAllDestinationToLocal,
    TResult? Function(_UpdateHeader value)? updateHeader,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveCs value)? approveCs,
    TResult? Function(_RejectCs value)? rejectCs,
    TResult? Function(_UpdateActualStart value)? updateActualStart,
    TResult? Function(_UpdateActualEnd value)? updateActualEnd,
    TResult? Function(_UpdateDestinations value)? updateDestinations,
    TResult? Function(_FetchById value)? fetchById,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Delete value)? delete,
  }) {
    return updateHeader?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult Function(_AddAllDestinationToLocal value)? addAllDestinationToLocal,
    TResult Function(_UpdateHeader value)? updateHeader,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveCs value)? approveCs,
    TResult Function(_RejectCs value)? rejectCs,
    TResult Function(_UpdateActualStart value)? updateActualStart,
    TResult Function(_UpdateActualEnd value)? updateActualEnd,
    TResult Function(_UpdateDestinations value)? updateDestinations,
    TResult Function(_FetchById value)? fetchById,
    TResult Function(_Remove value)? remove,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (updateHeader != null) {
      return updateHeader(this);
    }
    return orElse();
  }
}

abstract class _UpdateHeader implements VehicleRentEvent {
  const factory _UpdateHeader(
          {required final VehicleRentFormHeader vehicleRentFormHeader}) =
      _$UpdateHeaderImpl;

  VehicleRentFormHeader get vehicleRentFormHeader;

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateHeaderImplCopyWith<_$UpdateHeaderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApproveManagerImplCopyWith<$Res> {
  factory _$$ApproveManagerImplCopyWith(_$ApproveManagerImpl value,
          $Res Function(_$ApproveManagerImpl) then) =
      __$$ApproveManagerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VehicleRent vehicleRent});

  $VehicleRentCopyWith<$Res> get vehicleRent;
}

/// @nodoc
class __$$ApproveManagerImplCopyWithImpl<$Res>
    extends _$VehicleRentEventCopyWithImpl<$Res, _$ApproveManagerImpl>
    implements _$$ApproveManagerImplCopyWith<$Res> {
  __$$ApproveManagerImplCopyWithImpl(
      _$ApproveManagerImpl _value, $Res Function(_$ApproveManagerImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleRent = null,
  }) {
    return _then(_$ApproveManagerImpl(
      vehicleRent: null == vehicleRent
          ? _value.vehicleRent
          : vehicleRent // ignore: cast_nullable_to_non_nullable
              as VehicleRent,
    ));
  }

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VehicleRentCopyWith<$Res> get vehicleRent {
    return $VehicleRentCopyWith<$Res>(_value.vehicleRent, (value) {
      return _then(_value.copyWith(vehicleRent: value));
    });
  }
}

/// @nodoc

class _$ApproveManagerImpl implements _ApproveManager {
  const _$ApproveManagerImpl({required this.vehicleRent});

  @override
  final VehicleRent vehicleRent;

  @override
  String toString() {
    return 'VehicleRentEvent.approveManager(vehicleRent: $vehicleRent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveManagerImpl &&
            (identical(other.vehicleRent, vehicleRent) ||
                other.vehicleRent == vehicleRent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vehicleRent);

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveManagerImplCopyWith<_$ApproveManagerImpl> get copyWith =>
      __$$ApproveManagerImplCopyWithImpl<_$ApproveManagerImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        createHeaderToLocal,
    required TResult Function(LatLng destination) addDestinationToLocal,
    required TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)
        addAllDestinationToLocal,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        updateHeader,
    required TResult Function(VehicleRent vehicleRent) approveManager,
    required TResult Function(VehicleRent vehicleRent, String reason)
        rejectManager,
    required TResult Function(
            VehicleRent vehicleRent, int driverId, Vehicle vehicle)
        approveCs,
    required TResult Function(VehicleRent vehicleRent, String reason) rejectCs,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualStart,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualEnd,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)
        updateDestinations,
    required TResult Function(VehicleRentFormHeader header) fetchById,
    required TResult Function(LatLng destination) remove,
    required TResult Function(VehicleRent vehicleRent) delete,
  }) {
    return approveManager(vehicleRent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult? Function(LatLng destination)? addDestinationToLocal,
    TResult? Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        updateHeader,
    TResult? Function(VehicleRent vehicleRent)? approveManager,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult? Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult? Function(VehicleRentFormHeader header)? fetchById,
    TResult? Function(LatLng destination)? remove,
    TResult? Function(VehicleRent vehicleRent)? delete,
  }) {
    return approveManager?.call(vehicleRent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult Function(LatLng destination)? addDestinationToLocal,
    TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)? updateHeader,
    TResult Function(VehicleRent vehicleRent)? approveManager,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult Function(VehicleRentFormHeader header)? fetchById,
    TResult Function(LatLng destination)? remove,
    TResult Function(VehicleRent vehicleRent)? delete,
    required TResult orElse(),
  }) {
    if (approveManager != null) {
      return approveManager(vehicleRent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateHeaderToLocal value) createHeaderToLocal,
    required TResult Function(_AddDestinationToLocal value)
        addDestinationToLocal,
    required TResult Function(_AddAllDestinationToLocal value)
        addAllDestinationToLocal,
    required TResult Function(_UpdateHeader value) updateHeader,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveCs value) approveCs,
    required TResult Function(_RejectCs value) rejectCs,
    required TResult Function(_UpdateActualStart value) updateActualStart,
    required TResult Function(_UpdateActualEnd value) updateActualEnd,
    required TResult Function(_UpdateDestinations value) updateDestinations,
    required TResult Function(_FetchById value) fetchById,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Delete value) delete,
  }) {
    return approveManager(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult? Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult? Function(_AddAllDestinationToLocal value)?
        addAllDestinationToLocal,
    TResult? Function(_UpdateHeader value)? updateHeader,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveCs value)? approveCs,
    TResult? Function(_RejectCs value)? rejectCs,
    TResult? Function(_UpdateActualStart value)? updateActualStart,
    TResult? Function(_UpdateActualEnd value)? updateActualEnd,
    TResult? Function(_UpdateDestinations value)? updateDestinations,
    TResult? Function(_FetchById value)? fetchById,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Delete value)? delete,
  }) {
    return approveManager?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult Function(_AddAllDestinationToLocal value)? addAllDestinationToLocal,
    TResult Function(_UpdateHeader value)? updateHeader,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveCs value)? approveCs,
    TResult Function(_RejectCs value)? rejectCs,
    TResult Function(_UpdateActualStart value)? updateActualStart,
    TResult Function(_UpdateActualEnd value)? updateActualEnd,
    TResult Function(_UpdateDestinations value)? updateDestinations,
    TResult Function(_FetchById value)? fetchById,
    TResult Function(_Remove value)? remove,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (approveManager != null) {
      return approveManager(this);
    }
    return orElse();
  }
}

abstract class _ApproveManager implements VehicleRentEvent {
  const factory _ApproveManager({required final VehicleRent vehicleRent}) =
      _$ApproveManagerImpl;

  VehicleRent get vehicleRent;

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApproveManagerImplCopyWith<_$ApproveManagerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RejectManagerImplCopyWith<$Res> {
  factory _$$RejectManagerImplCopyWith(
          _$RejectManagerImpl value, $Res Function(_$RejectManagerImpl) then) =
      __$$RejectManagerImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VehicleRent vehicleRent, String reason});

  $VehicleRentCopyWith<$Res> get vehicleRent;
}

/// @nodoc
class __$$RejectManagerImplCopyWithImpl<$Res>
    extends _$VehicleRentEventCopyWithImpl<$Res, _$RejectManagerImpl>
    implements _$$RejectManagerImplCopyWith<$Res> {
  __$$RejectManagerImplCopyWithImpl(
      _$RejectManagerImpl _value, $Res Function(_$RejectManagerImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleRent = null,
    Object? reason = null,
  }) {
    return _then(_$RejectManagerImpl(
      vehicleRent: null == vehicleRent
          ? _value.vehicleRent
          : vehicleRent // ignore: cast_nullable_to_non_nullable
              as VehicleRent,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VehicleRentCopyWith<$Res> get vehicleRent {
    return $VehicleRentCopyWith<$Res>(_value.vehicleRent, (value) {
      return _then(_value.copyWith(vehicleRent: value));
    });
  }
}

/// @nodoc

class _$RejectManagerImpl implements _RejectManager {
  const _$RejectManagerImpl({required this.vehicleRent, required this.reason});

  @override
  final VehicleRent vehicleRent;
  @override
  final String reason;

  @override
  String toString() {
    return 'VehicleRentEvent.rejectManager(vehicleRent: $vehicleRent, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectManagerImpl &&
            (identical(other.vehicleRent, vehicleRent) ||
                other.vehicleRent == vehicleRent) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vehicleRent, reason);

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectManagerImplCopyWith<_$RejectManagerImpl> get copyWith =>
      __$$RejectManagerImplCopyWithImpl<_$RejectManagerImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        createHeaderToLocal,
    required TResult Function(LatLng destination) addDestinationToLocal,
    required TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)
        addAllDestinationToLocal,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        updateHeader,
    required TResult Function(VehicleRent vehicleRent) approveManager,
    required TResult Function(VehicleRent vehicleRent, String reason)
        rejectManager,
    required TResult Function(
            VehicleRent vehicleRent, int driverId, Vehicle vehicle)
        approveCs,
    required TResult Function(VehicleRent vehicleRent, String reason) rejectCs,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualStart,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualEnd,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)
        updateDestinations,
    required TResult Function(VehicleRentFormHeader header) fetchById,
    required TResult Function(LatLng destination) remove,
    required TResult Function(VehicleRent vehicleRent) delete,
  }) {
    return rejectManager(vehicleRent, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult? Function(LatLng destination)? addDestinationToLocal,
    TResult? Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        updateHeader,
    TResult? Function(VehicleRent vehicleRent)? approveManager,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult? Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult? Function(VehicleRentFormHeader header)? fetchById,
    TResult? Function(LatLng destination)? remove,
    TResult? Function(VehicleRent vehicleRent)? delete,
  }) {
    return rejectManager?.call(vehicleRent, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult Function(LatLng destination)? addDestinationToLocal,
    TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)? updateHeader,
    TResult Function(VehicleRent vehicleRent)? approveManager,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult Function(VehicleRentFormHeader header)? fetchById,
    TResult Function(LatLng destination)? remove,
    TResult Function(VehicleRent vehicleRent)? delete,
    required TResult orElse(),
  }) {
    if (rejectManager != null) {
      return rejectManager(vehicleRent, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateHeaderToLocal value) createHeaderToLocal,
    required TResult Function(_AddDestinationToLocal value)
        addDestinationToLocal,
    required TResult Function(_AddAllDestinationToLocal value)
        addAllDestinationToLocal,
    required TResult Function(_UpdateHeader value) updateHeader,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveCs value) approveCs,
    required TResult Function(_RejectCs value) rejectCs,
    required TResult Function(_UpdateActualStart value) updateActualStart,
    required TResult Function(_UpdateActualEnd value) updateActualEnd,
    required TResult Function(_UpdateDestinations value) updateDestinations,
    required TResult Function(_FetchById value) fetchById,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Delete value) delete,
  }) {
    return rejectManager(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult? Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult? Function(_AddAllDestinationToLocal value)?
        addAllDestinationToLocal,
    TResult? Function(_UpdateHeader value)? updateHeader,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveCs value)? approveCs,
    TResult? Function(_RejectCs value)? rejectCs,
    TResult? Function(_UpdateActualStart value)? updateActualStart,
    TResult? Function(_UpdateActualEnd value)? updateActualEnd,
    TResult? Function(_UpdateDestinations value)? updateDestinations,
    TResult? Function(_FetchById value)? fetchById,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Delete value)? delete,
  }) {
    return rejectManager?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult Function(_AddAllDestinationToLocal value)? addAllDestinationToLocal,
    TResult Function(_UpdateHeader value)? updateHeader,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveCs value)? approveCs,
    TResult Function(_RejectCs value)? rejectCs,
    TResult Function(_UpdateActualStart value)? updateActualStart,
    TResult Function(_UpdateActualEnd value)? updateActualEnd,
    TResult Function(_UpdateDestinations value)? updateDestinations,
    TResult Function(_FetchById value)? fetchById,
    TResult Function(_Remove value)? remove,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (rejectManager != null) {
      return rejectManager(this);
    }
    return orElse();
  }
}

abstract class _RejectManager implements VehicleRentEvent {
  const factory _RejectManager(
      {required final VehicleRent vehicleRent,
      required final String reason}) = _$RejectManagerImpl;

  VehicleRent get vehicleRent;
  String get reason;

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RejectManagerImplCopyWith<_$RejectManagerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApproveCsImplCopyWith<$Res> {
  factory _$$ApproveCsImplCopyWith(
          _$ApproveCsImpl value, $Res Function(_$ApproveCsImpl) then) =
      __$$ApproveCsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VehicleRent vehicleRent, int driverId, Vehicle vehicle});

  $VehicleRentCopyWith<$Res> get vehicleRent;
  $VehicleCopyWith<$Res> get vehicle;
}

/// @nodoc
class __$$ApproveCsImplCopyWithImpl<$Res>
    extends _$VehicleRentEventCopyWithImpl<$Res, _$ApproveCsImpl>
    implements _$$ApproveCsImplCopyWith<$Res> {
  __$$ApproveCsImplCopyWithImpl(
      _$ApproveCsImpl _value, $Res Function(_$ApproveCsImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleRent = null,
    Object? driverId = null,
    Object? vehicle = null,
  }) {
    return _then(_$ApproveCsImpl(
      vehicleRent: null == vehicleRent
          ? _value.vehicleRent
          : vehicleRent // ignore: cast_nullable_to_non_nullable
              as VehicleRent,
      driverId: null == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as int,
      vehicle: null == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as Vehicle,
    ));
  }

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VehicleRentCopyWith<$Res> get vehicleRent {
    return $VehicleRentCopyWith<$Res>(_value.vehicleRent, (value) {
      return _then(_value.copyWith(vehicleRent: value));
    });
  }

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VehicleCopyWith<$Res> get vehicle {
    return $VehicleCopyWith<$Res>(_value.vehicle, (value) {
      return _then(_value.copyWith(vehicle: value));
    });
  }
}

/// @nodoc

class _$ApproveCsImpl implements _ApproveCs {
  const _$ApproveCsImpl(
      {required this.vehicleRent,
      required this.driverId,
      required this.vehicle});

  @override
  final VehicleRent vehicleRent;
  @override
  final int driverId;
  @override
  final Vehicle vehicle;

  @override
  String toString() {
    return 'VehicleRentEvent.approveCs(vehicleRent: $vehicleRent, driverId: $driverId, vehicle: $vehicle)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApproveCsImpl &&
            (identical(other.vehicleRent, vehicleRent) ||
                other.vehicleRent == vehicleRent) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.vehicle, vehicle) || other.vehicle == vehicle));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vehicleRent, driverId, vehicle);

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApproveCsImplCopyWith<_$ApproveCsImpl> get copyWith =>
      __$$ApproveCsImplCopyWithImpl<_$ApproveCsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        createHeaderToLocal,
    required TResult Function(LatLng destination) addDestinationToLocal,
    required TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)
        addAllDestinationToLocal,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        updateHeader,
    required TResult Function(VehicleRent vehicleRent) approveManager,
    required TResult Function(VehicleRent vehicleRent, String reason)
        rejectManager,
    required TResult Function(
            VehicleRent vehicleRent, int driverId, Vehicle vehicle)
        approveCs,
    required TResult Function(VehicleRent vehicleRent, String reason) rejectCs,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualStart,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualEnd,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)
        updateDestinations,
    required TResult Function(VehicleRentFormHeader header) fetchById,
    required TResult Function(LatLng destination) remove,
    required TResult Function(VehicleRent vehicleRent) delete,
  }) {
    return approveCs(vehicleRent, driverId, vehicle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult? Function(LatLng destination)? addDestinationToLocal,
    TResult? Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        updateHeader,
    TResult? Function(VehicleRent vehicleRent)? approveManager,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult? Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult? Function(VehicleRentFormHeader header)? fetchById,
    TResult? Function(LatLng destination)? remove,
    TResult? Function(VehicleRent vehicleRent)? delete,
  }) {
    return approveCs?.call(vehicleRent, driverId, vehicle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult Function(LatLng destination)? addDestinationToLocal,
    TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)? updateHeader,
    TResult Function(VehicleRent vehicleRent)? approveManager,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult Function(VehicleRentFormHeader header)? fetchById,
    TResult Function(LatLng destination)? remove,
    TResult Function(VehicleRent vehicleRent)? delete,
    required TResult orElse(),
  }) {
    if (approveCs != null) {
      return approveCs(vehicleRent, driverId, vehicle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateHeaderToLocal value) createHeaderToLocal,
    required TResult Function(_AddDestinationToLocal value)
        addDestinationToLocal,
    required TResult Function(_AddAllDestinationToLocal value)
        addAllDestinationToLocal,
    required TResult Function(_UpdateHeader value) updateHeader,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveCs value) approveCs,
    required TResult Function(_RejectCs value) rejectCs,
    required TResult Function(_UpdateActualStart value) updateActualStart,
    required TResult Function(_UpdateActualEnd value) updateActualEnd,
    required TResult Function(_UpdateDestinations value) updateDestinations,
    required TResult Function(_FetchById value) fetchById,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Delete value) delete,
  }) {
    return approveCs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult? Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult? Function(_AddAllDestinationToLocal value)?
        addAllDestinationToLocal,
    TResult? Function(_UpdateHeader value)? updateHeader,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveCs value)? approveCs,
    TResult? Function(_RejectCs value)? rejectCs,
    TResult? Function(_UpdateActualStart value)? updateActualStart,
    TResult? Function(_UpdateActualEnd value)? updateActualEnd,
    TResult? Function(_UpdateDestinations value)? updateDestinations,
    TResult? Function(_FetchById value)? fetchById,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Delete value)? delete,
  }) {
    return approveCs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult Function(_AddAllDestinationToLocal value)? addAllDestinationToLocal,
    TResult Function(_UpdateHeader value)? updateHeader,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveCs value)? approveCs,
    TResult Function(_RejectCs value)? rejectCs,
    TResult Function(_UpdateActualStart value)? updateActualStart,
    TResult Function(_UpdateActualEnd value)? updateActualEnd,
    TResult Function(_UpdateDestinations value)? updateDestinations,
    TResult Function(_FetchById value)? fetchById,
    TResult Function(_Remove value)? remove,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (approveCs != null) {
      return approveCs(this);
    }
    return orElse();
  }
}

abstract class _ApproveCs implements VehicleRentEvent {
  const factory _ApproveCs(
      {required final VehicleRent vehicleRent,
      required final int driverId,
      required final Vehicle vehicle}) = _$ApproveCsImpl;

  VehicleRent get vehicleRent;
  int get driverId;
  Vehicle get vehicle;

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApproveCsImplCopyWith<_$ApproveCsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RejectCsImplCopyWith<$Res> {
  factory _$$RejectCsImplCopyWith(
          _$RejectCsImpl value, $Res Function(_$RejectCsImpl) then) =
      __$$RejectCsImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VehicleRent vehicleRent, String reason});

  $VehicleRentCopyWith<$Res> get vehicleRent;
}

/// @nodoc
class __$$RejectCsImplCopyWithImpl<$Res>
    extends _$VehicleRentEventCopyWithImpl<$Res, _$RejectCsImpl>
    implements _$$RejectCsImplCopyWith<$Res> {
  __$$RejectCsImplCopyWithImpl(
      _$RejectCsImpl _value, $Res Function(_$RejectCsImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleRent = null,
    Object? reason = null,
  }) {
    return _then(_$RejectCsImpl(
      vehicleRent: null == vehicleRent
          ? _value.vehicleRent
          : vehicleRent // ignore: cast_nullable_to_non_nullable
              as VehicleRent,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VehicleRentCopyWith<$Res> get vehicleRent {
    return $VehicleRentCopyWith<$Res>(_value.vehicleRent, (value) {
      return _then(_value.copyWith(vehicleRent: value));
    });
  }
}

/// @nodoc

class _$RejectCsImpl implements _RejectCs {
  const _$RejectCsImpl({required this.vehicleRent, required this.reason});

  @override
  final VehicleRent vehicleRent;
  @override
  final String reason;

  @override
  String toString() {
    return 'VehicleRentEvent.rejectCs(vehicleRent: $vehicleRent, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RejectCsImpl &&
            (identical(other.vehicleRent, vehicleRent) ||
                other.vehicleRent == vehicleRent) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vehicleRent, reason);

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RejectCsImplCopyWith<_$RejectCsImpl> get copyWith =>
      __$$RejectCsImplCopyWithImpl<_$RejectCsImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        createHeaderToLocal,
    required TResult Function(LatLng destination) addDestinationToLocal,
    required TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)
        addAllDestinationToLocal,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        updateHeader,
    required TResult Function(VehicleRent vehicleRent) approveManager,
    required TResult Function(VehicleRent vehicleRent, String reason)
        rejectManager,
    required TResult Function(
            VehicleRent vehicleRent, int driverId, Vehicle vehicle)
        approveCs,
    required TResult Function(VehicleRent vehicleRent, String reason) rejectCs,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualStart,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualEnd,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)
        updateDestinations,
    required TResult Function(VehicleRentFormHeader header) fetchById,
    required TResult Function(LatLng destination) remove,
    required TResult Function(VehicleRent vehicleRent) delete,
  }) {
    return rejectCs(vehicleRent, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult? Function(LatLng destination)? addDestinationToLocal,
    TResult? Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        updateHeader,
    TResult? Function(VehicleRent vehicleRent)? approveManager,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult? Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult? Function(VehicleRentFormHeader header)? fetchById,
    TResult? Function(LatLng destination)? remove,
    TResult? Function(VehicleRent vehicleRent)? delete,
  }) {
    return rejectCs?.call(vehicleRent, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult Function(LatLng destination)? addDestinationToLocal,
    TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)? updateHeader,
    TResult Function(VehicleRent vehicleRent)? approveManager,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult Function(VehicleRentFormHeader header)? fetchById,
    TResult Function(LatLng destination)? remove,
    TResult Function(VehicleRent vehicleRent)? delete,
    required TResult orElse(),
  }) {
    if (rejectCs != null) {
      return rejectCs(vehicleRent, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateHeaderToLocal value) createHeaderToLocal,
    required TResult Function(_AddDestinationToLocal value)
        addDestinationToLocal,
    required TResult Function(_AddAllDestinationToLocal value)
        addAllDestinationToLocal,
    required TResult Function(_UpdateHeader value) updateHeader,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveCs value) approveCs,
    required TResult Function(_RejectCs value) rejectCs,
    required TResult Function(_UpdateActualStart value) updateActualStart,
    required TResult Function(_UpdateActualEnd value) updateActualEnd,
    required TResult Function(_UpdateDestinations value) updateDestinations,
    required TResult Function(_FetchById value) fetchById,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Delete value) delete,
  }) {
    return rejectCs(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult? Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult? Function(_AddAllDestinationToLocal value)?
        addAllDestinationToLocal,
    TResult? Function(_UpdateHeader value)? updateHeader,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveCs value)? approveCs,
    TResult? Function(_RejectCs value)? rejectCs,
    TResult? Function(_UpdateActualStart value)? updateActualStart,
    TResult? Function(_UpdateActualEnd value)? updateActualEnd,
    TResult? Function(_UpdateDestinations value)? updateDestinations,
    TResult? Function(_FetchById value)? fetchById,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Delete value)? delete,
  }) {
    return rejectCs?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult Function(_AddAllDestinationToLocal value)? addAllDestinationToLocal,
    TResult Function(_UpdateHeader value)? updateHeader,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveCs value)? approveCs,
    TResult Function(_RejectCs value)? rejectCs,
    TResult Function(_UpdateActualStart value)? updateActualStart,
    TResult Function(_UpdateActualEnd value)? updateActualEnd,
    TResult Function(_UpdateDestinations value)? updateDestinations,
    TResult Function(_FetchById value)? fetchById,
    TResult Function(_Remove value)? remove,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (rejectCs != null) {
      return rejectCs(this);
    }
    return orElse();
  }
}

abstract class _RejectCs implements VehicleRentEvent {
  const factory _RejectCs(
      {required final VehicleRent vehicleRent,
      required final String reason}) = _$RejectCsImpl;

  VehicleRent get vehicleRent;
  String get reason;

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RejectCsImplCopyWith<_$RejectCsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateActualStartImplCopyWith<$Res> {
  factory _$$UpdateActualStartImplCopyWith(_$UpdateActualStartImpl value,
          $Res Function(_$UpdateActualStartImpl) then) =
      __$$UpdateActualStartImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {VehicleRent vehicleRent,
      DateTime startDate,
      double actualKilometer,
      int fuelBar,
      String vehicleCheckNote,
      List<PlatformFile> attachments});

  $VehicleRentCopyWith<$Res> get vehicleRent;
}

/// @nodoc
class __$$UpdateActualStartImplCopyWithImpl<$Res>
    extends _$VehicleRentEventCopyWithImpl<$Res, _$UpdateActualStartImpl>
    implements _$$UpdateActualStartImplCopyWith<$Res> {
  __$$UpdateActualStartImplCopyWithImpl(_$UpdateActualStartImpl _value,
      $Res Function(_$UpdateActualStartImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleRent = null,
    Object? startDate = null,
    Object? actualKilometer = null,
    Object? fuelBar = null,
    Object? vehicleCheckNote = null,
    Object? attachments = null,
  }) {
    return _then(_$UpdateActualStartImpl(
      vehicleRent: null == vehicleRent
          ? _value.vehicleRent
          : vehicleRent // ignore: cast_nullable_to_non_nullable
              as VehicleRent,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      actualKilometer: null == actualKilometer
          ? _value.actualKilometer
          : actualKilometer // ignore: cast_nullable_to_non_nullable
              as double,
      fuelBar: null == fuelBar
          ? _value.fuelBar
          : fuelBar // ignore: cast_nullable_to_non_nullable
              as int,
      vehicleCheckNote: null == vehicleCheckNote
          ? _value.vehicleCheckNote
          : vehicleCheckNote // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: null == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<PlatformFile>,
    ));
  }

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VehicleRentCopyWith<$Res> get vehicleRent {
    return $VehicleRentCopyWith<$Res>(_value.vehicleRent, (value) {
      return _then(_value.copyWith(vehicleRent: value));
    });
  }
}

/// @nodoc

class _$UpdateActualStartImpl implements _UpdateActualStart {
  const _$UpdateActualStartImpl(
      {required this.vehicleRent,
      required this.startDate,
      required this.actualKilometer,
      required this.fuelBar,
      required this.vehicleCheckNote,
      required final List<PlatformFile> attachments})
      : _attachments = attachments;

  @override
  final VehicleRent vehicleRent;
  @override
  final DateTime startDate;
  @override
  final double actualKilometer;
  @override
  final int fuelBar;
  @override
  final String vehicleCheckNote;
  final List<PlatformFile> _attachments;
  @override
  List<PlatformFile> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  String toString() {
    return 'VehicleRentEvent.updateActualStart(vehicleRent: $vehicleRent, startDate: $startDate, actualKilometer: $actualKilometer, fuelBar: $fuelBar, vehicleCheckNote: $vehicleCheckNote, attachments: $attachments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateActualStartImpl &&
            (identical(other.vehicleRent, vehicleRent) ||
                other.vehicleRent == vehicleRent) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.actualKilometer, actualKilometer) ||
                other.actualKilometer == actualKilometer) &&
            (identical(other.fuelBar, fuelBar) || other.fuelBar == fuelBar) &&
            (identical(other.vehicleCheckNote, vehicleCheckNote) ||
                other.vehicleCheckNote == vehicleCheckNote) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      vehicleRent,
      startDate,
      actualKilometer,
      fuelBar,
      vehicleCheckNote,
      const DeepCollectionEquality().hash(_attachments));

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateActualStartImplCopyWith<_$UpdateActualStartImpl> get copyWith =>
      __$$UpdateActualStartImplCopyWithImpl<_$UpdateActualStartImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        createHeaderToLocal,
    required TResult Function(LatLng destination) addDestinationToLocal,
    required TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)
        addAllDestinationToLocal,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        updateHeader,
    required TResult Function(VehicleRent vehicleRent) approveManager,
    required TResult Function(VehicleRent vehicleRent, String reason)
        rejectManager,
    required TResult Function(
            VehicleRent vehicleRent, int driverId, Vehicle vehicle)
        approveCs,
    required TResult Function(VehicleRent vehicleRent, String reason) rejectCs,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualStart,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualEnd,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)
        updateDestinations,
    required TResult Function(VehicleRentFormHeader header) fetchById,
    required TResult Function(LatLng destination) remove,
    required TResult Function(VehicleRent vehicleRent) delete,
  }) {
    return updateActualStart(vehicleRent, startDate, actualKilometer, fuelBar,
        vehicleCheckNote, attachments);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult? Function(LatLng destination)? addDestinationToLocal,
    TResult? Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        updateHeader,
    TResult? Function(VehicleRent vehicleRent)? approveManager,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult? Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult? Function(VehicleRentFormHeader header)? fetchById,
    TResult? Function(LatLng destination)? remove,
    TResult? Function(VehicleRent vehicleRent)? delete,
  }) {
    return updateActualStart?.call(vehicleRent, startDate, actualKilometer,
        fuelBar, vehicleCheckNote, attachments);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult Function(LatLng destination)? addDestinationToLocal,
    TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)? updateHeader,
    TResult Function(VehicleRent vehicleRent)? approveManager,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult Function(VehicleRentFormHeader header)? fetchById,
    TResult Function(LatLng destination)? remove,
    TResult Function(VehicleRent vehicleRent)? delete,
    required TResult orElse(),
  }) {
    if (updateActualStart != null) {
      return updateActualStart(vehicleRent, startDate, actualKilometer, fuelBar,
          vehicleCheckNote, attachments);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateHeaderToLocal value) createHeaderToLocal,
    required TResult Function(_AddDestinationToLocal value)
        addDestinationToLocal,
    required TResult Function(_AddAllDestinationToLocal value)
        addAllDestinationToLocal,
    required TResult Function(_UpdateHeader value) updateHeader,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveCs value) approveCs,
    required TResult Function(_RejectCs value) rejectCs,
    required TResult Function(_UpdateActualStart value) updateActualStart,
    required TResult Function(_UpdateActualEnd value) updateActualEnd,
    required TResult Function(_UpdateDestinations value) updateDestinations,
    required TResult Function(_FetchById value) fetchById,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Delete value) delete,
  }) {
    return updateActualStart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult? Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult? Function(_AddAllDestinationToLocal value)?
        addAllDestinationToLocal,
    TResult? Function(_UpdateHeader value)? updateHeader,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveCs value)? approveCs,
    TResult? Function(_RejectCs value)? rejectCs,
    TResult? Function(_UpdateActualStart value)? updateActualStart,
    TResult? Function(_UpdateActualEnd value)? updateActualEnd,
    TResult? Function(_UpdateDestinations value)? updateDestinations,
    TResult? Function(_FetchById value)? fetchById,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Delete value)? delete,
  }) {
    return updateActualStart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult Function(_AddAllDestinationToLocal value)? addAllDestinationToLocal,
    TResult Function(_UpdateHeader value)? updateHeader,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveCs value)? approveCs,
    TResult Function(_RejectCs value)? rejectCs,
    TResult Function(_UpdateActualStart value)? updateActualStart,
    TResult Function(_UpdateActualEnd value)? updateActualEnd,
    TResult Function(_UpdateDestinations value)? updateDestinations,
    TResult Function(_FetchById value)? fetchById,
    TResult Function(_Remove value)? remove,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (updateActualStart != null) {
      return updateActualStart(this);
    }
    return orElse();
  }
}

abstract class _UpdateActualStart implements VehicleRentEvent {
  const factory _UpdateActualStart(
      {required final VehicleRent vehicleRent,
      required final DateTime startDate,
      required final double actualKilometer,
      required final int fuelBar,
      required final String vehicleCheckNote,
      required final List<PlatformFile> attachments}) = _$UpdateActualStartImpl;

  VehicleRent get vehicleRent;
  DateTime get startDate;
  double get actualKilometer;
  int get fuelBar;
  String get vehicleCheckNote;
  List<PlatformFile> get attachments;

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateActualStartImplCopyWith<_$UpdateActualStartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateActualEndImplCopyWith<$Res> {
  factory _$$UpdateActualEndImplCopyWith(_$UpdateActualEndImpl value,
          $Res Function(_$UpdateActualEndImpl) then) =
      __$$UpdateActualEndImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {VehicleRent vehicleRent,
      DateTime endDate,
      double actualKilometer,
      int fuelBar,
      String vehicleCheckNote,
      List<PlatformFile> attachments});

  $VehicleRentCopyWith<$Res> get vehicleRent;
}

/// @nodoc
class __$$UpdateActualEndImplCopyWithImpl<$Res>
    extends _$VehicleRentEventCopyWithImpl<$Res, _$UpdateActualEndImpl>
    implements _$$UpdateActualEndImplCopyWith<$Res> {
  __$$UpdateActualEndImplCopyWithImpl(
      _$UpdateActualEndImpl _value, $Res Function(_$UpdateActualEndImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleRent = null,
    Object? endDate = null,
    Object? actualKilometer = null,
    Object? fuelBar = null,
    Object? vehicleCheckNote = null,
    Object? attachments = null,
  }) {
    return _then(_$UpdateActualEndImpl(
      vehicleRent: null == vehicleRent
          ? _value.vehicleRent
          : vehicleRent // ignore: cast_nullable_to_non_nullable
              as VehicleRent,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      actualKilometer: null == actualKilometer
          ? _value.actualKilometer
          : actualKilometer // ignore: cast_nullable_to_non_nullable
              as double,
      fuelBar: null == fuelBar
          ? _value.fuelBar
          : fuelBar // ignore: cast_nullable_to_non_nullable
              as int,
      vehicleCheckNote: null == vehicleCheckNote
          ? _value.vehicleCheckNote
          : vehicleCheckNote // ignore: cast_nullable_to_non_nullable
              as String,
      attachments: null == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<PlatformFile>,
    ));
  }

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VehicleRentCopyWith<$Res> get vehicleRent {
    return $VehicleRentCopyWith<$Res>(_value.vehicleRent, (value) {
      return _then(_value.copyWith(vehicleRent: value));
    });
  }
}

/// @nodoc

class _$UpdateActualEndImpl implements _UpdateActualEnd {
  const _$UpdateActualEndImpl(
      {required this.vehicleRent,
      required this.endDate,
      required this.actualKilometer,
      required this.fuelBar,
      required this.vehicleCheckNote,
      required final List<PlatformFile> attachments})
      : _attachments = attachments;

  @override
  final VehicleRent vehicleRent;
  @override
  final DateTime endDate;
  @override
  final double actualKilometer;
  @override
  final int fuelBar;
  @override
  final String vehicleCheckNote;
  final List<PlatformFile> _attachments;
  @override
  List<PlatformFile> get attachments {
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attachments);
  }

  @override
  String toString() {
    return 'VehicleRentEvent.updateActualEnd(vehicleRent: $vehicleRent, endDate: $endDate, actualKilometer: $actualKilometer, fuelBar: $fuelBar, vehicleCheckNote: $vehicleCheckNote, attachments: $attachments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateActualEndImpl &&
            (identical(other.vehicleRent, vehicleRent) ||
                other.vehicleRent == vehicleRent) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.actualKilometer, actualKilometer) ||
                other.actualKilometer == actualKilometer) &&
            (identical(other.fuelBar, fuelBar) || other.fuelBar == fuelBar) &&
            (identical(other.vehicleCheckNote, vehicleCheckNote) ||
                other.vehicleCheckNote == vehicleCheckNote) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      vehicleRent,
      endDate,
      actualKilometer,
      fuelBar,
      vehicleCheckNote,
      const DeepCollectionEquality().hash(_attachments));

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateActualEndImplCopyWith<_$UpdateActualEndImpl> get copyWith =>
      __$$UpdateActualEndImplCopyWithImpl<_$UpdateActualEndImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        createHeaderToLocal,
    required TResult Function(LatLng destination) addDestinationToLocal,
    required TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)
        addAllDestinationToLocal,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        updateHeader,
    required TResult Function(VehicleRent vehicleRent) approveManager,
    required TResult Function(VehicleRent vehicleRent, String reason)
        rejectManager,
    required TResult Function(
            VehicleRent vehicleRent, int driverId, Vehicle vehicle)
        approveCs,
    required TResult Function(VehicleRent vehicleRent, String reason) rejectCs,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualStart,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualEnd,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)
        updateDestinations,
    required TResult Function(VehicleRentFormHeader header) fetchById,
    required TResult Function(LatLng destination) remove,
    required TResult Function(VehicleRent vehicleRent) delete,
  }) {
    return updateActualEnd(vehicleRent, endDate, actualKilometer, fuelBar,
        vehicleCheckNote, attachments);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult? Function(LatLng destination)? addDestinationToLocal,
    TResult? Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        updateHeader,
    TResult? Function(VehicleRent vehicleRent)? approveManager,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult? Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult? Function(VehicleRentFormHeader header)? fetchById,
    TResult? Function(LatLng destination)? remove,
    TResult? Function(VehicleRent vehicleRent)? delete,
  }) {
    return updateActualEnd?.call(vehicleRent, endDate, actualKilometer, fuelBar,
        vehicleCheckNote, attachments);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult Function(LatLng destination)? addDestinationToLocal,
    TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)? updateHeader,
    TResult Function(VehicleRent vehicleRent)? approveManager,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult Function(VehicleRentFormHeader header)? fetchById,
    TResult Function(LatLng destination)? remove,
    TResult Function(VehicleRent vehicleRent)? delete,
    required TResult orElse(),
  }) {
    if (updateActualEnd != null) {
      return updateActualEnd(vehicleRent, endDate, actualKilometer, fuelBar,
          vehicleCheckNote, attachments);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateHeaderToLocal value) createHeaderToLocal,
    required TResult Function(_AddDestinationToLocal value)
        addDestinationToLocal,
    required TResult Function(_AddAllDestinationToLocal value)
        addAllDestinationToLocal,
    required TResult Function(_UpdateHeader value) updateHeader,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveCs value) approveCs,
    required TResult Function(_RejectCs value) rejectCs,
    required TResult Function(_UpdateActualStart value) updateActualStart,
    required TResult Function(_UpdateActualEnd value) updateActualEnd,
    required TResult Function(_UpdateDestinations value) updateDestinations,
    required TResult Function(_FetchById value) fetchById,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Delete value) delete,
  }) {
    return updateActualEnd(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult? Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult? Function(_AddAllDestinationToLocal value)?
        addAllDestinationToLocal,
    TResult? Function(_UpdateHeader value)? updateHeader,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveCs value)? approveCs,
    TResult? Function(_RejectCs value)? rejectCs,
    TResult? Function(_UpdateActualStart value)? updateActualStart,
    TResult? Function(_UpdateActualEnd value)? updateActualEnd,
    TResult? Function(_UpdateDestinations value)? updateDestinations,
    TResult? Function(_FetchById value)? fetchById,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Delete value)? delete,
  }) {
    return updateActualEnd?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult Function(_AddAllDestinationToLocal value)? addAllDestinationToLocal,
    TResult Function(_UpdateHeader value)? updateHeader,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveCs value)? approveCs,
    TResult Function(_RejectCs value)? rejectCs,
    TResult Function(_UpdateActualStart value)? updateActualStart,
    TResult Function(_UpdateActualEnd value)? updateActualEnd,
    TResult Function(_UpdateDestinations value)? updateDestinations,
    TResult Function(_FetchById value)? fetchById,
    TResult Function(_Remove value)? remove,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (updateActualEnd != null) {
      return updateActualEnd(this);
    }
    return orElse();
  }
}

abstract class _UpdateActualEnd implements VehicleRentEvent {
  const factory _UpdateActualEnd(
      {required final VehicleRent vehicleRent,
      required final DateTime endDate,
      required final double actualKilometer,
      required final int fuelBar,
      required final String vehicleCheckNote,
      required final List<PlatformFile> attachments}) = _$UpdateActualEndImpl;

  VehicleRent get vehicleRent;
  DateTime get endDate;
  double get actualKilometer;
  int get fuelBar;
  String get vehicleCheckNote;
  List<PlatformFile> get attachments;

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateActualEndImplCopyWith<_$UpdateActualEndImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateDestinationsImplCopyWith<$Res> {
  factory _$$UpdateDestinationsImplCopyWith(_$UpdateDestinationsImpl value,
          $Res Function(_$UpdateDestinationsImpl) then) =
      __$$UpdateDestinationsImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {VehicleRentFormHeader vehicleRentFormHeader, List<LatLng> destinations});
}

/// @nodoc
class __$$UpdateDestinationsImplCopyWithImpl<$Res>
    extends _$VehicleRentEventCopyWithImpl<$Res, _$UpdateDestinationsImpl>
    implements _$$UpdateDestinationsImplCopyWith<$Res> {
  __$$UpdateDestinationsImplCopyWithImpl(_$UpdateDestinationsImpl _value,
      $Res Function(_$UpdateDestinationsImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleRentFormHeader = null,
    Object? destinations = null,
  }) {
    return _then(_$UpdateDestinationsImpl(
      vehicleRentFormHeader: null == vehicleRentFormHeader
          ? _value.vehicleRentFormHeader
          : vehicleRentFormHeader // ignore: cast_nullable_to_non_nullable
              as VehicleRentFormHeader,
      destinations: null == destinations
          ? _value._destinations
          : destinations // ignore: cast_nullable_to_non_nullable
              as List<LatLng>,
    ));
  }
}

/// @nodoc

class _$UpdateDestinationsImpl implements _UpdateDestinations {
  const _$UpdateDestinationsImpl(
      {required this.vehicleRentFormHeader,
      required final List<LatLng> destinations})
      : _destinations = destinations;

  @override
  final VehicleRentFormHeader vehicleRentFormHeader;
  final List<LatLng> _destinations;
  @override
  List<LatLng> get destinations {
    if (_destinations is EqualUnmodifiableListView) return _destinations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_destinations);
  }

  @override
  String toString() {
    return 'VehicleRentEvent.updateDestinations(vehicleRentFormHeader: $vehicleRentFormHeader, destinations: $destinations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateDestinationsImpl &&
            (identical(other.vehicleRentFormHeader, vehicleRentFormHeader) ||
                other.vehicleRentFormHeader == vehicleRentFormHeader) &&
            const DeepCollectionEquality()
                .equals(other._destinations, _destinations));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vehicleRentFormHeader,
      const DeepCollectionEquality().hash(_destinations));

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateDestinationsImplCopyWith<_$UpdateDestinationsImpl> get copyWith =>
      __$$UpdateDestinationsImplCopyWithImpl<_$UpdateDestinationsImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        createHeaderToLocal,
    required TResult Function(LatLng destination) addDestinationToLocal,
    required TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)
        addAllDestinationToLocal,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        updateHeader,
    required TResult Function(VehicleRent vehicleRent) approveManager,
    required TResult Function(VehicleRent vehicleRent, String reason)
        rejectManager,
    required TResult Function(
            VehicleRent vehicleRent, int driverId, Vehicle vehicle)
        approveCs,
    required TResult Function(VehicleRent vehicleRent, String reason) rejectCs,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualStart,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualEnd,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)
        updateDestinations,
    required TResult Function(VehicleRentFormHeader header) fetchById,
    required TResult Function(LatLng destination) remove,
    required TResult Function(VehicleRent vehicleRent) delete,
  }) {
    return updateDestinations(vehicleRentFormHeader, destinations);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult? Function(LatLng destination)? addDestinationToLocal,
    TResult? Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        updateHeader,
    TResult? Function(VehicleRent vehicleRent)? approveManager,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult? Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult? Function(VehicleRentFormHeader header)? fetchById,
    TResult? Function(LatLng destination)? remove,
    TResult? Function(VehicleRent vehicleRent)? delete,
  }) {
    return updateDestinations?.call(vehicleRentFormHeader, destinations);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult Function(LatLng destination)? addDestinationToLocal,
    TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)? updateHeader,
    TResult Function(VehicleRent vehicleRent)? approveManager,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult Function(VehicleRentFormHeader header)? fetchById,
    TResult Function(LatLng destination)? remove,
    TResult Function(VehicleRent vehicleRent)? delete,
    required TResult orElse(),
  }) {
    if (updateDestinations != null) {
      return updateDestinations(vehicleRentFormHeader, destinations);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateHeaderToLocal value) createHeaderToLocal,
    required TResult Function(_AddDestinationToLocal value)
        addDestinationToLocal,
    required TResult Function(_AddAllDestinationToLocal value)
        addAllDestinationToLocal,
    required TResult Function(_UpdateHeader value) updateHeader,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveCs value) approveCs,
    required TResult Function(_RejectCs value) rejectCs,
    required TResult Function(_UpdateActualStart value) updateActualStart,
    required TResult Function(_UpdateActualEnd value) updateActualEnd,
    required TResult Function(_UpdateDestinations value) updateDestinations,
    required TResult Function(_FetchById value) fetchById,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Delete value) delete,
  }) {
    return updateDestinations(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult? Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult? Function(_AddAllDestinationToLocal value)?
        addAllDestinationToLocal,
    TResult? Function(_UpdateHeader value)? updateHeader,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveCs value)? approveCs,
    TResult? Function(_RejectCs value)? rejectCs,
    TResult? Function(_UpdateActualStart value)? updateActualStart,
    TResult? Function(_UpdateActualEnd value)? updateActualEnd,
    TResult? Function(_UpdateDestinations value)? updateDestinations,
    TResult? Function(_FetchById value)? fetchById,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Delete value)? delete,
  }) {
    return updateDestinations?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult Function(_AddAllDestinationToLocal value)? addAllDestinationToLocal,
    TResult Function(_UpdateHeader value)? updateHeader,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveCs value)? approveCs,
    TResult Function(_RejectCs value)? rejectCs,
    TResult Function(_UpdateActualStart value)? updateActualStart,
    TResult Function(_UpdateActualEnd value)? updateActualEnd,
    TResult Function(_UpdateDestinations value)? updateDestinations,
    TResult Function(_FetchById value)? fetchById,
    TResult Function(_Remove value)? remove,
    TResult Function(_Delete value)? delete,
    required TResult orElse(),
  }) {
    if (updateDestinations != null) {
      return updateDestinations(this);
    }
    return orElse();
  }
}

abstract class _UpdateDestinations implements VehicleRentEvent {
  const factory _UpdateDestinations(
      {required final VehicleRentFormHeader vehicleRentFormHeader,
      required final List<LatLng> destinations}) = _$UpdateDestinationsImpl;

  VehicleRentFormHeader get vehicleRentFormHeader;
  List<LatLng> get destinations;

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateDestinationsImplCopyWith<_$UpdateDestinationsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchByIdImplCopyWith<$Res> {
  factory _$$FetchByIdImplCopyWith(
          _$FetchByIdImpl value, $Res Function(_$FetchByIdImpl) then) =
      __$$FetchByIdImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VehicleRentFormHeader header});
}

/// @nodoc
class __$$FetchByIdImplCopyWithImpl<$Res>
    extends _$VehicleRentEventCopyWithImpl<$Res, _$FetchByIdImpl>
    implements _$$FetchByIdImplCopyWith<$Res> {
  __$$FetchByIdImplCopyWithImpl(
      _$FetchByIdImpl _value, $Res Function(_$FetchByIdImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? header = null,
  }) {
    return _then(_$FetchByIdImpl(
      header: null == header
          ? _value.header
          : header // ignore: cast_nullable_to_non_nullable
              as VehicleRentFormHeader,
    ));
  }
}

/// @nodoc

class _$FetchByIdImpl implements _FetchById {
  const _$FetchByIdImpl({required this.header});

  @override
  final VehicleRentFormHeader header;

  @override
  String toString() {
    return 'VehicleRentEvent.fetchById(header: $header)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchByIdImpl &&
            (identical(other.header, header) || other.header == header));
  }

  @override
  int get hashCode => Object.hash(runtimeType, header);

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchByIdImplCopyWith<_$FetchByIdImpl> get copyWith =>
      __$$FetchByIdImplCopyWithImpl<_$FetchByIdImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        createHeaderToLocal,
    required TResult Function(LatLng destination) addDestinationToLocal,
    required TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)
        addAllDestinationToLocal,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        updateHeader,
    required TResult Function(VehicleRent vehicleRent) approveManager,
    required TResult Function(VehicleRent vehicleRent, String reason)
        rejectManager,
    required TResult Function(
            VehicleRent vehicleRent, int driverId, Vehicle vehicle)
        approveCs,
    required TResult Function(VehicleRent vehicleRent, String reason) rejectCs,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualStart,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualEnd,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)
        updateDestinations,
    required TResult Function(VehicleRentFormHeader header) fetchById,
    required TResult Function(LatLng destination) remove,
    required TResult Function(VehicleRent vehicleRent) delete,
  }) {
    return fetchById(header);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult? Function(LatLng destination)? addDestinationToLocal,
    TResult? Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        updateHeader,
    TResult? Function(VehicleRent vehicleRent)? approveManager,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult? Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult? Function(VehicleRentFormHeader header)? fetchById,
    TResult? Function(LatLng destination)? remove,
    TResult? Function(VehicleRent vehicleRent)? delete,
  }) {
    return fetchById?.call(header);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult Function(LatLng destination)? addDestinationToLocal,
    TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)? updateHeader,
    TResult Function(VehicleRent vehicleRent)? approveManager,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult Function(VehicleRentFormHeader header)? fetchById,
    TResult Function(LatLng destination)? remove,
    TResult Function(VehicleRent vehicleRent)? delete,
    required TResult orElse(),
  }) {
    if (fetchById != null) {
      return fetchById(header);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateHeaderToLocal value) createHeaderToLocal,
    required TResult Function(_AddDestinationToLocal value)
        addDestinationToLocal,
    required TResult Function(_AddAllDestinationToLocal value)
        addAllDestinationToLocal,
    required TResult Function(_UpdateHeader value) updateHeader,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveCs value) approveCs,
    required TResult Function(_RejectCs value) rejectCs,
    required TResult Function(_UpdateActualStart value) updateActualStart,
    required TResult Function(_UpdateActualEnd value) updateActualEnd,
    required TResult Function(_UpdateDestinations value) updateDestinations,
    required TResult Function(_FetchById value) fetchById,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Delete value) delete,
  }) {
    return fetchById(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult? Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult? Function(_AddAllDestinationToLocal value)?
        addAllDestinationToLocal,
    TResult? Function(_UpdateHeader value)? updateHeader,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveCs value)? approveCs,
    TResult? Function(_RejectCs value)? rejectCs,
    TResult? Function(_UpdateActualStart value)? updateActualStart,
    TResult? Function(_UpdateActualEnd value)? updateActualEnd,
    TResult? Function(_UpdateDestinations value)? updateDestinations,
    TResult? Function(_FetchById value)? fetchById,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Delete value)? delete,
  }) {
    return fetchById?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult Function(_AddAllDestinationToLocal value)? addAllDestinationToLocal,
    TResult Function(_UpdateHeader value)? updateHeader,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveCs value)? approveCs,
    TResult Function(_RejectCs value)? rejectCs,
    TResult Function(_UpdateActualStart value)? updateActualStart,
    TResult Function(_UpdateActualEnd value)? updateActualEnd,
    TResult Function(_UpdateDestinations value)? updateDestinations,
    TResult Function(_FetchById value)? fetchById,
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

abstract class _FetchById implements VehicleRentEvent {
  const factory _FetchById({required final VehicleRentFormHeader header}) =
      _$FetchByIdImpl;

  VehicleRentFormHeader get header;

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FetchByIdImplCopyWith<_$FetchByIdImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveImplCopyWith<$Res> {
  factory _$$RemoveImplCopyWith(
          _$RemoveImpl value, $Res Function(_$RemoveImpl) then) =
      __$$RemoveImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LatLng destination});
}

/// @nodoc
class __$$RemoveImplCopyWithImpl<$Res>
    extends _$VehicleRentEventCopyWithImpl<$Res, _$RemoveImpl>
    implements _$$RemoveImplCopyWith<$Res> {
  __$$RemoveImplCopyWithImpl(
      _$RemoveImpl _value, $Res Function(_$RemoveImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? destination = null,
  }) {
    return _then(_$RemoveImpl(
      null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc

class _$RemoveImpl implements _Remove {
  const _$RemoveImpl(this.destination);

  @override
  final LatLng destination;

  @override
  String toString() {
    return 'VehicleRentEvent.remove(destination: $destination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveImpl &&
            (identical(other.destination, destination) ||
                other.destination == destination));
  }

  @override
  int get hashCode => Object.hash(runtimeType, destination);

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveImplCopyWith<_$RemoveImpl> get copyWith =>
      __$$RemoveImplCopyWithImpl<_$RemoveImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        createHeaderToLocal,
    required TResult Function(LatLng destination) addDestinationToLocal,
    required TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)
        addAllDestinationToLocal,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        updateHeader,
    required TResult Function(VehicleRent vehicleRent) approveManager,
    required TResult Function(VehicleRent vehicleRent, String reason)
        rejectManager,
    required TResult Function(
            VehicleRent vehicleRent, int driverId, Vehicle vehicle)
        approveCs,
    required TResult Function(VehicleRent vehicleRent, String reason) rejectCs,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualStart,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualEnd,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)
        updateDestinations,
    required TResult Function(VehicleRentFormHeader header) fetchById,
    required TResult Function(LatLng destination) remove,
    required TResult Function(VehicleRent vehicleRent) delete,
  }) {
    return remove(destination);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult? Function(LatLng destination)? addDestinationToLocal,
    TResult? Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        updateHeader,
    TResult? Function(VehicleRent vehicleRent)? approveManager,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult? Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult? Function(VehicleRentFormHeader header)? fetchById,
    TResult? Function(LatLng destination)? remove,
    TResult? Function(VehicleRent vehicleRent)? delete,
  }) {
    return remove?.call(destination);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult Function(LatLng destination)? addDestinationToLocal,
    TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)? updateHeader,
    TResult Function(VehicleRent vehicleRent)? approveManager,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult Function(VehicleRentFormHeader header)? fetchById,
    TResult Function(LatLng destination)? remove,
    TResult Function(VehicleRent vehicleRent)? delete,
    required TResult orElse(),
  }) {
    if (remove != null) {
      return remove(destination);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateHeaderToLocal value) createHeaderToLocal,
    required TResult Function(_AddDestinationToLocal value)
        addDestinationToLocal,
    required TResult Function(_AddAllDestinationToLocal value)
        addAllDestinationToLocal,
    required TResult Function(_UpdateHeader value) updateHeader,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveCs value) approveCs,
    required TResult Function(_RejectCs value) rejectCs,
    required TResult Function(_UpdateActualStart value) updateActualStart,
    required TResult Function(_UpdateActualEnd value) updateActualEnd,
    required TResult Function(_UpdateDestinations value) updateDestinations,
    required TResult Function(_FetchById value) fetchById,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Delete value) delete,
  }) {
    return remove(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult? Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult? Function(_AddAllDestinationToLocal value)?
        addAllDestinationToLocal,
    TResult? Function(_UpdateHeader value)? updateHeader,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveCs value)? approveCs,
    TResult? Function(_RejectCs value)? rejectCs,
    TResult? Function(_UpdateActualStart value)? updateActualStart,
    TResult? Function(_UpdateActualEnd value)? updateActualEnd,
    TResult? Function(_UpdateDestinations value)? updateDestinations,
    TResult? Function(_FetchById value)? fetchById,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Delete value)? delete,
  }) {
    return remove?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult Function(_AddAllDestinationToLocal value)? addAllDestinationToLocal,
    TResult Function(_UpdateHeader value)? updateHeader,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveCs value)? approveCs,
    TResult Function(_RejectCs value)? rejectCs,
    TResult Function(_UpdateActualStart value)? updateActualStart,
    TResult Function(_UpdateActualEnd value)? updateActualEnd,
    TResult Function(_UpdateDestinations value)? updateDestinations,
    TResult Function(_FetchById value)? fetchById,
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

abstract class _Remove implements VehicleRentEvent {
  const factory _Remove(final LatLng destination) = _$RemoveImpl;

  LatLng get destination;

  /// Create a copy of VehicleRentEvent
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
  $Res call({VehicleRent vehicleRent});

  $VehicleRentCopyWith<$Res> get vehicleRent;
}

/// @nodoc
class __$$DeleteImplCopyWithImpl<$Res>
    extends _$VehicleRentEventCopyWithImpl<$Res, _$DeleteImpl>
    implements _$$DeleteImplCopyWith<$Res> {
  __$$DeleteImplCopyWithImpl(
      _$DeleteImpl _value, $Res Function(_$DeleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? vehicleRent = null,
  }) {
    return _then(_$DeleteImpl(
      null == vehicleRent
          ? _value.vehicleRent
          : vehicleRent // ignore: cast_nullable_to_non_nullable
              as VehicleRent,
    ));
  }

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VehicleRentCopyWith<$Res> get vehicleRent {
    return $VehicleRentCopyWith<$Res>(_value.vehicleRent, (value) {
      return _then(_value.copyWith(vehicleRent: value));
    });
  }
}

/// @nodoc

class _$DeleteImpl implements _Delete {
  const _$DeleteImpl(this.vehicleRent);

  @override
  final VehicleRent vehicleRent;

  @override
  String toString() {
    return 'VehicleRentEvent.delete(vehicleRent: $vehicleRent)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteImpl &&
            (identical(other.vehicleRent, vehicleRent) ||
                other.vehicleRent == vehicleRent));
  }

  @override
  int get hashCode => Object.hash(runtimeType, vehicleRent);

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      __$$DeleteImplCopyWithImpl<_$DeleteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() create,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        createHeaderToLocal,
    required TResult Function(LatLng destination) addDestinationToLocal,
    required TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)
        addAllDestinationToLocal,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader)
        updateHeader,
    required TResult Function(VehicleRent vehicleRent) approveManager,
    required TResult Function(VehicleRent vehicleRent, String reason)
        rejectManager,
    required TResult Function(
            VehicleRent vehicleRent, int driverId, Vehicle vehicle)
        approveCs,
    required TResult Function(VehicleRent vehicleRent, String reason) rejectCs,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualStart,
    required TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)
        updateActualEnd,
    required TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)
        updateDestinations,
    required TResult Function(VehicleRentFormHeader header) fetchById,
    required TResult Function(LatLng destination) remove,
    required TResult Function(VehicleRent vehicleRent) delete,
  }) {
    return delete(vehicleRent);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? create,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult? Function(LatLng destination)? addDestinationToLocal,
    TResult? Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader)?
        updateHeader,
    TResult? Function(VehicleRent vehicleRent)? approveManager,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult? Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult? Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult? Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult? Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult? Function(VehicleRentFormHeader header)? fetchById,
    TResult? Function(LatLng destination)? remove,
    TResult? Function(VehicleRent vehicleRent)? delete,
  }) {
    return delete?.call(vehicleRent);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? create,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)?
        createHeaderToLocal,
    TResult Function(LatLng destination)? addDestinationToLocal,
    TResult Function(List<LatLng> destinations,
            VehicleRentFormHeader? vehicleRentFormHeader)?
        addAllDestinationToLocal,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader)? updateHeader,
    TResult Function(VehicleRent vehicleRent)? approveManager,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectManager,
    TResult Function(VehicleRent vehicleRent, int driverId, Vehicle vehicle)?
        approveCs,
    TResult Function(VehicleRent vehicleRent, String reason)? rejectCs,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime startDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualStart,
    TResult Function(
            VehicleRent vehicleRent,
            DateTime endDate,
            double actualKilometer,
            int fuelBar,
            String vehicleCheckNote,
            List<PlatformFile> attachments)?
        updateActualEnd,
    TResult Function(VehicleRentFormHeader vehicleRentFormHeader,
            List<LatLng> destinations)?
        updateDestinations,
    TResult Function(VehicleRentFormHeader header)? fetchById,
    TResult Function(LatLng destination)? remove,
    TResult Function(VehicleRent vehicleRent)? delete,
    required TResult orElse(),
  }) {
    if (delete != null) {
      return delete(vehicleRent);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Create value) create,
    required TResult Function(_CreateHeaderToLocal value) createHeaderToLocal,
    required TResult Function(_AddDestinationToLocal value)
        addDestinationToLocal,
    required TResult Function(_AddAllDestinationToLocal value)
        addAllDestinationToLocal,
    required TResult Function(_UpdateHeader value) updateHeader,
    required TResult Function(_ApproveManager value) approveManager,
    required TResult Function(_RejectManager value) rejectManager,
    required TResult Function(_ApproveCs value) approveCs,
    required TResult Function(_RejectCs value) rejectCs,
    required TResult Function(_UpdateActualStart value) updateActualStart,
    required TResult Function(_UpdateActualEnd value) updateActualEnd,
    required TResult Function(_UpdateDestinations value) updateDestinations,
    required TResult Function(_FetchById value) fetchById,
    required TResult Function(_Remove value) remove,
    required TResult Function(_Delete value) delete,
  }) {
    return delete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Create value)? create,
    TResult? Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult? Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult? Function(_AddAllDestinationToLocal value)?
        addAllDestinationToLocal,
    TResult? Function(_UpdateHeader value)? updateHeader,
    TResult? Function(_ApproveManager value)? approveManager,
    TResult? Function(_RejectManager value)? rejectManager,
    TResult? Function(_ApproveCs value)? approveCs,
    TResult? Function(_RejectCs value)? rejectCs,
    TResult? Function(_UpdateActualStart value)? updateActualStart,
    TResult? Function(_UpdateActualEnd value)? updateActualEnd,
    TResult? Function(_UpdateDestinations value)? updateDestinations,
    TResult? Function(_FetchById value)? fetchById,
    TResult? Function(_Remove value)? remove,
    TResult? Function(_Delete value)? delete,
  }) {
    return delete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Create value)? create,
    TResult Function(_CreateHeaderToLocal value)? createHeaderToLocal,
    TResult Function(_AddDestinationToLocal value)? addDestinationToLocal,
    TResult Function(_AddAllDestinationToLocal value)? addAllDestinationToLocal,
    TResult Function(_UpdateHeader value)? updateHeader,
    TResult Function(_ApproveManager value)? approveManager,
    TResult Function(_RejectManager value)? rejectManager,
    TResult Function(_ApproveCs value)? approveCs,
    TResult Function(_RejectCs value)? rejectCs,
    TResult Function(_UpdateActualStart value)? updateActualStart,
    TResult Function(_UpdateActualEnd value)? updateActualEnd,
    TResult Function(_UpdateDestinations value)? updateDestinations,
    TResult Function(_FetchById value)? fetchById,
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

abstract class _Delete implements VehicleRentEvent {
  const factory _Delete(final VehicleRent vehicleRent) = _$DeleteImpl;

  VehicleRent get vehicleRent;

  /// Create a copy of VehicleRentEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeleteImplCopyWith<_$DeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
