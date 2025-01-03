// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MaterialRequest _$MaterialRequestFromJson(Map<String, dynamic> json) {
  return _MaterialRequest.fromJson(json);
}

/// @nodoc
mixin _$MaterialRequest {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updateById => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
  DateTime get dateOfNeed => throw _privateConstructorUsedError;
  @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
  DateTime get deliveryDate => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
  MaterialGroup get materialGroup => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Vendor.fromJsonNullable)
  Vendor? get vendor => throw _privateConstructorUsedError;
  @JsonKey(fromJson: Department.fromJson)
  Department get department => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'department_budgeting',
      fromJson: Department.fromJson,
      defaultValue: Department.empty)
  Department get departmentBudgeting => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _materialRequestStatusFromString)
  PurchaseRequestStatus get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_printed_by_id')
  int? get isPrintById => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_printed_at', fromJson: isoDateToDateTime)
  DateTime? get isPrintAt => throw _privateConstructorUsedError;

  /// Serializes this MaterialRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MaterialRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MaterialRequestCopyWith<MaterialRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MaterialRequestCopyWith<$Res> {
  factory $MaterialRequestCopyWith(
          MaterialRequest value, $Res Function(MaterialRequest) then) =
      _$MaterialRequestCopyWithImpl<$Res, MaterialRequest>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
      DateTime dateOfNeed,
      @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
      DateTime deliveryDate,
      String description,
      @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
      MaterialGroup materialGroup,
      @JsonKey(fromJson: Vendor.fromJsonNullable) Vendor? vendor,
      @JsonKey(fromJson: Department.fromJson) Department department,
      @JsonKey(
          name: 'department_budgeting',
          fromJson: Department.fromJson,
          defaultValue: Department.empty)
      Department departmentBudgeting,
      @JsonKey(fromJson: _materialRequestStatusFromString)
      PurchaseRequestStatus status,
      @JsonKey(name: 'is_printed_by_id') int? isPrintById,
      @JsonKey(name: 'is_printed_at', fromJson: isoDateToDateTime)
      DateTime? isPrintAt});

  $MaterialGroupCopyWith<$Res> get materialGroup;
  $VendorCopyWith<$Res>? get vendor;
  $DepartmentCopyWith<$Res> get department;
  $DepartmentCopyWith<$Res> get departmentBudgeting;
}

/// @nodoc
class _$MaterialRequestCopyWithImpl<$Res, $Val extends MaterialRequest>
    implements $MaterialRequestCopyWith<$Res> {
  _$MaterialRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MaterialRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
    Object? dateOfNeed = null,
    Object? deliveryDate = null,
    Object? description = null,
    Object? materialGroup = null,
    Object? vendor = freezed,
    Object? department = null,
    Object? departmentBudgeting = null,
    Object? status = null,
    Object? isPrintById = freezed,
    Object? isPrintAt = freezed,
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
      updateById: null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
      dateOfNeed: null == dateOfNeed
          ? _value.dateOfNeed
          : dateOfNeed // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryDate: null == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroup: null == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      vendor: freezed == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as Vendor?,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      departmentBudgeting: null == departmentBudgeting
          ? _value.departmentBudgeting
          : departmentBudgeting // ignore: cast_nullable_to_non_nullable
              as Department,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PurchaseRequestStatus,
      isPrintById: freezed == isPrintById
          ? _value.isPrintById
          : isPrintById // ignore: cast_nullable_to_non_nullable
              as int?,
      isPrintAt: freezed == isPrintAt
          ? _value.isPrintAt
          : isPrintAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of MaterialRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MaterialGroupCopyWith<$Res> get materialGroup {
    return $MaterialGroupCopyWith<$Res>(_value.materialGroup, (value) {
      return _then(_value.copyWith(materialGroup: value) as $Val);
    });
  }

  /// Create a copy of MaterialRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VendorCopyWith<$Res>? get vendor {
    if (_value.vendor == null) {
      return null;
    }

    return $VendorCopyWith<$Res>(_value.vendor!, (value) {
      return _then(_value.copyWith(vendor: value) as $Val);
    });
  }

  /// Create a copy of MaterialRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DepartmentCopyWith<$Res> get department {
    return $DepartmentCopyWith<$Res>(_value.department, (value) {
      return _then(_value.copyWith(department: value) as $Val);
    });
  }

  /// Create a copy of MaterialRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DepartmentCopyWith<$Res> get departmentBudgeting {
    return $DepartmentCopyWith<$Res>(_value.departmentBudgeting, (value) {
      return _then(_value.copyWith(departmentBudgeting: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MaterialRequestImplCopyWith<$Res>
    implements $MaterialRequestCopyWith<$Res> {
  factory _$$MaterialRequestImplCopyWith(_$MaterialRequestImpl value,
          $Res Function(_$MaterialRequestImpl) then) =
      __$$MaterialRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updateById,
      @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
      DateTime dateOfNeed,
      @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
      DateTime deliveryDate,
      String description,
      @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
      MaterialGroup materialGroup,
      @JsonKey(fromJson: Vendor.fromJsonNullable) Vendor? vendor,
      @JsonKey(fromJson: Department.fromJson) Department department,
      @JsonKey(
          name: 'department_budgeting',
          fromJson: Department.fromJson,
          defaultValue: Department.empty)
      Department departmentBudgeting,
      @JsonKey(fromJson: _materialRequestStatusFromString)
      PurchaseRequestStatus status,
      @JsonKey(name: 'is_printed_by_id') int? isPrintById,
      @JsonKey(name: 'is_printed_at', fromJson: isoDateToDateTime)
      DateTime? isPrintAt});

  @override
  $MaterialGroupCopyWith<$Res> get materialGroup;
  @override
  $VendorCopyWith<$Res>? get vendor;
  @override
  $DepartmentCopyWith<$Res> get department;
  @override
  $DepartmentCopyWith<$Res> get departmentBudgeting;
}

/// @nodoc
class __$$MaterialRequestImplCopyWithImpl<$Res>
    extends _$MaterialRequestCopyWithImpl<$Res, _$MaterialRequestImpl>
    implements _$$MaterialRequestImplCopyWith<$Res> {
  __$$MaterialRequestImplCopyWithImpl(
      _$MaterialRequestImpl _value, $Res Function(_$MaterialRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of MaterialRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updateById = null,
    Object? dateOfNeed = null,
    Object? deliveryDate = null,
    Object? description = null,
    Object? materialGroup = null,
    Object? vendor = freezed,
    Object? department = null,
    Object? departmentBudgeting = null,
    Object? status = null,
    Object? isPrintById = freezed,
    Object? isPrintAt = freezed,
  }) {
    return _then(_$MaterialRequestImpl(
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
      updateById: null == updateById
          ? _value.updateById
          : updateById // ignore: cast_nullable_to_non_nullable
              as int,
      dateOfNeed: null == dateOfNeed
          ? _value.dateOfNeed
          : dateOfNeed // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryDate: null == deliveryDate
          ? _value.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      materialGroup: null == materialGroup
          ? _value.materialGroup
          : materialGroup // ignore: cast_nullable_to_non_nullable
              as MaterialGroup,
      vendor: freezed == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as Vendor?,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as Department,
      departmentBudgeting: null == departmentBudgeting
          ? _value.departmentBudgeting
          : departmentBudgeting // ignore: cast_nullable_to_non_nullable
              as Department,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as PurchaseRequestStatus,
      isPrintById: freezed == isPrintById
          ? _value.isPrintById
          : isPrintById // ignore: cast_nullable_to_non_nullable
              as int?,
      isPrintAt: freezed == isPrintAt
          ? _value.isPrintAt
          : isPrintAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MaterialRequestImpl extends _MaterialRequest {
  const _$MaterialRequestImpl(
      {required this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required this.createdAt,
      @JsonKey(name: 'created_by_id') required this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required this.updatedAt,
      @JsonKey(name: 'updated_by_id') required this.updateById,
      @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
      required this.dateOfNeed,
      @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
      required this.deliveryDate,
      required this.description,
      @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
      required this.materialGroup,
      @JsonKey(fromJson: Vendor.fromJsonNullable) required this.vendor,
      @JsonKey(fromJson: Department.fromJson) required this.department,
      @JsonKey(
          name: 'department_budgeting',
          fromJson: Department.fromJson,
          defaultValue: Department.empty)
      required this.departmentBudgeting,
      @JsonKey(fromJson: _materialRequestStatusFromString) required this.status,
      @JsonKey(name: 'is_printed_by_id') this.isPrintById,
      @JsonKey(name: 'is_printed_at', fromJson: isoDateToDateTime)
      this.isPrintAt})
      : super._();

  factory _$MaterialRequestImpl.fromJson(Map<String, dynamic> json) =>
      _$$MaterialRequestImplFromJson(json);

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
  final int updateById;
  @override
  @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
  final DateTime dateOfNeed;
  @override
  @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
  final DateTime deliveryDate;
  @override
  final String description;
  @override
  @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
  final MaterialGroup materialGroup;
  @override
  @JsonKey(fromJson: Vendor.fromJsonNullable)
  final Vendor? vendor;
  @override
  @JsonKey(fromJson: Department.fromJson)
  final Department department;
  @override
  @JsonKey(
      name: 'department_budgeting',
      fromJson: Department.fromJson,
      defaultValue: Department.empty)
  final Department departmentBudgeting;
  @override
  @JsonKey(fromJson: _materialRequestStatusFromString)
  final PurchaseRequestStatus status;
  @override
  @JsonKey(name: 'is_printed_by_id')
  final int? isPrintById;
  @override
  @JsonKey(name: 'is_printed_at', fromJson: isoDateToDateTime)
  final DateTime? isPrintAt;

  @override
  String toString() {
    return 'MaterialRequest(id: $id, createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, updateById: $updateById, dateOfNeed: $dateOfNeed, deliveryDate: $deliveryDate, description: $description, materialGroup: $materialGroup, vendor: $vendor, department: $department, departmentBudgeting: $departmentBudgeting, status: $status, isPrintById: $isPrintById, isPrintAt: $isPrintAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MaterialRequestImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updateById, updateById) ||
                other.updateById == updateById) &&
            (identical(other.dateOfNeed, dateOfNeed) ||
                other.dateOfNeed == dateOfNeed) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.materialGroup, materialGroup) ||
                other.materialGroup == materialGroup) &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.departmentBudgeting, departmentBudgeting) ||
                other.departmentBudgeting == departmentBudgeting) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isPrintById, isPrintById) ||
                other.isPrintById == isPrintById) &&
            (identical(other.isPrintAt, isPrintAt) ||
                other.isPrintAt == isPrintAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      createdById,
      updatedAt,
      updateById,
      dateOfNeed,
      deliveryDate,
      description,
      materialGroup,
      vendor,
      department,
      departmentBudgeting,
      status,
      isPrintById,
      isPrintAt);

  /// Create a copy of MaterialRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MaterialRequestImplCopyWith<_$MaterialRequestImpl> get copyWith =>
      __$$MaterialRequestImplCopyWithImpl<_$MaterialRequestImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MaterialRequestImplToJson(
      this,
    );
  }
}

abstract class _MaterialRequest extends MaterialRequest {
  const factory _MaterialRequest(
      {required final String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      required final DateTime createdAt,
      @JsonKey(name: 'created_by_id') required final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      required final DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') required final int updateById,
      @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
      required final DateTime dateOfNeed,
      @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
      required final DateTime deliveryDate,
      required final String description,
      @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
      required final MaterialGroup materialGroup,
      @JsonKey(fromJson: Vendor.fromJsonNullable) required final Vendor? vendor,
      @JsonKey(fromJson: Department.fromJson)
      required final Department department,
      @JsonKey(
          name: 'department_budgeting',
          fromJson: Department.fromJson,
          defaultValue: Department.empty)
      required final Department departmentBudgeting,
      @JsonKey(fromJson: _materialRequestStatusFromString)
      required final PurchaseRequestStatus status,
      @JsonKey(name: 'is_printed_by_id') final int? isPrintById,
      @JsonKey(name: 'is_printed_at', fromJson: isoDateToDateTime)
      final DateTime? isPrintAt}) = _$MaterialRequestImpl;
  const _MaterialRequest._() : super._();

  factory _MaterialRequest.fromJson(Map<String, dynamic> json) =
      _$MaterialRequestImpl.fromJson;

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
  int get updateById;
  @override
  @JsonKey(name: 'date_of_need', fromJson: isoDateToDateTime)
  DateTime get dateOfNeed;
  @override
  @JsonKey(name: 'delivery_date', fromJson: isoDateToDateTime)
  DateTime get deliveryDate;
  @override
  String get description;
  @override
  @JsonKey(name: 'material_group', fromJson: MaterialGroup.fromJson)
  MaterialGroup get materialGroup;
  @override
  @JsonKey(fromJson: Vendor.fromJsonNullable)
  Vendor? get vendor;
  @override
  @JsonKey(fromJson: Department.fromJson)
  Department get department;
  @override
  @JsonKey(
      name: 'department_budgeting',
      fromJson: Department.fromJson,
      defaultValue: Department.empty)
  Department get departmentBudgeting;
  @override
  @JsonKey(fromJson: _materialRequestStatusFromString)
  PurchaseRequestStatus get status;
  @override
  @JsonKey(name: 'is_printed_by_id')
  int? get isPrintById;
  @override
  @JsonKey(name: 'is_printed_at', fromJson: isoDateToDateTime)
  DateTime? get isPrintAt;

  /// Create a copy of MaterialRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MaterialRequestImplCopyWith<_$MaterialRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
