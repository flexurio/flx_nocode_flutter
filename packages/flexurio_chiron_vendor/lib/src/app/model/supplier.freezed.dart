// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'supplier.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Supplier _$SupplierFromJson(Map<String, dynamic> json) {
  return _Supplier.fromJson(json);
}

/// @nodoc
mixin _$Supplier {
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
  @JsonKey(name: 'term_of_payment')
  int get termOfPayment => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Supplier to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Supplier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SupplierCopyWith<Supplier> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SupplierCopyWith<$Res> {
  factory $SupplierCopyWith(Supplier value, $Res Function(Supplier) then) =
      _$SupplierCopyWithImpl<$Res, Supplier>;
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
      @JsonKey(name: 'term_of_payment') int termOfPayment,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt});
}

/// @nodoc
class _$SupplierCopyWithImpl<$Res, $Val extends Supplier>
    implements $SupplierCopyWith<$Res> {
  _$SupplierCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Supplier
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
    Object? termOfPayment = null,
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
      termOfPayment: null == termOfPayment
          ? _value.termOfPayment
          : termOfPayment // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$SupplierImplCopyWith<$Res>
    implements $SupplierCopyWith<$Res> {
  factory _$$SupplierImplCopyWith(
          _$SupplierImpl value, $Res Function(_$SupplierImpl) then) =
      __$$SupplierImplCopyWithImpl<$Res>;
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
      @JsonKey(name: 'term_of_payment') int termOfPayment,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt});
}

/// @nodoc
class __$$SupplierImplCopyWithImpl<$Res>
    extends _$SupplierCopyWithImpl<$Res, _$SupplierImpl>
    implements _$$SupplierImplCopyWith<$Res> {
  __$$SupplierImplCopyWithImpl(
      _$SupplierImpl _value, $Res Function(_$SupplierImpl) _then)
      : super(_value, _then);

  /// Create a copy of Supplier
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
    Object? termOfPayment = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$SupplierImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as int,
      null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      null == fax
          ? _value.fax
          : fax // ignore: cast_nullable_to_non_nullable
              as String,
      null == pic
          ? _value.pic
          : pic // ignore: cast_nullable_to_non_nullable
              as String,
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == npwp
          ? _value.npwp
          : npwp // ignore: cast_nullable_to_non_nullable
              as String,
      null == termOfPayment
          ? _value.termOfPayment
          : termOfPayment // ignore: cast_nullable_to_non_nullable
              as int,
      null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SupplierImpl extends _Supplier {
  const _$SupplierImpl(
      this.id,
      this.name,
      this.address,
      @JsonKey(name: 'city_name') this.city,
      @JsonKey(name: 'country_name') this.country,
      @JsonKey(name: 'postal_code') this.postalCode,
      this.phone,
      this.fax,
      this.pic,
      this.email,
      this.npwp,
      @JsonKey(name: 'term_of_payment') this.termOfPayment,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) this.updatedAt)
      : super._();

  factory _$SupplierImpl.fromJson(Map<String, dynamic> json) =>
      _$$SupplierImplFromJson(json);

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
  @JsonKey(name: 'term_of_payment')
  final int termOfPayment;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Supplier(id: $id, name: $name, address: $address, city: $city, country: $country, postalCode: $postalCode, phone: $phone, fax: $fax, pic: $pic, email: $email, npwp: $npwp, termOfPayment: $termOfPayment, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SupplierImpl &&
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
            (identical(other.termOfPayment, termOfPayment) ||
                other.termOfPayment == termOfPayment) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      address,
      city,
      country,
      postalCode,
      phone,
      fax,
      pic,
      email,
      npwp,
      termOfPayment,
      createdAt,
      updatedAt);

  /// Create a copy of Supplier
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SupplierImplCopyWith<_$SupplierImpl> get copyWith =>
      __$$SupplierImplCopyWithImpl<_$SupplierImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SupplierImplToJson(
      this,
    );
  }
}

abstract class _Supplier extends Supplier {
  const factory _Supplier(
      final String id,
      final String name,
      final String address,
      @JsonKey(name: 'city_name') final String city,
      @JsonKey(name: 'country_name') final String country,
      @JsonKey(name: 'postal_code') final int postalCode,
      final String phone,
      final String fax,
      final String pic,
      final String email,
      final String npwp,
      @JsonKey(name: 'term_of_payment') final int termOfPayment,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      final DateTime updatedAt) = _$SupplierImpl;
  const _Supplier._() : super._();

  factory _Supplier.fromJson(Map<String, dynamic> json) =
      _$SupplierImpl.fromJson;

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
  @JsonKey(name: 'term_of_payment')
  int get termOfPayment;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;

  /// Create a copy of Supplier
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SupplierImplCopyWith<_$SupplierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
