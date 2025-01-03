// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehicleImpl _$$VehicleImplFromJson(Map<String, dynamic> json) =>
    _$VehicleImpl(
      createdAt: isoDateToDateTime(json['created_at'] as String?),
      createdById: (json['created_by_id'] as num).toInt(),
      updatedAt: isoDateToDateTime(json['updated_at'] as String?),
      updatedById: (json['updated_by_id'] as num).toInt(),
      vehicleRegistrationNumber: json['vehicle_registration_number'] as String,
      brand: json['brand'] as String,
      category:
          VehicleCategory.VehicleCategoryFromString(json['category'] as String),
      typeFuel: TypeFuel.TypeFuelFromString(json['type_fuel'] as String),
      manufactureYear: (json['manufacture_year'] as num).toInt(),
      fuelPerKilometer: (json['fuel_per_kilometer'] as num).toDouble(),
      isActive: json['is_active'] as bool? ?? false,
    );

Map<String, dynamic> _$$VehicleImplToJson(_$VehicleImpl instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'created_by_id': instance.createdById,
      'updated_at': instance.updatedAt.toIso8601String(),
      'updated_by_id': instance.updatedById,
      'vehicle_registration_number': instance.vehicleRegistrationNumber,
      'brand': instance.brand,
      'category': _$VehicleCategoryEnumMap[instance.category]!,
      'type_fuel': _$TypeFuelEnumMap[instance.typeFuel]!,
      'manufacture_year': instance.manufactureYear,
      'fuel_per_kilometer': instance.fuelPerKilometer,
      'is_active': instance.isActive,
    };

const _$VehicleCategoryEnumMap = {
  VehicleCategory.mobilPenumpang: 'mobilPenumpang',
  VehicleCategory.l300Box: 'l300Box',
  VehicleCategory.coldDiesel: 'coldDiesel',
  VehicleCategory.empty: 'empty',
};

const _$TypeFuelEnumMap = {
  TypeFuel.gasoline: 'gasoline',
  TypeFuel.diesel: 'diesel',
  TypeFuel.empty: 'empty',
};
