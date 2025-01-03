// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_rent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VehicleRent _$VehicleRentFromJson(Map<String, dynamic> json) {
  return _VehicleRent.fromJson(json);
}

/// @nodoc
mixin _$VehicleRent {
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updatedById => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  Department get department => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_id')
  int? get driverId => throw _privateConstructorUsedError;
  @JsonKey(name: 'status', fromJson: _vehicleRentStatusFromString)
  VehicleRentStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'type', fromJson: _vehicleRentTypeFromString)
  VehicleRentType get type => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle')
  Vehicle? get vehicle => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_cost')
  double get totalCost => throw _privateConstructorUsedError;
  @JsonKey(name: 'cost_per_kilometer')
  double get costPerKilometer => throw _privateConstructorUsedError;
  @JsonKey(name: 'initial_kilometer')
  double get initialKilometer => throw _privateConstructorUsedError;
  @JsonKey(name: 'final_kilometer')
  double get finalKilometer => throw _privateConstructorUsedError;
  String? get point => throw _privateConstructorUsedError;
  @JsonKey(name: 'scheduled_start_date', fromJson: isoDateToDateTime)
  DateTime get scheduledStartDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'scheduled_end_date', fromJson: isoDateToDateTime)
  DateTime get scheduledEndDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'actual_start_date', fromJson: dateTimeNullable)
  DateTime? get actualStartDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'actual_end_date', fromJson: dateTimeNullable)
  DateTime? get actualEndDate => throw _privateConstructorUsedError;

  /// Serializes this VehicleRent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehicleRent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleRentCopyWith<VehicleRent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleRentCopyWith<$Res> {
  factory $VehicleRentCopyWith(
          VehicleRent value, $Res Function(VehicleRent) then) =
      _$VehicleRentCopyWithImpl<$Res, VehicleRent>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      String id,
      Department department,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'driver_id') int? driverId,
      @JsonKey(name: 'status', fromJson: _vehicleRentStatusFromString)
      VehicleRentStatus status,
      @JsonKey(name: 'type', fromJson: _vehicleRentTypeFromString)
      VehicleRentType type,
      String description,
      @JsonKey(name: 'vehicle') Vehicle? vehicle,
      @JsonKey(name: 'total_cost') double totalCost,
      @JsonKey(name: 'cost_per_kilometer') double costPerKilometer,
      @JsonKey(name: 'initial_kilometer') double initialKilometer,
      @JsonKey(name: 'final_kilometer') double finalKilometer,
      String? point,
      @JsonKey(name: 'scheduled_start_date', fromJson: isoDateToDateTime)
      DateTime scheduledStartDate,
      @JsonKey(name: 'scheduled_end_date', fromJson: isoDateToDateTime)
      DateTime scheduledEndDate,
      @JsonKey(name: 'actual_start_date', fromJson: dateTimeNullable)
      DateTime? actualStartDate,
      @JsonKey(name: 'actual_end_date', fromJson: dateTimeNullable)
      DateTime? actualEndDate});

  $DepartmentCopyWith<$Res> get department;
  $VehicleCopyWith<$Res>? get vehicle;
}

/// @nodoc
class _$VehicleRentCopyWithImpl<$Res, $Val extends VehicleRent>
    implements $VehicleRentCopyWith<$Res> {
  _$VehicleRentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehicleRent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updatedById = null,
    Object? id = null,
    Object? department = null,
    Object? userId = null,
    Object? driverId = freezed,
    Object? status = null,
    Object? type = null,
    Object? description = null,
    Object? vehicle = freezed,
    Object? totalCost = null,
    Object? costPerKilometer = null,
    Object? initialKilometer = null,
    Object? finalKilometer = null,
    Object? point = freezed,
    Object? scheduledStartDate = null,
    Object? scheduledEndDate = null,
    Object? actualStartDate = freezed,
    Object? actualEndDate = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      driverId: freezed == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as VehicleRentStatus,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as VehicleRentType,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      vehicle: freezed == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as Vehicle?,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
      costPerKilometer: null == costPerKilometer
          ? _value.costPerKilometer
          : costPerKilometer // ignore: cast_nullable_to_non_nullable
              as double,
      initialKilometer: null == initialKilometer
          ? _value.initialKilometer
          : initialKilometer // ignore: cast_nullable_to_non_nullable
              as double,
      finalKilometer: null == finalKilometer
          ? _value.finalKilometer
          : finalKilometer // ignore: cast_nullable_to_non_nullable
              as double,
      point: freezed == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledStartDate: null == scheduledStartDate
          ? _value.scheduledStartDate
          : scheduledStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scheduledEndDate: null == scheduledEndDate
          ? _value.scheduledEndDate
          : scheduledEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      actualStartDate: freezed == actualStartDate
          ? _value.actualStartDate
          : actualStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualEndDate: freezed == actualEndDate
          ? _value.actualEndDate
          : actualEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of VehicleRent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DepartmentCopyWith<$Res> get department {
    return $DepartmentCopyWith<$Res>(_value.department, (value) {
      return _then(_value.copyWith(department: value) as $Val);
    });
  }

  /// Create a copy of VehicleRent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VehicleCopyWith<$Res>? get vehicle {
    if (_value.vehicle == null) {
      return null;
    }

    return $VehicleCopyWith<$Res>(_value.vehicle!, (value) {
      return _then(_value.copyWith(vehicle: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$VehicleRentImplCopyWith<$Res>
    implements $VehicleRentCopyWith<$Res> {
  factory _$$VehicleRentImplCopyWith(
          _$VehicleRentImpl value, $Res Function(_$VehicleRentImpl) then) =
      __$$VehicleRentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      String id,
      Department department,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'driver_id') int? driverId,
      @JsonKey(name: 'status', fromJson: _vehicleRentStatusFromString)
      VehicleRentStatus status,
      @JsonKey(name: 'type', fromJson: _vehicleRentTypeFromString)
      VehicleRentType type,
      String description,
      @JsonKey(name: 'vehicle') Vehicle? vehicle,
      @JsonKey(name: 'total_cost') double totalCost,
      @JsonKey(name: 'cost_per_kilometer') double costPerKilometer,
      @JsonKey(name: 'initial_kilometer') double initialKilometer,
      @JsonKey(name: 'final_kilometer') double finalKilometer,
      String? point,
      @JsonKey(name: 'scheduled_start_date', fromJson: isoDateToDateTime)
      DateTime scheduledStartDate,
      @JsonKey(name: 'scheduled_end_date', fromJson: isoDateToDateTime)
      DateTime scheduledEndDate,
      @JsonKey(name: 'actual_start_date', fromJson: dateTimeNullable)
      DateTime? actualStartDate,
      @JsonKey(name: 'actual_end_date', fromJson: dateTimeNullable)
      DateTime? actualEndDate});

  @override
  $DepartmentCopyWith<$Res> get department;
  @override
  $VehicleCopyWith<$Res>? get vehicle;
}

/// @nodoc
class __$$VehicleRentImplCopyWithImpl<$Res>
    extends _$VehicleRentCopyWithImpl<$Res, _$VehicleRentImpl>
    implements _$$VehicleRentImplCopyWith<$Res> {
  __$$VehicleRentImplCopyWithImpl(
      _$VehicleRentImpl _value, $Res Function(_$VehicleRentImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehicleRent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updatedById = null,
    Object? id = null,
    Object? department = null,
    Object? userId = null,
    Object? driverId = freezed,
    Object? status = null,
    Object? type = null,
    Object? description = null,
    Object? vehicle = freezed,
    Object? totalCost = null,
    Object? costPerKilometer = null,
    Object? initialKilometer = null,
    Object? finalKilometer = null,
    Object? point = freezed,
    Object? scheduledStartDate = null,
    Object? scheduledEndDate = null,
    Object? actualStartDate = freezed,
    Object? actualEndDate = freezed,
  }) {
    return _then(_$VehicleRentImpl(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdById: null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedById: null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      driverId: freezed == driverId
          ? _value.driverId
          : driverId // ignore: cast_nullable_to_non_nullable
              as int?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as VehicleRentStatus,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as VehicleRentType,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      vehicle: freezed == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as Vehicle?,
      totalCost: null == totalCost
          ? _value.totalCost
          : totalCost // ignore: cast_nullable_to_non_nullable
              as double,
      costPerKilometer: null == costPerKilometer
          ? _value.costPerKilometer
          : costPerKilometer // ignore: cast_nullable_to_non_nullable
              as double,
      initialKilometer: null == initialKilometer
          ? _value.initialKilometer
          : initialKilometer // ignore: cast_nullable_to_non_nullable
              as double,
      finalKilometer: null == finalKilometer
          ? _value.finalKilometer
          : finalKilometer // ignore: cast_nullable_to_non_nullable
              as double,
      point: freezed == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as String?,
      scheduledStartDate: null == scheduledStartDate
          ? _value.scheduledStartDate
          : scheduledStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scheduledEndDate: null == scheduledEndDate
          ? _value.scheduledEndDate
          : scheduledEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      actualStartDate: freezed == actualStartDate
          ? _value.actualStartDate
          : actualStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      actualEndDate: freezed == actualEndDate
          ? _value.actualEndDate
          : actualEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleRentImpl extends _VehicleRent {
  _$VehicleRentImpl(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'updated_by_id') required this.updatedById,
      required this.id,
      required this.department,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'driver_id') this.driverId,
      @JsonKey(name: 'status', fromJson: _vehicleRentStatusFromString)
      required this.status,
      @JsonKey(name: 'type', fromJson: _vehicleRentTypeFromString)
      required this.type,
      required this.description,
      @JsonKey(name: 'vehicle') this.vehicle,
      @JsonKey(name: 'total_cost') required this.totalCost,
      @JsonKey(name: 'cost_per_kilometer') required this.costPerKilometer,
      @JsonKey(name: 'initial_kilometer') required this.initialKilometer,
      @JsonKey(name: 'final_kilometer') required this.finalKilometer,
      required this.point,
      @JsonKey(name: 'scheduled_start_date', fromJson: isoDateToDateTime)
      required this.scheduledStartDate,
      @JsonKey(name: 'scheduled_end_date', fromJson: isoDateToDateTime)
      required this.scheduledEndDate,
      @JsonKey(name: 'actual_start_date', fromJson: dateTimeNullable)
      this.actualStartDate,
      @JsonKey(name: 'actual_end_date', fromJson: dateTimeNullable)
      this.actualEndDate})
      : super._();

  factory _$VehicleRentImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleRentImplFromJson(json);

  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'created_by_id')
  final int createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'updated_by_id')
  final int updatedById;
  @override
  final String id;
  @override
  final Department department;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'driver_id')
  final int? driverId;
  @override
  @JsonKey(name: 'status', fromJson: _vehicleRentStatusFromString)
  final VehicleRentStatus status;
  @override
  @JsonKey(name: 'type', fromJson: _vehicleRentTypeFromString)
  final VehicleRentType type;
  @override
  final String description;
  @override
  @JsonKey(name: 'vehicle')
  final Vehicle? vehicle;
  @override
  @JsonKey(name: 'total_cost')
  final double totalCost;
  @override
  @JsonKey(name: 'cost_per_kilometer')
  final double costPerKilometer;
  @override
  @JsonKey(name: 'initial_kilometer')
  final double initialKilometer;
  @override
  @JsonKey(name: 'final_kilometer')
  final double finalKilometer;
  @override
  final String? point;
  @override
  @JsonKey(name: 'scheduled_start_date', fromJson: isoDateToDateTime)
  final DateTime scheduledStartDate;
  @override
  @JsonKey(name: 'scheduled_end_date', fromJson: isoDateToDateTime)
  final DateTime scheduledEndDate;
  @override
  @JsonKey(name: 'actual_start_date', fromJson: dateTimeNullable)
  final DateTime? actualStartDate;
  @override
  @JsonKey(name: 'actual_end_date', fromJson: dateTimeNullable)
  final DateTime? actualEndDate;

  @override
  String toString() {
    return 'VehicleRent(createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, updatedById: $updatedById, id: $id, department: $department, userId: $userId, driverId: $driverId, status: $status, type: $type, description: $description, vehicle: $vehicle, totalCost: $totalCost, costPerKilometer: $costPerKilometer, initialKilometer: $initialKilometer, finalKilometer: $finalKilometer, point: $point, scheduledStartDate: $scheduledStartDate, scheduledEndDate: $scheduledEndDate, actualStartDate: $actualStartDate, actualEndDate: $actualEndDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleRentImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.driverId, driverId) ||
                other.driverId == driverId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.vehicle, vehicle) || other.vehicle == vehicle) &&
            (identical(other.totalCost, totalCost) ||
                other.totalCost == totalCost) &&
            (identical(other.costPerKilometer, costPerKilometer) ||
                other.costPerKilometer == costPerKilometer) &&
            (identical(other.initialKilometer, initialKilometer) ||
                other.initialKilometer == initialKilometer) &&
            (identical(other.finalKilometer, finalKilometer) ||
                other.finalKilometer == finalKilometer) &&
            (identical(other.point, point) || other.point == point) &&
            (identical(other.scheduledStartDate, scheduledStartDate) ||
                other.scheduledStartDate == scheduledStartDate) &&
            (identical(other.scheduledEndDate, scheduledEndDate) ||
                other.scheduledEndDate == scheduledEndDate) &&
            (identical(other.actualStartDate, actualStartDate) ||
                other.actualStartDate == actualStartDate) &&
            (identical(other.actualEndDate, actualEndDate) ||
                other.actualEndDate == actualEndDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        createdAt,
        createdById,
        updatedAt,
        updatedById,
        id,
        department,
        userId,
        driverId,
        status,
        type,
        description,
        vehicle,
        totalCost,
        costPerKilometer,
        initialKilometer,
        finalKilometer,
        point,
        scheduledStartDate,
        scheduledEndDate,
        actualStartDate,
        actualEndDate
      ]);

  /// Create a copy of VehicleRent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleRentImplCopyWith<_$VehicleRentImpl> get copyWith =>
      __$$VehicleRentImplCopyWithImpl<_$VehicleRentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleRentImplToJson(
      this,
    );
  }
}

abstract class _VehicleRent extends VehicleRent {
  factory _VehicleRent(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') required final int updatedById,
      required final String id,
      required final Department department,
      @JsonKey(name: 'user_id') required final int userId,
      @JsonKey(name: 'driver_id') final int? driverId,
      @JsonKey(name: 'status', fromJson: _vehicleRentStatusFromString)
      required final VehicleRentStatus status,
      @JsonKey(name: 'type', fromJson: _vehicleRentTypeFromString)
      required final VehicleRentType type,
      required final String description,
      @JsonKey(name: 'vehicle') final Vehicle? vehicle,
      @JsonKey(name: 'total_cost') required final double totalCost,
      @JsonKey(name: 'cost_per_kilometer')
      required final double costPerKilometer,
      @JsonKey(name: 'initial_kilometer')
      required final double initialKilometer,
      @JsonKey(name: 'final_kilometer') required final double finalKilometer,
      required final String? point,
      @JsonKey(name: 'scheduled_start_date', fromJson: isoDateToDateTime)
      required final DateTime scheduledStartDate,
      @JsonKey(name: 'scheduled_end_date', fromJson: isoDateToDateTime)
      required final DateTime scheduledEndDate,
      @JsonKey(name: 'actual_start_date', fromJson: dateTimeNullable)
      final DateTime? actualStartDate,
      @JsonKey(name: 'actual_end_date', fromJson: dateTimeNullable)
      final DateTime? actualEndDate}) = _$VehicleRentImpl;
  _VehicleRent._() : super._();

  factory _VehicleRent.fromJson(Map<String, dynamic> json) =
      _$VehicleRentImpl.fromJson;

  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'created_by_id')
  int get createdById;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'updated_by_id')
  int get updatedById;
  @override
  String get id;
  @override
  Department get department;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'driver_id')
  int? get driverId;
  @override
  @JsonKey(name: 'status', fromJson: _vehicleRentStatusFromString)
  VehicleRentStatus get status;
  @override
  @JsonKey(name: 'type', fromJson: _vehicleRentTypeFromString)
  VehicleRentType get type;
  @override
  String get description;
  @override
  @JsonKey(name: 'vehicle')
  Vehicle? get vehicle;
  @override
  @JsonKey(name: 'total_cost')
  double get totalCost;
  @override
  @JsonKey(name: 'cost_per_kilometer')
  double get costPerKilometer;
  @override
  @JsonKey(name: 'initial_kilometer')
  double get initialKilometer;
  @override
  @JsonKey(name: 'final_kilometer')
  double get finalKilometer;
  @override
  String? get point;
  @override
  @JsonKey(name: 'scheduled_start_date', fromJson: isoDateToDateTime)
  DateTime get scheduledStartDate;
  @override
  @JsonKey(name: 'scheduled_end_date', fromJson: isoDateToDateTime)
  DateTime get scheduledEndDate;
  @override
  @JsonKey(name: 'actual_start_date', fromJson: dateTimeNullable)
  DateTime? get actualStartDate;
  @override
  @JsonKey(name: 'actual_end_date', fromJson: dateTimeNullable)
  DateTime? get actualEndDate;

  /// Create a copy of VehicleRent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleRentImplCopyWith<_$VehicleRentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
