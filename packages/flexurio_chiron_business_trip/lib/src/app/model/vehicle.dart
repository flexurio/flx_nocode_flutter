import 'package:flexurio_erp_core/flexurio_erp_core.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle.freezed.dart';
part 'vehicle.g.dart';

@freezed
class Vehicle with _$Vehicle {
  factory Vehicle({
    @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
    required DateTime createdAt,
    @JsonKey(name: 'created_by_id') required int createdById,
    @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
    required DateTime updatedAt,
    @JsonKey(name: 'updated_by_id') required int updatedById,
    @JsonKey(name: 'vehicle_registration_number')
    required String vehicleRegistrationNumber,
    required String brand,
    @JsonKey(
        name: 'category', fromJson: VehicleCategory.VehicleCategoryFromString)
    required VehicleCategory category,
    @JsonKey(name: 'type_fuel', fromJson: TypeFuel.TypeFuelFromString)
    required TypeFuel typeFuel,
    @JsonKey(name: 'manufacture_year') required int manufactureYear,
    @JsonKey(name: 'fuel_per_kilometer') required double fuelPerKilometer,
    @JsonKey(name: 'is_active', defaultValue: false) required bool isActive,
  }) = _Vehicle;
  const Vehicle._();

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);

  factory Vehicle.empty() {
    return Vehicle(
      createdAt: DateTime.now(),
      createdById: 0,
      updatedAt: DateTime.now(),
      updatedById: 0,
      vehicleRegistrationNumber: '',
      brand: '',
      category: VehicleCategory.empty,
      typeFuel: TypeFuel.empty,
      manufactureYear: 0,
      fuelPerKilometer: 0,
      isActive: false,
    );
  }
}

enum TypeFuel implements ColorType {
  gasoline('Gasoline', Colors.orange),
  diesel('Diesel', Colors.green),
  empty('', Colors.transparent);

  const TypeFuel(this.label, this.color);

  @override
  final String label;
  @override
  final Color color;

  static TypeFuel TypeFuelFromString(String type) {
    if (type == TypeFuel.gasoline.label) {
      return TypeFuel.gasoline;
    }
    if (type == TypeFuel.diesel.label) {
      return TypeFuel.diesel;
    }
    if (type == TypeFuel.empty.label) {
      return TypeFuel.empty;
    }
    throw ArgumentError();
  }
}

enum VehicleCategory implements ColorType {
  mobilPenumpang('Mobil Penumpang', Colors.orange),
  l300Box('L300 Box', Colors.green),
  coldDiesel('Colt Diesel', Colors.blue),
  empty('', Colors.transparent);

  const VehicleCategory(this.label, this.color);

  @override
  final String label;
  @override
  final Color color;

  static VehicleCategory VehicleCategoryFromString(String type) {
    if (type == VehicleCategory.mobilPenumpang.label) {
      return VehicleCategory.mobilPenumpang;
    }
    if (type == VehicleCategory.l300Box.label) {
      return VehicleCategory.l300Box;
    }
    if (type == VehicleCategory.coldDiesel.label) {
      return VehicleCategory.coldDiesel;
    }
    if (type == VehicleCategory.empty.label) {
      return VehicleCategory.empty;
    }
    throw ArgumentError();
  }
}
