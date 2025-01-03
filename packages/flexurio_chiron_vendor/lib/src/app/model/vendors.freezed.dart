// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vendors.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Vendor _$VendorFromJson(Map<String, dynamic> json) {
  return _Vendors.fromJson(json);
}

/// @nodoc
mixin _$Vendor {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'city_name')
  String get city => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_name')
  String get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'postal_code')
  int get postalCode => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get fax => throw _privateConstructorUsedError;
  String get pic => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get npwp => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Vendor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Vendor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VendorCopyWith<Vendor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VendorCopyWith<$Res> {
  factory $VendorCopyWith(Vendor value, $Res Function(Vendor) then) =
      _$VendorCopyWithImpl<$Res, Vendor>;
  @useResult
  $Res call(
      {String id,
      String name,
      String address,
      @JsonKey(name: 'city_name') String city,
      @JsonKey(name: 'country_name') String country,
      @JsonKey(name: 'postal_code') int postalCode,
      String phone,
      String fax,
      String pic,
      String email,
      String npwp,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt});
}

/// @nodoc
class _$VendorCopyWithImpl<$Res, $Val extends Vendor>
    implements $VendorCopyWith<$Res> {
  _$VendorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Vendor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? city = null,
    Object? country = null,
    Object? postalCode = null,
    Object? phone = null,
    Object? fax = null,
    Object? pic = null,
    Object? email = null,
    Object? npwp = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as int,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      fax: null == fax
          ? _value.fax
          : fax // ignore: cast_nullable_to_non_nullable
              as String,
      pic: null == pic
          ? _value.pic
          : pic // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      npwp: null == npwp
          ? _value.npwp
          : npwp // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VendorsImplCopyWith<$Res> implements $VendorCopyWith<$Res> {
  factory _$$VendorsImplCopyWith(
          _$VendorsImpl value, $Res Function(_$VendorsImpl) then) =
      __$$VendorsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String address,
      @JsonKey(name: 'city_name') String city,
      @JsonKey(name: 'country_name') String country,
      @JsonKey(name: 'postal_code') int postalCode,
      String phone,
      String fax,
      String pic,
      String email,
      String npwp,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt});
}

/// @nodoc
class __$$VendorsImplCopyWithImpl<$Res>
    extends _$VendorCopyWithImpl<$Res, _$VendorsImpl>
    implements _$$VendorsImplCopyWith<$Res> {
  __$$VendorsImplCopyWithImpl(
      _$VendorsImpl _value, $Res Function(_$VendorsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Vendor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? address = null,
    Object? city = null,
    Object? country = null,
    Object? postalCode = null,
    Object? phone = null,
    Object? fax = null,
    Object? pic = null,
    Object? email = null,
    Object? npwp = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$VendorsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as int,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      fax: null == fax
          ? _value.fax
          : fax // ignore: cast_nullable_to_non_nullable
              as String,
      pic: null == pic
          ? _value.pic
          : pic // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      npwp: null == npwp
          ? _value.npwp
          : npwp // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VendorsImpl extends _Vendors {
  const _$VendorsImpl(
      {required this.id,
      required this.name,
      required this.address,
      @JsonKey(name: 'city_name') required this.city,
      @JsonKey(name: 'country_name') required this.country,
      @JsonKey(name: 'postal_code') required this.postalCode,
      required this.phone,
      required this.fax,
      required this.pic,
      required this.email,
      required this.npwp,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt})
      : super._();

  factory _$VendorsImpl.fromJson(Map<String, dynamic> json) =>
      _$$VendorsImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String address;
  @override
  @JsonKey(name: 'city_name')
  final String city;
  @override
  @JsonKey(name: 'country_name')
  final String country;
  @override
  @JsonKey(name: 'postal_code')
  final int postalCode;
  @override
  final String phone;
  @override
  final String fax;
  @override
  final String pic;
  @override
  final String email;
  @override
  final String npwp;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Vendor(id: $id, name: $name, address: $address, city: $city, country: $country, postalCode: $postalCode, phone: $phone, fax: $fax, pic: $pic, email: $email, npwp: $npwp, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VendorsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.fax, fax) || other.fax == fax) &&
            (identical(other.pic, pic) || other.pic == pic) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.npwp, npwp) || other.npwp == npwp) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, address, city, country,
      postalCode, phone, fax, pic, email, npwp, createdAt, updatedAt);

  /// Create a copy of Vendor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VendorsImplCopyWith<_$VendorsImpl> get copyWith =>
      __$$VendorsImplCopyWithImpl<_$VendorsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VendorsImplToJson(
      this,
    );
  }
}

abstract class _Vendors extends Vendor {
  const factory _Vendors(
      {required final String id,
      required final String name,
      required final String address,
      @JsonKey(name: 'city_name') required final String city,
      @JsonKey(name: 'country_name') required final String country,
      @JsonKey(name: 'postal_code') required final int postalCode,
      required final String phone,
      required final String fax,
      required final String pic,
      required final String email,
      required final String npwp,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt}) = _$VendorsImpl;
  const _Vendors._() : super._();

  factory _Vendors.fromJson(Map<String, dynamic> json) = _$VendorsImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get address;
  @override
  @JsonKey(name: 'city_name')
  String get city;
  @override
  @JsonKey(name: 'country_name')
  String get country;
  @override
  @JsonKey(name: 'postal_code')
  int get postalCode;
  @override
  String get phone;
  @override
  String get fax;
  @override
  String get pic;
  @override
  String get email;
  @override
  String get npwp;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;

  /// Create a copy of Vendor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VendorsImplCopyWith<_$VendorsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
