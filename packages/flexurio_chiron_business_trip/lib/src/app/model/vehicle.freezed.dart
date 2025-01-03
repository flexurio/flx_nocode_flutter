// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Vehicle _$VehicleFromJson(Map<String, dynamic> json) {
  return _Vehicle.fromJson(json);
}

/// @nodoc
mixin _$Vehicle {
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updatedById => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_registration_number')
  String get vehicleRegistrationNumber => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'category', fromJson: VehicleCategory.VehicleCategoryFromString)
  VehicleCategory get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_fuel', fromJson: TypeFuel.TypeFuelFromString)
  TypeFuel get typeFuel => throw _privateConstructorUsedError;
  @JsonKey(name: 'manufacture_year')
  int get manufactureYear => throw _privateConstructorUsedError;
  @JsonKey(name: 'fuel_per_kilometer')
  double get fuelPerKilometer => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_active', defaultValue: false)
  bool get isActive => throw _privateConstructorUsedError;

  /// Serializes this Vehicle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehicleCopyWith<Vehicle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehicleCopyWith<$Res> {
  factory $VehicleCopyWith(Vehicle value, $Res Function(Vehicle) then) =
      _$VehicleCopyWithImpl<$Res, Vehicle>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'vehicle_registration_number')
      String vehicleRegistrationNumber,
      String brand,
      @JsonKey(
          name: 'category', fromJson: VehicleCategory.VehicleCategoryFromString)
      VehicleCategory category,
      @JsonKey(name: 'type_fuel', fromJson: TypeFuel.TypeFuelFromString)
      TypeFuel typeFuel,
      @JsonKey(name: 'manufacture_year') int manufactureYear,
      @JsonKey(name: 'fuel_per_kilometer') double fuelPerKilometer,
      @JsonKey(name: 'is_active', defaultValue: false) bool isActive});
}

/// @nodoc
class _$VehicleCopyWithImpl<$Res, $Val extends Vehicle>
    implements $VehicleCopyWith<$Res> {
  _$VehicleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updatedById = null,
    Object? vehicleRegistrationNumber = null,
    Object? brand = null,
    Object? category = null,
    Object? typeFuel = null,
    Object? manufactureYear = null,
    Object? fuelPerKilometer = null,
    Object? isActive = null,
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
      vehicleRegistrationNumber: null == vehicleRegistrationNumber
          ? _value.vehicleRegistrationNumber
          : vehicleRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as VehicleCategory,
      typeFuel: null == typeFuel
          ? _value.typeFuel
          : typeFuel // ignore: cast_nullable_to_non_nullable
              as TypeFuel,
      manufactureYear: null == manufactureYear
          ? _value.manufactureYear
          : manufactureYear // ignore: cast_nullable_to_non_nullable
              as int,
      fuelPerKilometer: null == fuelPerKilometer
          ? _value.fuelPerKilometer
          : fuelPerKilometer // ignore: cast_nullable_to_non_nullable
              as double,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehicleImplCopyWith<$Res> implements $VehicleCopyWith<$Res> {
  factory _$$VehicleImplCopyWith(
          _$VehicleImpl value, $Res Function(_$VehicleImpl) then) =
      __$$VehicleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'vehicle_registration_number')
      String vehicleRegistrationNumber,
      String brand,
      @JsonKey(
          name: 'category', fromJson: VehicleCategory.VehicleCategoryFromString)
      VehicleCategory category,
      @JsonKey(name: 'type_fuel', fromJson: TypeFuel.TypeFuelFromString)
      TypeFuel typeFuel,
      @JsonKey(name: 'manufacture_year') int manufactureYear,
      @JsonKey(name: 'fuel_per_kilometer') double fuelPerKilometer,
      @JsonKey(name: 'is_active', defaultValue: false) bool isActive});
}

/// @nodoc
class __$$VehicleImplCopyWithImpl<$Res>
    extends _$VehicleCopyWithImpl<$Res, _$VehicleImpl>
    implements _$$VehicleImplCopyWith<$Res> {
  __$$VehicleImplCopyWithImpl(
      _$VehicleImpl _value, $Res Function(_$VehicleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updatedById = null,
    Object? vehicleRegistrationNumber = null,
    Object? brand = null,
    Object? category = null,
    Object? typeFuel = null,
    Object? manufactureYear = null,
    Object? fuelPerKilometer = null,
    Object? isActive = null,
  }) {
    return _then(_$VehicleImpl(
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
      vehicleRegistrationNumber: null == vehicleRegistrationNumber
          ? _value.vehicleRegistrationNumber
          : vehicleRegistrationNumber // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as VehicleCategory,
      typeFuel: null == typeFuel
          ? _value.typeFuel
          : typeFuel // ignore: cast_nullable_to_non_nullable
              as TypeFuel,
      manufactureYear: null == manufactureYear
          ? _value.manufactureYear
          : manufactureYear // ignore: cast_nullable_to_non_nullable
              as int,
      fuelPerKilometer: null == fuelPerKilometer
          ? _value.fuelPerKilometer
          : fuelPerKilometer // ignore: cast_nullable_to_non_nullable
              as double,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehicleImpl extends _Vehicle {
  _$VehicleImpl(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'updated_by_id') required this.updatedById,
      @JsonKey(name: 'vehicle_registration_number')
      required this.vehicleRegistrationNumber,
      required this.brand,
      @JsonKey(
          name: 'category', fromJson: VehicleCategory.VehicleCategoryFromString)
      required this.category,
      @JsonKey(name: 'type_fuel', fromJson: TypeFuel.TypeFuelFromString)
      required this.typeFuel,
      @JsonKey(name: 'manufacture_year') required this.manufactureYear,
      @JsonKey(name: 'fuel_per_kilometer') required this.fuelPerKilometer,
      @JsonKey(name: 'is_active', defaultValue: false) required this.isActive})
      : super._();

  factory _$VehicleImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehicleImplFromJson(json);

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
  @JsonKey(name: 'vehicle_registration_number')
  final String vehicleRegistrationNumber;
  @override
  final String brand;
  @override
  @JsonKey(
      name: 'category', fromJson: VehicleCategory.VehicleCategoryFromString)
  final VehicleCategory category;
  @override
  @JsonKey(name: 'type_fuel', fromJson: TypeFuel.TypeFuelFromString)
  final TypeFuel typeFuel;
  @override
  @JsonKey(name: 'manufacture_year')
  final int manufactureYear;
  @override
  @JsonKey(name: 'fuel_per_kilometer')
  final double fuelPerKilometer;
  @override
  @JsonKey(name: 'is_active', defaultValue: false)
  final bool isActive;

  @override
  String toString() {
    return 'Vehicle(createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, updatedById: $updatedById, vehicleRegistrationNumber: $vehicleRegistrationNumber, brand: $brand, category: $category, typeFuel: $typeFuel, manufactureYear: $manufactureYear, fuelPerKilometer: $fuelPerKilometer, isActive: $isActive)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehicleImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.vehicleRegistrationNumber,
                    vehicleRegistrationNumber) ||
                other.vehicleRegistrationNumber == vehicleRegistrationNumber) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.typeFuel, typeFuel) ||
                other.typeFuel == typeFuel) &&
            (identical(other.manufactureYear, manufactureYear) ||
                other.manufactureYear == manufactureYear) &&
            (identical(other.fuelPerKilometer, fuelPerKilometer) ||
                other.fuelPerKilometer == fuelPerKilometer) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      createdById,
      updatedAt,
      updatedById,
      vehicleRegistrationNumber,
      brand,
      category,
      typeFuel,
      manufactureYear,
      fuelPerKilometer,
      isActive);

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehicleImplCopyWith<_$VehicleImpl> get copyWith =>
      __$$VehicleImplCopyWithImpl<_$VehicleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehicleImplToJson(
      this,
    );
  }
}

abstract class _Vehicle extends Vehicle {
  factory _Vehicle(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') required final int updatedById,
      @JsonKey(name: 'vehicle_registration_number')
      required final String vehicleRegistrationNumber,
      required final String brand,
      @JsonKey(
          name: 'category', fromJson: VehicleCategory.VehicleCategoryFromString)
      required final VehicleCategory category,
      @JsonKey(name: 'type_fuel', fromJson: TypeFuel.TypeFuelFromString)
      required final TypeFuel typeFuel,
      @JsonKey(name: 'manufacture_year') required final int manufactureYear,
      @JsonKey(name: 'fuel_per_kilometer')
      required final double fuelPerKilometer,
      @JsonKey(name: 'is_active', defaultValue: false)
      required final bool isActive}) = _$VehicleImpl;
  _Vehicle._() : super._();

  factory _Vehicle.fromJson(Map<String, dynamic> json) = _$VehicleImpl.fromJson;

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
  @JsonKey(name: 'vehicle_registration_number')
  String get vehicleRegistrationNumber;
  @override
  String get brand;
  @override
  @JsonKey(
      name: 'category', fromJson: VehicleCategory.VehicleCategoryFromString)
  VehicleCategory get category;
  @override
  @JsonKey(name: 'type_fuel', fromJson: TypeFuel.TypeFuelFromString)
  TypeFuel get typeFuel;
  @override
  @JsonKey(name: 'manufacture_year')
  int get manufactureYear;
  @override
  @JsonKey(name: 'fuel_per_kilometer')
  double get fuelPerKilometer;
  @override
  @JsonKey(name: 'is_active', defaultValue: false)
  bool get isActive;

  /// Create a copy of Vehicle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehicleImplCopyWith<_$VehicleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
