// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'fuel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Fuel _$FuelFromJson(Map<String, dynamic> json) {
  return _Fuel.fromJson(json);
}

/// @nodoc
mixin _$Fuel {
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updatedById => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date', fromJson: isoDateToDateTime)
  DateTime get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date', fromJson: isoDateToDateTime)
  DateTime get endDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'type_fuel')
  String get typeFuel => throw _privateConstructorUsedError;
  String get brand => throw _privateConstructorUsedError;

  /// Serializes this Fuel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Fuel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FuelCopyWith<Fuel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FuelCopyWith<$Res> {
  factory $FuelCopyWith(Fuel value, $Res Function(Fuel) then) =
      _$FuelCopyWithImpl<$Res, Fuel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      int id,
      String name,
      double price,
      @JsonKey(name: 'start_date', fromJson: isoDateToDateTime)
      DateTime startDate,
      @JsonKey(name: 'end_date', fromJson: isoDateToDateTime) DateTime endDate,
      @JsonKey(name: 'type_fuel') String typeFuel,
      String brand});
}

/// @nodoc
class _$FuelCopyWithImpl<$Res, $Val extends Fuel>
    implements $FuelCopyWith<$Res> {
  _$FuelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Fuel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updatedById = null,
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? typeFuel = null,
    Object? brand = null,
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
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      typeFuel: null == typeFuel
          ? _value.typeFuel
          : typeFuel // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FuelImplCopyWith<$Res> implements $FuelCopyWith<$Res> {
  factory _$$FuelImplCopyWith(
          _$FuelImpl value, $Res Function(_$FuelImpl) then) =
      __$$FuelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      int id,
      String name,
      double price,
      @JsonKey(name: 'start_date', fromJson: isoDateToDateTime)
      DateTime startDate,
      @JsonKey(name: 'end_date', fromJson: isoDateToDateTime) DateTime endDate,
      @JsonKey(name: 'type_fuel') String typeFuel,
      String brand});
}

/// @nodoc
class __$$FuelImplCopyWithImpl<$Res>
    extends _$FuelCopyWithImpl<$Res, _$FuelImpl>
    implements _$$FuelImplCopyWith<$Res> {
  __$$FuelImplCopyWithImpl(_$FuelImpl _value, $Res Function(_$FuelImpl) _then)
      : super(_value, _then);

  /// Create a copy of Fuel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updatedById = null,
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? startDate = null,
    Object? endDate = null,
    Object? typeFuel = null,
    Object? brand = null,
  }) {
    return _then(_$FuelImpl(
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
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endDate: null == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      typeFuel: null == typeFuel
          ? _value.typeFuel
          : typeFuel // ignore: cast_nullable_to_non_nullable
              as String,
      brand: null == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FuelImpl extends _Fuel {
  _$FuelImpl(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'updated_by_id') required this.updatedById,
      required this.id,
      required this.name,
      required this.price,
      @JsonKey(name: 'start_date', fromJson: isoDateToDateTime)
      required this.startDate,
      @JsonKey(name: 'end_date', fromJson: isoDateToDateTime)
      required this.endDate,
      @JsonKey(name: 'type_fuel') required this.typeFuel,
      required this.brand})
      : super._();

  factory _$FuelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FuelImplFromJson(json);

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
  final int id;
  @override
  final String name;
  @override
  final double price;
  @override
  @JsonKey(name: 'start_date', fromJson: isoDateToDateTime)
  final DateTime startDate;
  @override
  @JsonKey(name: 'end_date', fromJson: isoDateToDateTime)
  final DateTime endDate;
  @override
  @JsonKey(name: 'type_fuel')
  final String typeFuel;
  @override
  final String brand;

  @override
  String toString() {
    return 'Fuel(createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, updatedById: $updatedById, id: $id, name: $name, price: $price, startDate: $startDate, endDate: $endDate, typeFuel: $typeFuel, brand: $brand)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FuelImpl &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.typeFuel, typeFuel) ||
                other.typeFuel == typeFuel) &&
            (identical(other.brand, brand) || other.brand == brand));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      createdAt,
      createdById,
      updatedAt,
      updatedById,
      id,
      name,
      price,
      startDate,
      endDate,
      typeFuel,
      brand);

  /// Create a copy of Fuel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FuelImplCopyWith<_$FuelImpl> get copyWith =>
      __$$FuelImplCopyWithImpl<_$FuelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FuelImplToJson(
      this,
    );
  }
}

abstract class _Fuel extends Fuel {
  factory _Fuel(
      {@JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') required final int updatedById,
      required final int id,
      required final String name,
      required final double price,
      @JsonKey(name: 'start_date', fromJson: isoDateToDateTime)
      required final DateTime startDate,
      @JsonKey(name: 'end_date', fromJson: isoDateToDateTime)
      required final DateTime endDate,
      @JsonKey(name: 'type_fuel') required final String typeFuel,
      required final String brand}) = _$FuelImpl;
  _Fuel._() : super._();

  factory _Fuel.fromJson(Map<String, dynamic> json) = _$FuelImpl.fromJson;

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
  int get id;
  @override
  String get name;
  @override
  double get price;
  @override
  @JsonKey(name: 'start_date', fromJson: isoDateToDateTime)
  DateTime get startDate;
  @override
  @JsonKey(name: 'end_date', fromJson: isoDateToDateTime)
  DateTime get endDate;
  @override
  @JsonKey(name: 'type_fuel')
  String get typeFuel;
  @override
  String get brand;

  /// Create a copy of Fuel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FuelImplCopyWith<_$FuelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
