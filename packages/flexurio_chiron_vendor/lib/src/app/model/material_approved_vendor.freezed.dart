// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'material_approved_vendor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialApprovedVendor _$MaterialApprovedVendorFromJson(
    Map<String, dynamic> json) {
  return _MaterialApprovedVendor.fromJson(json);
}

/// @nodoc
mixin _$MaterialApprovedVendor {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'halal_certificate_expired', fromJson: dateTimeNullable)
  DateTime? get halalCertificateExpired => throw _privateConstructorUsedError;
  @JsonKey(name: 'halal_institution', defaultValue: '')
  String get halalInstitution => throw _privateConstructorUsedError;
  @JsonKey(name: 'halal_no_certificate')
  String get halalNoCertificate => throw _privateConstructorUsedError;
  @JsonKey(name: 'storage_procedure')
  String get storageProcedure => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _categoryFromString)
  MaterialApprovedVendorCategory get category =>
      throw _privateConstructorUsedError;
  @JsonKey(fromJson: _typeFromString)
  MaterialApprovedVendorType get type => throw _privateConstructorUsedError;
  Material get material => throw _privateConstructorUsedError;
  Supplier get supplier => throw _privateConstructorUsedError;
  Vendor get vendor => throw _privateConstructorUsedError;
  @JsonKey(name: 'certificate_document')
  String get sertificateDocument => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_enable', defaultValue: false)
  bool get isEnable => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this MaterialApprovedVendor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaterialApprovedVendor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialApprovedVendorCopyWith<MaterialApprovedVendor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialApprovedVendorCopyWith<$Res> {
  factory $MaterialApprovedVendorCopyWith(MaterialApprovedVendor value,
          $Res Function(MaterialApprovedVendor) then) =
      _$MaterialApprovedVendorCopyWithImpl<$Res, MaterialApprovedVendor>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'halal_certificate_expired', fromJson: dateTimeNullable)
      DateTime? halalCertificateExpired,
      @JsonKey(name: 'halal_institution', defaultValue: '')
      String halalInstitution,
      @JsonKey(name: 'halal_no_certificate') String halalNoCertificate,
      @JsonKey(name: 'storage_procedure') String storageProcedure,
      String? description,
      @JsonKey(fromJson: _categoryFromString)
      MaterialApprovedVendorCategory category,
      @JsonKey(fromJson: _typeFromString) MaterialApprovedVendorType type,
      Material material,
      Supplier supplier,
      Vendor vendor,
      @JsonKey(name: 'certificate_document') String sertificateDocument,
      @JsonKey(name: 'is_enable', defaultValue: false) bool isEnable,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt});

  $MaterialCopyWith<$Res> get material;
  $SupplierCopyWith<$Res> get supplier;
  $VendorCopyWith<$Res> get vendor;
}

/// @nodoc
class _$MaterialApprovedVendorCopyWithImpl<$Res,
        $Val extends MaterialApprovedVendor>
    implements $MaterialApprovedVendorCopyWith<$Res> {
  _$MaterialApprovedVendorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialApprovedVendor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? halalCertificateExpired = freezed,
    Object? halalInstitution = null,
    Object? halalNoCertificate = null,
    Object? storageProcedure = null,
    Object? description = freezed,
    Object? category = null,
    Object? type = null,
    Object? material = null,
    Object? supplier = null,
    Object? vendor = null,
    Object? sertificateDocument = null,
    Object? isEnable = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      halalCertificateExpired: freezed == halalCertificateExpired
          ? _value.halalCertificateExpired
          : halalCertificateExpired // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      halalInstitution: null == halalInstitution
          ? _value.halalInstitution
          : halalInstitution // ignore: cast_nullable_to_non_nullable
              as String,
      halalNoCertificate: null == halalNoCertificate
          ? _value.halalNoCertificate
          : halalNoCertificate // ignore: cast_nullable_to_non_nullable
              as String,
      storageProcedure: null == storageProcedure
          ? _value.storageProcedure
          : storageProcedure // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as MaterialApprovedVendorCategory,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MaterialApprovedVendorType,
      material: null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
      supplier: null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier,
      vendor: null == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as Vendor,
      sertificateDocument: null == sertificateDocument
          ? _value.sertificateDocument
          : sertificateDocument // ignore: cast_nullable_to_non_nullable
              as String,
      isEnable: null == isEnable
          ? _value.isEnable
          : isEnable // ignore: cast_nullable_to_non_nullable
              as bool,
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

  /// Create a copy of MaterialApprovedVendor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialCopyWith<$Res> get material {
    return $MaterialCopyWith<$Res>(_value.material, (value) {
      return _then(_value.copyWith(material: value) as $Val);
    });
  }

  /// Create a copy of MaterialApprovedVendor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SupplierCopyWith<$Res> get supplier {
    return $SupplierCopyWith<$Res>(_value.supplier, (value) {
      return _then(_value.copyWith(supplier: value) as $Val);
    });
  }

  /// Create a copy of MaterialApprovedVendor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VendorCopyWith<$Res> get vendor {
    return $VendorCopyWith<$Res>(_value.vendor, (value) {
      return _then(_value.copyWith(vendor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MaterialApprovedVendorImplCopyWith<$Res>
    implements $MaterialApprovedVendorCopyWith<$Res> {
  factory _$$MaterialApprovedVendorImplCopyWith(
          _$MaterialApprovedVendorImpl value,
          $Res Function(_$MaterialApprovedVendorImpl) then) =
      __$$MaterialApprovedVendorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'halal_certificate_expired', fromJson: dateTimeNullable)
      DateTime? halalCertificateExpired,
      @JsonKey(name: 'halal_institution', defaultValue: '')
      String halalInstitution,
      @JsonKey(name: 'halal_no_certificate') String halalNoCertificate,
      @JsonKey(name: 'storage_procedure') String storageProcedure,
      String? description,
      @JsonKey(fromJson: _categoryFromString)
      MaterialApprovedVendorCategory category,
      @JsonKey(fromJson: _typeFromString) MaterialApprovedVendorType type,
      Material material,
      Supplier supplier,
      Vendor vendor,
      @JsonKey(name: 'certificate_document') String sertificateDocument,
      @JsonKey(name: 'is_enable', defaultValue: false) bool isEnable,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt});

  @override
  $MaterialCopyWith<$Res> get material;
  @override
  $SupplierCopyWith<$Res> get supplier;
  @override
  $VendorCopyWith<$Res> get vendor;
}

/// @nodoc
class __$$MaterialApprovedVendorImplCopyWithImpl<$Res>
    extends _$MaterialApprovedVendorCopyWithImpl<$Res,
        _$MaterialApprovedVendorImpl>
    implements _$$MaterialApprovedVendorImplCopyWith<$Res> {
  __$$MaterialApprovedVendorImplCopyWithImpl(
      _$MaterialApprovedVendorImpl _value,
      $Res Function(_$MaterialApprovedVendorImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialApprovedVendor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? halalCertificateExpired = freezed,
    Object? halalInstitution = null,
    Object? halalNoCertificate = null,
    Object? storageProcedure = null,
    Object? description = freezed,
    Object? category = null,
    Object? type = null,
    Object? material = null,
    Object? supplier = null,
    Object? vendor = null,
    Object? sertificateDocument = null,
    Object? isEnable = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$MaterialApprovedVendorImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == halalCertificateExpired
          ? _value.halalCertificateExpired
          : halalCertificateExpired // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      null == halalInstitution
          ? _value.halalInstitution
          : halalInstitution // ignore: cast_nullable_to_non_nullable
              as String,
      null == halalNoCertificate
          ? _value.halalNoCertificate
          : halalNoCertificate // ignore: cast_nullable_to_non_nullable
              as String,
      null == storageProcedure
          ? _value.storageProcedure
          : storageProcedure // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as MaterialApprovedVendorCategory,
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MaterialApprovedVendorType,
      null == material
          ? _value.material
          : material // ignore: cast_nullable_to_non_nullable
              as Material,
      null == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as Supplier,
      null == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as Vendor,
      null == sertificateDocument
          ? _value.sertificateDocument
          : sertificateDocument // ignore: cast_nullable_to_non_nullable
              as String,
      null == isEnable
          ? _value.isEnable
          : isEnable // ignore: cast_nullable_to_non_nullable
              as bool,
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
class _$MaterialApprovedVendorImpl extends _MaterialApprovedVendor {
  const _$MaterialApprovedVendorImpl(
      this.id,
      @JsonKey(name: 'halal_certificate_expired', fromJson: dateTimeNullable)
      this.halalCertificateExpired,
      @JsonKey(name: 'halal_institution', defaultValue: '')
      this.halalInstitution,
      @JsonKey(name: 'halal_no_certificate') this.halalNoCertificate,
      @JsonKey(name: 'storage_procedure') this.storageProcedure,
      this.description,
      @JsonKey(fromJson: _categoryFromString) this.category,
      @JsonKey(fromJson: _typeFromString) this.type,
      this.material,
      this.supplier,
      this.vendor,
      @JsonKey(name: 'certificate_document') this.sertificateDocument,
      @JsonKey(name: 'is_enable', defaultValue: false) this.isEnable,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) this.createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) this.updatedAt)
      : super._();

  factory _$MaterialApprovedVendorImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialApprovedVendorImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'halal_certificate_expired', fromJson: dateTimeNullable)
  final DateTime? halalCertificateExpired;
  @override
  @JsonKey(name: 'halal_institution', defaultValue: '')
  final String halalInstitution;
  @override
  @JsonKey(name: 'halal_no_certificate')
  final String halalNoCertificate;
  @override
  @JsonKey(name: 'storage_procedure')
  final String storageProcedure;
  @override
  final String? description;
  @override
  @JsonKey(fromJson: _categoryFromString)
  final MaterialApprovedVendorCategory category;
  @override
  @JsonKey(fromJson: _typeFromString)
  final MaterialApprovedVendorType type;
  @override
  final Material material;
  @override
  final Supplier supplier;
  @override
  final Vendor vendor;
  @override
  @JsonKey(name: 'certificate_document')
  final String sertificateDocument;
  @override
  @JsonKey(name: 'is_enable', defaultValue: false)
  final bool isEnable;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  final DateTime updatedAt;

  @override
  String toString() {
    return 'MaterialApprovedVendor(id: $id, halalCertificateExpired: $halalCertificateExpired, halalInstitution: $halalInstitution, halalNoCertificate: $halalNoCertificate, storageProcedure: $storageProcedure, description: $description, category: $category, type: $type, material: $material, supplier: $supplier, vendor: $vendor, sertificateDocument: $sertificateDocument, isEnable: $isEnable, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialApprovedVendorImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(
                    other.halalCertificateExpired, halalCertificateExpired) ||
                other.halalCertificateExpired == halalCertificateExpired) &&
            (identical(other.halalInstitution, halalInstitution) ||
                other.halalInstitution == halalInstitution) &&
            (identical(other.halalNoCertificate, halalNoCertificate) ||
                other.halalNoCertificate == halalNoCertificate) &&
            (identical(other.storageProcedure, storageProcedure) ||
                other.storageProcedure == storageProcedure) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.material, material) ||
                other.material == material) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            (identical(other.sertificateDocument, sertificateDocument) ||
                other.sertificateDocument == sertificateDocument) &&
            (identical(other.isEnable, isEnable) ||
                other.isEnable == isEnable) &&
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
      halalCertificateExpired,
      halalInstitution,
      halalNoCertificate,
      storageProcedure,
      description,
      category,
      type,
      material,
      supplier,
      vendor,
      sertificateDocument,
      isEnable,
      createdAt,
      updatedAt);

  /// Create a copy of MaterialApprovedVendor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialApprovedVendorImplCopyWith<_$MaterialApprovedVendorImpl>
      get copyWith => __$$MaterialApprovedVendorImplCopyWithImpl<
          _$MaterialApprovedVendorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialApprovedVendorImplToJson(
      this,
    );
  }
}

abstract class _MaterialApprovedVendor extends MaterialApprovedVendor {
  const factory _MaterialApprovedVendor(
      final int id,
      @JsonKey(name: 'halal_certificate_expired', fromJson: dateTimeNullable)
      final DateTime? halalCertificateExpired,
      @JsonKey(name: 'halal_institution', defaultValue: '')
      final String halalInstitution,
      @JsonKey(name: 'halal_no_certificate') final String halalNoCertificate,
      @JsonKey(name: 'storage_procedure') final String storageProcedure,
      final String? description,
      @JsonKey(fromJson: _categoryFromString)
      final MaterialApprovedVendorCategory category,
      @JsonKey(fromJson: _typeFromString) final MaterialApprovedVendorType type,
      final Material material,
      final Supplier supplier,
      final Vendor vendor,
      @JsonKey(name: 'certificate_document') final String sertificateDocument,
      @JsonKey(name: 'is_enable', defaultValue: false) final bool isEnable,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      final DateTime createdAt,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      final DateTime updatedAt) = _$MaterialApprovedVendorImpl;
  const _MaterialApprovedVendor._() : super._();

  factory _MaterialApprovedVendor.fromJson(Map<String, dynamic> json) =
      _$MaterialApprovedVendorImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'halal_certificate_expired', fromJson: dateTimeNullable)
  DateTime? get halalCertificateExpired;
  @override
  @JsonKey(name: 'halal_institution', defaultValue: '')
  String get halalInstitution;
  @override
  @JsonKey(name: 'halal_no_certificate')
  String get halalNoCertificate;
  @override
  @JsonKey(name: 'storage_procedure')
  String get storageProcedure;
  @override
  String? get description;
  @override
  @JsonKey(fromJson: _categoryFromString)
  MaterialApprovedVendorCategory get category;
  @override
  @JsonKey(fromJson: _typeFromString)
  MaterialApprovedVendorType get type;
  @override
  Material get material;
  @override
  Supplier get supplier;
  @override
  Vendor get vendor;
  @override
  @JsonKey(name: 'certificate_document')
  String get sertificateDocument;
  @override
  @JsonKey(name: 'is_enable', defaultValue: false)
  bool get isEnable;
  @override
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt;

  /// Create a copy of MaterialApprovedVendor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialApprovedVendorImplCopyWith<_$MaterialApprovedVendorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
