// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Customer _$CustomerFromJson(Map<String, dynamic> json) {
  return _Customer.fromJson(json);
}

/// @nodoc
mixin _$Customer {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updatedById => throw _privateConstructorUsedError;
  @JsonKey(name: 'city_name')
  String get cityName => throw _privateConstructorUsedError;
  @JsonKey(name: 'country_name')
  String get countryName => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get fax => throw _privateConstructorUsedError;
  String get pic => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get npwp => throw _privateConstructorUsedError;
  String get nppkp => throw _privateConstructorUsedError;
  String get province => throw _privateConstructorUsedError;
  String? get parent => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_type', fromJson: _customerTypeFromString)
  CustomerType get customerType => throw _privateConstructorUsedError;
  @JsonKey(name: 'customer_category', fromJson: _customerCategoryFromString)
  CustomerCategory get customerCategory => throw _privateConstructorUsedError;
  @JsonKey(name: 'postal_code', defaultValue: 0)
  int? get postalCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_administration', defaultValue: false)
  bool? get isAdministration => throw _privateConstructorUsedError;
  @JsonKey(name: 'term_of_payment', defaultValue: 0)
  int? get termOfPayment => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount', defaultValue: 0)
  double? get discount => throw _privateConstructorUsedError;

  /// Serializes this Customer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CustomerCopyWith<Customer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CustomerCopyWith<$Res> {
  factory $CustomerCopyWith(Customer value, $Res Function(Customer) then) =
      _$CustomerCopyWithImpl<$Res, Customer>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'city_name') String cityName,
      @JsonKey(name: 'country_name') String countryName,
      String name,
      String address,
      String phone,
      String fax,
      String pic,
      String email,
      String npwp,
      String nppkp,
      String province,
      String? parent,
      @JsonKey(name: 'customer_type', fromJson: _customerTypeFromString)
      CustomerType customerType,
      @JsonKey(name: 'customer_category', fromJson: _customerCategoryFromString)
      CustomerCategory customerCategory,
      @JsonKey(name: 'postal_code', defaultValue: 0) int? postalCode,
      @JsonKey(name: 'is_administration', defaultValue: false)
      bool? isAdministration,
      @JsonKey(name: 'term_of_payment', defaultValue: 0) int? termOfPayment,
      @JsonKey(name: 'discount', defaultValue: 0) double? discount});
}

/// @nodoc
class _$CustomerCopyWithImpl<$Res, $Val extends Customer>
    implements $CustomerCopyWith<$Res> {
  _$CustomerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updatedById = null,
    Object? cityName = null,
    Object? countryName = null,
    Object? name = null,
    Object? address = null,
    Object? phone = null,
    Object? fax = null,
    Object? pic = null,
    Object? email = null,
    Object? npwp = null,
    Object? nppkp = null,
    Object? province = null,
    Object? parent = freezed,
    Object? customerType = null,
    Object? customerCategory = null,
    Object? postalCode = freezed,
    Object? isAdministration = freezed,
    Object? termOfPayment = freezed,
    Object? discount = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      cityName: null == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      countryName: null == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
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
      nppkp: null == nppkp
          ? _value.nppkp
          : nppkp // ignore: cast_nullable_to_non_nullable
              as String,
      province: null == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      customerType: null == customerType
          ? _value.customerType
          : customerType // ignore: cast_nullable_to_non_nullable
              as CustomerType,
      customerCategory: null == customerCategory
          ? _value.customerCategory
          : customerCategory // ignore: cast_nullable_to_non_nullable
              as CustomerCategory,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as int?,
      isAdministration: freezed == isAdministration
          ? _value.isAdministration
          : isAdministration // ignore: cast_nullable_to_non_nullable
              as bool?,
      termOfPayment: freezed == termOfPayment
          ? _value.termOfPayment
          : termOfPayment // ignore: cast_nullable_to_non_nullable
              as int?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CustomerImplCopyWith<$Res>
    implements $CustomerCopyWith<$Res> {
  factory _$$CustomerImplCopyWith(
          _$CustomerImpl value, $Res Function(_$CustomerImpl) then) =
      __$$CustomerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'city_name') String cityName,
      @JsonKey(name: 'country_name') String countryName,
      String name,
      String address,
      String phone,
      String fax,
      String pic,
      String email,
      String npwp,
      String nppkp,
      String province,
      String? parent,
      @JsonKey(name: 'customer_type', fromJson: _customerTypeFromString)
      CustomerType customerType,
      @JsonKey(name: 'customer_category', fromJson: _customerCategoryFromString)
      CustomerCategory customerCategory,
      @JsonKey(name: 'postal_code', defaultValue: 0) int? postalCode,
      @JsonKey(name: 'is_administration', defaultValue: false)
      bool? isAdministration,
      @JsonKey(name: 'term_of_payment', defaultValue: 0) int? termOfPayment,
      @JsonKey(name: 'discount', defaultValue: 0) double? discount});
}

/// @nodoc
class __$$CustomerImplCopyWithImpl<$Res>
    extends _$CustomerCopyWithImpl<$Res, _$CustomerImpl>
    implements _$$CustomerImplCopyWith<$Res> {
  __$$CustomerImplCopyWithImpl(
      _$CustomerImpl _value, $Res Function(_$CustomerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updatedById = null,
    Object? cityName = null,
    Object? countryName = null,
    Object? name = null,
    Object? address = null,
    Object? phone = null,
    Object? fax = null,
    Object? pic = null,
    Object? email = null,
    Object? npwp = null,
    Object? nppkp = null,
    Object? province = null,
    Object? parent = freezed,
    Object? customerType = null,
    Object? customerCategory = null,
    Object? postalCode = freezed,
    Object? isAdministration = freezed,
    Object? termOfPayment = freezed,
    Object? discount = freezed,
  }) {
    return _then(_$CustomerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
      cityName: null == cityName
          ? _value.cityName
          : cityName // ignore: cast_nullable_to_non_nullable
              as String,
      countryName: null == countryName
          ? _value.countryName
          : countryName // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
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
      nppkp: null == nppkp
          ? _value.nppkp
          : nppkp // ignore: cast_nullable_to_non_nullable
              as String,
      province: null == province
          ? _value.province
          : province // ignore: cast_nullable_to_non_nullable
              as String,
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      customerType: null == customerType
          ? _value.customerType
          : customerType // ignore: cast_nullable_to_non_nullable
              as CustomerType,
      customerCategory: null == customerCategory
          ? _value.customerCategory
          : customerCategory // ignore: cast_nullable_to_non_nullable
              as CustomerCategory,
      postalCode: freezed == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as int?,
      isAdministration: freezed == isAdministration
          ? _value.isAdministration
          : isAdministration // ignore: cast_nullable_to_non_nullable
              as bool?,
      termOfPayment: freezed == termOfPayment
          ? _value.termOfPayment
          : termOfPayment // ignore: cast_nullable_to_non_nullable
              as int?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CustomerImpl extends _Customer {
  const _$CustomerImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'updated_by_id') required this.updatedById,
      @JsonKey(name: 'city_name') required this.cityName,
      @JsonKey(name: 'country_name') required this.countryName,
      required this.name,
      required this.address,
      required this.phone,
      required this.fax,
      required this.pic,
      required this.email,
      required this.npwp,
      required this.nppkp,
      required this.province,
      required this.parent,
      @JsonKey(name: 'customer_type', fromJson: _customerTypeFromString)
      required this.customerType,
      @JsonKey(name: 'customer_category', fromJson: _customerCategoryFromString)
      required this.customerCategory,
      @JsonKey(name: 'postal_code', defaultValue: 0) this.postalCode,
      @JsonKey(name: 'is_administration', defaultValue: false)
      this.isAdministration,
      @JsonKey(name: 'term_of_payment', defaultValue: 0) this.termOfPayment,
      @JsonKey(name: 'discount', defaultValue: 0) this.discount})
      : super._();

  factory _$CustomerImpl.fromJson(Map<String, dynamic> json) =>
      _$$CustomerImplFromJson(json);

  @override
  final String id;
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
  @JsonKey(name: 'city_name')
  final String cityName;
  @override
  @JsonKey(name: 'country_name')
  final String countryName;
  @override
  final String name;
  @override
  final String address;
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
  final String nppkp;
  @override
  final String province;
  @override
  final String? parent;
  @override
  @JsonKey(name: 'customer_type', fromJson: _customerTypeFromString)
  final CustomerType customerType;
  @override
  @JsonKey(name: 'customer_category', fromJson: _customerCategoryFromString)
  final CustomerCategory customerCategory;
  @override
  @JsonKey(name: 'postal_code', defaultValue: 0)
  final int? postalCode;
  @override
  @JsonKey(name: 'is_administration', defaultValue: false)
  final bool? isAdministration;
  @override
  @JsonKey(name: 'term_of_payment', defaultValue: 0)
  final int? termOfPayment;
  @override
  @JsonKey(name: 'discount', defaultValue: 0)
  final double? discount;

  @override
  String toString() {
    return 'Customer(id: $id, createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, updatedById: $updatedById, cityName: $cityName, countryName: $countryName, name: $name, address: $address, phone: $phone, fax: $fax, pic: $pic, email: $email, npwp: $npwp, nppkp: $nppkp, province: $province, parent: $parent, customerType: $customerType, customerCategory: $customerCategory, postalCode: $postalCode, isAdministration: $isAdministration, termOfPayment: $termOfPayment, discount: $discount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CustomerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.cityName, cityName) ||
                other.cityName == cityName) &&
            (identical(other.countryName, countryName) ||
                other.countryName == countryName) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.fax, fax) || other.fax == fax) &&
            (identical(other.pic, pic) || other.pic == pic) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.npwp, npwp) || other.npwp == npwp) &&
            (identical(other.nppkp, nppkp) || other.nppkp == nppkp) &&
            (identical(other.province, province) ||
                other.province == province) &&
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.customerType, customerType) ||
                other.customerType == customerType) &&
            (identical(other.customerCategory, customerCategory) ||
                other.customerCategory == customerCategory) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.isAdministration, isAdministration) ||
                other.isAdministration == isAdministration) &&
            (identical(other.termOfPayment, termOfPayment) ||
                other.termOfPayment == termOfPayment) &&
            (identical(other.discount, discount) ||
                other.discount == discount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        createdAt,
        createdById,
        updatedAt,
        updatedById,
        cityName,
        countryName,
        name,
        address,
        phone,
        fax,
        pic,
        email,
        npwp,
        nppkp,
        province,
        parent,
        customerType,
        customerCategory,
        postalCode,
        isAdministration,
        termOfPayment,
        discount
      ]);

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      __$$CustomerImplCopyWithImpl<_$CustomerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CustomerImplToJson(
      this,
    );
  }
}

abstract class _Customer extends Customer {
  const factory _Customer(
      {required final String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') required final int updatedById,
      @JsonKey(name: 'city_name') required final String cityName,
      @JsonKey(name: 'country_name') required final String countryName,
      required final String name,
      required final String address,
      required final String phone,
      required final String fax,
      required final String pic,
      required final String email,
      required final String npwp,
      required final String nppkp,
      required final String province,
      required final String? parent,
      @JsonKey(name: 'customer_type', fromJson: _customerTypeFromString)
      required final CustomerType customerType,
      @JsonKey(name: 'customer_category', fromJson: _customerCategoryFromString)
      required final CustomerCategory customerCategory,
      @JsonKey(name: 'postal_code', defaultValue: 0) final int? postalCode,
      @JsonKey(name: 'is_administration', defaultValue: false)
      final bool? isAdministration,
      @JsonKey(name: 'term_of_payment', defaultValue: 0)
      final int? termOfPayment,
      @JsonKey(name: 'discount', defaultValue: 0)
      final double? discount}) = _$CustomerImpl;
  const _Customer._() : super._();

  factory _Customer.fromJson(Map<String, dynamic> json) =
      _$CustomerImpl.fromJson;

  @override
  String get id;
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
  @JsonKey(name: 'city_name')
  String get cityName;
  @override
  @JsonKey(name: 'country_name')
  String get countryName;
  @override
  String get name;
  @override
  String get address;
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
  String get nppkp;
  @override
  String get province;
  @override
  String? get parent;
  @override
  @JsonKey(name: 'customer_type', fromJson: _customerTypeFromString)
  CustomerType get customerType;
  @override
  @JsonKey(name: 'customer_category', fromJson: _customerCategoryFromString)
  CustomerCategory get customerCategory;
  @override
  @JsonKey(name: 'postal_code', defaultValue: 0)
  int? get postalCode;
  @override
  @JsonKey(name: 'is_administration', defaultValue: false)
  bool? get isAdministration;
  @override
  @JsonKey(name: 'term_of_payment', defaultValue: 0)
  int? get termOfPayment;
  @override
  @JsonKey(name: 'discount', defaultValue: 0)
  double? get discount;

  /// Create a copy of Customer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CustomerImplCopyWith<_$CustomerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
