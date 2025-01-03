// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_rent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleRentImpl _$$VehicleRentImplFromJson(Map<String, dynamic> json) =>
    _$VehicleRentImpl(
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      updatedById: (json['updated_by_id'] as num).toInt(),
      id: json['id'] as String,
      department:
          Department.fromJson(json['department'] as Map<String, dynamic>),
      userId: (json['user_id'] as num).toInt(),
      driverId: (json['driver_id'] as num?)?.toInt(),
      status: _vehicleRentStatusFromString(json['status'] as String),
      type: _vehicleRentTypeFromString(json['type'] as String),
      description: json['description'] as String,
      vehicle: json['vehicle'] == null
          ? null
          : Vehicle.fromJson(json['vehicle'] as Map<String, dynamic>),
      totalCost: (json['total_cost'] as num).toDouble(),
      costPerKilometer: (json['cost_per_kilometer'] as num).toDouble(),
      initialKilometer: (json['initial_kilometer'] as num).toDouble(),
      finalKilometer: (json['final_kilometer'] as num).toDouble(),
      point: json['point'] as String?,
      scheduledStartDate:
          isoDateToDateTime(json['scheduled_start_date'] as String?),
      scheduledEndDate:
          isoDateToDateTime(json['scheduled_end_date'] as String?),
      actualStartDate: dateTimeNullable(json['actual_start_date'] as String?),
      actualEndDate: dateTimeNullable(json['actual_end_date'] as String?),
    );

Map<String, dynamic> _$$VehicleRentImplToJson(_$VehicleRentImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updatedById,
      'id': instance.id,
      'department': instance.department,
      'user_id': instance.userId,
      'driver_id': instance.driverId,
      'status': _$VehicleRentStatusEnumMap[instance.status]!,
      'type': _$VehicleRentTypeEnumMap[instance.type]!,
      'description': instance.description,
      'vehicle': instance.vehicle,
      'total_cost': instance.totalCost,
      'cost_per_kilometer': instance.costPerKilometer,
      'initial_kilometer': instance.initialKilometer,
      'final_kilometer': instance.finalKilometer,
      'point': instance.point,
      'scheduled_start_date': instance.scheduledStartDate.toIso8601String(),
      'scheduled_end_date': instance.scheduledEndDate.toIso8601String(),
      'actual_start_date': instance.actualStartDate?.toIso8601String(),
      'actual_end_date': instance.actualEndDate?.toIso8601String(),
    };

const _$VehicleRentStatusEnumMap = {
  VehicleRentStatus.input: 'input',
  VehicleRentStatus.approveCs: 'approveCs',
  VehicleRentStatus.approveManager: 'approveManager',
  VehicleRentStatus.rejectManager: 'rejectManager',
  VehicleRentStatus.rejectCs: 'rejectCs',
  VehicleRentStatus.closed: 'closed',
  VehicleRentStatus.empty: 'empty',
};

const _$VehicleRentTypeEnumMap = {
  VehicleRentType.dinas: 'dinas',
  VehicleRentType.pribadi: 'pribadi',
  VehicleRentType.empty: 'empty',
};
