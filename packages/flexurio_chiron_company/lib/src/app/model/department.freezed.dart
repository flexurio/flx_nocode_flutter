// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'department.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Department _$DepartmentFromJson(Map<String, dynamic> json) {
  return _Department.fromJson(json);
}

/// @nodoc
mixin _$Department {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_by_id')
  int get createdById => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_by_id')
  int get updatedById => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_group', fromJson: DepartmentGroup.fromJson)
  DepartmentGroup get departmentGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_type', fromJson: DepartmentType.fromJson)
  DepartmentType get departmentType => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  /// Serializes this Department to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Department
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DepartmentCopyWith<Department> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepartmentCopyWith<$Res> {
  factory $DepartmentCopyWith(
          Department value, $Res Function(Department) then) =
      _$DepartmentCopyWithImpl<$Res, Department>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      DateTime createdAt,
      @JsonKey(name: 'created_by_id') int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') int updatedById,
      @JsonKey(name: 'department_group', fromJson: DepartmentGroup.fromJson)
      DepartmentGroup departmentGroup,
      @JsonKey(name: 'department_type', fromJson: DepartmentType.fromJson)
      DepartmentType departmentType,
      String name,
      String email});

  $DepartmentGroupCopyWith<$Res> get departmentGroup;
  $DepartmentTypeCopyWith<$Res> get departmentType;
}

/// @nodoc
class _$DepartmentCopyWithImpl<$Res, $Val extends Department>
    implements $DepartmentCopyWith<$Res> {
  _$DepartmentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Department
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updatedById = null,
    Object? departmentGroup = null,
    Object? departmentType = null,
    Object? name = null,
    Object? email = null,
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
      departmentGroup: null == departmentGroup
          ? _value.departmentGroup
          : departmentGroup // ignore: cast_nullable_to_non_nullable
              as DepartmentGroup,
      departmentType: null == departmentType
          ? _value.departmentType
          : departmentType // ignore: cast_nullable_to_non_nullable
              as DepartmentType,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of Department
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DepartmentGroupCopyWith<$Res> get departmentGroup {
    return $DepartmentGroupCopyWith<$Res>(_value.departmentGroup, (value) {
      return _then(_value.copyWith(departmentGroup: value) as $Val);
    });
  }

  /// Create a copy of Department
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DepartmentTypeCopyWith<$Res> get departmentType {
    return $DepartmentTypeCopyWith<$Res>(_value.departmentType, (value) {
      return _then(_value.copyWith(departmentType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DepartmentImplCopyWith<$Res>
    implements $DepartmentCopyWith<$Res> {
  factory _$$DepartmentImplCopyWith(
          _$DepartmentImpl value, $Res Function(_$DepartmentImpl) then) =
      __$$DepartmentImplCopyWithImpl<$Res>;
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
      @JsonKey(name: 'department_group', fromJson: DepartmentGroup.fromJson)
      DepartmentGroup departmentGroup,
      @JsonKey(name: 'department_type', fromJson: DepartmentType.fromJson)
      DepartmentType departmentType,
      String name,
      String email});

  @override
  $DepartmentGroupCopyWith<$Res> get departmentGroup;
  @override
  $DepartmentTypeCopyWith<$Res> get departmentType;
}

/// @nodoc
class __$$DepartmentImplCopyWithImpl<$Res>
    extends _$DepartmentCopyWithImpl<$Res, _$DepartmentImpl>
    implements _$$DepartmentImplCopyWith<$Res> {
  __$$DepartmentImplCopyWithImpl(
      _$DepartmentImpl _value, $Res Function(_$DepartmentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Department
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? createdById = null,
    Object? updatedAt = null,
    Object? updatedById = null,
    Object? departmentGroup = null,
    Object? departmentType = null,
    Object? name = null,
    Object? email = null,
  }) {
    return _then(_$DepartmentImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == createdById
          ? _value.createdById
          : createdById // ignore: cast_nullable_to_non_nullable
              as int,
      null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      null == updatedById
          ? _value.updatedById
          : updatedById // ignore: cast_nullable_to_non_nullable
              as int,
      null == departmentGroup
          ? _value.departmentGroup
          : departmentGroup // ignore: cast_nullable_to_non_nullable
              as DepartmentGroup,
      null == departmentType
          ? _value.departmentType
          : departmentType // ignore: cast_nullable_to_non_nullable
              as DepartmentType,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DepartmentImpl extends _Department {
  _$DepartmentImpl(
      this.id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) this.createdAt,
      @JsonKey(name: 'created_by_id') this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) this.updatedAt,
      @JsonKey(name: 'updated_by_id') this.updatedById,
      @JsonKey(name: 'department_group', fromJson: DepartmentGroup.fromJson)
      this.departmentGroup,
      @JsonKey(name: 'department_type', fromJson: DepartmentType.fromJson)
      this.departmentType,
      this.name,
      this.email)
      : super._();

  factory _$DepartmentImpl.fromJson(Map<String, dynamic> json) =>
      _$$DepartmentImplFromJson(json);

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
  @JsonKey(name: 'department_group', fromJson: DepartmentGroup.fromJson)
  final DepartmentGroup departmentGroup;
  @override
  @JsonKey(name: 'department_type', fromJson: DepartmentType.fromJson)
  final DepartmentType departmentType;
  @override
  final String name;
  @override
  final String email;

  @override
  String toString() {
    return 'Department(id: $id, createdAt: $createdAt, createdById: $createdById, updatedAt: $updatedAt, updatedById: $updatedById, departmentGroup: $departmentGroup, departmentType: $departmentType, name: $name, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepartmentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.createdById, createdById) ||
                other.createdById == createdById) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.updatedById, updatedById) ||
                other.updatedById == updatedById) &&
            (identical(other.departmentGroup, departmentGroup) ||
                other.departmentGroup == departmentGroup) &&
            (identical(other.departmentType, departmentType) ||
                other.departmentType == departmentType) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, createdById,
      updatedAt, updatedById, departmentGroup, departmentType, name, email);

  /// Create a copy of Department
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DepartmentImplCopyWith<_$DepartmentImpl> get copyWith =>
      __$$DepartmentImplCopyWithImpl<_$DepartmentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DepartmentImplToJson(
      this,
    );
  }
}

abstract class _Department extends Department {
  factory _Department(
      final String id,
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      final DateTime createdAt,
      @JsonKey(name: 'created_by_id') final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      final DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') final int updatedById,
      @JsonKey(name: 'department_group', fromJson: DepartmentGroup.fromJson)
      final DepartmentGroup departmentGroup,
      @JsonKey(name: 'department_type', fromJson: DepartmentType.fromJson)
      final DepartmentType departmentType,
      final String name,
      final String email) = _$DepartmentImpl;
  _Department._() : super._();

  factory _Department.fromJson(Map<String, dynamic> json) =
      _$DepartmentImpl.fromJson;

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
  @JsonKey(name: 'department_group', fromJson: DepartmentGroup.fromJson)
  DepartmentGroup get departmentGroup;
  @override
  @JsonKey(name: 'department_type', fromJson: DepartmentType.fromJson)
  DepartmentType get departmentType;
  @override
  String get name;
  @override
  String get email;

  /// Create a copy of Department
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DepartmentImplCopyWith<_$DepartmentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
