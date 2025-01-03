// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_type.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BudgetType _$BudgetTypeFromJson(Map<String, dynamic> json) {
  return _BudgetType.fromJson(json);
}

/// @nodoc
mixin _$BudgetType {
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
  int get level => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'department_type', fromJson: BudgetTypeDepartmentType.fromString)
  BudgetTypeDepartmentType get departmentType =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'usage_type', fromJson: BudgetTypeUsageType.fromString)
  BudgetTypeUsageType get usageType => throw _privateConstructorUsedError;
  int get parent => throw _privateConstructorUsedError;

  /// Serializes this BudgetType to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BudgetType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BudgetTypeCopyWith<BudgetType> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetTypeCopyWith<$Res> {
  factory $BudgetTypeCopyWith(
          BudgetType value, $Res Function(BudgetType) then) =
      _$BudgetTypeCopyWithImpl<$Res, BudgetType>;
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
      int level,
      @JsonKey(
          name: 'department_type',
          fromJson: BudgetTypeDepartmentType.fromString)
      BudgetTypeDepartmentType departmentType,
      @JsonKey(name: 'usage_type', fromJson: BudgetTypeUsageType.fromString)
      BudgetTypeUsageType usageType,
      int parent});
}

/// @nodoc
class _$BudgetTypeCopyWithImpl<$Res, $Val extends BudgetType>
    implements $BudgetTypeCopyWith<$Res> {
  _$BudgetTypeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BudgetType
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
    Object? level = null,
    Object? departmentType = null,
    Object? usageType = null,
    Object? parent = null,
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
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      departmentType: null == departmentType
          ? _value.departmentType
          : departmentType // ignore: cast_nullable_to_non_nullable
              as BudgetTypeDepartmentType,
      usageType: null == usageType
          ? _value.usageType
          : usageType // ignore: cast_nullable_to_non_nullable
              as BudgetTypeUsageType,
      parent: null == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BudgetTypeImplCopyWith<$Res>
    implements $BudgetTypeCopyWith<$Res> {
  factory _$$BudgetTypeImplCopyWith(
          _$BudgetTypeImpl value, $Res Function(_$BudgetTypeImpl) then) =
      __$$BudgetTypeImplCopyWithImpl<$Res>;
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
      int level,
      @JsonKey(
          name: 'department_type',
          fromJson: BudgetTypeDepartmentType.fromString)
      BudgetTypeDepartmentType departmentType,
      @JsonKey(name: 'usage_type', fromJson: BudgetTypeUsageType.fromString)
      BudgetTypeUsageType usageType,
      int parent});
}

/// @nodoc
class __$$BudgetTypeImplCopyWithImpl<$Res>
    extends _$BudgetTypeCopyWithImpl<$Res, _$BudgetTypeImpl>
    implements _$$BudgetTypeImplCopyWith<$Res> {
  __$$BudgetTypeImplCopyWithImpl(
      _$BudgetTypeImpl _value, $Res Function(_$BudgetTypeImpl) _then)
      : super(_value, _then);

  /// Create a copy of BudgetType
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
    Object? level = null,
    Object? departmentType = null,
    Object? usageType = null,
    Object? parent = null,
  }) {
    return _then(_$BudgetTypeImpl(
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
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      null == departmentType
          ? _value.departmentType
          : departmentType // ignore: cast_nullable_to_non_nullable
              as BudgetTypeDepartmentType,
      null == usageType
          ? _value.usageType
          : usageType // ignore: cast_nullable_to_non_nullable
              as BudgetTypeUsageType,
      null == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetTypeImpl extends _BudgetType {
  _$BudgetTypeImpl(
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime) this.createdAt,
      @JsonKey(name: 'created_by_id') this.createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime) this.updatedAt,
      @JsonKey(name: 'updated_by_id') this.updatedById,
      this.id,
      this.name,
      this.level,
      @JsonKey(
          name: 'department_type',
          fromJson: BudgetTypeDepartmentType.fromString)
      this.departmentType,
      @JsonKey(name: 'usage_type', fromJson: BudgetTypeUsageType.fromString)
      this.usageType,
      this.parent)
      : super._();

  factory _$BudgetTypeImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetTypeImplFromJson(json);

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
  final int level;
  @override
  @JsonKey(
      name: 'department_type', fromJson: BudgetTypeDepartmentType.fromString)
  final BudgetTypeDepartmentType departmentType;
  @override
  @JsonKey(name: 'usage_type', fromJson: BudgetTypeUsageType.fromString)
  final BudgetTypeUsageType usageType;
  @override
  final int parent;

  /// Create a copy of BudgetType
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetTypeImplCopyWith<_$BudgetTypeImpl> get copyWith =>
      __$$BudgetTypeImplCopyWithImpl<_$BudgetTypeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetTypeImplToJson(
      this,
    );
  }
}

abstract class _BudgetType extends BudgetType {
  factory _BudgetType(
      @JsonKey(name: 'created_at', fromJson: isoDateToDateTime)
      final DateTime createdAt,
      @JsonKey(name: 'created_by_id') final int createdById,
      @JsonKey(name: 'updated_at', fromJson: isoDateToDateTime)
      final DateTime updatedAt,
      @JsonKey(name: 'updated_by_id') final int updatedById,
      final int id,
      final String name,
      final int level,
      @JsonKey(
          name: 'department_type',
          fromJson: BudgetTypeDepartmentType.fromString)
      final BudgetTypeDepartmentType departmentType,
      @JsonKey(name: 'usage_type', fromJson: BudgetTypeUsageType.fromString)
      final BudgetTypeUsageType usageType,
      final int parent) = _$BudgetTypeImpl;
  _BudgetType._() : super._();

  factory _BudgetType.fromJson(Map<String, dynamic> json) =
      _$BudgetTypeImpl.fromJson;

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
  int get level;
  @override
  @JsonKey(
      name: 'department_type', fromJson: BudgetTypeDepartmentType.fromString)
  BudgetTypeDepartmentType get departmentType;
  @override
  @JsonKey(name: 'usage_type', fromJson: BudgetTypeUsageType.fromString)
  BudgetTypeUsageType get usageType;
  @override
  int get parent;

  /// Create a copy of BudgetType
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BudgetTypeImplCopyWith<_$BudgetTypeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BudgetTypeSummary _$BudgetTypeSummaryFromJson(Map<String, dynamic> json) {
  return _BudgetTypeSummary.fromJson(json);
}

/// @nodoc
mixin _$BudgetTypeSummary {
  @JsonKey(name: 'coa')
  String get coa => throw _privateConstructorUsedError;
  @JsonKey(name: 'department_type')
  String get departmentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_subtype')
  int get subtypeId => throw _privateConstructorUsedError;
  @JsonKey(name: 'subtype')
  String get subtypeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String get type => throw _privateConstructorUsedError;

  /// Serializes this BudgetTypeSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BudgetTypeSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BudgetTypeSummaryCopyWith<BudgetTypeSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetTypeSummaryCopyWith<$Res> {
  factory $BudgetTypeSummaryCopyWith(
          BudgetTypeSummary value, $Res Function(BudgetTypeSummary) then) =
      _$BudgetTypeSummaryCopyWithImpl<$Res, BudgetTypeSummary>;
  @useResult
  $Res call(
      {@JsonKey(name: 'coa') String coa,
      @JsonKey(name: 'department_type') String departmentType,
      @JsonKey(name: 'id_subtype') int subtypeId,
      @JsonKey(name: 'subtype') String subtypeName,
      @JsonKey(name: 'type') String type});
}

/// @nodoc
class _$BudgetTypeSummaryCopyWithImpl<$Res, $Val extends BudgetTypeSummary>
    implements $BudgetTypeSummaryCopyWith<$Res> {
  _$BudgetTypeSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BudgetTypeSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coa = null,
    Object? departmentType = null,
    Object? subtypeId = null,
    Object? subtypeName = null,
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      coa: null == coa
          ? _value.coa
          : coa // ignore: cast_nullable_to_non_nullable
              as String,
      departmentType: null == departmentType
          ? _value.departmentType
          : departmentType // ignore: cast_nullable_to_non_nullable
              as String,
      subtypeId: null == subtypeId
          ? _value.subtypeId
          : subtypeId // ignore: cast_nullable_to_non_nullable
              as int,
      subtypeName: null == subtypeName
          ? _value.subtypeName
          : subtypeName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BudgetTypeSummaryImplCopyWith<$Res>
    implements $BudgetTypeSummaryCopyWith<$Res> {
  factory _$$BudgetTypeSummaryImplCopyWith(_$BudgetTypeSummaryImpl value,
          $Res Function(_$BudgetTypeSummaryImpl) then) =
      __$$BudgetTypeSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'coa') String coa,
      @JsonKey(name: 'department_type') String departmentType,
      @JsonKey(name: 'id_subtype') int subtypeId,
      @JsonKey(name: 'subtype') String subtypeName,
      @JsonKey(name: 'type') String type});
}

/// @nodoc
class __$$BudgetTypeSummaryImplCopyWithImpl<$Res>
    extends _$BudgetTypeSummaryCopyWithImpl<$Res, _$BudgetTypeSummaryImpl>
    implements _$$BudgetTypeSummaryImplCopyWith<$Res> {
  __$$BudgetTypeSummaryImplCopyWithImpl(_$BudgetTypeSummaryImpl _value,
      $Res Function(_$BudgetTypeSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of BudgetTypeSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? coa = null,
    Object? departmentType = null,
    Object? subtypeId = null,
    Object? subtypeName = null,
    Object? type = null,
  }) {
    return _then(_$BudgetTypeSummaryImpl(
      coa: null == coa
          ? _value.coa
          : coa // ignore: cast_nullable_to_non_nullable
              as String,
      departmentType: null == departmentType
          ? _value.departmentType
          : departmentType // ignore: cast_nullable_to_non_nullable
              as String,
      subtypeId: null == subtypeId
          ? _value.subtypeId
          : subtypeId // ignore: cast_nullable_to_non_nullable
              as int,
      subtypeName: null == subtypeName
          ? _value.subtypeName
          : subtypeName // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BudgetTypeSummaryImpl extends _BudgetTypeSummary {
  _$BudgetTypeSummaryImpl(
      {@JsonKey(name: 'coa') required this.coa,
      @JsonKey(name: 'department_type') required this.departmentType,
      @JsonKey(name: 'id_subtype') required this.subtypeId,
      @JsonKey(name: 'subtype') required this.subtypeName,
      @JsonKey(name: 'type') required this.type})
      : super._();

  factory _$BudgetTypeSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$BudgetTypeSummaryImplFromJson(json);

  @override
  @JsonKey(name: 'coa')
  final String coa;
  @override
  @JsonKey(name: 'department_type')
  final String departmentType;
  @override
  @JsonKey(name: 'id_subtype')
  final int subtypeId;
  @override
  @JsonKey(name: 'subtype')
  final String subtypeName;
  @override
  @JsonKey(name: 'type')
  final String type;

  @override
  String toString() {
    return 'BudgetTypeSummary(coa: $coa, departmentType: $departmentType, subtypeId: $subtypeId, subtypeName: $subtypeName, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetTypeSummaryImpl &&
            (identical(other.coa, coa) || other.coa == coa) &&
            (identical(other.departmentType, departmentType) ||
                other.departmentType == departmentType) &&
            (identical(other.subtypeId, subtypeId) ||
                other.subtypeId == subtypeId) &&
            (identical(other.subtypeName, subtypeName) ||
                other.subtypeName == subtypeName) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, coa, departmentType, subtypeId, subtypeName, type);

  /// Create a copy of BudgetTypeSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetTypeSummaryImplCopyWith<_$BudgetTypeSummaryImpl> get copyWith =>
      __$$BudgetTypeSummaryImplCopyWithImpl<_$BudgetTypeSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetTypeSummaryImplToJson(
      this,
    );
  }
}

abstract class _BudgetTypeSummary extends BudgetTypeSummary {
  factory _BudgetTypeSummary(
      {@JsonKey(name: 'coa') required final String coa,
      @JsonKey(name: 'department_type') required final String departmentType,
      @JsonKey(name: 'id_subtype') required final int subtypeId,
      @JsonKey(name: 'subtype') required final String subtypeName,
      @JsonKey(name: 'type')
      required final String type}) = _$BudgetTypeSummaryImpl;
  _BudgetTypeSummary._() : super._();

  factory _BudgetTypeSummary.fromJson(Map<String, dynamic> json) =
      _$BudgetTypeSummaryImpl.fromJson;

  @override
  @JsonKey(name: 'coa')
  String get coa;
  @override
  @JsonKey(name: 'department_type')
  String get departmentType;
  @override
  @JsonKey(name: 'id_subtype')
  int get subtypeId;
  @override
  @JsonKey(name: 'subtype')
  String get subtypeName;
  @override
  @JsonKey(name: 'type')
  String get type;

  /// Create a copy of BudgetTypeSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BudgetTypeSummaryImplCopyWith<_$BudgetTypeSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
