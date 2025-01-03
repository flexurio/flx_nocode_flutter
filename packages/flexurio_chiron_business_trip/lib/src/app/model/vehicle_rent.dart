import 'package:flexurio_chiron_company/flexurio_chiron_company.dart';
import 'package:flexurio_chiron_business_trip/src/app/model/vehicle.dart';
import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_rent.freezed.dart';
part 'vehicle_rent.g.dart';

enum VehicleRentStatus implements ColorType {
  input('INPUT', Colors.orange),
  approveCs('APPROVE CS', Colors.blue),
  approveManager('APPROVE MANAGER', Color.fromARGB(255, 76, 175, 80)),
  rejectManager('REJECT MANAGER', Colors.red),
  rejectCs('REJECT CS', Color.fromARGB(255, 186, 59, 70)),
  closed('CLOSED', Colors.teal),
  empty('', Colors.transparent);

  const VehicleRentStatus(this.status, this.color);

  @override
  String get label => status;

  @override
  final Color color;
  final String status;
}

enum VehicleRentType implements ColorType {
  dinas('dinas', 'DINAS', Colors.orange),
  pribadi('pribadi', 'PRIBADI', Colors.blue),
  empty('', '', Colors.transparent);

  const VehicleRentType(this.type, this.label, this.color);

  @override
  final Color color;
  final String label;
  final String type;
}

@freezed
class VehicleRent with _$VehicleRent {
  factory VehicleRent({
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') required int updatedById,
    required String id,
    required Department department,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'driver_id') int? driverId,
    @JsonKey(name: 'status', fromJson: _vehicleRentStatusFromString)
    required VehicleRentStatus status,
    @JsonKey(name: 'type', fromJson: _vehicleRentTypeFromString)
    required VehicleRentType type,
    required String description,
    @JsonKey(name: 'vehicle') Vehicle? vehicle,
    @JsonKey(name: 'total_cost') required double totalCost,
    @JsonKey(name: 'cost_per_kilometer') required double costPerKilometer,
    @JsonKey(name: 'initial_kilometer') required double initialKilometer,
    @JsonKey(name: 'final_kilometer') required double finalKilometer,
    required String? point,
    @JsonKey(name: 'scheduled_start_date', fromJson: isoDateToDateTime)
    required DateTime scheduledStartDate,
    @JsonKey(name: 'scheduled_end_date', fromJson: isoDateToDateTime)
    required DateTime scheduledEndDate,
    @JsonKey(name: 'actual_start_date', fromJson: dateTimeNullable)
    DateTime? actualStartDate,
    @JsonKey(name: 'actual_end_date', fromJson: dateTimeNullable)
    DateTime? actualEndDate,
  }) = _VehicleRent;
  const VehicleRent._();

  factory VehicleRent.empty() {
    return VehicleRent(
      createdAt: DateTime(0),
      createdById: 0,
      updatedAt: DateTime(0),
      updatedById: 0,
      id: '',
      department: Department.empty(),
      userId: 0,
      status: VehicleRentStatus.empty,
      type: VehicleRentType.empty,
      description: '',
      totalCost: 0,
      costPerKilometer: 0,
      initialKilometer: 0,
      finalKilometer: 0,
      scheduledStartDate: DateTime(0),
      scheduledEndDate: DateTime(0),
      point: '',
    );
  }

  factory VehicleRent.fromJson(Map<String, dynamic> json) =>
      _$VehicleRentFromJson(json);
}

VehicleRentStatus _vehicleRentStatusFromString(String type) {
  if (type == VehicleRentStatus.input.status) {
    return VehicleRentStatus.input;
  }
  if (type == VehicleRentStatus.approveCs.status) {
    return VehicleRentStatus.approveCs;
  }
  if (type == VehicleRentStatus.approveManager.status) {
    return VehicleRentStatus.approveManager;
  }
  if (type == VehicleRentStatus.rejectCs.status) {
    return VehicleRentStatus.rejectCs;
  }
  if (type == VehicleRentStatus.rejectManager.status) {
    return VehicleRentStatus.rejectManager;
  }
  if (type == VehicleRentStatus.closed.status) {
    return VehicleRentStatus.closed;
  }
  if (type == VehicleRentStatus.empty.status) {
    return VehicleRentStatus.empty;
  }
  throw ArgumentError();
}

VehicleRentType _vehicleRentTypeFromString(String type) {
  if (type == VehicleRentType.pribadi.type) {
    return VehicleRentType.pribadi;
  }
  if (type == VehicleRentType.dinas.type) {
    return VehicleRentType.dinas;
  }
  if (type == VehicleRentType.empty.type) {
    return VehicleRentType.empty;
  }
  throw ArgumentError();
}

class VehicleRentFormHeader {
  VehicleRentFormHeader({
    this.driver,
    this.vehicle,
    this.department,
    this.user,
    this.requestBy,
    this.totalCost,
    this.startDate,
    this.endDate,
    this.description,
    this.id,
    this.status,
    this.costPerKilometer,
    this.initialKilometer,
    this.finalKilometer,
    this.point,
    this.type,
  });

  factory VehicleRentFormHeader.empty() => VehicleRentFormHeader(
        driver: null,
        vehicle: Vehicle.empty(),
        department: Department.empty(),
        user: 0,
        requestBy: 0,
        totalCost: 0,
        startDate: DateTime.now(),
        endDate: DateTime.now(),
        description: '',
        id: '',
        status: '',
        costPerKilometer: 0,
        initialKilometer: 0,
        finalKilometer: 0,
        point: '',
        type: VehicleRentType.empty,
      );

  final int? driver;
  final Vehicle? vehicle;
  final Department? department;
  final int? user;
  final int? requestBy;
  final double? totalCost;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? description;
  final String? id;
  final String? status;
  final double? costPerKilometer;
  final double? initialKilometer;
  final double? finalKilometer;
  final String? point;
  final VehicleRentType? type;
}
